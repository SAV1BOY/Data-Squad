# Privacy and Compliance Quality Checklist

> Gate type: Pre-delivery
> Owner: Data Chief
> Applies to: Any dataset, report, model, or export that touches personal data or operates under regulatory scope

## Purpose

Privacy compliance is not a bureaucratic hurdle -- it is a trust contract with users and a legal obligation. A leaked PII column, an ignored deletion request, or an overbroad data export can result in regulatory fines, reputational damage, and loss of user trust. This gate keeps data handling pragmatic but compliant, catching the most common violations before data leaves the pipeline.

## Checklist Items

1. - [ ] **PII inventory current** -- All columns containing personally identifiable information are identified and tagged in the data catalog or schema metadata.
   - Pass criteria: PII columns are tagged (e.g., `pii: true`) in the schema definition; the inventory was reviewed within the last 90 days.
   - Fail signal: New tables or columns were added without a PII classification pass.
   - Action if fail: Run a PII scan on new or unclassified tables, tag all PII columns, and update the catalog.

2. - [ ] **PII masked or removed in non-production environments** -- Dev, staging, and analytics environments do not contain raw PII unless specifically authorized.
   - Pass criteria: Non-production copies use masked, hashed, or synthetic data for PII fields.
   - Fail signal: Full email addresses, phone numbers, or names are present in a dev database.
   - Action if fail: Apply masking transformations to non-production copies and restrict raw PII access to production only.

3. - [ ] **Consent basis documented** -- For each PII data use, the legal basis (consent, legitimate interest, contract performance) is documented.
   - Pass criteria: A data processing record or privacy impact note exists for this deliverable's use of personal data.
   - Fail signal: PII is used in a new analysis or model with no record of the legal basis.
   - Action if fail: Consult with the legal or privacy team to establish the basis before proceeding.

4. - [ ] **Data minimization applied** -- The deliverable uses only the personal data fields strictly necessary for its purpose; no extra PII is carried along "just in case."
   - Pass criteria: Each PII field included has a documented reason; unused PII columns are excluded from the output.
   - Fail signal: A report includes full names and email addresses when only an anonymized user ID is needed.
   - Action if fail: Remove unnecessary PII fields and re-deliver with minimized data.

5. - [ ] **Retention policy enforced** -- Data older than the defined retention period is either deleted or anonymized on schedule.
   - Pass criteria: Retention policy documented (e.g., "raw event data retained for 24 months, then anonymized"); automated purge or anonymization job exists and ran on schedule.
   - Fail signal: Data from 5 years ago is still in raw form with no retention policy applied.
   - Action if fail: Define or enforce the retention schedule; prioritize purging the oldest non-compliant data.

6. - [ ] **Deletion requests honored** -- User deletion requests (right to erasure / LGPD / GDPR Art. 17) have been processed in all relevant tables and systems.
   - Pass criteria: A deletion log exists showing requests processed within the SLA (typically 30 days); spot-check confirms deleted users are not present in active tables.
   - Fail signal: Deleted users still appear in analytics tables or model training sets.
   - Action if fail: Propagate deletions to all downstream tables, verify with a spot-check, and close the request.

7. - [ ] **Cross-border transfer rules checked** -- If data is transferred across jurisdictions (e.g., Brazil to US), the transfer mechanism is documented and compliant.
   - Pass criteria: Transfer mechanism identified (e.g., Standard Contractual Clauses, adequacy decision) and documented.
   - Fail signal: Data is exported to a foreign cloud region or third-party tool with no transfer assessment.
   - Action if fail: Consult legal on the appropriate transfer mechanism; do not proceed with the export until resolved.

8. - [ ] **Third-party data sharing governed** -- Any data shared with external vendors, partners, or tools is covered by a Data Processing Agreement (DPA).
   - Pass criteria: DPA on file for the recipient; data shared is limited to what the DPA covers.
   - Fail signal: PII sent to a new SaaS tool without a DPA or data review.
   - Action if fail: Obtain a DPA before sharing data, or anonymize the data so a DPA is not required.

9. - [ ] **Access controls appropriate** -- Access to the deliverable is restricted to those with a legitimate need; access is logged.
   - Pass criteria: Access granted via role-based controls; access list reviewed and matches the intended audience.
   - Fail signal: A dataset with PII is accessible to the entire company or stored in a public bucket.
   - Action if fail: Restrict access immediately, audit who accessed the data, and notify the privacy team if exposure occurred.

10. - [ ] **Anonymization is irreversible** -- If data is described as "anonymized," it cannot be re-identified through linkage, small-cell sizes, or quasi-identifiers.
    - Pass criteria: k-anonymity >= 5 for any quasi-identifier combination, or a formal anonymization technique (differential privacy, generalization) is applied.
    - Fail signal: "Anonymized" data still contains zip code + birth year + gender, enabling re-identification.
    - Action if fail: Apply stronger anonymization (generalize, suppress small groups) and re-validate.

11. - [ ] **LGPD-specific requirements met** -- For Brazilian users, LGPD-specific obligations are addressed (legal basis per Art. 7, data subject rights, DPO notification if applicable).
    - Pass criteria: LGPD legal basis documented; data subject rights process covers Brazilian users; DPO informed if required.
    - Fail signal: Brazilian user data is processed under a GDPR-only framework without LGPD-specific review.
    - Action if fail: Review LGPD requirements with legal and ensure the processing record covers Brazilian data subjects.

12. - [ ] **Audit trail exists** -- Changes to PII-containing tables (who accessed, modified, or exported data) are logged and retained.
    - Pass criteria: Query logs or access logs are enabled on PII tables; logs retained for at least 12 months.
    - Fail signal: No logging on sensitive tables; it is impossible to determine who accessed PII data last month.
    - Action if fail: Enable access logging on PII tables in the data warehouse and configure log retention.

13. - [ ] **Privacy impact proportionate** -- For new data uses, a lightweight privacy impact assessment has been completed to ensure the benefit justifies the privacy risk.
    - Pass criteria: A brief (1-page) privacy impact note exists for new processing activities involving PII.
    - Fail signal: A new machine learning model trained on behavioral data with no privacy assessment.
    - Action if fail: Complete a proportionate impact assessment; escalate to the DPO if the risk is high.

## Cross-References

- See `data-quality-quality.md` for general data quality checks that complement privacy-specific validation.
- See `predictive-model-quality.md` for privacy considerations specific to model training data.
- See `cross-squad-data-request-quality.md` for privacy checks when sharing data across squads.
