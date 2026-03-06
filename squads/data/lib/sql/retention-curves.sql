/*
  Retention Curves
  ================
  SQL for calculating retention rates and survival curves.
  Covers Day 1, Day 7, Day 30, Day 90 retention and full retention curves.

  Tables referenced:
    - users (user_id, signup_date, is_internal)
    - events (user_id, event_name, event_date)
*/


-- =============================================================================
-- 1. CLASSIC N-DAY RETENTION (D1, D7, D30, D90)
-- =============================================================================
-- For each signup cohort (by week), calculate the percentage of users
-- who returned on exactly day N after signup.

WITH cohort_users AS (
  SELECT
    user_id,
    signup_date,
    DATE_TRUNC('week', signup_date) AS cohort_week
  FROM users
  WHERE signup_date >= '2025-01-01'
    AND signup_date < CURRENT_DATE - 90  -- only include cohorts with 90 days of maturity
    AND is_internal = FALSE
),

user_return_days AS (
  -- For each user, find distinct days they were active (relative to signup)
  SELECT DISTINCT
    cu.user_id,
    cu.cohort_week,
    DATEDIFF('day', cu.signup_date, e.event_date) AS days_since_signup
  FROM cohort_users AS cu
  INNER JOIN events AS e
    ON cu.user_id = e.user_id
    AND e.event_date >= cu.signup_date
    AND e.event_date <= cu.signup_date + INTERVAL '90 days'
  WHERE e.event_name IN ('page_view', 'feature_used', 'session_start')
)

SELECT
  cu.cohort_week,
  COUNT(DISTINCT cu.user_id) AS cohort_size,
  -- D1: returned on day 1
  COUNT(DISTINCT CASE WHEN urd.days_since_signup = 1 THEN urd.user_id END) AS d1_users,
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN urd.days_since_signup = 1 THEN urd.user_id END)
    / NULLIF(COUNT(DISTINCT cu.user_id), 0), 1) AS d1_retention_pct,
  -- D7: returned on day 7
  COUNT(DISTINCT CASE WHEN urd.days_since_signup = 7 THEN urd.user_id END) AS d7_users,
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN urd.days_since_signup = 7 THEN urd.user_id END)
    / NULLIF(COUNT(DISTINCT cu.user_id), 0), 1) AS d7_retention_pct,
  -- D30: returned on day 30
  COUNT(DISTINCT CASE WHEN urd.days_since_signup = 30 THEN urd.user_id END) AS d30_users,
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN urd.days_since_signup = 30 THEN urd.user_id END)
    / NULLIF(COUNT(DISTINCT cu.user_id), 0), 1) AS d30_retention_pct,
  -- D90: returned on day 90
  COUNT(DISTINCT CASE WHEN urd.days_since_signup = 90 THEN urd.user_id END) AS d90_users,
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN urd.days_since_signup = 90 THEN urd.user_id END)
    / NULLIF(COUNT(DISTINCT cu.user_id), 0), 1) AS d90_retention_pct
FROM cohort_users AS cu
LEFT JOIN user_return_days AS urd
  ON cu.user_id = urd.user_id
GROUP BY cu.cohort_week
ORDER BY cu.cohort_week;


-- =============================================================================
-- 2. BOUNDED RETENTION (returned within N days, not exactly on day N)
-- =============================================================================
-- More forgiving than exact-day retention. A user counts as "retained at D7"
-- if they were active on any day between day 1 and day 7.

WITH cohort_users AS (
  SELECT
    user_id,
    signup_date,
    DATE_TRUNC('week', signup_date) AS cohort_week
  FROM users
  WHERE signup_date >= '2025-01-01'
    AND signup_date < CURRENT_DATE - 90
    AND is_internal = FALSE
),

user_return_days AS (
  SELECT DISTINCT
    cu.user_id,
    cu.cohort_week,
    DATEDIFF('day', cu.signup_date, e.event_date) AS days_since_signup
  FROM cohort_users AS cu
  INNER JOIN events AS e
    ON cu.user_id = e.user_id
    AND e.event_date > cu.signup_date  -- exclude day 0 (signup day)
    AND e.event_date <= cu.signup_date + INTERVAL '90 days'
  WHERE e.event_name IN ('page_view', 'feature_used', 'session_start')
)

SELECT
  cu.cohort_week,
  COUNT(DISTINCT cu.user_id) AS cohort_size,
  -- Within D1
  COUNT(DISTINCT CASE WHEN urd.days_since_signup BETWEEN 1 AND 1 THEN urd.user_id END) AS within_d1,
  -- Within D7
  COUNT(DISTINCT CASE WHEN urd.days_since_signup BETWEEN 1 AND 7 THEN urd.user_id END) AS within_d7,
  -- Within D30
  COUNT(DISTINCT CASE WHEN urd.days_since_signup BETWEEN 1 AND 30 THEN urd.user_id END) AS within_d30,
  -- Within D90
  COUNT(DISTINCT CASE WHEN urd.days_since_signup BETWEEN 1 AND 90 THEN urd.user_id END) AS within_d90,
  -- Retention rates
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN urd.days_since_signup BETWEEN 1 AND 7 THEN urd.user_id END)
    / NULLIF(COUNT(DISTINCT cu.user_id), 0), 1) AS within_d7_pct,
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN urd.days_since_signup BETWEEN 1 AND 30 THEN urd.user_id END)
    / NULLIF(COUNT(DISTINCT cu.user_id), 0), 1) AS within_d30_pct,
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN urd.days_since_signup BETWEEN 1 AND 90 THEN urd.user_id END)
    / NULLIF(COUNT(DISTINCT cu.user_id), 0), 1) AS within_d90_pct
