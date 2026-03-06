/*
  Basic Historical CLV (Customer Lifetime Value)
  ===============================================
  SQL for calculating historical CLV based on actual observed revenue.
  These are backward-looking calculations, not predictive models.

  Tables referenced:
    - users (user_id, signup_date, plan_type, is_internal)
    - orders (order_id, user_id, order_date, revenue_amount, order_status)
    - subscriptions (subscription_id, user_id, start_date, end_date, mrr_amount)
*/


-- =============================================================================
-- 1. SIMPLE HISTORICAL CLV: Total revenue per customer
-- =============================================================================
-- Sum of all completed order revenue per customer, from signup to now.

SELECT
  u.user_id,
  u.signup_date,
  u.plan_type,
  DATEDIFF('day', u.signup_date, CURRENT_DATE) AS customer_age_days,
  COUNT(DISTINCT o.order_id) AS total_orders,
  COALESCE(SUM(o.revenue_amount), 0) AS historical_clv,
  COALESCE(SUM(o.revenue_amount), 0) / NULLIF(DATEDIFF('month', u.signup_date, CURRENT_DATE), 0) AS avg_monthly_revenue
FROM users AS u
LEFT JOIN orders AS o
  ON u.user_id = o.user_id
  AND o.order_status = 'completed'
WHERE u.is_internal = FALSE
  AND u.signup_date >= '2024-01-01'
GROUP BY u.user_id, u.signup_date, u.plan_type
ORDER BY historical_clv DESC;


-- =============================================================================
-- 2. CLV BY ACQUISITION COHORT
-- =============================================================================
-- Average CLV per signup month cohort, useful for tracking whether newer
-- cohorts are more or less valuable than older ones.

WITH user_clv AS (
  SELECT
    u.user_id,
    DATE_TRUNC('month', u.signup_date) AS cohort_month,
    COALESCE(SUM(o.revenue_amount), 0) AS historical_clv,
    COUNT(DISTINCT o.order_id) AS total_orders,
    DATEDIFF('month', u.signup_date, CURRENT_DATE) AS months_since_signup
  FROM users AS u
  LEFT JOIN orders AS o
    ON u.user_id = o.user_id
    AND o.order_status = 'completed'
  WHERE u.is_internal = FALSE
    AND u.signup_date >= '2024-01-01'
  GROUP BY u.user_id, cohort_month, months_since_signup
)

SELECT
  cohort_month,
  COUNT(DISTINCT user_id) AS cohort_size,
  MAX(months_since_signup) AS cohort_maturity_months,
  ROUND(AVG(historical_clv), 2) AS avg_clv,
  ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY historical_clv), 2) AS median_clv,
  ROUND(SUM(historical_clv), 2) AS total_clv,
  ROUND(AVG(total_orders), 1) AS avg_orders_per_user,
  -- Percentage of users with zero revenue
  ROUND(100.0 * SUM(CASE WHEN historical_clv = 0 THEN 1 ELSE 0 END) / COUNT(*), 1) AS pct_zero_revenue
FROM user_clv
GROUP BY cohort_month
ORDER BY cohort_month;


-- =============================================================================
-- 3. CUMULATIVE CLV OVER TIME (Revenue Curve by Cohort)
-- =============================================================================
-- Shows how revenue accumulates month by month after signup.
-- This helps predict future CLV for newer cohorts based on older cohort curves.

WITH user_orders_by_month AS (
  SELECT
    u.user_id,
    DATE_TRUNC('month', u.signup_date) AS cohort_month,
    -- Month number relative to signup
    DATEDIFF('month', DATE_TRUNC('month', u.signup_date), DATE_TRUNC('month', o.order_date)) AS month_number,
    SUM(o.revenue_amount) AS monthly_revenue
  FROM users AS u
  INNER JOIN orders AS o
    ON u.user_id = o.user_id
    AND o.order_status = 'completed'
  WHERE u.is_internal = FALSE
    AND u.signup_date >= '2024-01-01'
  GROUP BY u.user_id, cohort_month, month_number
),

cohort_monthly_revenue AS (
  SELECT
    cohort_month,
    month_number,
    SUM(monthly_revenue) AS total_revenue,
    COUNT(DISTINCT user_id) AS users_with_revenue
  FROM user_orders_by_month
  WHERE month_number BETWEEN 0 AND 12
  GROUP BY cohort_month, month_number
),

