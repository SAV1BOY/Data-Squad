# Retention Policy QA Checklist

## Purpose

Ensure that data retention, anonymization, and deletion policies are defined, implemented, and actually enforced. Keeping data forever is a liability, not an asset. This gate verifies that the organization retains what it needs, anonymizes what it can, and deletes what it must.

---

## Checklist Items

### 1. Retention Periods Are Defined Per Data Category

- **Pass:** Each category of data (user PII, transaction records, behavioral events, logs, backups) has a documented retention period justified by business need and legal requirements. Periods are specific (e.g., "24 months after last activity") not vague ("as long as needed").
- **Fail:** No retention periods are defined, or a blanket "keep everything forever" policy exists.

### 2. Retention Periods Comply With Regulations

- **Pass:** Retention periods are reviewed against applicable regulations (LGPD, GDPR, SOX, industry-specific rules). Where regulations require minimum retention (e.g., financial records for 5 years), the policy meets the minimum. Where regulations require maximum retention, the policy does not exceed it.
- **Fail:** Regulations require deletion after a certain period, but the data remains indefinitely.

### 3. Deletion Processes Are Automated and Verified

- **Pass:** Automated jobs delete or anonymize data that has exceeded its retention period. The jobs run on a defined schedule (at least monthly). After each run, a verification check confirms that the target data is no longer accessible.
- **Fail:** Retention policy says "delete after 2 years" but no automated process exists; data accumulates.

### 4. Anonymization Is Used Where Full Deletion Is Not Feasible

- **Pass:** Where historical data is needed for analytics but PII is not, anonymization (irreversible removal of identifying fields) or pseudonymization (replacing identifiers with tokens) is applied. The anonymization method is documented and resistant to re-identification.
- **Fail:** "Anonymization" consists of deleting the name field while keeping email, phone, and address.

### 5. Backup and Archive Retention Aligns With Primary Data

- **Pass:** Retention policies cover backups, archives, data warehouse snapshots, and disaster recovery copies. Backup data that contains expired primary data is also purged or the backup retention window does not exceed the primary retention period.
- **Fail:** Primary data is deleted per policy, but full backups from 3 years ago still contain the "deleted" data.

### 6. Third-Party Data Sharing Includes Retention Terms

- **Pass:** Data shared with third parties (analytics vendors, advertising platforms, partners) includes contractual retention limits. The team periodically verifies that third parties comply with agreed retention terms.
- **Fail:** Data is sent to a third-party platform with no contractual or technical enforcement of when it should be deleted.

### 7. User Deletion Requests Are Fulfilled End-to-End

- **Pass:** When a user exercises their right to deletion (LGPD, GDPR), the request is processed across all systems (primary database, warehouse, backups where feasible, third-party integrations) within the regulatory timeframe. Completion is logged and confirmable.
- **Fail:** The user's record is deleted from the app database but persists in the data warehouse and three third-party tools.

### 8. Retention Policy Is Reviewed Annually

- **Pass:** The full retention policy is reviewed at least annually with input from legal, security, data engineering, and business stakeholders. Changes in business needs, data architecture, or regulations trigger interim reviews.
- **Fail:** The retention policy was written 3 years ago and has not been updated since.

---

## Cross-References

- [PII Audit](pii-audit.md) -- PII identified in the audit must have corresponding retention schedules.
- [LGPD Compliance Check](lgpd-compliance-check.md) -- LGPD mandates specific retention and deletion rights.
- [Access Control QA](access-control-qa.md) -- Data pending deletion should have restricted access.
