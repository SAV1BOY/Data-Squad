/*
  Anomaly Detection
  =================
  SQL for detecting anomalies in metric time series using z-scores,
  moving averages, and interquartile range methods.

  Tables referenced:
    - daily_metrics (metric_date, metric_name, metric_value)
      (Adjust to your actual metric table structure)
*/


-- =============================================================================
-- 1. Z-SCORE ANOMALY DETECTION
-- =============================================================================
-- Flag data points that deviate significantly from the trailing mean.
-- Uses a configurable lookback window and z-score threshold.

WITH metric_stats AS (
  SELECT
    metric_date,
    metric_name,
    metric_value,
    -- Trailing 28-day mean and standard deviation (excluding current day)
    AVG(metric_value) OVER (
      PARTITION BY metric_name
      ORDER BY metric_date
      ROWS BETWEEN 28 PRECEDING AND 1 PRECEDING
    ) AS trailing_mean,
    STDDEV(metric_value) OVER (
      PARTITION BY metric_name
      ORDER BY metric_date
      ROWS BETWEEN 28 PRECEDING AND 1 PRECEDING
    ) AS trailing_stddev,
    COUNT(metric_value) OVER (
      PARTITION BY metric_name
      ORDER BY metric_date
      ROWS BETWEEN 28 PRECEDING AND 1 PRECEDING
    ) AS trailing_count
  FROM daily_metrics
  WHERE metric_date >= CURRENT_DATE - 90
)

SELECT
  metric_date,
  metric_name,
  metric_value,
  ROUND(trailing_mean, 2) AS trailing_mean,
  ROUND(trailing_stddev, 2) AS trailing_stddev,
  -- Z-score: how many standard deviations from the mean
  ROUND(
    (metric_value - trailing_mean) / NULLIF(trailing_stddev, 0),
    2
  ) AS z_score,
  -- Flag anomalies at different thresholds
  CASE
    WHEN ABS((metric_value - trailing_mean) / NULLIF(trailing_stddev, 0)) > 3.0 THEN 'CRITICAL'
    WHEN ABS((metric_value - trailing_mean) / NULLIF(trailing_stddev, 0)) > 2.5 THEN 'WARNING'
    WHEN ABS((metric_value - trailing_mean) / NULLIF(trailing_stddev, 0)) > 2.0 THEN 'INFO'
    ELSE 'NORMAL'
  END AS anomaly_level,
  -- Direction of anomaly
  CASE
    WHEN (metric_value - trailing_mean) / NULLIF(trailing_stddev, 0) > 2.0 THEN 'HIGH'
    WHEN (metric_value - trailing_mean) / NULLIF(trailing_stddev, 0) < -2.0 THEN 'LOW'
    ELSE 'NORMAL'
  END AS anomaly_direction
FROM metric_stats
WHERE trailing_count >= 14  -- require at least 14 days of history for stable stats
ORDER BY metric_date DESC, ABS((metric_value - trailing_mean) / NULLIF(trailing_stddev, 0)) DESC;


-- =============================================================================
-- 2. DAY-OF-WEEK ADJUSTED ANOMALY DETECTION
-- =============================================================================
-- Many metrics have strong day-of-week patterns (weekday vs weekend).
-- This compares each day only to the same day-of-week in prior weeks.

WITH dow_stats AS (
  SELECT
    metric_date,
    metric_name,
    metric_value,
    EXTRACT(DOW FROM metric_date) AS day_of_week,
    -- Mean and stddev for the same day of week over the last 8 weeks
    AVG(metric_value) OVER (
      PARTITION BY metric_name, EXTRACT(DOW FROM metric_date)
      ORDER BY metric_date
      ROWS BETWEEN 8 PRECEDING AND 1 PRECEDING
    ) AS dow_mean,
    STDDEV(metric_value) OVER (
      PARTITION BY metric_name, EXTRACT(DOW FROM metric_date)
      ORDER BY metric_date
      ROWS BETWEEN 8 PRECEDING AND 1 PRECEDING
    ) AS dow_stddev,
    COUNT(metric_value) OVER (
      PARTITION BY metric_name, EXTRACT(DOW FROM metric_date)
      ORDER BY metric_date
      ROWS BETWEEN 8 PRECEDING AND 1 PRECEDING
    ) AS dow_count
  FROM daily_metrics
  WHERE metric_date >= CURRENT_DATE - 120  -- need ~16 weeks for 8-week window per DOW
)

