# Data Quality Rubric

A 1-5 scale rubric for scoring data quality across four dimensions: completeness, accuracy, freshness, and consistency. Use this to assess tables, pipelines, and data products.

---

## Dimension 1: Completeness

Does the dataset contain all expected records and fields?

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | Significant data gaps. Missing days, missing segments, or > 10% null rate on required fields. |
| 2     | Intermittent gaps. Occasional missing data (1-10% null rate on required fields). Some time periods or segments are incomplete. |
| 3     | Generally complete. Null rate on required fields < 1%. Rare gaps (< 1 day per quarter). Known gaps are documented. |
| 4     | Highly complete. Null rate on required fields < 0.1%. Coverage is verified against source systems. Gaps trigger automated alerts. |
| 5     | Fully complete. Zero nulls on required fields. Row counts reconcile with source systems. Completeness is monitored continuously with SLA guarantees. |

### How to Assess

```sql
-- Null rate per column
SELECT
  COUNT(*) AS total_rows,
  ROUND(100.0 * SUM(CASE WHEN col_a IS NULL THEN 1 ELSE 0 END) / COUNT(*), 2) AS null_pct_col_a,
  ROUND(100.0 * SUM(CASE WHEN col_b IS NULL THEN 1 ELSE 0 END) / COUNT(*), 2) AS null_pct_col_b
FROM your_table;

-- Date coverage
SELECT
  MIN(date_col) AS min_date,
  MAX(date_col) AS max_date,
  COUNT(DISTINCT date_col) AS distinct_dates,
  DATEDIFF('day', MIN(date_col), MAX(date_col)) + 1 AS expected_dates
FROM your_table;
```

---

## Dimension 2: Accuracy

Does the data reflect reality? Are values correct?

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | Known inaccuracies. Values contradict source systems or business reality. No validation in place. |
| 2     | Accuracy is assumed but not verified. No reconciliation against source systems. Occasional user-reported errors. |
| 3     | Basic accuracy checks are in place (range validation, referential integrity). Reconciliation is done manually on occasion. |
| 4     | Automated accuracy checks run on every load. Regular reconciliation against source systems. Discrepancies are investigated and resolved within SLA. |
| 5     | Comprehensive accuracy validation: automated reconciliation, cross-source verification, statistical anomaly detection, and root cause analysis for every discrepancy. Accuracy rate > 99.9%. |

### How to Assess

- Compare aggregated values (revenue, user counts) between the data warehouse and the source system.
- Sample 50-100 records and manually verify against the source.
- Check for impossible values: negative ages, future dates in historical fields, revenue amounts of $0.01 or $999,999.

---

## Dimension 3: Freshness

Is the data available when stakeholders need it?

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | Data is stale. No defined refresh schedule. Stakeholders often view outdated data without knowing it. |
| 2     | Data refreshes on a schedule but frequently misses it. No SLA. Stakeholders have learned to check the "last updated" timestamp. |
| 3     | Data refreshes on schedule most of the time (> 95% on-time). SLA exists but is not formally monitored. |
| 4     | Data refreshes on schedule > 99% of the time. SLA is monitored with alerts for misses. Recovery process is documented and tested. |
| 5     | Near-real-time or guaranteed SLA with automated failover. Freshness is continuously monitored. SLA misses are post-mortem'd. Stakeholders are automatically notified of any delays. |

### How to Assess

```sql
-- Check freshness
SELECT
  MAX(loaded_at) AS last_load_time,
  CURRENT_TIMESTAMP - MAX(loaded_at) AS time_since_last_load
FROM your_table;
```

Track SLA compliance over time:

| Month    | Loads On-Time | Loads Late | SLA Compliance |
|----------|---------------|------------|----------------|
| January  | 30            | 1          | 96.8%          |
| February | 28            | 0          | 100%           |

---

## Dimension 4: Consistency

Is the data consistent across sources, over time, and within itself?

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | Major inconsistencies. The same metric shows different values in different dashboards. No single source of truth. |
| 2     | Known inconsistencies exist but are not actively managed. Teams use different definitions for the same concept. |
| 3     | Most metrics have a single source of truth. Inconsistencies are identified and tracked. Key metrics are reconciled. |
| 4     | Single source of truth for all production metrics. Consistency checks run between related tables. Inconsistencies trigger alerts. |
| 5     | Full SSOT architecture. All downstream consumers derive from the same transformation layer. Cross-table consistency is continuously verified. Schema changes are versioned and communicated. |

### How to Assess

- Compare the same metric across different dashboards. Do the numbers match?
- Check that related metrics are consistent: does `new_users + returning_users = total_users`?
- Verify that dimensions have consistent values across tables (e.g., "US" vs "United States" vs "USA").

---

## Scoring Summary

| Dimension    | Score (1-5) | Weight | Weighted Score |
|-------------|-------------|--------|----------------|
| Completeness |             | 25%    |                |
| Accuracy     |             | 30%    |                |
| Freshness    |             | 20%    |                |
| Consistency  |             | 25%    |                |
| **Total**    |             |        | **/5.00**      |

### Quality Tiers

| Total Score | Tier     | Implication                                              |
|-------------|----------|----------------------------------------------------------|
| 4.5 - 5.0   | Gold     | Production-ready for critical business decisions.        |
| 3.5 - 4.4   | Silver   | Production-ready with known, managed limitations.        |
| 2.5 - 3.4   | Bronze   | Usable with caveats. Improvement plan required.          |
| 1.5 - 2.4   | At Risk  | Should not be used for decisions. Remediation needed.    |
| 1.0 - 1.4   | Critical | Unreliable. Pause consumption until fixed.               |

---

## Assessment Cadence

| Data Tier                  | Assessment Frequency | Assessor            |
|---------------------------|---------------------|---------------------|
| L0/L1 metric sources      | Monthly              | Data Engineering    |
| L2 metric sources         | Quarterly            | Data Engineering    |
| L3 metric sources         | Semi-annually        | Data team           |
| Ad-hoc / experimental data| At creation          | Analyst             |
