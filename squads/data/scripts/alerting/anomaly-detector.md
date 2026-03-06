# anomaly-detector

## Purpose

Detects anomalies in key business and operational metrics using multiple statistical methods: z-score analysis, IQR outlier detection, and rolling average deviation. Supports configurable sensitivity per metric. When an anomaly is confirmed (passes multiple detection methods), triggers the alert-dispatcher for notification and escalation.

## When to Run

- **Scheduled**: Every 2 hours via cron to catch anomalies quickly.
- **Triggered**: After any ETL refresh that updates metric source tables.
- **Ad-hoc**: When investigating a suspected issue.

## Inputs

| Input | Source | Description |
|---|---|---|
| `analytics.metric_values_hourly` | Data warehouse | Hourly metric snapshots for near-real-time detection |
| `analytics.metric_values_daily` | Data warehouse | Daily metric values for daily-cadence metrics |
| `config/anomaly-config.yaml` | Config repo | Per-metric sensitivity, detection methods, thresholds |
| `analytics.anomaly_history` | Data warehouse | Past anomaly detections for suppression and trend analysis |

### Anomaly Configuration Example

```yaml
metrics:
  - metric_name: "revenue"
    cadence: "hourly"
    detection_methods: ["z_score", "iqr", "rolling_avg"]
    z_score_threshold: 3.0
    iqr_multiplier: 1.5
    rolling_window_hours: 168  # 7 days
    rolling_deviation_pct: 0.20
    min_confirmation_methods: 2  # must flag on at least 2 methods
    baseline_lookback_days: 60
    seasonality: "day_of_week"  # adjust for weekly patterns

  - metric_name: "dau"
    cadence: "daily"
    detection_methods: ["z_score", "rolling_avg"]
    z_score_threshold: 2.5
    rolling_window_hours: 720  # 30 days
    rolling_deviation_pct: 0.15
    min_confirmation_methods: 1
    baseline_lookback_days: 90
    seasonality: "day_of_week"

  - metric_name: "error_rate"
    cadence: "hourly"
    detection_methods: ["z_score", "iqr"]
    z_score_threshold: 2.0  # more sensitive for errors
    iqr_multiplier: 1.5
    min_confirmation_methods: 1
    baseline_lookback_days: 30
    seasonality: "none"
```

## Process

### Step 1: Load configuration and determine detection window

```python
config = load_yaml("config/anomaly-config.yaml")
last_run = get_job_metadata("anomaly_detector", "last_success_ts")
detection_window_start = last_run or (now() - timedelta(hours=2))
detection_window_end = now()
```

### Step 2: Fetch current values and compute seasonality-adjusted baselines

```sql
-- Hourly metric with day-of-week seasonality adjustment
WITH current_values AS (
    SELECT
        metric_name,
        hour_ts,
        value,
        EXTRACT(DOW FROM hour_ts) AS dow,
        EXTRACT(HOUR FROM hour_ts) AS hour_of_day
    FROM analytics.metric_values_hourly
    WHERE hour_ts BETWEEN :detection_window_start AND :detection_window_end
      AND metric_name = :metric_name
),
seasonal_baseline AS (
    SELECT
        metric_name,
        EXTRACT(DOW FROM hour_ts) AS dow,
        EXTRACT(HOUR FROM hour_ts) AS hour_of_day,
        AVG(value) AS seasonal_mean,
        STDDEV(value) AS seasonal_stddev,
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY value) AS p25,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY value) AS p75,
        COUNT(*) AS sample_count
    FROM analytics.metric_values_hourly
    WHERE hour_ts BETWEEN DATEADD('day', -:baseline_lookback_days, :detection_window_start)
                       AND DATEADD('hour', -3, :detection_window_start)
      AND metric_name = :metric_name
    GROUP BY metric_name, EXTRACT(DOW FROM hour_ts), EXTRACT(HOUR FROM hour_ts)
)
SELECT
    c.metric_name,
    c.hour_ts,
    c.value AS current_value,
    b.seasonal_mean,
    b.seasonal_stddev,
    b.p25,
    b.p75,
    b.sample_count
FROM current_values c
JOIN seasonal_baseline b
    ON c.metric_name = b.metric_name
    AND c.dow = b.dow
    AND c.hour_of_day = b.hour_of_day;
```

### Step 3: Z-score detection

```python
def detect_zscore(current_value, mean, stddev, threshold):
    if stddev == 0 or stddev is None:
        return {"flagged": False, "z_score": 0, "reason": "zero_variance"}

    z = (current_value - mean) / stddev
    flagged = abs(z) > threshold
    return {
        "flagged": flagged,
        "z_score": z,
        "direction": "high" if z > 0 else "low",
        "reason": f"z-score {z:.2f} exceeds threshold {threshold}"
    }
```

### Step 4: IQR outlier detection

```python
def detect_iqr(current_value, p25, p75, multiplier):
    iqr = p75 - p25
    if iqr == 0:
        return {"flagged": False, "reason": "zero_iqr"}

    lower_bound = p25 - multiplier * iqr
    upper_bound = p75 + multiplier * iqr
    flagged = current_value < lower_bound or current_value > upper_bound

    return {
        "flagged": flagged,
        "lower_bound": lower_bound,
        "upper_bound": upper_bound,
        "direction": "high" if current_value > upper_bound else "low" if current_value < lower_bound else "normal",
        "reason": f"Value {current_value:.2f} outside IQR bounds [{lower_bound:.2f}, {upper_bound:.2f}]"
    }
```

