# Data Quality Remediation - Audit

## Phase Objective

Conduct a systematic scan of all data sources across the organization to identify, categorize, and quantify data quality issues. The audit covers the six dimensions of data quality: completeness, accuracy, consistency, timeliness, validity, and uniqueness. The output is a comprehensive inventory of quality issues that enables informed prioritization.

## Prerequisites

- Inventory of all data sources used for analytics, reporting, and decision-making
- Access to production databases, data warehouses, analytics tools, and data pipelines
- Understanding of the business rules that govern data (valid ranges, required fields, relationships)
- Stakeholder input on which data quality problems are causing the most pain
- SQL access and profiling tools for automated data scanning

## Steps

1. **Catalog All Data Sources**: Build a comprehensive inventory of every data source in the organization's analytics ecosystem. Include production databases, data warehouses, analytics event streams, CRM exports, marketing platform data, financial systems, and third-party data feeds. For each source, document the owner, refresh frequency, downstream consumers, and perceived reliability. This catalog becomes the audit scope.

2. **Define Quality Dimensions and Rules**: For each data source, establish specific quality rules based on the six dimensions. Completeness: which fields must never be null, what is the expected row count per period. Accuracy: what are the valid ranges for numeric fields, what are the allowed values for categorical fields. Consistency: which fields should match across related tables, which totals should reconcile. Timeliness: what is the maximum acceptable latency from event to availability. Validity: which formats must data conform to (email, phone, date). Uniqueness: which fields or combinations should have no duplicates.

3. **Run Automated Data Profiling**: Execute automated profiling scripts against each data source. Profile every column for null rate, distinct value count, min/max values, distribution statistics (mean, median, standard deviation, percentiles), most common values, and data type consistency. Flag any column where the profile deviates from expected patterns: null rates above thresholds, unexpected data types, distributions with suspicious outliers, or distinct counts that suggest duplication.

4. **Test Completeness**: For each required field, calculate the null or empty rate. For each table, compare the actual row count against the expected count based on business activity. Identify time periods where data is missing entirely (gaps in daily data). Check for partial completeness: records that exist but have critical fields missing, rendering the record unusable for analysis.

5. **Test Accuracy**: Validate data against authoritative sources. Compare revenue totals in the data warehouse against the financial system. Compare user counts against the authentication system. Compare event counts against source system logs. For fields without an authoritative source, apply statistical accuracy checks: identify values that are mathematically impossible, internally contradictory, or statistical outliers that suggest data entry or system errors.

6. **Test Consistency**: Check for consistency within and across data sources. Within a source: do records that should match (e.g., order total equals sum of line items) actually match? Across sources: do the same entities have the same attribute values in different systems (e.g., does a customer's plan type in the billing system match the plan type in the analytics system)? Identify referential integrity violations: foreign keys that point to non-existent records.

7. **Test Timeliness**: Measure the actual latency of each data source from event occurrence to data availability. Compare against the expected latency documented in Step 2. Check whether the refresh schedule is reliable: is daily data consistently available by the expected time, or does it frequently arrive late? Identify data sources with growing latency that may eventually become operationally problematic.

8. **Test Uniqueness**: Scan for duplicate records across all tables where uniqueness is expected. Check natural keys (email addresses, transaction IDs) and synthetic keys (auto-increment IDs). Distinguish exact duplicates (identical rows) from near-duplicates (same entity with slightly different attributes, suggesting a merge failure). Quantify the duplication rate and assess whether duplicates are inflating metrics.

9. **Compile the Quality Issue Inventory**: For every quality rule violation discovered, create a structured issue record containing: the data source, the specific field or table affected, the quality dimension violated, the severity (critical, high, medium, low), a description of the issue, the volume of affected records, the estimated downstream impact (which reports or decisions are affected), and a hypothesis for the root cause. Aggregate issues by source and dimension to identify systemic patterns.

## Deliverables

- Data source catalog with owner, refresh schedule, and consumer documentation
- Quality rule definitions for each data source across all six dimensions
- Automated profiling results for all scanned data sources
- Completeness audit report with null rates and gap analysis
- Accuracy validation report comparing against authoritative sources
- Consistency check results showing within-source and cross-source discrepancies
- Timeliness measurement report with actual versus expected latency
- Uniqueness scan results with duplication rates and affected volumes
- Comprehensive quality issue inventory with structured records for every finding

## Quality Gate

The audit is complete when all of the following conditions are met:

- Every data source in the catalog has been scanned across all six quality dimensions
- Quality rules are defined and documented for each data source
- Automated profiling has been executed on at least 90% of tables in scope
- Each quality issue has a severity rating, affected volume, and downstream impact assessment
- Cross-source consistency checks have been performed for all shared entities
- The quality issue inventory is organized and searchable by source, dimension, and severity
- Findings have been reviewed with data source owners to validate accuracy and root cause hypotheses
- No major data sources were excluded from the audit scope without documented justification

## Next Phase

Proceed to **01-prioritization.md** (Prioritization) to rank the identified issues by business impact and determine the remediation sequence.
