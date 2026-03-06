# retention-curves-generator

## Purpose

Generates retention and survival curves from cohort data produced by `cohort-builder`. Computes standard retention rates (D1, D7, D30, D90), builds survival curves, and enables cohort-over-cohort comparison. Outputs tables and chart-ready datasets for dashboards and reports.

## When to Run

- **Scheduled**: Daily at 06:30 UTC, after cohort-builder completes.
- **Triggered**: After any cohort-builder refresh.
- **Ad-hoc**: When preparing retention analysis for product reviews.

## Inputs

| Input | Source | Description |
|---|---|---|
| `analytics.cohort_base` | Data warehouse | Cohort-level metrics by period (from cohort-builder) |
| `analytics.cohort_summary` | Data warehouse | Cohort metadata |
| `analytics.cohort_user_map` | Data warehouse | User-to-cohort mapping |
| `analytics.raw_events` | Data warehouse | Raw events for computing return visits |
| Parameters | CLI args | comparison_cohorts, retention_days, segments |

### Parameters

| Parameter | Type | Default | Description |
|---|---|---|---|
| `retention_periods` | list[int] | `[1,7,14,30,60,90]` | Day offsets to measure retention |
| `granularity` | string | `week` | Must match cohort-builder granularity |
| `segments` | list[string] | `[]` | Optional: `platform`, `country`, `plan_type` |
| `compare_cohorts` | list[date] | all | Specific cohort dates to compare |

## Process

### Step 1: Compute per-user retention flags

```sql
CREATE TEMPORARY TABLE user_retention AS
SELECT
    c.user_id,
    c.cohort_date,
    c.assignment_date,
    -- D1: returned on day 1 after assignment
    MAX(CASE WHEN DATEDIFF('day', c.assignment_date, e.event_timestamp::DATE) = 1 THEN 1 ELSE 0 END) AS retained_d1,
    MAX(CASE WHEN DATEDIFF('day', c.assignment_date, e.event_timestamp::DATE) BETWEEN 6 AND 8 THEN 1 ELSE 0 END) AS retained_d7,
    MAX(CASE WHEN DATEDIFF('day', c.assignment_date, e.event_timestamp::DATE) BETWEEN 13 AND 15 THEN 1 ELSE 0 END) AS retained_d14,
    MAX(CASE WHEN DATEDIFF('day', c.assignment_date, e.event_timestamp::DATE) BETWEEN 28 AND 32 THEN 1 ELSE 0 END) AS retained_d30,
    MAX(CASE WHEN DATEDIFF('day', c.assignment_date, e.event_timestamp::DATE) BETWEEN 58 AND 62 THEN 1 ELSE 0 END) AS retained_d60,
    MAX(CASE WHEN DATEDIFF('day', c.assignment_date, e.event_timestamp::DATE) BETWEEN 88 AND 92 THEN 1 ELSE 0 END) AS retained_d90
FROM analytics.cohort_user_map c
LEFT JOIN analytics.raw_events e
    ON c.user_id = e.user_id
    AND e.event_timestamp >= c.assignment_date
    AND e.event_timestamp < DATEADD('day', 93, c.assignment_date)
GROUP BY c.user_id, c.cohort_date, c.assignment_date;
```

### Step 2: Aggregate retention rates by cohort

```sql
CREATE OR REPLACE TABLE analytics.retention_rates AS
SELECT
    cohort_date,
    COUNT(*) AS cohort_size,
    AVG(retained_d1) AS retention_d1,
    AVG(retained_d7) AS retention_d7,
    AVG(retained_d14) AS retention_d14,
    AVG(retained_d30) AS retention_d30,
    AVG(retained_d60) AS retention_d60,
    AVG(retained_d90) AS retention_d90
FROM user_retention
GROUP BY cohort_date
ORDER BY cohort_date;
```

### Step 3: Build daily survival curve

For a more granular view, compute the fraction of users surviving (returning at least once) at each day offset.

