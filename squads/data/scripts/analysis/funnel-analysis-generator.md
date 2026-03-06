# funnel-analysis-generator

## Purpose

Generates funnel analysis from sequential event data. Measures conversion rates between configurable steps, supports time-window constraints between steps, and enables segmentation by user attributes. Identifies where users drop off and quantifies the impact of each funnel stage.

## When to Run

- **Scheduled**: Weekly on Mondays at 07:00 UTC for standard funnels.
- **Triggered**: On-demand when product teams define new funnels or launch features.
- **Ad-hoc**: During product reviews or when investigating conversion changes.

## Inputs

| Input | Source | Description |
|---|---|---|
| `analytics.raw_events` | Data warehouse | Timestamped user events |
| `analytics.users` | Data warehouse | User attributes for segmentation |
| Funnel definition | CLI args or `config/funnels.yaml` | Ordered steps, time windows, segments |

### Parameters

| Parameter | Type | Default | Description |
|---|---|---|---|
| `funnel_name` | string | required | Identifier for the funnel |
| `steps` | list[dict] | required | Ordered list of `{event_name, label}` |
| `time_window_minutes` | int | 1440 (24h) | Max time between first and last step |
| `step_timeout_minutes` | int | null | Max time between consecutive steps |
| `date_range` | tuple[date] | last 30 days | Analysis window |
| `segments` | list[string] | `[]` | User attributes to segment by |

## Process

### Step 1: Parse funnel definition

```python
funnel_config = {
    "funnel_name": "onboarding_funnel",
    "steps": [
        {"event_name": "page_viewed", "label": "Landing Page", "filter": "page_name = 'home'"},
        {"event_name": "signup_started", "label": "Signup Started"},
        {"event_name": "signup_completed", "label": "Signup Completed"},
        {"event_name": "onboarding_step_completed", "label": "Onboarding Done", "filter": "step = 'final'"},
        {"event_name": "first_action_taken", "label": "First Value Action"}
    ],
    "time_window_minutes": 4320,  # 3 days
    "step_timeout_minutes": 1440  # 24h between steps
}
```

### Step 2: Build step CTEs dynamically

```sql
WITH step_1 AS (
    SELECT
        user_id,
        MIN(event_timestamp) AS step_1_ts
    FROM analytics.raw_events
    WHERE event_name = 'page_viewed'
      AND event_properties:page_name::STRING = 'home'
      AND event_timestamp BETWEEN :start_date AND :end_date
    GROUP BY user_id
),
step_2 AS (
    SELECT
        s1.user_id,
        s1.step_1_ts,
        MIN(e.event_timestamp) AS step_2_ts
    FROM step_1 s1
    JOIN analytics.raw_events e
        ON s1.user_id = e.user_id
        AND e.event_name = 'signup_started'
        AND e.event_timestamp > s1.step_1_ts
        AND e.event_timestamp <= DATEADD('minute', :step_timeout, s1.step_1_ts)
    GROUP BY s1.user_id, s1.step_1_ts
),
step_3 AS (
    SELECT
        s2.user_id,
        s2.step_1_ts,
        s2.step_2_ts,
        MIN(e.event_timestamp) AS step_3_ts
    FROM step_2 s2
    JOIN analytics.raw_events e
        ON s2.user_id = e.user_id
        AND e.event_name = 'signup_completed'
        AND e.event_timestamp > s2.step_2_ts
        AND e.event_timestamp <= DATEADD('minute', :step_timeout, s2.step_2_ts)
    GROUP BY s2.user_id, s2.step_1_ts, s2.step_2_ts
),
-- ... repeat for steps 4 and 5 ...
```

### Step 3: Compute funnel metrics

```sql
funnel_summary AS (
    SELECT
        'Landing Page' AS step_label,
        1 AS step_number,
        COUNT(DISTINCT user_id) AS users_at_step,
        COUNT(DISTINCT user_id) AS users_entering,
        1.0 AS conversion_from_top,
        1.0 AS conversion_from_previous,
        NULL AS median_time_from_previous_seconds
    FROM step_1

    UNION ALL

    SELECT
        'Signup Started',
        2,
        COUNT(DISTINCT user_id),
        (SELECT COUNT(DISTINCT user_id) FROM step_1),
        COUNT(DISTINCT user_id)::FLOAT / NULLIF((SELECT COUNT(DISTINCT user_id) FROM step_1), 0),
        COUNT(DISTINCT user_id)::FLOAT / NULLIF((SELECT COUNT(DISTINCT user_id) FROM step_1), 0),
        MEDIAN(DATEDIFF('second', step_1_ts, step_2_ts))
    FROM step_2

    UNION ALL

    SELECT
        'Signup Completed',
        3,
        COUNT(DISTINCT user_id),
        (SELECT COUNT(DISTINCT user_id) FROM step_1),
        COUNT(DISTINCT user_id)::FLOAT / NULLIF((SELECT COUNT(DISTINCT user_id) FROM step_1), 0),
        COUNT(DISTINCT user_id)::FLOAT / NULLIF((SELECT COUNT(DISTINCT user_id) FROM step_2), 0),
        MEDIAN(DATEDIFF('second', step_2_ts, step_3_ts))
    FROM step_3

    -- ... continue for remaining steps ...
)
SELECT * FROM funnel_summary ORDER BY step_number;
```

