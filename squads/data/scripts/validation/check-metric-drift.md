# check-metric-drift

## Purpose

Detects metric drift by comparing current metric values against historical baselines. Flags metrics that have shifted beyond statistically expected bounds, distinguishing genuine changes from normal variance. Prevents silent data issues from corrupting dashboards and decisions.

## When to Run

- **Scheduled**: Daily at 07:00 UTC after overnight ETL completes.
- **Triggered**: After any dbt model rebuild that touches metric source tables.
- **Ad-hoc**: When investigating suspected data quality issues.

## Inputs

| Input | Source | Description |
|---|---|---|
| `analytics.metric_values_daily` | Data warehouse | Daily metric snapshots (metric_name, date, value, segment) |
| `config/metric-registry.yaml` | Config repo | Metric definitions with expected ranges and sensitivity settings |
| `analytics.metric_baselines` | Data warehouse | Rolling baseline statistics per metric (mean, stddev, percentiles) |

## Process

### Step 1: Refresh baseline statistics

Compute rolling baselines over the last 90 days, excluding the most recent 3 days (to avoid contaminating baselines with current anomalies).

```sql
CREATE OR REPLACE TABLE analytics.metric_baselines AS
SELECT
    metric_name,
    segment,
    AVG(value) AS baseline_mean,
    STDDEV(value) AS baseline_stddev,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY value) AS p25,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY value) AS p50,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY value) AS p75,
    COUNT(*) AS baseline_days,
    MIN(date) AS baseline_start,
    MAX(date) AS baseline_end
FROM analytics.metric_values_daily
WHERE date BETWEEN DATEADD('day', -93, CURRENT_DATE) AND DATEADD('day', -3, CURRENT_DATE)
GROUP BY metric_name, segment;
```

### Step 2: Compute z-scores for current values

```sql
SELECT
    m.metric_name,
    m.segment,
    m.date,
    m.value AS current_value,
    b.baseline_mean,
    b.baseline_stddev,
    CASE WHEN b.baseline_stddev > 0
         THEN (m.value - b.baseline_mean) / b.baseline_stddev
         ELSE 0 END AS z_score,
    ABS(CASE WHEN b.baseline_stddev > 0
             THEN (m.value - b.baseline_mean) / b.baseline_stddev
             ELSE 0 END) AS abs_z_score
FROM analytics.metric_values_daily m
JOIN analytics.metric_baselines b
  ON m.metric_name = b.metric_name AND m.segment = b.segment
WHERE m.date = CURRENT_DATE - 1;
```

### Step 3: Moving average deviation check

Compare the 7-day moving average against the 30-day moving average to detect gradual drift that z-scores on single days might miss.

```sql
WITH moving_avgs AS (
    SELECT
        metric_name,
        segment,
        AVG(CASE WHEN date >= DATEADD('day', -7, CURRENT_DATE) THEN value END) AS ma_7d,
        AVG(CASE WHEN date >= DATEADD('day', -30, CURRENT_DATE) THEN value END) AS ma_30d
    FROM analytics.metric_values_daily
    WHERE date >= DATEADD('day', -30, CURRENT_DATE)
    GROUP BY metric_name, segment
)
SELECT
    metric_name,
    segment,
    ma_7d,
    ma_30d,
    ((ma_7d - ma_30d) / NULLIF(ma_30d, 0)) * 100 AS pct_deviation
FROM moving_avgs
WHERE ABS((ma_7d - ma_30d) / NULLIF(ma_30d, 0)) > 0.10;
```

A deviation of >10% between the 7-day and 30-day moving average signals gradual drift.

### Step 4: IQR-based outlier detection

For metrics with skewed distributions where z-scores are unreliable.

```sql
SELECT
    m.metric_name,
    m.segment,
    m.value,
    b.p25,
    b.p75,
    (b.p75 - b.p25) AS iqr,
    CASE WHEN m.value < b.p25 - 1.5 * (b.p75 - b.p25) THEN 'low_outlier'
         WHEN m.value > b.p75 + 1.5 * (b.p75 - b.p25) THEN 'high_outlier'
         ELSE 'normal' END AS iqr_status
FROM analytics.metric_values_daily m
JOIN analytics.metric_baselines b
  ON m.metric_name = b.metric_name AND m.segment = b.segment
WHERE m.date = CURRENT_DATE - 1;
```

### Step 5: Classify drift severity

```python
for metric in drift_results:
    abs_z = abs(metric.z_score)
    pct_dev = abs(metric.pct_deviation) if metric.pct_deviation else 0

    if abs_z > 4.0 or pct_dev > 25:
        metric.severity = "critical"
        metric.action = "immediate_investigation"
    elif abs_z > 3.0 or pct_dev > 15:
        metric.severity = "high"
        metric.action = "investigate_within_24h"
    elif abs_z > 2.5 or pct_dev > 10:
        metric.severity = "medium"
        metric.action = "review_in_weekly_standup"
    else:
        metric.severity = "info"
        metric.action = "log_only"
```

### Step 6: Check for correlated drift

If multiple related metrics drift simultaneously, it may indicate a systemic issue (e.g., tracking outage) rather than independent problems.

```python
drifting_metrics = [m for m in drift_results if m.severity in ("critical", "high")]
if len(drifting_metrics) >= 3:
    correlated_alert = True
    root_cause_hint = "Multiple metrics drifting together suggests upstream data issue"
```

### Step 7: Persist results and dispatch alerts

```python
insert_drift_results(drift_results)  # -> analytics.metric_drift_log

for metric in drift_results:
    if metric.severity in ("critical", "high"):
        trigger_alert_dispatcher(
            alert_type="metric_drift",
            metric_name=metric.metric_name,
            severity=metric.severity,
            z_score=metric.z_score,
            current_value=metric.current_value,
            baseline_mean=metric.baseline_mean
        )
```

## Outputs

| Output | Destination | Description |
|---|---|---|
| `analytics.metric_drift_log` | Data warehouse | Daily log of drift checks with z-scores, deviations, severity |
| `analytics.metric_baselines` | Data warehouse | Refreshed rolling baselines |
| Alert payloads | `alert-dispatcher` | For critical/high severity drift detections |

## Error Handling

| Error | Action |
|---|---|
| Baseline has fewer than 30 days of data | Skip metric, log as insufficient data, set severity to "info" |
| Baseline stddev is zero (constant metric) | Use absolute change threshold from registry instead of z-score |
| Missing current day value | Flag as potential ingestion failure, alert as "high" severity |
| Warehouse query timeout | Retry twice, then process metrics in smaller batches |
| Registry YAML unavailable | Fall back to default thresholds (z > 3.0 = critical, z > 2.5 = high) |

## Schedule / Trigger

- **Cron**: `0 7 * * *` (daily at 07:00 UTC)
- **dbt trigger**: Post-hook on `metric_values_daily` model refresh
- **Manual**: `python run_script.py check-metric-drift --date 2026-03-05 --metric revenue`
