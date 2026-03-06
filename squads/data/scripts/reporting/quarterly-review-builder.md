# quarterly-review-builder

## Purpose

Assembles the quarterly business review package: strategic metric performance against OKRs, experiment portfolio outcomes, cohort lifecycle analysis, data quality trends, and forward-looking recommendations. Designed for executive and board-level consumption with emphasis on strategic narrative over operational detail.

## When to Run

- **Scheduled**: First Monday after quarter end at 10:00 UTC.
- **Ad-hoc**: For board meeting preparation or investor updates.

## Inputs

| Input | Source | Description |
|---|---|---|
| `analytics.metric_values_daily` | Data warehouse | Daily metric values spanning the quarter |
| `analytics.monthly_reports` | Data warehouse | Archived monthly reports for the quarter |
| `analytics.experiment_results` | Data warehouse | All experiment analyses from the quarter |
| `analytics.retention_rates` | Data warehouse | Cohort retention data |
| `analytics.clv_by_cohort` | Data warehouse | CLV by cohort for lifetime value trends |
| `analytics.dq_scorecard` | Data warehouse | Data quality history |
| `config/okr-targets.yaml` | Config repo | Quarterly OKR definitions with key results and targets |

### OKR Configuration Example

```yaml
quarter: "2026-Q1"
okrs:
  - objective: "Accelerate user growth"
    key_results:
      - metric: "mau"
        target: 500000
        baseline: 420000
      - metric: "signup_conversion_rate"
        target: 0.08
        baseline: 0.065
  - objective: "Improve monetization"
    key_results:
      - metric: "arpu"
        target: 12.50
        baseline: 10.80
      - metric: "paying_user_rate"
        target: 0.15
        baseline: 0.12
  - objective: "Strengthen retention"
    key_results:
      - metric: "d30_retention"
        target: 0.35
        baseline: 0.30
```

## Process

### Step 1: Define quarter boundaries

```python
quarter_map = {1: ("01-01", "03-31"), 2: ("04-01", "06-30"),
               3: ("07-01", "09-30"), 4: ("10-01", "12-31")}
current_quarter = (today.month - 1) // 3  # previous quarter
q_start, q_end = compute_quarter_dates(current_quarter, today.year)
prior_q_start, prior_q_end = compute_quarter_dates(current_quarter - 1, today.year)
```

### Step 2: Strategic metrics -- quarterly aggregates and trends

```sql
WITH quarterly_metrics AS (
    SELECT
        metric_name,
        DATE_TRUNC('quarter', date) AS quarter,
        AVG(value) AS avg_value,
        MAX(value) AS peak_value,
        MIN(value) AS trough_value,
        -- End-of-quarter value (most recent day)
        LAST_VALUE(value) OVER (
            PARTITION BY metric_name, DATE_TRUNC('quarter', date)
            ORDER BY date
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS eop_value
    FROM analytics.metric_values_daily
    WHERE date BETWEEN DATEADD('quarter', -4, :q_start) AND :q_end
      AND metric_name IN ('mau', 'revenue', 'arpu', 'paying_user_rate', 'churn_rate',
                           'd30_retention', 'signup_conversion_rate', 'nps_score')
    GROUP BY metric_name, DATE_TRUNC('quarter', date)
)
SELECT
    metric_name,
    quarter,
    avg_value,
    eop_value,
    LAG(avg_value) OVER (PARTITION BY metric_name ORDER BY quarter) AS prior_q_avg,
    (avg_value - LAG(avg_value) OVER (PARTITION BY metric_name ORDER BY quarter))
        / NULLIF(LAG(avg_value) OVER (PARTITION BY metric_name ORDER BY quarter), 0) AS qoq_change
FROM quarterly_metrics
ORDER BY metric_name, quarter;
```

### Step 3: OKR progress evaluation

```python
okr_config = load_yaml("config/okr-targets.yaml")
okr_results = []

for okr in okr_config["okrs"]:
    kr_results = []
    for kr in okr["key_results"]:
        actual = metric_data[kr["metric"]].eop_value  # end-of-quarter actual
        target = kr["target"]
        baseline = kr["baseline"]

        # Progress: 0% = at baseline, 100% = at target
        progress = (actual - baseline) / (target - baseline) if target != baseline else 1.0
        progress_pct = min(max(progress * 100, 0), 150)  # cap at 150%

        kr_results.append({
            "metric": kr["metric"],
            "baseline": baseline,
            "target": target,
            "actual": actual,
            "progress_pct": progress_pct,
            "status": "achieved" if progress >= 1.0 else "on_track" if progress >= 0.7 else "at_risk"
        })

    okr_results.append({
        "objective": okr["objective"],
        "key_results": kr_results,
        "overall_status": classify_okr_status(kr_results)
    })
```

### Step 4: Experiment portfolio review

```sql
SELECT
    experiment_id,
    primary_metric,
    classification,
    relative_lift,
    p_value,
    recommendation,
    analysis_date
FROM analytics.experiment_results
WHERE analysis_date BETWEEN :q_start AND :q_end
  AND analysis_type = 'final'
ORDER BY analysis_date;
```

```python
experiment_portfolio = {
    "total_concluded": len(experiments),
    "winners": [e for e in experiments if e.recommendation == "ship"],
    "losers": [e for e in experiments if e.recommendation == "revert"],
    "inconclusive": [e for e in experiments if e.recommendation == "inconclusive"],
    "win_rate": len(winners) / max(len(experiments), 1),
    "cumulative_lift": sum(e.relative_lift for e in winners),
    "avg_experiment_duration_days": avg([e.duration for e in experiments]),
    "top_wins": sorted(winners, key=lambda e: e.relative_lift, reverse=True)[:3],
    "notable_failures": sorted(losers, key=lambda e: e.relative_lift)[:3],
    "velocity": len(experiments) / 13  # experiments per week over 13-week quarter
}
```

