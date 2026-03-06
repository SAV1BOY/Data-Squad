# LGPD Compliance Check

## Purpose

Provide a pragmatic checklist for LGPD (Lei Geral de Protecao de Dados) compliance focused on what the data team must get right: legal basis for processing, consent management, data subject rights fulfillment, and DPO coordination. This is not a legal manual -- it is an operational gate for the data squad.

---

## Checklist Items

### 1. Legal Basis Is Identified for Each Processing Activity

- **Pass:** For every data processing activity (collection, storage, analysis, sharing), the team has identified and documented the LGPD legal basis: consent, legitimate interest, contract execution, legal obligation, or another applicable basis from Art. 7. The legal team has reviewed and approved each basis.
- **Fail:** Data is processed without any identified legal basis, or "consent" is cited as the basis when no valid consent was obtained.

### 2. Consent Collection Is Valid and Granular

- **Pass:** Where consent is the legal basis, it is: freely given (no forced bundling), informed (clear explanation of what data and why), unambiguous (affirmative action, not pre-checked boxes), and granular (separate consent for different purposes). Consent records include timestamp, version of the terms shown, and the specific permissions granted.
- **Fail:** A single "I agree to everything" checkbox covers all data processing activities, or consent records do not capture what the user actually agreed to.

### 3. Data Subject Rights Are Operationalized

- **Pass:** The team has implemented processes to fulfill LGPD data subject rights within the regulatory timeframe: access (provide all data held), correction, deletion, portability, and revocation of consent. Each right has a documented process, responsible person, and SLA.
- **Fail:** A user requests their data and no one knows how to fulfill the request, or it takes months.

### 4. Data Processing Records (ROPA) Are Maintained

- **Pass:** A Record of Processing Activities exists listing: what personal data is processed, the purpose, the legal basis, data categories, retention periods, security measures, and any international transfers. The ROPA is updated when new processing activities are added.
- **Fail:** No processing inventory exists; the team cannot answer "what personal data do we process and why?"

### 5. International Data Transfers Are Compliant

- **Pass:** Any transfer of personal data outside Brazil is done in compliance with LGPD Chapter V: to countries with adequate protection levels, under standard contractual clauses, or with explicit consent. The legal basis for each transfer is documented.
- **Fail:** Data flows to servers in other countries (cloud providers, SaaS tools) without any assessment of transfer legality.

### 6. Data Protection Impact Assessments Are Conducted When Required

- **Pass:** New data processing activities that involve high risk to data subjects (large-scale profiling, sensitive data processing, new technology) trigger a Data Protection Impact Assessment (DPIA) before launch. The DPO is consulted.
- **Fail:** High-risk processing activities are launched without any impact assessment.

### 7. DPO Is Designated and Accessible

- **Pass:** A Data Protection Officer (DPO) is formally designated and their contact information is publicly accessible. The DPO has a working relationship with the data team and is consulted on new data initiatives, incidents, and subject rights requests.
- **Fail:** A DPO exists on paper but has no involvement with the data team's day-to-day operations.

### 8. Incident Response Includes ANPD Notification

- **Pass:** The data incident response plan includes: assessment of whether a breach involves personal data, notification to the ANPD (Autoridade Nacional de Protecao de Dados) within the required timeframe, notification to affected data subjects when there is relevant risk, and documentation of the incident and response.
- **Fail:** The incident response plan does not address LGPD notification requirements, or the team is unaware that the ANPD must be notified of certain breaches.

---

## Cross-References

- [PII Audit](pii-audit.md) -- The PII inventory feeds directly into the ROPA and legal basis mapping.
- [Consent Mode Tracking QA](../instrumentation/consent-mode-tracking-qa.md) -- Consent collection in tracking must meet LGPD validity requirements.
- [Retention Policy QA](retention-policy-qa.md) -- LGPD requires that data is not retained beyond its purpose; retention policies must enforce this.
- [Access Control QA](access-control-qa.md) -- LGPD requires appropriate security measures, including access restrictions.