SELECT
  metric_date,
  metric_name,
  metric_value,
  day_of_week,
  ROUND(dow_mean, 2) AS dow_expected,
  ROUND((metric_value - dow_mean) / NULLIF(dow_stddev, 0), 2) AS dow_z_score,
  ROUND(100.0 * (metric_value - dow_mean) / NULLIF(dow_mean, 0), 1) AS pct_deviation,
  CASE
    WHEN ABS((metric_value - dow_mean) / NULLIF(dow_stddev, 0)) > 3.0 THEN 'ANOMALY'
    WHEN ABS((metric_value - dow_mean) / NULLIF(dow_stddev, 0)) > 2.0 THEN 'SUSPICIOUS'
    ELSE 'NORMAL'
  END AS status
FROM dow_stats
WHERE dow_count >= 4  -- at least 4 same-day-of-week observations
  AND metric_date >= CURRENT_DATE - 30  -- show last 30 days
ORDER BY metric_date DESC, ABS((metric_value - dow_mean) / NULLIF(dow_stddev, 0)) DESC;


-- =============================================================================
-- 3. MOVING AVERAGE CROSSOVER DETECTION
-- =============================================================================
-- Detect when a short-term moving average crosses a long-term moving average.
-- Crossovers signal trend changes.

WITH moving_averages AS (
  SELECT
    metric_date,
    metric_name,
    metric_value,
    -- Short-term: 7-day moving average
    AVG(metric_value) OVER (
      PARTITION BY metric_name
      ORDER BY metric_date
      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS ma_7d,
    -- Long-term: 28-day moving average
    AVG(metric_value) OVER (
      PARTITION BY metric_name
      ORDER BY metric_date
      ROWS BETWEEN 27 PRECEDING AND CURRENT ROW
    ) AS ma_28d
  FROM daily_metrics
  WHERE metric_date >= CURRENT_DATE - 120
),

with_signals AS (
  SELECT
    *,
    -- Previous day's relationship between MAs
    LAG(ma_7d - ma_28d) OVER (PARTITION BY metric_name ORDER BY metric_date) AS prev_diff,
    -- Current relationship
    ma_7d - ma_28d AS curr_diff
  FROM moving_averages
)

SELECT
  metric_date,
  metric_name,
  metric_value,
  ROUND(ma_7d, 2) AS ma_7d,
  ROUND(ma_28d, 2) AS ma_28d,
  ROUND(curr_diff, 2) AS ma_spread,
  CASE
    WHEN prev_diff < 0 AND curr_diff >= 0 THEN 'BULLISH_CROSSOVER'   -- short crosses above long
    WHEN prev_diff > 0 AND curr_diff <= 0 THEN 'BEARISH_CROSSOVER'   -- short crosses below long
    WHEN curr_diff > 0 THEN 'ABOVE_TREND'
    ELSE 'BELOW_TREND'
  END AS trend_signal
FROM with_signals
WHERE metric_date >= CURRENT_DATE - 60
ORDER BY metric_date DESC;


-- =============================================================================
-- 4. IQR-BASED OUTLIER DETECTION
-- =============================================================================
-- Uses the interquartile range method, which is more robust to skewed
-- distributions than z-scores.

WITH recent_data AS (
  SELECT
    metric_date,
    metric_name,
    metric_value
  FROM daily_metrics
  WHERE metric_date >= CURRENT_DATE - 90
),

quartiles AS (
  SELECT
    metric_name,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY metric_value) AS q1,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY metric_value) AS median_val,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY metric_value) AS q3
  FROM recent_data
  GROUP BY metric_name
),

