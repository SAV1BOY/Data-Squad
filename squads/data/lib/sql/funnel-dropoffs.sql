/*
  Funnel Analysis with Step-by-Step Dropoff Rates
  ================================================
  SQL for analyzing conversion funnels and identifying where users drop off.

  Tables referenced:
    - events (user_id, event_name, event_timestamp, event_date, session_id)
    - users (user_id, signup_date, platform, plan_type)
*/


-- =============================================================================
-- 1. BASIC LINEAR FUNNEL
-- =============================================================================
-- Counts users who reached each step, in order. A user must complete step N
-- before being counted at step N+1.

WITH funnel_events AS (
  SELECT
    user_id,
    event_name,
    MIN(event_timestamp) AS first_occurrence
  FROM events
  WHERE event_date BETWEEN '2026-01-01' AND '2026-01-31'
    AND event_name IN (
      'visited_landing_page',
      'started_signup',
      'completed_signup',
      'completed_onboarding',
      'made_first_purchase'
    )
  GROUP BY user_id, event_name
),

-- Ensure ordering: each user must have completed prior steps
ordered_funnel AS (
  SELECT
    user_id,
    MAX(CASE WHEN event_name = 'visited_landing_page' THEN 1 ELSE 0 END) AS step_1,
    MAX(CASE WHEN event_name = 'started_signup' THEN 1 ELSE 0 END) AS step_2,
    MAX(CASE WHEN event_name = 'completed_signup' THEN 1 ELSE 0 END) AS step_3,
    MAX(CASE WHEN event_name = 'completed_onboarding' THEN 1 ELSE 0 END) AS step_4,
    MAX(CASE WHEN event_name = 'made_first_purchase' THEN 1 ELSE 0 END) AS step_5
  FROM funnel_events
  GROUP BY user_id
),

-- Apply strict ordering: user must have completed all prior steps
strict_funnel AS (
  SELECT
    user_id,
    step_1,
    CASE WHEN step_1 = 1 AND step_2 = 1 THEN 1 ELSE 0 END AS step_2_strict,
    CASE WHEN step_1 = 1 AND step_2 = 1 AND step_3 = 1 THEN 1 ELSE 0 END AS step_3_strict,
    CASE WHEN step_1 = 1 AND step_2 = 1 AND step_3 = 1 AND step_4 = 1 THEN 1 ELSE 0 END AS step_4_strict,
    CASE WHEN step_1 = 1 AND step_2 = 1 AND step_3 = 1 AND step_4 = 1 AND step_5 = 1 THEN 1 ELSE 0 END AS step_5_strict
  FROM ordered_funnel
)

SELECT
  'Step 1: Visited Landing Page' AS step_name,
  SUM(step_1) AS users,
  100.0 AS pct_of_top,
  NULL AS dropoff_rate_pct
FROM strict_funnel
UNION ALL
SELECT
  'Step 2: Started Signup',
  SUM(step_2_strict),
  ROUND(100.0 * SUM(step_2_strict) / NULLIF(SUM(step_1), 0), 1),
  ROUND(100.0 * (1.0 - SUM(step_2_strict) * 1.0 / NULLIF(SUM(step_1), 0)), 1)
FROM strict_funnel
UNION ALL
SELECT
  'Step 3: Completed Signup',
  SUM(step_3_strict),
  ROUND(100.0 * SUM(step_3_strict) / NULLIF(SUM(step_1), 0), 1),
  ROUND(100.0 * (1.0 - SUM(step_3_strict) * 1.0 / NULLIF(SUM(step_2_strict), 0)), 1)
FROM strict_funnel
UNION ALL
SELECT
  'Step 4: Completed Onboarding',
  SUM(step_4_strict),
  ROUND(100.0 * SUM(step_4_strict) / NULLIF(SUM(step_1), 0), 1),
  ROUND(100.0 * (1.0 - SUM(step_4_strict) * 1.0 / NULLIF(SUM(step_3_strict), 0)), 1)