### Step 5: Cohort lifecycle and CLV trends

```sql
SELECT
    cohort_date,
    cohort_size,
    retention_d7,
    retention_d30,
    retention_d90,
    c.avg_clv,
    c.realized_revenue,
    c.projected_future_revenue
FROM analytics.retention_rates r
JOIN analytics.clv_by_cohort c ON r.cohort_date = c.cohort_date
WHERE r.cohort_date BETWEEN DATEADD('quarter', -2, :q_start) AND :q_end
ORDER BY r.cohort_date;
```

```python
cohort_trends = {
    "retention_d30_trend": compute_linear_trend(cohort_data, "retention_d30"),
    "avg_clv_trend": compute_linear_trend(cohort_data, "avg_clv"),
    "best_retention_cohort": cohort_data.loc[cohort_data.retention_d30.idxmax()],
    "highest_clv_cohort": cohort_data.loc[cohort_data.avg_clv.idxmax()],
    "total_projected_revenue": cohort_data.projected_future_revenue.sum()
}
```

### Step 6: Data quality trends

```sql
SELECT
    DATE_TRUNC('week', scan_date) AS week,
    AVG(composite_score) AS avg_score,
    AVG(completeness_score) AS avg_completeness,
    AVG(freshness_score) AS avg_freshness,
    AVG(accuracy_score) AS avg_accuracy
FROM analytics.dq_scorecard
WHERE scan_date BETWEEN :q_start AND :q_end
GROUP BY DATE_TRUNC('week', scan_date)
ORDER BY week;
```

```python
dq_trends = {
    "q_start_score": dq_weekly.iloc[0].avg_score,
    "q_end_score": dq_weekly.iloc[-1].avg_score,
    "trend": "improving" if dq_weekly.iloc[-1].avg_score > dq_weekly.iloc[0].avg_score else "declining",
    "biggest_improvement_area": identify_most_improved_dimension(dq_weekly),
    "persistent_issues": identify_chronic_low_scores(dq_weekly)
}
```

### Step 7: Generate recommendations

```python
recommendations = []

# OKR-driven recommendations
for okr in okr_results:
    for kr in okr["key_results"]:
        if kr["status"] == "at_risk":
            recommendations.append({
                "area": okr["objective"],
                "finding": f"{kr['metric']} at {kr['actual']:.2f} vs target {kr['target']:.2f} ({kr['progress_pct']:.0f}% progress)",
                "recommendation": f"Prioritize experiments targeting {kr['metric']} next quarter"
            })

# Experiment velocity recommendation
if experiment_portfolio["velocity"] < 1.0:
    recommendations.append({
        "area": "Experimentation",
        "finding": f"Running {experiment_portfolio['velocity']:.1f} experiments/week (below 1/week target)",
        "recommendation": "Increase experiment throughput; consider smaller, faster tests"
    })

# Data quality recommendation
if dq_trends["trend"] == "declining":
    recommendations.append({
        "area": "Data Quality",
        "finding": f"Quality score declined from {dq_trends['q_start_score']:.2f} to {dq_trends['q_end_score']:.2f}",
        "recommendation": "Allocate engineering time to address persistent data quality issues"
    })
```

### Step 8: Assemble and distribute

```python
quarterly_report = {
    "title": f"Quarterly Business Review: {quarter_label}",
    "generated_at": now(),
    "sections": {
        "executive_summary": generate_quarterly_summary(okr_results, experiment_portfolio, cohort_trends),
        "okr_progress": okr_results,
        "strategic_metrics": quarterly_metric_trends,
        "experiment_portfolio": experiment_portfolio,
        "cohort_lifecycle": cohort_trends,
        "data_quality": dq_trends,
        "recommendations": recommendations
    }
}

insert_report("analytics.quarterly_reports", quarterly_report)
send_email(to=report_config["quarterly_recipients"], subject=quarterly_report["title"],
           body=format_html_with_charts(quarterly_report))
post_to_slack(channel="#quarterly-review", blocks=format_executive_summary_blocks(quarterly_report))
```

## Outputs

| Output | Destination | Description |
|---|---|---|
| `analytics.quarterly_reports` | Data warehouse | Archived quarterly report data |
| Email | Executive team + board | Full HTML report with charts and tables |
| Slack summary | #quarterly-review | Key highlights and OKR scorecard |
| Slide deck data | Google Sheets / export | Structured data for presentation slides |
| Job log | `analytics.job_log` | Run metadata |

## Error Handling

| Error | Action |
|---|---|
| OKR config not found for the quarter | Use previous quarter targets with warning, alert analytics lead |
| Incomplete quarter data (e.g., last days missing) | Proceed with available data, note cutoff date prominently |
| Monthly reports missing for a month in the quarter | Regenerate from raw data, flag delay |
| CLV data stale (not refreshed in >2 weeks) | Use latest available, mark as stale in report |
| Chart generation failure | Include data tables instead, log rendering error |
| Too many recommendations (>10) | Prioritize by impact, include top 5 in main report, full list in appendix |

## Schedule / Trigger

- **Cron**: `0 10 * * 1` on the first Monday of Jan, Apr, Jul, Oct
- **Manual**: `python run_script.py quarterly-review-builder --quarter 2026-Q1`