iqr_calc AS (
  SELECT
    metric_name,
    q1,
    median_val,
    q3,
    q3 - q1 AS iqr,
    q1 - 1.5 * (q3 - q1) AS lower_fence,
    q3 + 1.5 * (q3 - q1) AS upper_fence,
    q1 - 3.0 * (q3 - q1) AS extreme_lower,
    q3 + 3.0 * (q3 - q1) AS extreme_upper
  FROM quartiles
)

SELECT
  rd.metric_date,
  rd.metric_name,
  rd.metric_value,
  ROUND(iq.median_val, 2) AS median_value,
  ROUND(iq.lower_fence, 2) AS lower_fence,
  ROUND(iq.upper_fence, 2) AS upper_fence,
  CASE
    WHEN rd.metric_value < iq.extreme_lower OR rd.metric_value > iq.extreme_upper THEN 'EXTREME_OUTLIER'
    WHEN rd.metric_value < iq.lower_fence OR rd.metric_value > iq.upper_fence THEN 'MILD_OUTLIER'
    ELSE 'NORMAL'
  END AS outlier_status
FROM recent_data AS rd
INNER JOIN iqr_calc AS iq
  ON rd.metric_name = iq.metric_name
WHERE rd.metric_date >= CURRENT_DATE - 30
ORDER BY rd.metric_date DESC, rd.metric_name;


-- =============================================================================
-- 5. CONSECUTIVE ANOMALY DETECTION (Streak Alert)
-- =============================================================================
-- Detect when a metric has been consistently above or below expectations
-- for N consecutive days. This catches slow drifts that single-day anomaly
-- detection misses.

WITH deviations AS (
  SELECT
    metric_date,
    metric_name,
    metric_value,
    AVG(metric_value) OVER (
      PARTITION BY metric_name
      ORDER BY metric_date
      ROWS BETWEEN 28 PRECEDING AND 1 PRECEDING
    ) AS trailing_mean,
    CASE
      WHEN metric_value > AVG(metric_value) OVER (
        PARTITION BY metric_name ORDER BY metric_date
        ROWS BETWEEN 28 PRECEDING AND 1 PRECEDING
      ) THEN 1
      ELSE -1
    END AS direction
  FROM daily_metrics
  WHERE metric_date >= CURRENT_DATE - 90
),

streaks AS (
  SELECT
    *,
    -- Identify when direction changes to start a new streak
    SUM(CASE
      WHEN direction != LAG(direction) OVER (PARTITION BY metric_name ORDER BY metric_date)
      THEN 1 ELSE 0
    END) OVER (PARTITION BY metric_name ORDER BY metric_date) AS streak_id
  FROM deviations
),

streak_lengths AS (
  SELECT
    metric_date,
    metric_name,
    metric_value,
    trailing_mean,
    direction,
    streak_id,
    COUNT(*) OVER (PARTITION BY metric_name, streak_id) AS streak_length,
    ROW_NUMBER() OVER (PARTITION BY metric_name, streak_id ORDER BY metric_date) AS day_in_streak
  FROM streaks
)

SELECT
  metric_date,
  metric_name,
  metric_value,
  ROUND(trailing_mean, 2) AS expected_value,
  CASE WHEN direction = 1 THEN 'ABOVE' ELSE 'BELOW' END AS deviation_direction,
  streak_length AS consecutive_days,
  CASE
    WHEN streak_length >= 7 THEN 'ALERT: 7+ day streak'
    WHEN streak_length >= 5 THEN 'WARNING: 5+ day streak'
    WHEN streak_length >= 3 THEN 'WATCH: 3+ day streak'
    ELSE 'NORMAL'
  END AS streak_status
FROM streak_lengths
WHERE metric_date >= CURRENT_DATE - 30
  AND day_in_streak = streak_length  -- only show the latest day in each streak
ORDER BY streak_length DESC, metric_date DESC;