FROM strict_funnel
UNION ALL
SELECT
  'Step 5: Made First Purchase',
  SUM(step_5_strict),
  ROUND(100.0 * SUM(step_5_strict) / NULLIF(SUM(step_1), 0), 1),
  ROUND(100.0 * (1.0 - SUM(step_5_strict) * 1.0 / NULLIF(SUM(step_4_strict), 0)), 1)
FROM strict_funnel;


-- =============================================================================
-- 2. FUNNEL BY SEGMENT (e.g., by platform)
-- =============================================================================
-- Same funnel, broken down by a dimension to identify segment-specific issues.

WITH funnel_events AS (
  SELECT
    e.user_id,
    u.platform,
    e.event_name,
    MIN(e.event_timestamp) AS first_occurrence
  FROM events AS e
  INNER JOIN users AS u ON e.user_id = u.user_id
  WHERE e.event_date BETWEEN '2026-01-01' AND '2026-01-31'
    AND e.event_name IN (
      'visited_landing_page',
      'started_signup',
      'completed_signup',
      'completed_onboarding',
      'made_first_purchase'
    )
  GROUP BY e.user_id, u.platform, e.event_name
),

funnel_by_platform AS (
  SELECT
    platform,
    COUNT(DISTINCT user_id) AS step_1_users,
    COUNT(DISTINCT CASE WHEN event_name = 'started_signup' THEN user_id END) AS step_2_users,
    COUNT(DISTINCT CASE WHEN event_name = 'completed_signup' THEN user_id END) AS step_3_users,
    COUNT(DISTINCT CASE WHEN event_name = 'completed_onboarding' THEN user_id END) AS step_4_users,
    COUNT(DISTINCT CASE WHEN event_name = 'made_first_purchase' THEN user_id END) AS step_5_users
  FROM funnel_events
  GROUP BY platform
)

SELECT
  platform,
  step_1_users,
  step_2_users,
  step_3_users,
  step_4_users,
  step_5_users,
  -- Step-to-step conversion rates
  ROUND(100.0 * step_2_users / NULLIF(step_1_users, 0), 1) AS step1_to_2_pct,
  ROUND(100.0 * step_3_users / NULLIF(step_2_users, 0), 1) AS step2_to_3_pct,
  ROUND(100.0 * step_4_users / NULLIF(step_3_users, 0), 1) AS step3_to_4_pct,
  ROUND(100.0 * step_5_users / NULLIF(step_4_users, 0), 1) AS step4_to_5_pct,
  -- Overall conversion (top to bottom)
  ROUND(100.0 * step_5_users / NULLIF(step_1_users, 0), 1) AS overall_conversion_pct
FROM funnel_by_platform
ORDER BY step_1_users DESC;


-- =============================================================================
-- 3. TIME-BETWEEN-STEPS ANALYSIS
-- =============================================================================
-- How long does it take users to move between each funnel step?
-- Identifies steps where users stall.

WITH step_timestamps AS (
  SELECT
    user_id,
    MIN(CASE WHEN event_name = 'visited_landing_page' THEN event_timestamp END) AS step_1_at,
    MIN(CASE WHEN event_name = 'started_signup' THEN event_timestamp END) AS step_2_at,
    MIN(CASE WHEN event_name = 'completed_signup' THEN event_timestamp END) AS step_3_at,
    MIN(CASE WHEN event_name = 'completed_onboarding' THEN event_timestamp END) AS step_4_at,
    MIN(CASE WHEN event_name = 'made_first_purchase' THEN event_timestamp END) AS step_5_at
  FROM events
  WHERE event_date BETWEEN '2026-01-01' AND '2026-01-31'
    AND event_name IN (
      'visited_landing_page',
      'started_signup',
      'completed_signup',
      'completed_onboarding',
      'made_first_purchase'
    )
  GROUP BY user_id
)

SELECT
  'Step 1 -> 2' AS transition,
  COUNT(*) AS users_who_completed,
  ROUND(AVG(EXTRACT(EPOCH FROM (step_2_at - step_1_at)) / 60.0), 1) AS avg_minutes,
  ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY EXTRACT(EPOCH FROM (step_2_at - step_1_at)) / 60.0), 1) AS median_minutes,
  ROUND(PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY EXTRACT(EPOCH FROM (step_2_at - step_1_at)) / 60.0), 1) AS p90_minutes
