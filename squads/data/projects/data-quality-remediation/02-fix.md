# Data Quality Remediation - Fix

## Phase Objective

Implement corrections for each prioritized data quality issue following the remediation wave plan. Fixes span the full range from simple configuration changes to pipeline refactoring and source system modifications. Each fix must address both the existing bad data (backfill) and the ongoing process that produces it (prevention).

## Prerequisites

- Prioritized remediation roadmap from Phase 01 with waves and resource assignments
- Engineering and data team resources allocated for the current wave
- Access to source systems, pipelines, and data warehouse with write permissions
- Backup and rollback procedures in place before modifying production data
- Test environments for validating fixes before production deployment

## Steps

1. **Fix Completeness Issues**: Address missing data problems based on their root cause. For fields that are null due to collection failures, repair the collection mechanism (fix broken event tracking, restore dropped API fields, correct ETL extraction queries). For historical gaps, determine whether backfill is possible from source system logs, backup data, or alternative sources. Where backfill is impossible, document the gap and implement forward-looking completeness checks. Add NOT NULL constraints or application-level validation where appropriate to prevent recurrence.

2. **Fix Accuracy Issues**: Correct inaccurate data based on the type of inaccuracy. For systematic errors (a conversion factor applied incorrectly, a timezone offset wrong by one hour), calculate the correct transformation and apply it to all affected records. For sporadic errors (individual records with wrong values), correct them against the authoritative source. For drift issues (accuracy degrades over time as source systems change), update the extraction or transformation logic to match current source system behavior. Add range checks and anomaly detection to catch future accuracy problems at ingestion time.

3. **Fix Consistency Issues**: Resolve discrepancies between data sources by determining which source is authoritative and bringing other sources into alignment. For cross-system inconsistencies (customer plan type differs between billing and analytics), establish the authoritative source and build synchronization logic. For within-system inconsistencies (order total does not equal sum of line items), identify the correct value and fix the calculation or the source records. Implement referential integrity checks in the data pipeline to detect future inconsistencies before they reach downstream consumers.

4. **Fix Timeliness Issues**: Address data latency problems by optimizing the pipeline stages that introduce delay. Common causes include inefficient SQL queries that take hours to run (optimize them), serial processing that could be parallelized, excessive retry loops for transient failures (implement better error handling), and scheduled jobs that run at suboptimal times. For source systems with inherent latency, implement near-real-time streaming where feasible or adjust downstream expectations to match reality.

5. **Fix Validity Issues**: Correct data that violates format or business rule constraints. Standardize inconsistent formats (dates stored as strings in multiple formats, phone numbers with inconsistent country codes, email addresses with invalid syntax). Apply validation rules at the point of data entry or ingestion so invalid data is rejected or flagged before it enters the system. For existing invalid data, run correction scripts that apply standardization rules and flag records that cannot be automatically corrected for manual review.

6. **Fix Uniqueness Issues**: Resolve duplicate records through deduplication processes appropriate to the data type. For exact duplicates, retain one record and delete the rest, updating any foreign key references. For near-duplicates (same entity with slightly different attributes), implement a merge strategy: define which attributes come from which duplicate based on source reliability and recency. For entity resolution (multiple IDs representing the same customer), build an ID mapping table and update all references. Implement uniqueness constraints and deduplication checks in the pipeline to prevent future duplicates.

7. **Implement Data Contracts**: For each fixed data source, establish a data contract that defines the expected quality characteristics: schema, completeness thresholds, freshness guarantees, and valid value ranges. Data contracts formalize the quality expectations between data producers and consumers. When a contract is violated, the pipeline should alert the producer and the consumer rather than silently propagating bad data.

8. **Backfill Historical Data**: For issues where historical data is affected, run backfill processes to correct past records. Coordinate backfills with downstream consumers: warn dashboard owners that historical metrics may shift, schedule backfills during low-usage periods to minimize performance impact, and document before-and-after metric values so the impact of corrections is understood. Maintain an audit log of all backfill operations for traceability.

9. **Deploy Fixes Per Wave Schedule**: Execute fixes according to the wave plan, deploying Wave 1 quick wins first to build momentum and demonstrate value. For each fix, follow the deployment process: implement in development, validate in staging, deploy to production, verify in production, and confirm with downstream consumers. Document every fix including what was changed, why, and how to roll back if needed.

## Deliverables

- Completeness fixes deployed with backfill and prevention mechanisms
- Accuracy corrections applied with transformation logic documented
- Consistency resolutions implemented with authoritative source designations
- Timeliness optimizations deployed with measured latency improvements
- Validity standardization applied with validation rules implemented at ingestion
- Deduplication completed with merge strategies and uniqueness constraints
- Data contracts established for all remediated data sources
- Historical backfill execution log with before-and-after impact documentation
- Fix deployment log for each wave with rollback procedures

## Quality Gate

The fix phase is complete for each wave when all of the following conditions are met:

- Every issue assigned to the current wave has been addressed with a deployed fix
- Backfill has been completed for affected historical data where feasible
- Prevention mechanisms are in place to stop recurrence of each fixed issue
- Data contracts are established defining ongoing quality expectations
- Each fix has been validated in the staging environment before production deployment
- Production deployment has been verified with downstream consumers confirming improvement
- Fix documentation includes rollback procedures for every change
- Quality metrics for fixed data sources show measurable improvement against pre-fix baselines

## Next Phase

Proceed to **03-validation.md** (Validation) to verify that fixes are effective, confirm no regressions were introduced, and measure the overall quality improvement.
