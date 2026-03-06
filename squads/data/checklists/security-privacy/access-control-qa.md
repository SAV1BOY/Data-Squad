# Access Control QA Checklist

## Purpose

Verify that role-based access controls (RBAC) for data systems follow the principle of least privilege, are consistently enforced, and are regularly reviewed. This gate prevents over-permissioned accounts, orphaned access, and unauthorized data exposure.

---

## Checklist Items

### 1. Roles Are Defined Based on Job Function

- **Pass:** A documented set of data access roles exists (e.g., analyst-read-only, engineer-read-write, admin, executive-dashboard-only). Each role maps to specific data resources and permission levels. The mapping is reviewed by security and data team leads.
- **Fail:** Everyone has the same access level, or roles are created ad-hoc per individual request.

### 2. Least Privilege Is the Default

- **Pass:** New accounts start with minimal permissions. Access is granted incrementally based on demonstrated need. No user has write access to production data without explicit justification and approval.
- **Fail:** New employees receive admin-level warehouse access "to avoid blockers during onboarding."

### 3. Sensitive Data Has Additional Access Gates

- **Pass:** Tables containing PII, financial data, or other sensitive information require additional approval beyond the standard role assignment. Access is logged and auditable. Column-level or row-level security is applied where supported.
- **Fail:** Anyone with general warehouse access can query the table with customer CPF numbers.

### 4. Service Accounts and API Keys Are Inventoried

- **Pass:** All service accounts, API keys, and machine-to-machine credentials that access data systems are inventoried. Each has a documented owner, purpose, and expiration date. Unused service accounts are disabled.
- **Fail:** Legacy API keys with broad permissions exist with no known owner.

### 5. Access Reviews Are Conducted Quarterly

- **Pass:** Every quarter, a review of all active data access permissions is conducted. Users who have changed roles, left the company, or not used their access in 90 days are flagged. Unnecessary permissions are revoked.
- **Fail:** Access is only added, never removed; former employees' accounts remain active.

### 6. Off-boarding Triggers Immediate Access Revocation

- **Pass:** When an employee leaves or changes to a role that no longer requires data access, their permissions are revoked within 24 hours. This is part of the standard HR/IT off-boarding checklist, not dependent on the data team remembering.
- **Fail:** Access revocation depends on someone on the data team noticing the departure.

### 7. Access Requests Follow an Auditable Process

- **Pass:** Every access grant and revocation is recorded in a ticketing system or access management tool. The log includes: who requested, who approved, what access was granted, and when. The log can be audited by compliance.
- **Fail:** Access is granted via Slack DM or verbal request with no record.

### 8. Break-Glass Procedures Exist for Emergencies

- **Pass:** A documented procedure allows temporary elevated access during incidents (e.g., an analyst needs production write access to fix a critical data issue). Break-glass access is time-limited, logged, and reviewed post-incident.
- **Fail:** During incidents, people share admin credentials via chat, or there is no way to get emergency access, delaying resolution.

---

## Cross-References

- [PII Audit](pii-audit.md) -- Access controls must align with PII sensitivity tiers.
- [Retention Policy QA](retention-policy-qa.md) -- Access to data pending deletion must be restricted.
- [Data Catalog Quality](../governance/data-catalog-quality.md) -- The catalog should indicate sensitivity level and access requirements for each dataset.
