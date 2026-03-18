# Data Quality Improvement Workflow

## Purpose
Systematically improve data quality by auditing current state, prioritizing issues by business impact, implementing fixes, validating improvements, and establishing ongoing monitoring to prevent regression.

## Trigger
- Data quality score falls below SLA threshold
- Stakeholder reports incorrect data in a dashboard or report
- New data source onboarding requires quality baseline
- Quarterly data quality review cycle

## Agents Involved
- **avinash-kaushik**: Leads the entire workflow, owns monitoring
- **data-chief**: Implements data pipeline fixes and schema changes
- **wes-kao**: Communicates impact and progress to stakeholders
- **avinash-kaushik**: Fixes source-level instrumentation issues

## Steps

### Phase 1: Audit (Days 1-4)
1. **avinash-kaushik** runs the automated data quality suite across all critical tables: completeness, accuracy, consistency, timeliness, and uniqueness checks.
2. **avinash-kaushik** reviews freshness SLAs: which tables are late, how often, and by how much?
3. **avinash-kaushik** checks schema drift: have any columns changed type, been added, or disappeared without documentation?
4. **data-chief** reviews data lineage for affected tables to identify upstream root causes.
5. **avinash-kaushik** produces the audit report: issue inventory with severity, affected downstream consumers, and root cause hypothesis.

### Phase 2: Prioritize (Days 5-6)
6. **avinash-kaushik** scores each issue on business impact: which dashboards, metrics, or decisions does it affect?
7. **avinash-kaushik** scores each issue on fix complexity: simple config change, pipeline refactor, or source instrumentation fix.
8. **avinash-kaushik** creates a prioritized fix backlog using impact/effort matrix.
9. **wes-kao** communicates the top issues and timeline to affected stakeholders.

### Phase 3: Fix (Days 7-14)
10. **data-chief** implements fixes for pipeline-level issues: join corrections, deduplication logic, NULL handling, timezone alignment.
11. **avinash-kaushik** fixes source-level issues: missing events, incorrect property types, broken SDK configurations.
12. **data-chief** adds schema validation rules to prevent similar issues from recurring.
13. **avinash-kaushik** reviews each fix in staging before production deployment.

### Phase 4: Validate (Days 15-17)
14. **avinash-kaushik** reruns the full quality suite on fixed tables and compares against pre-fix baseline.
15. **avinash-kaushik** validates that downstream dashboards and metrics now show correct values.
16. **data-chief** runs reconciliation checks: do aggregated values match source systems?
17. **avinash-kaushik** documents the validation results for each fix.

### Phase 5: Monitor (Ongoing)
18. **avinash-kaushik** configures automated monitors for each fixed issue: alerts on regression.
19. **avinash-kaushik** establishes freshness and quality SLAs for each critical table.
20. **avinash-kaushik** produces a weekly data quality scorecard showing trends across all dimensions.
21. **data-chief** adds quality checks to CI/CD pipelines for data transformations.
22. **avinash-kaushik** reviews the quality scorecard monthly and feeds persistent issues into the next audit cycle.

## Inputs
- Automated data quality test suite results
- Table freshness and SLA definitions
- Schema documentation and data lineage maps
- Stakeholder issue reports

## Outputs
- Data quality audit report with issue inventory
- Prioritized fix backlog with impact/effort scores
- Validation report showing pre/post quality scores
- Automated monitoring configuration
- Weekly data quality scorecard

## Quality Gates

| Gate | Criteria | Owner |
|------|----------|-------|
| G1: Audit Complete | All critical tables assessed across 5 quality dimensions | avinash-kaushik |
| G2: Priority Justified | Each issue scored on business impact and fix complexity | avinash-kaushik |
| G3: Fix Validated | Each fix passes staging validation before production deploy | avinash-kaushik |
| G4: Score Improved | Overall data quality score improves post-fix cycle | avinash-kaushik |
| G5: Monitors Active | Every fixed issue has an automated regression monitor | avinash-kaushik |

## Registry Updates
- **Data Quality Registry**: Update quality scores, SLA status, and issue history for each table.
- **Monitor Registry**: Register new automated checks with thresholds and alert routing.
- **Schema Registry**: Document any schema changes made during fixes.
- **Change Log**: Record all fixes with root cause, resolution, and validation outcome.

## SLA Definitions
- **Freshness**: Critical tables updated within 2 hours of source, standard tables within 6 hours.
- **Completeness**: No more than 0.1% missing values in required fields.
- **Accuracy**: Aggregated values match source systems within 1% tolerance.
- **Consistency**: Cross-table references resolve correctly for 99.9% of records.
