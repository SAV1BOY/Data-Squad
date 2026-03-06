/*
  RFM Segmentation
  =================
  SQL for Recency, Frequency, Monetary scoring and customer segmentation.
  RFM is a simple, proven method for segmenting customers by their purchase behavior.

  Tables referenced:
    - orders (order_id, user_id, order_date, revenue_amount, order_status)
    - users (user_id, signup_date, is_internal)
*/


-- =============================================================================
-- 1. CALCULATE RAW RFM VALUES
-- =============================================================================
-- For each customer, compute:
--   Recency:  Days since their most recent purchase
--   Frequency: Total number of purchases in the analysis window
--   Monetary:  Total revenue in the analysis window

WITH rfm_raw AS (
  SELECT
    o.user_id,
    -- Recency: days since last order (lower = better)
    DATEDIFF('day', MAX(o.order_date), CURRENT_DATE) AS recency_days,
    -- Frequency: number of distinct orders
    COUNT(DISTINCT o.order_id) AS frequency,
    -- Monetary: total revenue
    SUM(o.revenue_amount) AS monetary
  FROM orders AS o
  INNER JOIN users AS u
    ON o.user_id = u.user_id
    AND u.is_internal = FALSE
  WHERE o.order_status = 'completed'
    AND o.order_date >= CURRENT_DATE - INTERVAL '365 days'  -- trailing 12 months
  GROUP BY o.user_id
)

SELECT * FROM rfm_raw
ORDER BY monetary DESC;


-- =============================================================================
-- 2. ASSIGN RFM SCORES (1-5 quintiles)
-- =============================================================================
-- Score each dimension from 1 (worst) to 5 (best) using quintiles.
-- For recency, lower days = higher score (inverse).

WITH rfm_raw AS (
  SELECT
    o.user_id,
    DATEDIFF('day', MAX(o.order_date), CURRENT_DATE) AS recency_days,
    COUNT(DISTINCT o.order_id) AS frequency,
    SUM(o.revenue_amount) AS monetary
  FROM orders AS o
  INNER JOIN users AS u
    ON o.user_id = u.user_id
    AND u.is_internal = FALSE
  WHERE o.order_status = 'completed'
    AND o.order_date >= CURRENT_DATE - INTERVAL '365 days'
  GROUP BY o.user_id
),

rfm_scored AS (
  SELECT
    user_id,
    recency_days,
    frequency,
    monetary,
    -- Recency: 5 = most recent (lowest days), 1 = least recent
    NTILE(5) OVER (ORDER BY recency_days ASC) AS r_score_raw,
    -- Frequency: 5 = most frequent, 1 = least frequent
    NTILE(5) OVER (ORDER BY frequency ASC) AS f_score,
    -- Monetary: 5 = highest value, 1 = lowest value
    NTILE(5) OVER (ORDER BY monetary ASC) AS m_score
  FROM rfm_raw
)

SELECT
  user_id,
  recency_days,
  frequency,
  monetary,
  -- Invert recency so 5 = most recent
  6 - r_score_raw AS r_score,
  f_score,
  m_score,
  -- Combined RFM score as a string for easy segment identification
  CONCAT(CAST(6 - r_score_raw AS VARCHAR), CAST(f_score AS VARCHAR), CAST(m_score AS VARCHAR)) AS rfm_code,
  -- Average RFM score for a single numeric summary
  ROUND((6 - r_score_raw + f_score + m_score) / 3.0, 1) AS rfm_avg
FROM rfm_scored
ORDER BY rfm_avg DESC;


-- =============================================================================
-- 3. MAP RFM SCORES TO NAMED SEGMENTS
-- =============================================================================
-- Translate numeric RFM scores into actionable, named customer segments.

WITH rfm_raw AS (
  SELECT
    o.user_id,
    DATEDIFF('day', MAX(o.order_date), CURRENT_DATE) AS recency_days,
    COUNT(DISTINCT o.order_id) AS frequency,
    SUM(o.revenue_amount) AS monetary
  FROM orders AS o
  INNER JOIN users AS u
    ON o.user_id = u.user_id
    AND u.is_internal = FALSE
  WHERE o.order_status = 'completed'
    AND o.order_date >= CURRENT_DATE - INTERVAL '365 days'
  GROUP BY o.user_id
),

rfm_scored AS (
  SELECT
    user_id,
    recency_days,
    frequency,
    monetary,
    6 - NTILE(5) OVER (ORDER BY recency_days ASC) AS r_score,
    NTILE(5) OVER (ORDER BY frequency ASC) AS f_score,
    NTILE(5) OVER (ORDER BY monetary ASC) AS m_score
  FROM rfm_raw
)