### Step 4: Segment the funnel

```sql
CREATE OR REPLACE TABLE analytics.funnel_segmented AS
SELECT
    u.platform AS segment_value,
    'platform' AS segment_dimension,
    -- Step 1 count
    COUNT(DISTINCT s1.user_id) AS step_1_users,
    -- Step 2 count
    COUNT(DISTINCT s2.user_id) AS step_2_users,
    -- Step 3 count
    COUNT(DISTINCT s3.user_id) AS step_3_users,
    -- Conversion rates
    COUNT(DISTINCT s2.user_id)::FLOAT / NULLIF(COUNT(DISTINCT s1.user_id), 0) AS step_1_to_2_rate,
    COUNT(DISTINCT s3.user_id)::FLOAT / NULLIF(COUNT(DISTINCT s2.user_id), 0) AS step_2_to_3_rate
FROM step_1 s1
JOIN analytics.users u ON s1.user_id = u.user_id
LEFT JOIN step_2 s2 ON s1.user_id = s2.user_id
LEFT JOIN step_3 s3 ON s2.user_id = s3.user_id
GROUP BY u.platform;
```

### Step 5: Time-between-steps analysis

```sql
CREATE OR REPLACE TABLE analytics.funnel_time_analysis AS
SELECT
    'Step 1 -> Step 2' AS transition,
    COUNT(*) AS users,
    AVG(DATEDIFF('second', step_1_ts, step_2_ts)) AS avg_seconds,
    MEDIAN(DATEDIFF('second', step_1_ts, step_2_ts)) AS median_seconds,
    PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY DATEDIFF('second', step_1_ts, step_2_ts)) AS p90_seconds
FROM step_2

UNION ALL

SELECT
    'Step 2 -> Step 3',
    COUNT(*),
    AVG(DATEDIFF('second', step_2_ts, step_3_ts)),
    MEDIAN(DATEDIFF('second', step_2_ts, step_3_ts)),
    PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY DATEDIFF('second', step_2_ts, step_3_ts))
FROM step_3;
```

### Step 6: Persist results

```python
insert_results("analytics.funnel_results", {
    "funnel_name": funnel_config["funnel_name"],
    "run_date": today,
    "date_range_start": start_date,
    "date_range_end": end_date,
    "summary": funnel_summary,
    "segmented": funnel_segmented,
    "time_analysis": funnel_time_analysis
})

log_job_completion("funnel_analysis_generator", {
    "funnel": funnel_config["funnel_name"],
    "top_of_funnel": funnel_summary[0].users_at_step,
    "bottom_of_funnel": funnel_summary[-1].users_at_step,
    "overall_conversion": funnel_summary[-1].conversion_from_top
})
```

## Outputs

| Output | Destination | Description |
|---|---|---|
| `analytics.funnel_results` | Data warehouse | Step-by-step conversion summary |
| `analytics.funnel_segmented` | Data warehouse | Conversion rates broken by segment |
| `analytics.funnel_time_analysis` | Data warehouse | Time-between-steps statistics |
| Job log | `analytics.job_log` | Run metadata with headline conversion numbers |

## Error Handling

| Error | Action |
|---|---|
| Event name in funnel definition not found in data | Flag step as having 0 users, warn that event may be misspelled or not tracked |
| Zero users at top of funnel | Abort, log as data issue (likely bad date range or filter), do not overwrite prior results |
| Step timeout produces 0 conversions but no-timeout shows conversions | Log suggestion to increase step_timeout_minutes |
| Segment column missing from users table | Skip that segment, log warning, proceed with remaining segments |
| Query timeout on large funnels | Process date range in weekly chunks, union results |

## Schedule / Trigger

- **Cron**: `0 7 * * 1` (Mondays at 07:00 UTC)
- **Manual**: `python run_script.py funnel-analysis-generator --funnel onboarding_funnel --start 2026-02-01 --end 2026-03-05 --segments platform,country`