cohort_sizes AS (
  SELECT
    DATE_TRUNC('month', signup_date) AS cohort_month,
    COUNT(DISTINCT user_id) AS cohort_size
  FROM users
  WHERE is_internal = FALSE AND signup_date >= '2024-01-01'
  GROUP BY 1
)

SELECT
  cmr.cohort_month,
  cs.cohort_size,
  cmr.month_number,
  cmr.total_revenue,
  -- Cumulative revenue per user up to this month
  ROUND(SUM(cmr.total_revenue) OVER (
    PARTITION BY cmr.cohort_month ORDER BY cmr.month_number
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) / cs.cohort_size, 2) AS cumulative_clv_per_user
FROM cohort_monthly_revenue AS cmr
INNER JOIN cohort_sizes AS cs
  ON cmr.cohort_month = cs.cohort_month
ORDER BY cmr.cohort_month, cmr.month_number;


-- =============================================================================
-- 4. SUBSCRIPTION-BASED CLV
-- =============================================================================
-- For SaaS/subscription businesses, CLV based on MRR and tenure.

WITH subscription_history AS (
  SELECT
    s.user_id,
    u.signup_date,
    s.start_date,
    COALESCE(s.end_date, CURRENT_DATE) AS effective_end_date,
    s.mrr_amount,
    -- Total months of subscription
    DATEDIFF('month', s.start_date, COALESCE(s.end_date, CURRENT_DATE)) AS subscription_months,
    -- Total subscription revenue
    s.mrr_amount * DATEDIFF('month', s.start_date, COALESCE(s.end_date, CURRENT_DATE)) AS subscription_revenue,
    CASE WHEN s.end_date IS NULL THEN TRUE ELSE FALSE END AS is_active
  FROM subscriptions AS s
  INNER JOIN users AS u ON s.user_id = u.user_id
  WHERE u.is_internal = FALSE
)

SELECT
  user_id,
  signup_date,
  COUNT(*) AS total_subscriptions,
  SUM(subscription_months) AS total_months_subscribed,
  SUM(subscription_revenue) AS total_subscription_revenue,
  MAX(mrr_amount) AS current_or_last_mrr,
  MAX(is_active::INT) AS has_active_subscription,
  -- Simple projected annual value for active subscribers
  CASE
    WHEN MAX(is_active::INT) = 1 THEN MAX(mrr_amount) * 12
    ELSE 0
  END AS projected_annual_value
FROM subscription_history
GROUP BY user_id, signup_date
ORDER BY total_subscription_revenue DESC;


-- =============================================================================
-- 5. CLV DISTRIBUTION SUMMARY
-- =============================================================================
-- Understand the shape of CLV across your customer base.

WITH user_clv AS (
  SELECT
    u.user_id,
    COALESCE(SUM(o.revenue_amount), 0) AS historical_clv
  FROM users AS u
  LEFT JOIN orders AS o
    ON u.user_id = o.user_id
    AND o.order_status = 'completed'
  WHERE u.is_internal = FALSE
    AND u.signup_date >= '2024-01-01'
  GROUP BY u.user_id
)

SELECT
  COUNT(*) AS total_customers,
  ROUND(AVG(historical_clv), 2) AS mean_clv,
  ROUND(PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY historical_clv), 2) AS median_clv,
  ROUND(PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY historical_clv), 2) AS p25_clv,
  ROUND(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY historical_clv), 2) AS p75_clv,
  ROUND(PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY historical_clv), 2) AS p90_clv,
  ROUND(PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY historical_clv), 2) AS p99_clv,
  ROUND(MIN(historical_clv), 2) AS min_clv,
  ROUND(MAX(historical_clv), 2) AS max_clv,
  -- Concentration: what % of total revenue comes from top 10% of customers
  ROUND(100.0 * (
    SELECT SUM(historical_clv)
    FROM (SELECT historical_clv FROM user_clv ORDER BY historical_clv DESC LIMIT (SELECT COUNT(*) / 10 FROM user_clv)) top10
  ) / NULLIF(SUM(historical_clv), 0), 1) AS pct_revenue_from_top_10pct
FROM user_clv;