SELECT
  user_id,
  r_score,
  f_score,
  m_score,
  recency_days,
  frequency,
  monetary,
  CASE
    -- Champions: recent, frequent, high spenders
    WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'Champions'
    -- Loyal Customers: frequent buyers, may not be the most recent
    WHEN f_score >= 4 AND m_score >= 3 THEN 'Loyal Customers'
    -- Potential Loyalists: recent and moderate frequency
    WHEN r_score >= 4 AND f_score BETWEEN 2 AND 4 THEN 'Potential Loyalists'
    -- New Customers: very recent but low frequency
    WHEN r_score >= 4 AND f_score <= 2 THEN 'New Customers'
    -- At Risk: used to be good but have not purchased recently
    WHEN r_score BETWEEN 2 AND 3 AND f_score >= 3 AND m_score >= 3 THEN 'At Risk'
    -- Needs Attention: moderate across all dimensions
    WHEN r_score = 3 AND f_score BETWEEN 2 AND 3 THEN 'Needs Attention'
    -- About to Sleep: below average recency and frequency
    WHEN r_score BETWEEN 2 AND 3 AND f_score <= 2 THEN 'About to Sleep'
    -- Hibernating: have not purchased in a long time, were previously active
    WHEN r_score <= 2 AND f_score >= 2 THEN 'Hibernating'
    -- Lost: have not purchased in a long time, were never very active
    WHEN r_score <= 2 AND f_score <= 2 THEN 'Lost'
    ELSE 'Other'
  END AS rfm_segment
FROM rfm_scored
ORDER BY monetary DESC;


-- =============================================================================
-- 4. SEGMENT SUMMARY STATISTICS
-- =============================================================================
-- Aggregate view of each RFM segment for reporting and strategy.

WITH rfm_raw AS (
  SELECT
    o.user_id,
    DATEDIFF('day', MAX(o.order_date), CURRENT_DATE) AS recency_days,
    COUNT(DISTINCT o.order_id) AS frequency,
    SUM(o.revenue_amount) AS monetary
  FROM orders AS o
  INNER JOIN users AS u
    ON o.user_id = u.user_id
    AND u.is_internal = FALSE
  WHERE o.order_status = 'completed'
    AND o.order_date >= CURRENT_DATE - INTERVAL '365 days'
  GROUP BY o.user_id
),

rfm_scored AS (
  SELECT
    user_id, recency_days, frequency, monetary,
    6 - NTILE(5) OVER (ORDER BY recency_days ASC) AS r_score,
    NTILE(5) OVER (ORDER BY frequency ASC) AS f_score,
    NTILE(5) OVER (ORDER BY monetary ASC) AS m_score
  FROM rfm_raw
),

rfm_segments AS (
  SELECT
    *,
    CASE
      WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'Champions'
      WHEN f_score >= 4 AND m_score >= 3 THEN 'Loyal Customers'
      WHEN r_score >= 4 AND f_score BETWEEN 2 AND 4 THEN 'Potential Loyalists'
      WHEN r_score >= 4 AND f_score <= 2 THEN 'New Customers'
      WHEN r_score BETWEEN 2 AND 3 AND f_score >= 3 AND m_score >= 3 THEN 'At Risk'
      WHEN r_score = 3 AND f_score BETWEEN 2 AND 3 THEN 'Needs Attention'
      WHEN r_score BETWEEN 2 AND 3 AND f_score <= 2 THEN 'About to Sleep'
      WHEN r_score <= 2 AND f_score >= 2 THEN 'Hibernating'
      WHEN r_score <= 2 AND f_score <= 2 THEN 'Lost'
      ELSE 'Other'
    END AS rfm_segment
  FROM rfm_scored
)

SELECT
  rfm_segment,
  COUNT(*) AS customer_count,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS pct_of_customers,
  ROUND(AVG(recency_days), 0) AS avg_recency_days,
  ROUND(AVG(frequency), 1) AS avg_frequency,
  ROUND(AVG(monetary), 2) AS avg_monetary,
  ROUND(SUM(monetary), 2) AS total_revenue,
  ROUND(100.0 * SUM(monetary) / SUM(SUM(monetary)) OVER (), 1) AS pct_of_revenue
FROM rfm_segments
GROUP BY rfm_segment
ORDER BY avg_monetary DESC;
