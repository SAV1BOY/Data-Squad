# Privacy Impact Brief

> Use this brief to assess the privacy implications of a new data collection, processing, or storage initiative.
> Must be completed before any new personal data handling begins or existing handling changes.

---

## 1. Brief Overview [REQUIRED]

**Brief ID:** [PIB-YYYY-NNN]
**Title:** [e.g., "User Behavioral Tracking for Personalization Engine"]
**Requestor:** [Name, Team]
**Privacy Reviewer:** [Name, Role]
**Date Submitted:** [YYYY-MM-DD]
**Status:** [Draft / Under Review / Approved / Rejected / Conditional]

---

## 2. Initiative Description [REQUIRED]

**What is being proposed?**
[2-3 sentences describing the initiative and its business purpose.]

**Why is this needed?**
[Business justification and expected outcomes.]

---

## 3. Data Classification [REQUIRED]

### Data Types Involved

| Data Element             | Data Category          | Sensitivity Level      | PII?   |
|--------------------------|------------------------|------------------------|--------|
| [e.g., "Email address"]  | [e.g., "Contact info"] | [Low / Medium / High]  | [Yes]  |
| [e.g., "Page views"]     | [e.g., "Behavioral"]   | [Low / Medium / High]  | [No]   |
| [e.g., "IP address"]     | [e.g., "Technical"]    | [Low / Medium / High]  | [Yes]  |
| [e.g., "Payment method"] | [e.g., "Financial"]    | [Low / Medium / High]  | [Yes]  |

### Data Subjects

- [e.g., "Registered users (all tiers)"]
- [e.g., "Anonymous website visitors"]
- [e.g., "Employees"]

**Estimated volume:** [e.g., "~50,000 users, ~2M events/month"]

---

## 4. Collection Method [REQUIRED]

| Field                    | Value                                    |
|--------------------------|------------------------------------------|
| Collection Method        | [e.g., "Client-side SDK / Server-side events / Third-party API / Manual upload"] |
| Consent Mechanism        | [e.g., "Cookie banner opt-in / Terms of Service / Explicit consent form"] |
| Lawful Basis (GDPR)      | [e.g., "Legitimate interest / Consent / Contract performance"] |
| User Notification        | [e.g., "Privacy policy update / In-app notice / Email notification"] |
| Opt-Out Available?       | [Yes / No - describe mechanism]          |

---

## 5. Storage and Retention [REQUIRED]

| Field                    | Value                                    |
|--------------------------|------------------------------------------|
| Storage Location         | [e.g., "BigQuery (US-central1)"]         |
| Encryption at Rest       | [e.g., "AES-256 via Google-managed keys"]|
| Encryption in Transit    | [e.g., "TLS 1.2+"]                      |
| Retention Period         | [e.g., "24 months, then anonymized"]     |
| Deletion Process         | [e.g., "Automated purge via scheduled job"] |
| Backup Policy            | [e.g., "Daily backups, 30-day retention"]|

---

## 6. Access Controls [REQUIRED]

| Role / Team              | Access Level           | Justification                  |
|--------------------------|------------------------|--------------------------------|
| [e.g., "Data team"]     | [e.g., "Read (PII masked)"]| [e.g., "Analysis and reporting"]|
| [e.g., "Engineering"]   | [e.g., "Read/Write"]       | [e.g., "Pipeline maintenance"] |
| [e.g., "Marketing"]     | [e.g., "Aggregated only"]  | [e.g., "Campaign performance"] |

**Access review cadence:** [e.g., "Quarterly"]
**Audit logging enabled?** [Yes / No]

---

## 7. Regulatory Requirements [REQUIRED]

| Regulation               | Applicable? | Compliance Status              |
|--------------------------|-------------|--------------------------------|
| GDPR                     | [Yes / No]  | [Compliant / In Progress / N/A]|
| CCPA / CPRA              | [Yes / No]  | [Compliant / In Progress / N/A]|
| HIPAA                    | [Yes / No]  | [Compliant / In Progress / N/A]|
| SOC 2                    | [Yes / No]  | [Compliant / In Progress / N/A]|
| [Other]                  | [Yes / No]  | [Compliant / In Progress / N/A]|

**Cross-border data transfers?** [Yes / No - if yes, describe safeguards]

---

## 8. Risk Assessment [REQUIRED]

| # | Risk                                          | Likelihood | Impact  | Mitigation                      |
|---|-----------------------------------------------|-----------|---------|----------------------------------|
| 1 | [e.g., "Unauthorized access to PII"]         | [H/M/L]   | [H/M/L] | [e.g., "Role-based access + audit logs"] |
| 2 | [e.g., "Data breach exposure"]               | [H/M/L]   | [H/M/L] | [e.g., "Encryption + incident response plan"] |
| 3 | [e.g., "Regulatory non-compliance"]          | [H/M/L]   | [H/M/L] | [e.g., "Legal review + DPA in place"] |
| 4 | [e.g., "User trust erosion"]                 | [H/M/L]   | [H/M/L] | [e.g., "Transparent privacy notice"] |

**Overall Risk Level:** [Low / Medium / High / Critical]

---

## 9. Approval

| Role                | Name | Date | Status             |
|---------------------|------|------|--------------------|
| Requestor           |      |      | Submitted          |
| Privacy Reviewer    |      |      | Pending / Approved |
| Legal               |      |      | Pending / Approved |
| Engineering Lead    |      |      | Pending / Approved |
| Data Lead           |      |      | Pending / Approved |
