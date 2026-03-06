# PII Audit Checklist

## Purpose

Map where personally identifiable information (PII) exists across the data ecosystem, ensure it is minimized to what is necessary, and verify that appropriate protections are in place. This gate prevents the accumulation of unnecessary PII that increases breach risk and regulatory exposure.

---

## Checklist Items

### 1. PII Inventory Is Complete and Current

- **Pass:** A documented inventory lists every data store (database, warehouse, log, cache, third-party tool) that contains PII. For each store, the types of PII are specified: name, email, phone, IP address, device ID, location, financial data, government IDs.
- **Fail:** No inventory exists, or it was created once and not updated when new systems were added.

### 2. Each PII Field Has a Justified Business Purpose

- **Pass:** For every PII field collected, a documented justification exists: why it is needed, which process consumes it, and what would break if it were removed. Fields without a current business purpose are candidates for deletion.
- **Fail:** PII is collected "because we might need it later" or because the default integration sends it.

### 3. PII Minimization Is Applied

- **Pass:** Data collection follows the minimization principle: only the PII strictly necessary for the stated purpose is collected. Where possible, pseudonymized or aggregated data is used instead of raw PII (e.g., hashed email instead of plain-text email for matching).
- **Fail:** Full PII is collected and stored when only a hash or aggregate would suffice.

### 4. PII Is Classified by Sensitivity Level

- **Pass:** PII is categorized into sensitivity tiers (e.g., Tier 1: government IDs, financial data; Tier 2: email, phone; Tier 3: IP address, device ID). Each tier has corresponding access and protection requirements.
- **Fail:** All PII is treated the same; a table with email addresses has the same access controls as a table with CPF numbers.

### 5. PII at Rest Is Encrypted

- **Pass:** All data stores containing PII use encryption at rest (AES-256 or equivalent). Encryption keys are managed through a key management service, not hardcoded or stored alongside the data.
- **Fail:** PII sits in unencrypted tables, S3 buckets without default encryption, or CSV files on shared drives.

### 6. PII in Transit Is Protected

- **Pass:** All data transfers containing PII use encrypted channels (TLS 1.2+). API calls that transmit PII use HTTPS. Internal service-to-service communication carrying PII is encrypted.
- **Fail:** PII is sent over unencrypted HTTP, in plain-text email attachments, or via unencrypted internal APIs.

### 7. PII Exposure in Logs and Analytics Is Prevented

- **Pass:** Application logs, error tracking systems, and analytics event payloads are scanned (automated or sampled) for inadvertent PII leakage. Masking or redaction rules prevent PII from appearing in logs.
- **Fail:** A user's email appears in error logs, or full names are sent as event properties to the analytics platform.

### 8. PII Audit Runs on a Regular Cadence

- **Pass:** The PII audit is repeated at least semi-annually, or triggered by significant system changes (new data source integration, new third-party tool, architecture migration). Findings are tracked to resolution.
- **Fail:** The audit was a one-time compliance exercise; no recurring schedule exists.

---

## Cross-References

- [Access Control QA](access-control-qa.md) -- PII access must be restricted by role.
- [Retention Policy QA](retention-policy-qa.md) -- PII retention must follow defined retention schedules.
- [LGPD Compliance Check](lgpd-compliance-check.md) -- PII handling is a core LGPD requirement.
