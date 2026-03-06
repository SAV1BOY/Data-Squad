# Data Quality Quality Checklist

> Gate type: Pre-delivery
> Owner: Data Chief
> Applies to: Any dataset, pipeline output, table, or data product before it is consumed downstream

## Purpose

Every downstream analysis, model, and report inherits the quality of its source data. If completeness, accuracy, freshness, or consistency are not verified at the point of production, errors compound silently until someone makes a bad decision. This gate catches data defects before they propagate.

## Checklist Items

1. - [ ] **Completeness: row count within expected range** -- The number of rows in the output is compared to a historical baseline or an upstream event count.
   - Pass criteria: Row count is within +/- 10% of the expected range for the period, or deviation is explained.
   - Fail signal: Row count is 0, significantly lower than expected, or suspiciously higher (duplicate ingestion).
   - Action if fail: Investigate the source pipeline, check for failed jobs or ingestion gaps, and reprocess if needed.

2. - [ ] **Completeness: critical columns have no unexpected nulls** -- Key business columns (user_id, timestamp, amount, event_type) are checked for null rates.
   - Pass criteria: Null rate for critical columns is < 1%, or a documented exception exists (e.g., optional fields).
   - Fail signal: A required column has > 5% nulls, or a column that was never null before suddenly has nulls.
   - Action if fail: Trace nulls to the source event or transformation, fix the root cause, and backfill if necessary.

3. - [ ] **Accuracy: spot-check against source of truth** -- A sample of records is compared to the authoritative source (e.g., billing system, CRM) to verify values match.
   - Pass criteria: Spot-check of 20-50 records shows < 1% discrepancy rate.
   - Fail signal: Spot-check reveals systematic mismatches (e.g., all amounts off by a factor of 100).
   - Action if fail: Identify the transformation step causing the error, fix it, and re-validate.

4. - [ ] **Accuracy: aggregates reconcile** -- Summary totals (revenue, user count, event volume) match the totals from a trusted independent source.
   - Pass criteria: Aggregates match within 1% of finance, product analytics, or another validated source.
   - Fail signal: Total revenue differs by > 2% from the finance ledger.
   - Action if fail: Reconcile line by line, identify missing or duplicate records, and correct.

5. - [ ] **Freshness: data arrived within SLA** -- The most recent record timestamp or pipeline completion time is within the expected freshness window.
   - Pass criteria: Latest data is < SLA hours old (e.g., daily tables refreshed by 06:00 UTC).
   - Fail signal: Latest record is > 24 hours old for a daily pipeline, or the pipeline finished after the SLA.
   - Action if fail: Check pipeline orchestration logs, identify the delay cause, and alert downstream consumers.

6. - [ ] **Consistency: no duplicate primary keys** -- The primary key (or composite key) of the table has no duplicates.
   - Pass criteria: COUNT(*) = COUNT(DISTINCT primary_key).
   - Fail signal: Duplicate keys exist, indicating a broken deduplication step or double ingestion.
   - Action if fail: Deduplicate the table, fix the upstream cause, and add a uniqueness test to the pipeline.

7. - [ ] **Consistency: referential integrity holds** -- Foreign keys reference valid records in parent tables (e.g., every order.user_id exists in users).
   - Pass criteria: Orphan rate < 0.1% for critical foreign keys.
   - Fail signal: > 1% of records reference non-existent parent records.
   - Action if fail: Investigate whether parent records were deleted, filtered, or never loaded. Repair or document the gap.

8. - [ ] **Consistency: enum values are valid** -- Categorical columns contain only expected values (e.g., status in ['active', 'churned', 'paused']).
   - Pass criteria: All values in categorical columns match the expected set; new values are flagged for review.
   - Fail signal: Unexpected values like "Active" (capitalized), "test", or empty strings appear.
   - Action if fail: Standardize values in the transformation layer and add a validation test.

9. - [ ] **Timeliness: schema changes detected** -- Any change in column names, types, or table structure since the last run is flagged.
   - Pass criteria: Schema comparison runs automatically; no unexpected changes, or changes are acknowledged.
   - Fail signal: A column was silently renamed or dropped upstream, breaking downstream queries.
   - Action if fail: Implement schema monitoring (e.g., dbt schema tests, Great Expectations) and coordinate with the source team.

10. - [ ] **Distribution stability: no unexpected shifts** -- Key numeric columns are checked for distribution anomalies (mean, median, percentiles) compared to the prior period.
    - Pass criteria: Distribution metrics are within 2 standard deviations of the 30-day rolling average.
    - Fail signal: Average order value doubled overnight with no known business reason.
    - Action if fail: Investigate whether the shift is real (a product change) or a data defect. Document either way.

11. - [ ] **Data lineage documented** -- The source tables, transformations, and output table are traceable; someone can follow the data from origin to delivery.
    - Pass criteria: A lineage diagram or dbt DAG is available and up to date.
    - Fail signal: No one can explain where a column's values come from without reading the code.
    - Action if fail: Document the lineage, at minimum in a comment block or a metadata entry.

12. - [ ] **Test coverage in pipeline** -- Automated data tests (not null, unique, accepted values, row count) are defined and running in the pipeline.
    - Pass criteria: At least 3 automated tests per critical table; tests run on every pipeline execution.
    - Fail signal: No automated tests; quality is only checked manually or after a stakeholder complaint.
    - Action if fail: Add foundational tests (unique key, not null on critical columns, row count range) to the pipeline.

## Cross-References

- See `alerting-quality.md` for how data quality failures should trigger alerts.
- See `privacy-and-compliance-quality.md` for quality checks specific to PII and compliance.
- See `cross-squad-data-request-quality.md` for quality expectations when serving data to other squads.
