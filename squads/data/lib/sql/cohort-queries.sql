/*
  Cohort Queries
  ==============
  SQL queries for building acquisition and behavioral cohorts.
  These queries assume a standard event table and user table structure.
  Adjust table and column names to match your warehouse.

  Tables referenced:
    - users (user_id, signup_date, platform, plan_type)
    - events (user_id, event_name, event_timestamp, event_date)
*/


-- =============================================================================
-- 1. ACQUISITION COHORT: Group users by signup week
-- =============================================================================
-- Each user is assigned to exactly one cohort based on when they signed up.
-- This is the foundation for retention analysis.

WITH acquisition_cohorts AS (
  SELECT
    user_id,
    signup_date,
    DATE_TRUNC('week', signup_date) AS cohort_week,
    DATE_TRUNC('month', signup_date) AS cohort_month
  FROM users
  WHERE signup_date >= '2025-01-01'
    AND is_internal = FALSE
    AND is_bot = FALSE
)

SELECT
  cohort_week,
  COUNT(DISTINCT user_id) AS cohort_size,
  MIN(signup_date) AS cohort_start,
  MAX(signup_date) AS cohort_end
FROM acquisition_cohorts
GROUP BY cohort_week
ORDER BY cohort_week;


-- =============================================================================
-- 2. ACQUISITION COHORT WITH ACTIVITY: Track which cohort members were active
-- =============================================================================
-- Joins cohort membership with activity data to calculate retention per period.

WITH cohort_members AS (
  SELECT
    user_id,
    DATE_TRUNC('week', signup_date) AS cohort_week
  FROM users
  WHERE signup_date >= '2025-01-01'
    AND is_internal = FALSE
),

user_activity AS (
  SELECT DISTINCT
    user_id,
    DATE_TRUNC('week', event_date) AS activity_week
  FROM events
  WHERE event_name IN ('page_view', 'feature_used', 'session_start')
    AND event_date >= '2025-01-01'
)

SELECT
  cm.cohort_week,
  -- Period number: how many weeks after the cohort week was the user active
  DATEDIFF('week', cm.cohort_week, ua.activity_week) AS period_number,
  COUNT(DISTINCT cm.user_id) AS active_users
FROM cohort_members AS cm
INNER JOIN user_activity AS ua
  ON cm.user_id = ua.user_id
  AND ua.activity_week >= cm.cohort_week
WHERE DATEDIFF('week', cm.cohort_week, ua.activity_week) BETWEEN 0 AND 12
GROUP BY cm.cohort_week, period_number
ORDER BY cm.cohort_week, period_number;


-- =============================================================================
-- 3. BEHAVIORAL COHORT: Group users by first action taken
-- =============================================================================
-- Users are grouped by the first meaningful action they performed,
-- regardless of signup date.

WITH first_actions AS (
  SELECT
    user_id,
    event_name AS first_action,
    MIN(event_date) AS first_action_date
  FROM events
  WHERE event_name IN (
    'completed_onboarding',
    'created_project',
    'invited_teammate',
    'made_purchase',
    'viewed_dashboard'
  )
  GROUP BY user_id, event_name
),

first_action_ranked AS (
  SELECT
    user_id,
    first_action,
    first_action_date,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY first_action_date ASC) AS rn
  FROM first_actions
)

SELECT
  first_action AS behavioral_cohort,
  DATE_TRUNC('week', first_action_date) AS cohort_week,
  COUNT(DISTINCT user_id) AS cohort_size
FROM first_action_ranked
WHERE rn = 1  -- only the very first action per user
GROUP BY first_action, cohort_week
ORDER BY cohort_week, cohort_size DESC;


-- =============================================================================
-- 4. FEATURE ADOPTION COHORT: Users who adopted a specific feature
-- =============================================================================
-- Compare users who adopted feature X vs. those who did not.
-- Useful for measuring feature impact on retention or revenue.

WITH feature_adopters AS (
  SELECT DISTINCT
    user_id,
    MIN(event_date) AS adoption_date
  FROM events
  WHERE event_name = 'used_advanced_search'  -- change to your feature event
    AND event_date >= '2025-01-01'
  GROUP BY user_id
),

all_eligible_users AS (
  SELECT
    u.user_id,
    u.signup_date,
    CASE WHEN fa.user_id IS NOT NULL THEN 'Adopter' ELSE 'Non-Adopter' END AS cohort_type,
    fa.adoption_date
  FROM users AS u
  LEFT JOIN feature_adopters AS fa
    ON u.user_id = fa.user_id
  WHERE u.signup_date >= '2025-01-01'
    AND u.is_internal = FALSE
)

SELECT
  cohort_type,
  COUNT(DISTINCT user_id) AS cohort_size,
  ROUND(AVG(DATEDIFF('day', signup_date, COALESCE(adoption_date, CURRENT_DATE))), 1) AS avg_days_to_adopt
FROM all_eligible_users
GROUP BY cohort_type;


-- =============================================================================
-- 5. VALUE-BASED COHORT: Group users by revenue tier
-- =============================================================================
-- Segments users into value tiers based on total spending in a period.

WITH user_revenue AS (
  SELECT
    user_id,
    SUM(revenue_amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_count
  FROM orders
  WHERE order_date BETWEEN '2025-10-01' AND '2025-12-31'
    AND order_status = 'completed'
  GROUP BY user_id
)

SELECT
  CASE
    WHEN total_revenue >= 500 THEN 'High Value (>=$500)'
    WHEN total_revenue >= 100 THEN 'Medium Value ($100-$499)'
    WHEN total_revenue > 0   THEN 'Low Value (<$100)'
    ELSE 'No Revenue'
  END AS value_cohort,
  COUNT(DISTINCT user_id) AS user_count,
  SUM(total_revenue) AS total_revenue,
  ROUND(AVG(total_revenue), 2) AS avg_revenue,
  ROUND(AVG(order_count), 1) AS avg_orders
FROM user_revenue
GROUP BY 1
ORDER BY MIN(total_revenue) DESC;
