# monthly-report-builder

## Purpose

Assembles a comprehensive monthly analytics report covering trend analysis, cohort updates, experiment results, and data quality status. Provides deeper context than the weekly report, including month-over-month trends, cohort lifecycle progression, and a portfolio view of experiments. Designed for product and analytics leadership.

## When to Run

- **Scheduled**: First business day of each month at 09:00 UTC.
- **Ad-hoc**: For mid-month reviews or board preparation.

## Inputs

| Input | Source | Description |
|---|---|---|
| `analytics.metric_values_daily` | Data warehouse | Daily metric values |
| `analytics.retention_rates` | Data warehouse | Cohort retention data from retention-curves-generator |
| `analytics.experiment_results` | Data warehouse | All experiment analyses from the month |
| `analytics.dq_scorecard` | Data warehouse | Daily data quality scores |
| `analytics.clv_by_segment` | Data warehouse | Latest CLV segmentation |
| `analytics.funnel_results` | Data warehouse | Latest funnel analysis results |
| `config/metric-registry.yaml` | Config repo | Metric definitions, monthly targets |

## Process

### Step 1: Define reporting period

```python
report_month = (today.replace(day=1) - timedelta(days=1)).replace(day=1)  # First of prior month
month_start = report_month
month_end = (report_month + timedelta(days=32)).replace(day=1) - timedelta(days=1)
prior_month_start = (report_month - timedelta(days=1)).replace(day=1)
prior_month_end = report_month - timedelta(days=1)
```

### Step 2: Monthly KPI trends

```sql
WITH monthly_metrics AS (
    SELECT
        metric_name,
        DATE_TRUNC('month', date) AS month,
        AVG(value) AS avg_value,
        SUM(value) AS sum_value,
        MIN(value) AS min_value,
        MAX(value) AS max_value,
        STDDEV(value) AS stddev_value
    FROM analytics.metric_values_daily
    WHERE date >= DATEADD('month', -6, :month_start)
      AND date <= :month_end
      AND metric_name IN ('dau', 'mau', 'revenue', 'conversion_rate', 'churn_rate',
                           'arpu', 'sessions_per_user', 'nps_score')
    GROUP BY metric_name, DATE_TRUNC('month', date)
)
SELECT
    metric_name,
    month,
    avg_value,
    LAG(avg_value) OVER (PARTITION BY metric_name ORDER BY month) AS prior_month_avg,
    (avg_value - LAG(avg_value) OVER (PARTITION BY metric_name ORDER BY month))
        / NULLIF(LAG(avg_value) OVER (PARTITION BY metric_name ORDER BY month), 0) AS mom_change,
    -- 3-month moving average for trend line
    AVG(avg_value) OVER (PARTITION BY metric_name ORDER BY month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS ma_3m
FROM monthly_metrics
ORDER BY metric_name, month;
```

### Step 3: Cohort retention update

```sql
-- Latest retention rates for cohorts that matured this month
SELECT
    cohort_date,
    cohort_size,
    retention_d1,
    retention_d7,
    retention_d30,
    retention_d90
FROM analytics.retention_rates
WHERE cohort_date BETWEEN DATEADD('month', -3, :month_start) AND :month_end
ORDER BY cohort_date;
```

```python
# Compute retention trend
recent_cohorts = retention_data[retention_data.cohort_date >= month_start - timedelta(days=90)]
d7_trend = compute_linear_trend(recent_cohorts, "retention_d7")
d30_trend = compute_linear_trend(recent_cohorts, "retention_d30")

retention_summary = {
    "latest_d7": recent_cohorts.iloc[-1].retention_d7,
    "latest_d30": recent_cohorts.iloc[-1].retention_d30,
    "d7_trend_direction": "improving" if d7_trend.slope > 0 else "declining",
    "d30_trend_direction": "improving" if d30_trend.slope > 0 else "declining",
    "best_cohort_d30": recent_cohorts.loc[recent_cohorts.retention_d30.idxmax()].cohort_date,
    "worst_cohort_d30": recent_cohorts.loc[recent_cohorts.retention_d30.idxmin()].cohort_date
}
```

### Step 4: Experiment portfolio summary

