# Privacy and Data Ethics Guide

## Purpose

This is a pragmatic guide for the Data Squad on handling personal data responsibly. It covers LGPD (Lei Geral de Protecao de Dados) compliance essentials, ethical data use principles, and practical rules for daily analytics work. This is not a legal document; consult Legal for binding interpretations.

## Core Principle

We collect and use the minimum data necessary to make decisions. More data is not better if it creates risk without creating value. Every data point we store is a responsibility, not just a resource.

## LGPD Essentials for Analysts

### What Counts as Personal Data
Any information that identifies or can identify a natural person: name, email, phone, CPF, IP address, device ID, location data, and behavioral data that can be linked to an individual.

### Legal Bases We Rely On
- **Consent:** User explicitly agreed to data collection for a stated purpose. Check that consent covers your use case.
- **Legitimate interest:** Processing is necessary for a legitimate business purpose that does not override the user's rights. Most analytics falls here, but document the legitimate interest assessment.
- **Contract execution:** Processing is necessary to fulfill a contract with the user.

### Analyst Responsibilities
1. **Know the legal basis.** Before using a dataset, confirm which legal basis covers its collection and whether your use case fits within that basis.
2. **Minimize data access.** Query only the columns you need. Do not pull full user records when you only need aggregate counts.
3. **Anonymize when possible.** Use anonymized or pseudonymized datasets for analysis when individual identity is not required.
4. **Respect data subject rights.** Users can request access, correction, or deletion of their data. Ensure your analyses do not depend on data that may be subject to deletion requests.
5. **Document data flows.** Every analysis that uses personal data should document: which data, which legal basis, and what purpose.

## Practical Rules for Daily Work

### Rule 1: No personal data in dashboards
Dashboards display aggregate data only. Never show individual user records, emails, names, or identifiable information in a shared dashboard. If a specific user investigation is needed, use a separate, access-controlled tool.

### Rule 2: Pseudonymize by default
When working with user-level data, use internal user IDs instead of email addresses, names, or phone numbers. If you need to match records across systems, use the identity resolution service rather than joining on PII fields directly.

### Rule 3: Retention limits
Do not retain raw personal data longer than the documented retention policy (typically 24 months for behavioral data, 36 months for transactional data). Aggregated data can be retained indefinitely.

### Rule 4: Access control
Access to personal data is granted based on role and need. Analysts receive access to pseudonymized datasets by default. Access to identifiable data requires manager approval and a documented business justification.

### Rule 5: No data in uncontrolled environments
Never export personal data to local machines, personal cloud storage, or shared documents. All analysis happens in the controlled warehouse and BI tool environment.

### Rule 6: Experiment ethics
Experiments must not cause harm to participants. Do not test changes that could result in financial loss, safety risks, or significant negative experiences without ethics review. All experiments must have guardrail metrics that catch harmful outcomes.

## Data Ethics Beyond Compliance

Compliance is the floor, not the ceiling. Consider these ethical principles:

**Fairness:** Check that your analyses and models do not discriminate against protected groups. If a segmentation disproportionately affects a demographic, investigate whether the impact is justified.

**Transparency:** Users should be able to understand, in broad terms, how their data is used. Avoid "dark patterns" in data collection that obscure what is being tracked.

**Proportionality:** The intrusiveness of data collection should be proportional to the value it creates for the user. Tracking every mouse movement is disproportionate if you only need to know which features are used.

**Reversibility:** Design systems so that data deletion requests can be honored. Do not create irreversible dependencies on personal data.

## When to Escalate

- You discover personal data in a dataset where it should not exist.
- A stakeholder requests an analysis that requires PII access beyond your approved scope.
- You identify a potential data breach or unauthorized access.
- An experiment design raises ethical concerns about participant welfare.
- You are unsure whether a legal basis covers your intended use.

In all these cases, notify the avinash-kaushik and Legal within 24 hours. Do not proceed until you have guidance.

## Checklist for New Analyses Using Personal Data

- [ ] Legal basis identified and documented
- [ ] Data minimized to only required fields
- [ ] Pseudonymized where individual identity is not required
- [ ] Access limited to authorized personnel
- [ ] Output does not contain identifiable information
- [ ] Retention policy applied to any stored intermediate results
- [ ] Analysis documented with data flow and purpose
