# Sanity Checks

Quick checks to run before trusting any dataset, query result, or analysis output. These catch the most common data issues with minimal effort.

---

## Check 1: Row Count Reasonableness

Before analyzing a table, verify the row count is in the expected range.

**How:**
```sql
SELECT COUNT(*) AS row_count,
       COUNT(DISTINCT date_col) AS distinct_dates,
       MIN(date_col) AS min_date,
       MAX(date_col) AS max_date
FROM your_table
WHERE date_col BETWEEN '2026-01-01' AND '2026-01-31';
```

**What to look for:**
- Row count is within 20% of the prior equivalent period.
- No missing dates in the range (compare distinct_dates to expected calendar days).
- Min and max dates match the expected range exactly.

**Red flags:** Row count is exactly zero, or exactly double the expected (duplication), or has gaps in dates.

---

## Check 2: Null Rate Analysis

Identify columns with unexpected null values.

**How:**
```sql
SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS null_user_id,
  SUM(CASE WHEN event_name IS NULL THEN 1 ELSE 0 END) AS null_event_name,
  SUM(CASE WHEN revenue IS NULL THEN 1 ELSE 0 END) AS null_revenue,
  ROUND(100.0 * SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) / COUNT(*), 2) AS null_pct_user_id
FROM your_table;
```

**Thresholds:**
- Primary keys (user_id, event_id): Must be 0% null.
- Required fields (event_name, timestamp): Should be < 0.1% null.
- Optional fields (revenue, metadata): Document the expected null rate and alert on deviations > 5pp.

---

## Check 3: Duplicate Detection

Check for unexpected duplicates on key columns.

**How:**
```sql
SELECT user_id, event_timestamp, event_name, COUNT(*) AS dupe_count
FROM your_table
WHERE date_col = CURRENT_DATE - 1
GROUP BY user_id, event_timestamp, event_name
HAVING COUNT(*) > 1
ORDER BY dupe_count DESC
LIMIT 20;
```

**What to look for:**
- Any row with dupe_count > 1 is a potential duplicate.
- High dupe_count (10+) on the same key suggests a replay or retry bug.
- Check if the total duplicate rows are a meaningful percentage of the table.

---

## Check 4: Outlier Detection

Identify extreme values that may indicate data errors or genuine anomalies.

**How:**
```sql
WITH stats AS (
  SELECT
    AVG(metric_value) AS mean_val,
    STDDEV(metric_value) AS stddev_val
  FROM your_table
  WHERE date_col >= CURRENT_DATE - 30
)
SELECT t.*,
       (t.metric_value - s.mean_val) / NULLIF(s.stddev_val, 0) AS z_score
FROM your_table t
CROSS JOIN stats s
WHERE ABS((t.metric_value - s.mean_val) / NULLIF(s.stddev_val, 0)) > 3
ORDER BY z_score DESC;
```

**Interpretation:**
- |z_score| > 3: Investigate. Could be a data error or genuine outlier.
- |z_score| > 5: Very likely a data error. Verify at the source.
- For skewed distributions, consider using IQR method instead: outlier if value > Q3 + 1.5*IQR or < Q1 - 1.5*IQR.

---

## Check 5: Distribution Drift

Compare the distribution of a column across two time periods to detect shifts.

**How:**
```sql
SELECT
  value_bucket,
  SUM(CASE WHEN period = 'current' THEN cnt ELSE 0 END) AS current_count,
  SUM(CASE WHEN period = 'prior' THEN cnt ELSE 0 END) AS prior_count
FROM (
  SELECT 'current' AS period,
         FLOOR(metric_value / 10) * 10 AS value_bucket,
         COUNT(*) AS cnt
  FROM your_table WHERE date_col BETWEEN '2026-02-01' AND '2026-02-28'
  GROUP BY 1, 2
  UNION ALL
  SELECT 'prior' AS period,
         FLOOR(metric_value / 10) * 10 AS value_bucket,
         COUNT(*) AS cnt
  FROM your_table WHERE date_col BETWEEN '2026-01-01' AND '2026-01-31'
  GROUP BY 1, 2
) combined
GROUP BY value_bucket
ORDER BY value_bucket;
```

**What to look for:**
- New value buckets that did not exist in the prior period (possible schema or logic change).
- Significant shift in the mode or median bucket.
- Collapse of the distribution into a single value (possible default/fallback behavior).

---

## Check 6: Cardinality Check

Verify that categorical columns have the expected number of distinct values.

**How:**
```sql
SELECT
  COUNT(DISTINCT platform) AS platform_cardinality,    -- expect 3: web, ios, android
  COUNT(DISTINCT country) AS country_cardinality,       -- expect ~200
  COUNT(DISTINCT event_name) AS event_cardinality       -- expect ~50
FROM your_table
WHERE date_col = CURRENT_DATE - 1;
```

**What to look for:**
- Cardinality = 1: Everything is the same value (likely a bug or default).
- Cardinality is much higher than expected: Possible free-text pollution in a categorical field.
- Cardinality is lower than expected: A category may have stopped being tracked.
- New categories appearing: Check if a new platform or event was instrumented.

---

## Check 7: Join Fanout Check

Before joining two tables, verify the join will not unexpectedly multiply rows.

**How:**
```sql
-- Check if the join key is unique in the right table
SELECT join_key, COUNT(*) AS cnt
FROM right_table
GROUP BY join_key
HAVING COUNT(*) > 1
LIMIT 10;

-- After joining, compare row counts
SELECT
  (SELECT COUNT(*) FROM left_table) AS left_count,
  (SELECT COUNT(*) FROM left_table l JOIN right_table r ON l.key = r.key) AS joined_count;
```

**Rule of thumb:** If joined_count > left_count, you have a fanout. Either deduplicate the right table first, or use a window function to pick one row per key.

---

## Quick Sanity Check Cheat Sheet

Run these five checks on every new dataset or query result:

| # | Check              | Time  | What It Catches                        |
|---|-------------------|-------|----------------------------------------|
| 1 | Row count         | 10s   | Missing data, duplicates, wrong filter |
| 2 | Null rates        | 30s   | Broken pipelines, schema changes       |
| 3 | Min/max/avg       | 10s   | Outliers, wrong units, sign errors     |
| 4 | Distinct counts   | 10s   | Cardinality issues, category drift     |
| 5 | Spot check 5 rows | 30s   | Obvious errors a human eye would catch |
