# LGPD Pragmatic Notes for Analytics Teams

## What is LGPD?

Lei Geral de Protecao de Dados (LGPD) is Brazil's data protection law, effective since September 2020, enforced by the ANPD (Autoridade Nacional de Protecao de Dados). It applies to any organization that processes personal data of individuals in Brazil, regardless of where the organization is based.

## Why Analytics Teams Should Care

Analytics teams are heavy consumers and processors of personal data. Every event you track, every user property you store, every cohort you build potentially falls under LGPD. Non-compliance can result in fines up to 2% of revenue in Brazil (capped at R$50 million per infraction), public disclosure of the violation, and suspension of data processing activities.

## Key Concepts for Analytics

### Personal Data (Dados Pessoais)

Any information that can identify a natural person, directly or indirectly:

- **Obviously personal:** Name, email, CPF, phone number, IP address.
- **Less obvious but still personal:** Device ID, advertising ID, cookie ID, behavioral patterns that can be linked to an individual.
- **Anonymized data** is exempt from LGPD, but true anonymization is hard. Pseudonymized data (e.g., hashed emails) is still personal data under LGPD.

### Sensitive Personal Data (Dados Pessoais Sensiveis)

Requires extra protection: racial/ethnic origin, religious belief, political opinion, health data, sexual orientation, genetic/biometric data. If your product collects health or wellness data, pay special attention.

### Legal Bases for Processing

LGPD provides 10 legal bases. The most relevant for analytics:

| Legal Base | Use Case | Notes |
|-----------|----------|-------|
| **Consent** | Marketing analytics, third-party tracking | Must be free, informed, unambiguous. Can be revoked at any time. |
| **Legitimate Interest** | Product analytics, internal reporting | Requires a Legitimate Interest Assessment (LIA). Cannot override user rights. |
| **Contract Performance** | Analytics necessary to deliver the service | Limited to what is truly necessary for the contracted service. |
| **Legal Obligation** | Compliance reporting, fraud detection | When law requires you to process the data. |

### Practical Guidance on Legal Bases

- **First-party product analytics** (how users interact with your own product): Usually covered by legitimate interest, but document your LIA.
- **Third-party marketing pixels** (Facebook, Google Ads): Requires consent. Implement a consent banner.
- **Internal BI dashboards** using aggregated data: Generally safe, but ensure the aggregation truly prevents re-identification.
- **Cohort analysis with PII:** Legitimate interest may apply, but minimize PII. Use pseudonymized IDs.

## Practical Implementation for Analytics

### Consent Management

1. Implement a Consent Management Platform (CMP) that supports LGPD categories.
2. Tracking events must check consent status before firing. This means:
   - GTM must have consent mode configured.
   - Server-side events must check consent flags.
   - CDPs (Segment, RudderStack) must respect consent signals.
3. Store consent records with timestamp, version of the privacy policy, and what was consented to.
4. Make consent revocation as easy as granting it.

### Data Mapping for Analytics

Document every data flow:

| Data Element | Source | Purpose | Legal Base | Retention | Shared With |
|-------------|--------|---------|------------|-----------|-------------|
| Page views | GA4 | Product analytics | Legitimate interest | 14 months | None |
| Email | CRM | Lifecycle comms | Consent | Until revoked | Email platform |
| Purchase data | Backend | Revenue analytics | Contract | 5 years (tax) | BI tool |

### Data Minimization

- Only collect what you need. If you do not use a property in any report or model, stop collecting it.
- Review tracked properties quarterly. Remove unused ones.
- Use aggregate data whenever individual-level data is not required.
- Avoid storing raw IP addresses. Truncate or hash them.

### Data Subject Rights

Under LGPD, users can request:

1. **Confirmation** of whether their data is being processed.
2. **Access** to their personal data.
3. **Correction** of inaccurate data.
4. **Anonymization, blocking, or deletion** of unnecessary or excessive data.
5. **Data portability.**
6. **Information about sharing** with third parties.
7. **Revocation of consent.**

**For analytics teams, this means:**

- You must be able to find all data associated with a user across your analytics tools.
- You must be able to delete user data from GA4, Mixpanel, Amplitude, your data warehouse, etc.
- Build a data subject request (DSR) process that includes analytics systems, not just the main application database.

### Retention Policies

- Set data retention limits in your analytics tools (GA4 allows 2 or 14 months).
- Warehouse data should have automated deletion or anonymization jobs.
- Do not keep data "just in case." Define a clear purpose and retention period.

## Tool-Specific Notes

### Google Analytics 4
- Enable IP anonymization (on by default in GA4).
- Set data retention to the minimum needed (2 months if you export to BigQuery).
- Use consent mode to adjust behavior based on user consent.

### Segment / CDPs
- Use the Segment Privacy Portal to manage deletion requests.
- Configure suppressed users list to prevent re-collection.

### BigQuery / Data Warehouse
- Implement column-level encryption for PII fields.
- Use authorized views to restrict PII access.
- Automate deletion jobs for data subject requests.

## Common Mistakes

1. **Assuming aggregated dashboards are exempt.** If the underlying data is personal, LGPD applies to the processing, not just the output.
2. **Ignoring server-side tracking.** LGPD applies regardless of whether data is collected client-side or server-side.
3. **Treating pseudonymization as anonymization.** Hashed emails are still personal data.
4. **Not including analytics tools in DSR processes.** Users have the right to deletion from ALL systems.
5. **Copy-pasting GDPR compliance and calling it LGPD.** They are similar but not identical. LGPD has different legal bases and enforcement mechanisms.

## Checklist for Analytics Teams

- [ ] Consent banner implemented and tested for Brazilian users.
- [ ] Tracking events respect consent status (no tracking before consent).
- [ ] Data mapping completed for all analytics data flows.
- [ ] Retention policies configured in all analytics tools.
- [ ] DSR process includes analytics systems.
- [ ] Legitimate Interest Assessment documented for first-party analytics.
- [ ] Third-party pixels fire only with explicit consent.
- [ ] Quarterly review of tracked properties scheduled.
- [ ] Data Processing Agreements (DPAs) in place with all analytics vendors.
- [ ] Privacy impact assessment completed for new tracking implementations.