```sql
CREATE OR REPLACE TABLE analytics.survival_curve AS
WITH daily_activity AS (
    SELECT
        c.user_id,
        c.cohort_date,
        DATEDIFF('day', c.assignment_date, e.event_timestamp::DATE) AS day_offset
    FROM analytics.cohort_user_map c
    JOIN analytics.raw_events e
        ON c.user_id = e.user_id
        AND e.event_timestamp >= c.assignment_date
        AND e.event_timestamp < DATEADD('day', 91, c.assignment_date)
    GROUP BY c.user_id, c.cohort_date, day_offset
),
last_seen AS (
    SELECT user_id, cohort_date, MAX(day_offset) AS last_active_day
    FROM daily_activity
    GROUP BY user_id, cohort_date
)
SELECT
    ls.cohort_date,
    d.day_number,
    COUNT(DISTINCT ls.user_id) FILTER (WHERE ls.last_active_day >= d.day_number) AS surviving_users,
    s.cohort_size,
    COUNT(DISTINCT ls.user_id) FILTER (WHERE ls.last_active_day >= d.day_number)::FLOAT / s.cohort_size AS survival_rate
FROM last_seen ls
CROSS JOIN (SELECT ROW_NUMBER() OVER (ORDER BY seq4()) - 1 AS day_number FROM TABLE(GENERATOR(ROWCOUNT => 91))) d
JOIN analytics.cohort_summary s ON ls.cohort_date = s.cohort_date
GROUP BY ls.cohort_date, d.day_number, s.cohort_size
ORDER BY ls.cohort_date, d.day_number;
```

### Step 4: Segmented retention (if segments requested)

```sql
-- Example: retention by platform
CREATE OR REPLACE TABLE analytics.retention_rates_segmented AS
SELECT
    r.cohort_date,
    u.platform,
    COUNT(*) AS cohort_size,
    AVG(r.retained_d1) AS retention_d1,
    AVG(r.retained_d7) AS retention_d7,
    AVG(r.retained_d30) AS retention_d30,
    AVG(r.retained_d90) AS retention_d90
FROM user_retention r
JOIN analytics.users u ON r.user_id = u.user_id
GROUP BY r.cohort_date, u.platform
ORDER BY r.cohort_date, u.platform;
```

### Step 5: Cohort comparison

```python
comparison_cohorts = params.get("compare_cohorts", None)

if comparison_cohorts:
    # Pull retention curves for specific cohorts for side-by-side comparison
    comparison_data = query("""
        SELECT cohort_date, day_number, survival_rate
        FROM analytics.survival_curve
        WHERE cohort_date IN ({cohort_list})
        ORDER BY cohort_date, day_number
    """, cohort_list=comparison_cohorts)

    # Compute deltas between consecutive cohorts
    for i in range(1, len(comparison_cohorts)):
        current = comparison_data[comparison_data.cohort_date == comparison_cohorts[i]]
        previous = comparison_data[comparison_data.cohort_date == comparison_cohorts[i-1]]
        delta = current.survival_rate - previous.survival_rate
        insert_comparison("analytics.retention_comparison", comparison_cohorts[i], comparison_cohorts[i-1], delta)
```

### Step 6: Compute summary statistics

```python
latest_cohort = retention_rates.iloc[-1]
overall_trend = {
    "latest_d1": latest_cohort.retention_d1,
    "latest_d7": latest_cohort.retention_d7,
    "latest_d30": latest_cohort.retention_d30,
    "d7_trend_4w": compute_trend(retention_rates.tail(4)["retention_d7"]),  # slope over last 4 cohorts
    "d30_trend_4w": compute_trend(retention_rates.tail(4)["retention_d30"]),
}

log_job_completion("retention_curves_generator", overall_trend)
```

## Outputs

| Output | Destination | Description |
|---|---|---|
| `analytics.retention_rates` | Data warehouse | Cohort-level D1/D7/D14/D30/D60/D90 retention rates |
| `analytics.survival_curve` | Data warehouse | Daily survival rates per cohort |
| `analytics.retention_rates_segmented` | Data warehouse | Retention broken by segment dimensions |
| `analytics.retention_comparison` | Data warehouse | Side-by-side cohort comparison deltas |
| Job log | `analytics.job_log` | Run summary with latest retention stats |

## Error Handling

| Error | Action |
|---|---|
| Cohort table empty or missing | Abort, log dependency failure, suggest running cohort-builder first |
| Cohort too young for requested period (e.g., D90 for 2-week-old cohort) | Compute only available periods, mark others as NULL |
| Zero events for a cohort in retention window | Set retention to 0.0 (not NULL) for that period, flag for review |
| Segment column not found | Skip segmented analysis, log warning, proceed with unsegmented |
| Large cohort causing query timeout | Process cohorts in batches of 10, merge results |

## Schedule / Trigger

- **Cron**: `30 6 * * *` (daily at 06:30 UTC, after cohort-builder)
- **Dependency**: Waits for `cohort-builder` job success signal
- **Manual**: `python run_script.py retention-curves-generator --granularity week --segments platform,country`