### Step 5: Rolling average deviation detection

```sql
SELECT
    metric_name,
    AVG(CASE WHEN hour_ts >= DATEADD('hour', -6, :detection_window_end) THEN value END) AS recent_avg,
    AVG(value) AS rolling_avg
FROM analytics.metric_values_hourly
WHERE metric_name = :metric_name
  AND hour_ts >= DATEADD('hour', -:rolling_window_hours, :detection_window_end)
  AND hour_ts <= :detection_window_end
GROUP BY metric_name;
```

```python
def detect_rolling_deviation(recent_avg, rolling_avg, threshold_pct):
    if rolling_avg == 0:
        return {"flagged": False, "reason": "zero_rolling_avg"}

    deviation = (recent_avg - rolling_avg) / rolling_avg
    flagged = abs(deviation) > threshold_pct

    return {
        "flagged": flagged,
        "deviation_pct": deviation,
        "direction": "high" if deviation > 0 else "low",
        "reason": f"Recent avg {recent_avg:.2f} deviates {deviation*100:.1f}% from rolling avg {rolling_avg:.2f}"
    }
```

### Step 6: Confirm anomaly (multi-method consensus)

```python
for metric_config in config["metrics"]:
    metric = metric_config["metric_name"]
    data = fetch_detection_data(metric, metric_config)

    results = {}
    if "z_score" in metric_config["detection_methods"]:
        results["z_score"] = detect_zscore(data.current_value, data.seasonal_mean,
                                            data.seasonal_stddev, metric_config["z_score_threshold"])
    if "iqr" in metric_config["detection_methods"]:
        results["iqr"] = detect_iqr(data.current_value, data.p25, data.p75,
                                     metric_config["iqr_multiplier"])
    if "rolling_avg" in metric_config["detection_methods"]:
        results["rolling_avg"] = detect_rolling_deviation(data.recent_avg, data.rolling_avg,
                                                           metric_config["rolling_deviation_pct"])

    methods_flagged = sum(1 for r in results.values() if r["flagged"])
    is_anomaly = methods_flagged >= metric_config["min_confirmation_methods"]

    if is_anomaly:
        severity = classify_severity(results, metric_config)
        anomaly = {
            "metric_name": metric,
            "timestamp": data.hour_ts,
            "current_value": data.current_value,
            "detection_results": results,
            "methods_flagged": methods_flagged,
            "severity": severity,
            "confirmed": True
        }
        confirmed_anomalies.append(anomaly)
```

### Step 7: Classify severity

```python
def classify_severity(results, config):
    z = results.get("z_score", {}).get("z_score", 0)
    abs_z = abs(z)

    if abs_z > 5.0:
        return "critical"
    elif abs_z > 4.0:
        return "high"
    elif abs_z > config.get("z_score_threshold", 3.0):
        return "medium"
    else:
        return "low"
```

### Step 8: Dispatch alerts and persist

```python
for anomaly in confirmed_anomalies:
    # Check suppression (avoid re-alerting on same ongoing anomaly)
    if not is_suppressed(anomaly["metric_name"], anomaly["severity"], cooldown_hours=4):
        trigger_alert_dispatcher({
            "alert_type": "anomaly_detected",
            "source_script": "anomaly-detector",
            "timestamp": anomaly["timestamp"].isoformat(),
            "severity": anomaly["severity"],
            "metric_name": anomaly["metric_name"],
            "current_value": anomaly["current_value"],
            "expected_value": anomaly["detection_results"].get("z_score", {}).get("z_score", "N/A"),
            "details": build_anomaly_detail_string(anomaly)
        })

    insert_anomaly("analytics.anomaly_history", anomaly)

update_job_metadata("anomaly_detector", detection_window_end)
```

## Outputs

| Output | Destination | Description |
|---|---|---|
| `analytics.anomaly_history` | Data warehouse | Full log of all detected anomalies with method details |
| Alert payloads | `alert-dispatcher` | Dispatched for confirmed anomalies above suppression threshold |
| Job metadata | `analytics.job_metadata` | Updated last_success_ts for next run window |

## Error Handling

| Error | Action |
|---|---|
| Anomaly config YAML missing | Use defaults: z_score threshold 3.0, IQR multiplier 1.5, min 2 methods |
| Baseline has insufficient data (<14 days) | Skip metric, log as "insufficient baseline", do not flag anomalies |
| Hourly data delayed (latest hour missing) | Wait 10 minutes, retry once; if still missing, skip and log |
| All metrics flagged simultaneously | Likely systemic issue (e.g., ETL failure); dispatch single "systemic anomaly" alert instead of individual alerts |
| Detection methods disagree (1 flags, others do not) | Not an anomaly if below min_confirmation_methods; log as "borderline" for review |
| Alert dispatcher unavailable | Queue alert in `analytics.alert_queue`, retry on next scheduled run |

## Schedule / Trigger

- **Cron**: `15 */2 * * *` (every 2 hours at :15 past the hour)
- **Post-ETL hook**: Triggered after `metric_values_hourly` table refresh
- **Manual**: `python run_script.py anomaly-detector --metric revenue --lookback-hours 24`
