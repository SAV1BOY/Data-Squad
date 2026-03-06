# weekly-report-builder

## Purpose

Assembles the weekly executive report by pulling key performance indicators from the data warehouse, comparing them to targets and prior periods, highlighting anomalies, and generating a structured summary ready for distribution. Produces a consistent, automated report that replaces manual data pulls.

## When to Run

- **Scheduled**: Every Monday at 08:00 UTC.
- **Ad-hoc**: When leadership requests an updated snapshot mid-week.

## Inputs

| Input | Source | Description |
|---|---|---|
| `analytics.metric_values_daily` | Data warehouse | Daily metric snapshots |
| `analytics.metric_drift_log` | Data warehouse | Recent drift detections |
| `analytics.experiment_results` | Data warehouse | Active/completed experiment summaries |
| `analytics.dq_scorecard` | Data warehouse | Data quality scores |
| `config/metric-registry.yaml` | Config repo | Metric definitions and weekly targets |
| `config/report-config.yaml` | Config repo | Report layout, recipients, KPI list |

### Report Configuration Example

```yaml
weekly_report:
  kpis:
    - metric: dau
      target_type: "absolute"
      target: 125000
      comparison: "wow"  # week-over-week
    - metric: revenue
      target_type: "growth_rate"
      target: 0.03  # 3% WoW growth
      comparison: "wow"
    - metric: conversion_rate
      target_type: "absolute"
      target: 0.045
      comparison: "wow"
    - metric: churn_rate
      target_type: "threshold"
      target: 0.05  # must stay below 5%
      comparison: "wow"
  recipients: ["exec-team@company.com"]
  slack_channel: "#weekly-metrics"
```

## Process

### Step 1: Define reporting periods

```python
report_date = last_monday()  # Monday of the reporting week
current_week_start = report_date - timedelta(days=7)  # Previous Monday
current_week_end = report_date - timedelta(days=1)     # Previous Sunday
prior_week_start = current_week_start - timedelta(days=7)
prior_week_end = current_week_start - timedelta(days=1)
```

### Step 2: Pull KPI values for current and prior week

```sql
WITH weekly_kpis AS (
    SELECT
        metric_name,
        -- Current week
        AVG(CASE WHEN date BETWEEN :current_week_start AND :current_week_end
                 THEN value END) AS current_week_avg,
        SUM(CASE WHEN date BETWEEN :current_week_start AND :current_week_end
                 THEN value END) AS current_week_sum,
        -- Prior week
        AVG(CASE WHEN date BETWEEN :prior_week_start AND :prior_week_end
                 THEN value END) AS prior_week_avg,
        SUM(CASE WHEN date BETWEEN :prior_week_start AND :prior_week_end
                 THEN value END) AS prior_week_sum,
        -- 4-week average (for trend context)
        AVG(CASE WHEN date BETWEEN DATEADD('day', -28, :current_week_end) AND :current_week_end
                 THEN value END) AS four_week_avg
    FROM analytics.metric_values_daily
    WHERE metric_name IN ('dau', 'revenue', 'conversion_rate', 'churn_rate')
      AND date BETWEEN :prior_week_start AND :current_week_end
    GROUP BY metric_name
)
SELECT
    metric_name,
    current_week_avg,
    prior_week_avg,
    four_week_avg,
    (current_week_avg - prior_week_avg) / NULLIF(prior_week_avg, 0) AS wow_change,
    (current_week_avg - four_week_avg) / NULLIF(four_week_avg, 0) AS vs_4w_avg_change
FROM weekly_kpis;
```

### Step 3: Compare against targets