FROM cohort_users AS cu
LEFT JOIN user_return_days AS urd
  ON cu.user_id = urd.user_id
GROUP BY cu.cohort_week
ORDER BY cu.cohort_week;


-- =============================================================================
-- 3. FULL RETENTION CURVE (weekly periods)
-- =============================================================================
-- Produces a complete retention curve: one row per cohort-week x period-week.
-- This is what you need to draw retention curves in a chart.

WITH cohort_users AS (
  SELECT
    user_id,
    signup_date,
    DATE_TRUNC('week', signup_date) AS cohort_week
  FROM users
  WHERE signup_date >= '2025-01-01'
    AND is_internal = FALSE
),

cohort_sizes AS (
  SELECT
    cohort_week,
    COUNT(DISTINCT user_id) AS cohort_size
  FROM cohort_users
  GROUP BY cohort_week
),

weekly_activity AS (
  SELECT DISTINCT
    cu.user_id,
    cu.cohort_week,
    DATEDIFF('week', cu.cohort_week, DATE_TRUNC('week', e.event_date)) AS period_number
  FROM cohort_users AS cu
  INNER JOIN events AS e
    ON cu.user_id = e.user_id
    AND e.event_date >= cu.cohort_week
  WHERE e.event_name IN ('page_view', 'feature_used', 'session_start')
    AND DATEDIFF('week', cu.cohort_week, DATE_TRUNC('week', e.event_date)) BETWEEN 0 AND 12
)

SELECT
  wa.cohort_week,
  cs.cohort_size,
  wa.period_number,
  COUNT(DISTINCT wa.user_id) AS active_users,
  ROUND(100.0 * COUNT(DISTINCT wa.user_id) / NULLIF(cs.cohort_size, 0), 1) AS retention_pct
FROM weekly_activity AS wa
INNER JOIN cohort_sizes AS cs
  ON wa.cohort_week = cs.cohort_week
GROUP BY wa.cohort_week, cs.cohort_size, wa.period_number
ORDER BY wa.cohort_week, wa.period_number;


-- =============================================================================
-- 4. SURVIVAL CURVE (time to churn)
-- =============================================================================
-- For each user, find when they "churned" (last active day), then calculate
-- the survival rate at each time point.
-- A user is considered churned if they have not been active for 14+ days.

WITH last_activity AS (
  SELECT
    user_id,
    MAX(event_date) AS last_active_date
  FROM events
  WHERE event_name IN ('page_view', 'feature_used', 'session_start')
  GROUP BY user_id
),

user_survival AS (
  SELECT
    u.user_id,
    u.signup_date,
    la.last_active_date,
    CASE
      WHEN la.last_active_date >= CURRENT_DATE - 14 THEN NULL  -- still active, censored
      ELSE DATEDIFF('day', u.signup_date, la.last_active_date)
    END AS days_to_churn,
    CASE
      WHEN la.last_active_date >= CURRENT_DATE - 14 THEN FALSE
      ELSE TRUE
    END AS is_churned
  FROM users AS u
  LEFT JOIN last_activity AS la
    ON u.user_id = la.user_id
  WHERE u.signup_date >= '2025-01-01'
    AND u.signup_date < CURRENT_DATE - 90
    AND u.is_internal = FALSE
),

-- Calculate survival at key time points
survival_summary AS (
  SELECT
    COUNT(*) AS total_users,
    SUM(CASE WHEN is_churned = FALSE OR days_to_churn > 7 THEN 1 ELSE 0 END) AS survived_d7,
    SUM(CASE WHEN is_churned = FALSE OR days_to_churn > 14 THEN 1 ELSE 0 END) AS survived_d14,
    SUM(CASE WHEN is_churned = FALSE OR days_to_churn > 30 THEN 1 ELSE 0 END) AS survived_d30,
    SUM(CASE WHEN is_churned = FALSE OR days_to_churn > 60 THEN 1 ELSE 0 END) AS survived_d60,
    SUM(CASE WHEN is_churned = FALSE OR days_to_churn > 90 THEN 1 ELSE 0 END) AS survived_d90
  FROM user_survival
)

SELECT
  total_users,
  ROUND(100.0 * survived_d7 / total_users, 1) AS survival_d7_pct,
  ROUND(100.0 * survived_d14 / total_users, 1) AS survival_d14_pct,
  ROUND(100.0 * survived_d30 / total_users, 1) AS survival_d30_pct,
  ROUND(100.0 * survived_d60 / total_users, 1) AS survival_d60_pct,
  ROUND(100.0 * survived_d90 / total_users, 1) AS survival_d90_pct
FROM survival_summary;
