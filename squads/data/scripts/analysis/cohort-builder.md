# cohort-builder

## Purpose

Builds cohort tables from raw event data, assigning users to cohorts based on configurable definitions (signup date, first purchase, first feature use). Produces a reusable cohort base table that feeds retention analysis, CLV calculations, and experiment segmentation.

## When to Run

- **Scheduled**: Daily at 06:00 UTC to incorporate the previous day's signups and events.
- **Triggered**: When a new cohort definition is added to the configuration.
- **Ad-hoc**: When analysts need a custom cohort for exploratory analysis.

## Inputs

| Input | Source | Description |
|---|---|---|
| `analytics.raw_events` | Data warehouse | Timestamped user events with event_name, user_id, properties |
| `analytics.users` | Data warehouse | User master table with signup_date, attributes |
| Cohort parameters | CLI args or config file | Cohort definition, time granularity, metric to track |

### Parameters

| Parameter | Type | Default | Description |
|---|---|---|---|
| `cohort_type` | string | `signup_date` | What defines cohort membership: `signup_date`, `first_purchase`, `first_event:{event_name}` |
| `granularity` | string | `week` | Time bucketing: `day`, `week`, `month` |
| `metric` | string | `active_days` | Metric to compute per cohort member: `active_days`, `revenue`, `event_count:{event_name}` |
| `start_date` | date | 90 days ago | Earliest cohort date to include |
| `end_date` | date | yesterday | Latest cohort date to include |

## Process

### Step 1: Determine cohort assignment date per user

```sql
-- For signup_date cohorts
CREATE TEMPORARY TABLE cohort_assignments AS
SELECT
    user_id,
    DATE_TRUNC(:granularity, signup_date) AS cohort_date,
    signup_date AS assignment_date
FROM analytics.users
WHERE signup_date BETWEEN :start_date AND :end_date;

-- For first_purchase cohorts
CREATE TEMPORARY TABLE cohort_assignments AS
SELECT
    user_id,
    DATE_TRUNC(:granularity, MIN(event_timestamp)) AS cohort_date,
    MIN(event_timestamp)::DATE AS assignment_date
FROM analytics.raw_events
WHERE event_name = 'purchase_completed'
  AND event_timestamp BETWEEN :start_date AND :end_date
GROUP BY user_id;

-- For first arbitrary event cohorts
CREATE TEMPORARY TABLE cohort_assignments AS
SELECT
    user_id,
    DATE_TRUNC(:granularity, MIN(event_timestamp)) AS cohort_date,
    MIN(event_timestamp)::DATE AS assignment_date
FROM analytics.raw_events
WHERE event_name = :cohort_event_name
  AND event_timestamp BETWEEN :start_date AND :end_date
GROUP BY user_id;
```

### Step 2: Build activity spine (periods since cohort assignment)

```sql
CREATE TEMPORARY TABLE period_spine AS
SELECT DISTINCT
    DATE_TRUNC(:granularity, d.date_value) AS period_date,
    DATEDIFF(:granularity, :start_date, DATE_TRUNC(:granularity, d.date_value)) AS period_index
FROM analytics.date_dim d
WHERE d.date_value BETWEEN :start_date AND CURRENT_DATE;
```

### Step 3: Compute metric per user per period

```sql
-- For active_days metric
CREATE TEMPORARY TABLE user_period_metrics AS
SELECT
    c.user_id,
    c.cohort_date,
    DATEDIFF(:granularity, c.assignment_date, DATE_TRUNC(:granularity, e.event_timestamp)) AS periods_since_assignment,
    COUNT(DISTINCT e.event_timestamp::DATE) AS active_days,
    COUNT(*) AS total_events
FROM cohort_assignments c
JOIN analytics.raw_events e ON c.user_id = e.user_id
WHERE e.event_timestamp >= c.assignment_date
  AND e.event_timestamp < DATEADD(:granularity, 52, c.assignment_date)  -- cap at 52 periods
GROUP BY c.user_id, c.cohort_date, periods_since_assignment;

-- For revenue metric
CREATE TEMPORARY TABLE user_period_metrics AS
SELECT
    c.user_id,
    c.cohort_date,
    DATEDIFF(:granularity, c.assignment_date, DATE_TRUNC(:granularity, e.event_timestamp)) AS periods_since_assignment,
    SUM(e.event_properties:amount::FLOAT) AS revenue
FROM cohort_assignments c
JOIN analytics.raw_events e ON c.user_id = e.user_id
WHERE e.event_name = 'purchase_completed'
  AND e.event_timestamp >= c.assignment_date
GROUP BY c.user_id, c.cohort_date, periods_since_assignment;
```

### Step 4: Aggregate to cohort level

```sql
CREATE OR REPLACE TABLE analytics.cohort_base AS
SELECT
    cohort_date,
    periods_since_assignment,
    COUNT(DISTINCT user_id) AS cohort_size,
    COUNT(DISTINCT CASE WHEN active_days > 0 THEN user_id END) AS active_users,
    SUM(active_days) AS total_active_days,
    AVG(active_days) AS avg_active_days,
    SUM(total_events) AS total_events,
    AVG(total_events) AS avg_events
FROM user_period_metrics
GROUP BY cohort_date, periods_since_assignment
ORDER BY cohort_date, periods_since_assignment;
```

### Step 5: Add cohort metadata

```sql
CREATE OR REPLACE TABLE analytics.cohort_summary AS
SELECT
    cohort_date,
    :cohort_type AS cohort_type,
    :granularity AS granularity,
    :metric AS tracked_metric,
    COUNT(DISTINCT user_id) AS cohort_size,
    MIN(assignment_date) AS earliest_assignment,
    MAX(assignment_date) AS latest_assignment
FROM cohort_assignments
GROUP BY cohort_date;
```

### Step 6: Validate and log

```python
total_users_assigned = sum(cohort.cohort_size for cohort in cohort_summary)
total_users_eligible = count_eligible_users(start_date, end_date)

if total_users_assigned / total_users_eligible < 0.95:
    log_warning(f"Only {total_users_assigned}/{total_users_eligible} users assigned to cohorts. "
                f"Check for missing data in cohort definition source.")

log_job_completion("cohort_builder", {
    "cohort_type": cohort_type,
    "granularity": granularity,
    "cohorts_created": len(cohort_summary),
    "total_users": total_users_assigned,
    "date_range": f"{start_date} to {end_date}"
})
```

## Outputs

| Output | Destination | Description |
|---|---|---|
| `analytics.cohort_base` | Data warehouse | Cohort-level aggregated metrics by period |
| `analytics.cohort_summary` | Data warehouse | Cohort metadata (size, type, date range) |
| `analytics.cohort_user_map` | Data warehouse | User-to-cohort mapping for downstream joins |
| Job log | `analytics.job_log` | Run metadata and validation results |

## Error Handling

| Error | Action |
|---|---|
| No users match cohort definition in date range | Abort gracefully, log as info, do not overwrite existing tables |
| Event table missing expected columns | Fail with descriptive error listing missing columns |
| Granularity produces >200 cohorts | Warn analyst that visualization may be cluttered, proceed anyway |
| Duplicate user assignments (user qualifies for multiple cohorts) | Assign to earliest cohort only, log count of re-assignments |
| Warehouse timeout on large date range | Process in monthly chunks, merge results |

## Schedule / Trigger

- **Cron**: `0 6 * * *` (daily at 06:00 UTC)
- **Manual**: `python run_script.py cohort-builder --cohort-type signup_date --granularity week --metric active_days --start 2026-01-01 --end 2026-03-05`