```python
kpi_results = []
for kpi_config in report_config["kpis"]:
    metric = kpi_config["metric"]
    actual = kpi_data[metric].current_week_avg
    target = kpi_config["target"]

    if kpi_config["target_type"] == "absolute":
        vs_target = (actual - target) / target
        on_track = actual >= target
    elif kpi_config["target_type"] == "growth_rate":
        actual_growth = kpi_data[metric].wow_change
        vs_target = actual_growth - target
        on_track = actual_growth >= target
    elif kpi_config["target_type"] == "threshold":
        vs_target = target - actual  # positive = good (below threshold)
        on_track = actual <= target

    kpi_results.append({
        "metric": metric,
        "value": actual,
        "target": target,
        "wow_change": kpi_data[metric].wow_change,
        "vs_target": vs_target,
        "status": "on_track" if on_track else "off_track",
        "trend": classify_trend(kpi_data[metric])
    })
```

### Step 4: Pull anomalies from drift log

```sql
SELECT
    metric_name,
    date,
    z_score,
    severity,
    current_value,
    baseline_mean
FROM analytics.metric_drift_log
WHERE date BETWEEN :current_week_start AND :current_week_end
  AND severity IN ('critical', 'high')
ORDER BY severity DESC, date DESC
LIMIT 10;
```

### Step 5: Summarize active experiments

```sql
SELECT
    experiment_id,
    primary_metric,
    control_rate,
    treatment_rate,
    relative_lift,
    p_value,
    classification,
    CASE WHEN p_value < 0.05 THEN 'significant' ELSE 'not yet' END AS significance_status
FROM analytics.experiment_results
WHERE analysis_date >= :current_week_start
ORDER BY analysis_date DESC;
```

### Step 6: Data quality summary

```sql
SELECT
    AVG(composite_score) AS avg_quality_score,
    MIN(composite_score) AS min_quality_score,
    COUNT(CASE WHEN composite_score < 0.7 THEN 1 END) AS tables_below_threshold
FROM analytics.dq_scorecard
WHERE scan_date = :current_week_end;
```

### Step 7: Assemble and distribute report

```python
report = {
    "title": f"Weekly Executive Report: {current_week_start.strftime('%b %d')} - {current_week_end.strftime('%b %d, %Y')}",
    "generated_at": now(),
    "sections": {
        "kpi_summary": {
            "metrics": kpi_results,
            "headline": generate_headline(kpi_results)
            # e.g., "Revenue up 4.2% WoW, beating 3% target. DAU flat. Churn within threshold."
        },
        "anomalies": anomaly_list,
        "experiments": experiment_summaries,
        "data_quality": {
            "avg_score": dq_summary.avg_quality_score,
            "issues": dq_summary.tables_below_threshold
        }
    }
}

# Persist to warehouse
insert_report("analytics.weekly_reports", report)

# Send to Slack
post_to_slack(channel=report_config["slack_channel"], blocks=format_slack_blocks(report))

# Send email
send_email(to=report_config["recipients"], subject=report["title"], body=format_html(report))

log_job_completion("weekly_report_builder", {
    "week": current_week_start.isoformat(),
    "kpis_reported": len(kpi_results),
    "anomalies_flagged": len(anomaly_list),
    "experiments_summarized": len(experiment_summaries)
})
```

## Outputs

| Output | Destination | Description |
|---|---|---|
| `analytics.weekly_reports` | Data warehouse | Archived report data for historical comparison |
| Slack message | #weekly-metrics | Formatted summary with KPI table and highlights |
| Email | Executive distribution list | HTML-formatted report |
| Job log | `analytics.job_log` | Run metadata |

## Error Handling

| Error | Action |
|---|---|
| Metric data missing for current week | Use most recent available day, flag staleness in report |
| Target not defined for a KPI | Show metric value and WoW change without target comparison |
| Slack API failure | Retry twice, fall back to email-only delivery, log warning |
| Email delivery failure | Log error, ensure warehouse copy is saved, alert ops |
| No anomalies detected | Report "No anomalies detected this week" (not an error) |
| Prior week data incomplete | Use 4-week average as comparison baseline, note in report |

## Schedule / Trigger

- **Cron**: `0 8 * * 1` (Mondays at 08:00 UTC)
- **Manual**: `python run_script.py weekly-report-builder --week-of 2026-03-02`