FROM step_timestamps
WHERE step_1_at IS NOT NULL AND step_2_at IS NOT NULL AND step_2_at > step_1_at

UNION ALL

SELECT
  'Step 2 -> 3',
  COUNT(*),
  ROUND(AVG(EXTRACT(EPOCH FROM (step_3_at - step_2_at)) / 60.0), 1),
  ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY EXTRACT(EPOCH FROM (step_3_at - step_2_at)) / 60.0), 1),
  ROUND(PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY EXTRACT(EPOCH FROM (step_3_at - step_2_at)) / 60.0), 1)
FROM step_timestamps
WHERE step_2_at IS NOT NULL AND step_3_at IS NOT NULL AND step_3_at > step_2_at

UNION ALL

SELECT
  'Step 3 -> 4',
  COUNT(*),
  ROUND(AVG(EXTRACT(EPOCH FROM (step_4_at - step_3_at)) / 60.0), 1),
  ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY EXTRACT(EPOCH FROM (step_4_at - step_3_at)) / 60.0), 1),
  ROUND(PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY EXTRACT(EPOCH FROM (step_4_at - step_3_at)) / 60.0), 1)
FROM step_timestamps
WHERE step_3_at IS NOT NULL AND step_4_at IS NOT NULL AND step_4_at > step_3_at

UNION ALL

SELECT
  'Step 4 -> 5',
  COUNT(*),
  ROUND(AVG(EXTRACT(EPOCH FROM (step_5_at - step_4_at)) / 60.0), 1),
  ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY EXTRACT(EPOCH FROM (step_5_at - step_4_at)) / 60.0), 1),
  ROUND(PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY EXTRACT(EPOCH FROM (step_5_at - step_4_at)) / 60.0), 1)
FROM step_timestamps
WHERE step_4_at IS NOT NULL AND step_5_at IS NOT NULL AND step_5_at > step_4_at;


-- =============================================================================
-- 4. DROPOFF DESTINATION ANALYSIS
-- =============================================================================
-- For users who dropped off at each step, what did they do instead?
-- Helps identify friction points and alternative paths.

WITH step_timestamps AS (
  SELECT
    user_id,
    MIN(CASE WHEN event_name = 'completed_signup' THEN event_timestamp END) AS signup_at,
    MIN(CASE WHEN event_name = 'completed_onboarding' THEN event_timestamp END) AS onboarding_at
  FROM events
  WHERE event_date BETWEEN '2026-01-01' AND '2026-01-31'
  GROUP BY user_id
),

-- Users who signed up but did NOT complete onboarding
dropoffs AS (
  SELECT user_id, signup_at
  FROM step_timestamps
  WHERE signup_at IS NOT NULL
    AND onboarding_at IS NULL
),

-- What did dropoff users do after signing up?
dropoff_next_actions AS (
  SELECT
    d.user_id,
    e.event_name,
    e.event_timestamp,
    ROW_NUMBER() OVER (PARTITION BY d.user_id ORDER BY e.event_timestamp ASC) AS action_rank
  FROM dropoffs AS d
  INNER JOIN events AS e
    ON d.user_id = e.user_id
    AND e.event_timestamp > d.signup_at
    AND e.event_timestamp <= d.signup_at + INTERVAL '24 hours'
  WHERE e.event_name != 'completed_signup'  -- exclude the step they already did
)

SELECT
  event_name AS next_action_after_signup,
  COUNT(DISTINCT user_id) AS user_count,
  ROUND(100.0 * COUNT(DISTINCT user_id) / (SELECT COUNT(*) FROM dropoffs), 1) AS pct_of_dropoffs
FROM dropoff_next_actions
WHERE action_rank <= 3  -- first 3 actions after dropping off
GROUP BY event_name
ORDER BY user_count DESC
LIMIT 15;
