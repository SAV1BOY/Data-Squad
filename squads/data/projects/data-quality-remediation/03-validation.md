# Data Quality Remediation - Validation

## Phase Objective

Verify that every deployed fix actually resolved its target quality issue, confirm that fixes did not introduce new quality problems (regression testing), and measure the overall improvement in data quality across the organization. Validation transforms remediation from a set of activities into a set of verified outcomes.

## Prerequisites

- Fixes deployed from Phase 02 for the current remediation wave
- Pre-fix quality baselines documented from the original audit
- Access to all fixed data sources for re-scanning
- Downstream reports and dashboards available for regression testing
- Stakeholders available to confirm that quality improvements are observable in their workflows

## Steps

1. **Re-Run Quality Scans on Fixed Sources**: Execute the same automated profiling and quality checks used during the original audit against every data source that received fixes. Compare the results directly against the pre-fix baseline. For each issue that was fixed, confirm that the quality metric has improved to an acceptable level. A completeness issue that was at 73% should now be above the defined threshold. A duplication rate that was at 8% should now be below 1%.

2. **Validate Each Fix Individually**: For every deployed fix, run a targeted validation test specific to that fix. If a null-rate issue was fixed by repairing a collection pipeline, verify that the null rate is now at the expected level by checking both recent data and the backfilled historical period. If a duplication fix merged records, verify that no duplicates remain and that merge decisions were correct by spot-checking merged records against source systems.

3. **Perform Regression Testing**: Verify that fixes did not break anything that was previously working. Check that downstream reports produce numbers consistent with expectations (accounting for the intentional impact of data corrections). Verify that data pipelines run without new errors. Confirm that application-level data consumers (features that read from the database, APIs that serve data) still function correctly. Regression testing catches unintended side effects of data modifications.

4. **Reconcile Corrected Metrics Against Source of Truth**: For metrics affected by data corrections, compare the new values against authoritative sources. Revenue figures should now match the financial system more closely. User counts should align with the authentication system. Event counts should reconcile with source system logs. Calculate the reconciliation gap before and after remediation to quantify improvement.

5. **Validate Data Contracts**: Test each newly established data contract by running contract validation checks. Verify that schema matches the contract definition, that completeness thresholds are met, that freshness guarantees are achieved, and that value ranges stay within valid bounds. Intentionally introduce contract violations in a test environment to verify that alerting and blocking mechanisms work correctly.

6. **Measure the Quality Score Improvement**: Calculate a composite data quality score for each remediated data source using a weighted combination of the six quality dimensions. Compare the post-remediation score against the pre-remediation baseline. Roll up source-level scores into an organization-wide data quality index. This quantification enables progress reporting to stakeholders and justifies continued investment in data quality.

7. **Conduct Stakeholder Validation**: Meet with the stakeholders who reported quality pain during the audit phase. Walk them through the specific fixes that addressed their concerns. Ask them to verify in their own workflows that the improvements are real: are reports now accurate, are they spending less time manually correcting data, are decisions being made with greater confidence? Stakeholder perception of quality is as important as measured quality.

8. **Test Prevention Mechanisms**: Verify that the prevention mechanisms implemented alongside fixes are working. Introduce test data that violates the rules the prevention mechanism should catch: insert a null value where NOT NULL was added, submit a record with an invalid format where validation was implemented, and attempt to create a duplicate where uniqueness constraints were added. Confirm that each violation is caught, flagged, or rejected as designed.

9. **Document Validation Results and Remaining Gaps**: Compile a validation report that documents the outcome for every fix: verified fixed, partially fixed (improved but not fully resolved), fix ineffective (quality issue persists), or regression introduced (new problem created by the fix). For issues that are partially fixed or ineffective, determine whether additional work is needed or whether the remaining gap is acceptable. Update the quality issue inventory to reflect the current state.

## Deliverables

- Post-remediation quality scan results compared against pre-fix baselines
- Individual fix validation reports with pass/fail status and evidence
- Regression test results confirming no unintended side effects
- Source-of-truth reconciliation report showing improvement in metric alignment
- Data contract validation results including synthetic violation testing
- Data quality score improvement calculation by source and overall
- Stakeholder validation summary confirming observable quality improvement
- Prevention mechanism test results verifying catch-and-block functionality
- Comprehensive validation report with status of every fix and remaining gaps

## Quality Gate

Validation is complete for each wave when all of the following conditions are met:

- Post-remediation quality scans show measurable improvement for at least 90% of fixed issues
- Every individual fix has been validated with specific evidence of resolution
- Regression testing confirms no new quality issues were introduced by the fixes
- Source-of-truth reconciliation shows improvement in alignment (gap reduced by at least 50%)
- Data contracts are validated and violation alerting is confirmed functional
- The organization-wide data quality index has improved compared to the pre-remediation baseline
- At least 3 stakeholders have confirmed observable quality improvement in their workflows
- Prevention mechanisms have been tested and confirmed to catch future violations
- Remaining gaps are documented and either scheduled for future waves or accepted with justification

## Next Phase

Proceed to **04-monitoring.md** (Monitoring) to establish ongoing quality monitoring that prevents quality regression and catches new issues before they impact downstream consumers.
