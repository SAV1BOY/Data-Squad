# Privacy Regulations Summary for Analytics Teams

## Purpose

This document summarizes the key requirements of GDPR, CCPA/CPRA, LGPD, and PIPL as they apply to analytics and data teams. It is not legal advice — consult your legal team for compliance decisions. It is a practical reference for analysts who need to understand what they can and cannot do with user data.

## Regulation Overview

| Regulation | Jurisdiction | Effective | Applies To |
|-----------|-------------|-----------|-----------|
| GDPR | EU/EEA | May 2018 | Any org processing EU residents' data |
| CCPA/CPRA | California, USA | Jan 2020 / Jan 2023 | Businesses meeting revenue/data thresholds |
| LGPD | Brazil | Sep 2020 | Any org processing Brazilian residents' data |
| PIPL | China | Nov 2021 | Any org processing Chinese residents' data |

## Consent Requirements

### GDPR

- **Opt-in required** for non-essential cookies and tracking (analytics, marketing).
- Consent must be freely given, specific, informed, and unambiguous.
- Pre-ticked boxes and cookie walls are invalid consent mechanisms.
- Consent must be as easy to withdraw as to give.
- First-party analytics may use legitimate interest as an alternative legal basis, but requires a documented Legitimate Interest Assessment.

### CCPA/CPRA

- **Opt-out model.** Businesses may collect data by default but must provide a "Do Not Sell or Share My Personal Information" link.
- CPRA expanded this to include "sharing" for cross-context behavioral advertising.
- No consent required for first-party analytics, but users can opt out of data sales/sharing.
- Sensitive personal information requires separate opt-in consent for non-essential purposes.

### LGPD

- **Opt-in required** for most analytics purposes, similar to GDPR.
- Ten legal bases available (consent, legitimate interest, contract performance, etc.).
- Legitimate interest is available but must be balanced against data subject rights.
- Consent must be free, informed, and unambiguous. Can be written or demonstrated.

### PIPL

- **Explicit consent required** for processing personal information.
- Separate consent required for: sensitive data, cross-border transfers, sharing with third parties.
- Consent must be voluntary, explicit, and informed.
- Legitimate interest is not a legal basis under PIPL. Consent is required for analytics.

## Data Retention

### Requirements by Regulation

| Regulation | Retention Rule |
|-----------|---------------|
| GDPR | Data must be kept no longer than necessary for the purpose. No fixed period, but you must define and justify your retention schedule. |
| CCPA/CPRA | No specific retention limit, but must disclose retention periods in privacy policy. |
| LGPD | Data must be deleted when purpose is fulfilled or consent is withdrawn. No fixed maximum. |
| PIPL | Minimum period necessary to achieve the processing purpose. Must delete when purpose is fulfilled. |

### Practical Guidance for Analytics

- Set GA4 data retention to the minimum needed (2 months or 14 months).
- In your data warehouse, implement tiered retention: raw event data (12-24 months), aggregated data (indefinite).
- Document your retention schedule and the justification for each data category.
- Implement automated deletion pipelines. Manual deletion does not scale.

## Right to Deletion

### What Must Be Deleted

| Regulation | Scope of Deletion |
|-----------|-------------------|
| GDPR (Article 17) | All personal data, all systems, including backups (with reasonable technical exceptions) |
| CCPA/CPRA | Personal information collected from the consumer |
| LGPD | Personal data processed with consent (when consent is withdrawn) |
| PIPL | Personal information when purpose is achieved, consent withdrawn, or processing is illegal |

### Analytics-Specific Deletion Challenges

1. **Analytics tools:** Each tool has its own deletion mechanism (GA4 User Deletion API, Mixpanel GDPR API, Amplitude User Privacy API). Automate these.
2. **Data warehouse:** Run DELETE on user-level tables. Ensure the deletion propagates to derived tables, marts, and snapshots.
3. **Backups:** GDPR requires deletion from backups where technically feasible. If not feasible, document the exception and delete when the backup is restored or cycled.
4. **Aggregated data:** Truly aggregated data (where the individual cannot be re-identified) does not need to be deleted. Ensure your aggregation is genuinely irreversible.
5. **Machine learning models:** Models trained on deleted users' data are a gray area. Regulators have ordered model deletion in some cases (FTC). Consult legal.

## Cross-Border Data Transfers

### Transfer Mechanisms by Regulation

| Regulation | Permitted Transfer Mechanisms |
|-----------|------------------------------|
| GDPR | Adequacy decision, Standard Contractual Clauses (SCCs), Binding Corporate Rules, EU-US Data Privacy Framework |
| CCPA/CPRA | No restrictions on cross-border transfers (but disclosure required) |
| LGPD | Adequacy decision, SCCs, binding corporate norms, specific consent |
| PIPL | Government security assessment (for Critical Information Infrastructure operators and large-volume processors), Standard Contract, certification |

### Impact on Analytics Tools

Most analytics tools (GA4, Amplitude, Mixpanel) process data in the US by default. For GDPR compliance:
- Use EU data residency options where available (Mixpanel EU, Amplitude EU).
- For GA4, consider server-side tagging with an EU-based server to control data flow.
- Verify that your analytics vendors are certified under the EU-US Data Privacy Framework or have SCCs in place.

For PIPL compliance:
- Data localization may be required for Chinese user data depending on volume thresholds.
- Conduct a Personal Information Protection Impact Assessment before transferring Chinese users' data abroad.

## Quick Decision Matrix for Analysts

| Action | GDPR | CCPA/CPRA | LGPD | PIPL |
|--------|------|-----------|------|------|
| First-party analytics (cookieless) | Legitimate interest (with LIA) | Permitted | Legitimate interest (with LIA) | Consent required |
| Third-party cookies | Consent required | Opt-out right | Consent required | Consent required |
| Sharing data with ad platforms | Consent required | Opt-out right ("Do Not Share") | Consent required | Separate consent required |
| Storing IP addresses | Minimize (truncate) | Disclose in privacy policy | Minimize | Minimize, consent required |
| User deletion request | Must comply (30 days) | Must comply (45 days) | Must comply (15 days) | Must comply (regulatory timeline) |
| Cross-border transfer | SCCs or DPF | No restriction | SCCs or consent | Security assessment or standard contract |

## Common Pitfalls

1. **Assuming CCPA is less strict than GDPR and ignoring it.** CPRA significantly strengthened California privacy rights. Opt-out requirements affect analytics data sharing.
2. **Treating pseudonymized data as anonymous.** Under GDPR, pseudonymized data (hashed IDs, cookie IDs) is still personal data.
3. **Not tracking consent state in your analytics pipeline.** You need to know which users consented to what, and filter data accordingly.
4. **Deleting from the analytics tool but not the warehouse.** Deletion requests must cascade across all systems.
5. **Ignoring PIPL.** If you have users in China, PIPL's consent requirements are stricter than GDPR in some respects.

## Cross-References

- **GDPR Analytics Notes** (`reference/standards/gdpr-analytics-notes.md`) — Detailed GDPR implementation guide.
- **GA4 Guide** (`reference/tools/google-analytics-4-guide.md`) — Consent mode configuration.
- **Event Naming Standard** (`reference/standards/event-naming-standard.md`) — PII exclusion from event properties.