```sql
SELECT
    experiment_id,
    primary_metric,
    classification,
    relative_lift,
    p_value,
    analysis_type,
    analysis_date,
    CASE
        WHEN classification = 'significant_and_meaningful' AND relative_lift > 0 THEN 'ship'
        WHEN classification = 'significant_and_meaningful' AND relative_lift < 0 THEN 'revert'
        WHEN classification = 'not_significant' THEN 'inconclusive'
        WHEN classification = 'underpowered' THEN 'extend'
        ELSE 'review'
    END AS recommendation
FROM analytics.experiment_results
WHERE analysis_date BETWEEN :month_start AND :month_end
ORDER BY analysis_date DESC;
```

```python
experiment_portfolio = {
    "total_experiments": len(experiments),
    "shipped": sum(1 for e in experiments if e.recommendation == "ship"),
    "reverted": sum(1 for e in experiments if e.recommendation == "revert"),
    "inconclusive": sum(1 for e in experiments if e.recommendation == "inconclusive"),
    "still_running": sum(1 for e in experiments if e.recommendation == "extend"),
    "avg_lift_shipped": mean([e.relative_lift for e in experiments if e.recommendation == "ship"]),
    "win_rate": sum(1 for e in experiments if e.recommendation == "ship") / max(len(experiments), 1)
}
```

### Step 5: Funnel and CLV highlights

```python
# Pull latest funnel results
funnel_summary = query("""
    SELECT funnel_name, step_label, step_number, users_at_step, conversion_from_top
    FROM analytics.funnel_results
    WHERE run_date = (SELECT MAX(run_date) FROM analytics.funnel_results)
    ORDER BY funnel_name, step_number
""")

# Pull CLV trends
clv_summary = query("""
    SELECT segment_value, avg_clv, median_clv, user_count
    FROM analytics.clv_by_segment
    ORDER BY avg_clv DESC
""")
```

### Step 6: Data quality status

```sql
SELECT
    DATE_TRUNC('week', scan_date) AS week,
    AVG(composite_score) AS avg_score,
    COUNT(CASE WHEN composite_score < 0.7 THEN 1 END) AS tables_with_issues
FROM analytics.dq_scorecard
WHERE scan_date BETWEEN :month_start AND :month_end
GROUP BY DATE_TRUNC('week', scan_date)
ORDER BY week;
```

```python
dq_status = {
    "month_avg_score": dq_data.avg_score.mean(),
    "trend": "improving" if dq_data.avg_score.iloc[-1] > dq_data.avg_score.iloc[0] else "stable_or_declining",
    "persistent_issues": identify_tables_below_threshold_all_month(dq_data)
}
```

### Step 7: Assemble and distribute

```python
monthly_report = {
    "title": f"Monthly Analytics Report: {report_month.strftime('%B %Y')}",
    "generated_at": now(),
    "sections": {
        "executive_summary": generate_executive_summary(kpi_trends, retention_summary,
                                                         experiment_portfolio),
        "kpi_trends": kpi_trends_with_charts,
        "cohort_retention": retention_summary,
        "experiment_portfolio": experiment_portfolio,
        "funnel_analysis": funnel_summary,
        "clv_update": clv_summary,
        "data_quality": dq_status,
        "recommendations": generate_monthly_recommendations(all_sections)
    }
}

insert_report("analytics.monthly_reports", monthly_report)
post_to_slack(channel="#monthly-analytics", blocks=format_slack_blocks(monthly_report))
send_email(to=report_config["monthly_recipients"], subject=monthly_report["title"],
           body=format_html(monthly_report))
```

## Outputs

| Output | Destination | Description |
|---|---|---|
| `analytics.monthly_reports` | Data warehouse | Archived monthly report data |
| Slack message | #monthly-analytics | Summary with key takeaways |
| Email | Analytics + product leadership | Full HTML report with charts |
| Job log | `analytics.job_log` | Run metadata |

## Error Handling

| Error | Action |
|---|---|
| Retention data not yet available for current month cohorts | Include only mature cohorts, note which are pending |
| No experiments completed this month | Report "No experiments reached conclusion" with count of still-running |
| Metric data partially missing (e.g., last 3 days of month) | Report with available data, note incomplete window |
| CLV or funnel tables stale (not refreshed recently) | Use latest available, flag staleness date in report |
| Report generation fails mid-assembly | Save partial report, alert on-call analyst, retry once |

## Schedule / Trigger

- **Cron**: `0 9 1-7 * 1-5` (first business day of month at 09:00 UTC)
- **Manual**: `python run_script.py monthly-report-builder --month 2026-02`
