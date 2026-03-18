# Task: Privacy Impact Assessment
> Agent(s): data-chief, avinash-kaushik
> Frameworks: governance-layer, data-quality-triad, instrumentation-layer
> Checklists: privacy-and-compliance-quality, security-privacy/pii-audit, security-privacy/retention-policy-qa
> Templates: reports/data-quality-report
> Registry: data-quality-registry, decision-registry

## Objective
Assess the privacy implications of new data collection, tracking, or sharing initiatives —
identifying risks, ensuring regulatory compliance, and producing a go/no-go recommendation
with required mitigations before implementation proceeds.

## Prerequisites
- A description of the proposed data initiative (new tracking, new data sharing, new collection).
- Access to the current data catalog and event registry.
- Knowledge of applicable regulations (GDPR, CCPA, SOC 2, industry-specific).
- Consent management platform documentation.

## Steps
1. **Scope the initiative** -- Document what is being proposed:
   - What data will be collected, tracked, or shared?
   - What is the business purpose and expected benefit?
   - Who are the data subjects (customers, employees, prospects)?
   - Where will the data be stored and processed?
   - Who will have access (internal teams, third parties, vendors)?
2. **Classify data sensitivity** -- For each data element, classify:
   - PII (personally identifiable information): names, emails, phone numbers.
   - Sensitive PII: financial data, health data, biometric data.
   - Behavioral data: clickstream, usage patterns, location.
   - Aggregated/anonymized data.
   Flag any sensitive PII that triggers enhanced regulatory requirements.
3. **Map regulatory requirements** -- For the identified data and geographies:
   - GDPR: legal basis, data subject rights, cross-border transfer rules.
   - CCPA/CPRA: consumer rights, opt-out requirements, sale/share definitions.
   - Industry-specific: HIPAA, PCI-DSS, SOX, COPPA.
   Document which requirements apply and the compliance obligations.
4. **Assess consent requirements** -- Determine:
   - Is explicit consent required, or does legitimate interest apply?
   - Does the current consent flow cover the proposed data use?
   - Are consent preferences granular enough to support the new initiative?
   - Does the consent mechanism need updating (banner, preference center)?
5. **Evaluate data minimization** -- Review whether the proposal collects more data than needed:
   - Can the business purpose be achieved with less data?
   - Can data be anonymized or pseudonymized at the point of collection?
   - Is the proposed retention period appropriate (not longer than needed)?
6. **Assess sharing and third-party risk** -- If data is shared externally:
   - Is a Data Processing Agreement (DPA) in place?
   - Does the third party meet security and privacy standards?
   - Can data be aggregated before sharing to reduce PII exposure?
   - Are cross-border data transfer mechanisms in place (SCCs, adequacy decisions)?
7. **Identify risks** -- For each risk, document:
   - Risk description and likelihood (low, medium, high).
   - Potential impact (regulatory fine, reputational damage, user trust erosion).
   - Affected data subjects and data volume.
8. **Propose mitigations** -- For each identified risk:
   - Technical mitigations (encryption, pseudonymization, access controls).
   - Process mitigations (consent updates, retention policies, audit trails).
   - Contractual mitigations (DPA updates, vendor assessments).
   Assign an owner and implementation timeline for each mitigation.
9. **Produce go/no-go recommendation** -- Based on the risk-mitigation analysis:
   - **Go:** Risks are acceptable with proposed mitigations. Proceed with implementation.
   - **Conditional go:** Proceed only after specific mitigations are in place.
   - **No-go:** Risks outweigh benefits. Recommend alternative approaches.
10. **Document and archive** -- Record the assessment:
    - Full PIA document with all findings.
    - Decision and rationale.
    - Mitigation tracking sheet.
    - Review date for reassessment (recommended annually or on material change).

## Deliverable
A privacy impact assessment package containing:
- Initiative scope and data classification.
- Regulatory requirements map.
- Consent assessment with gap analysis.
- Data minimization evaluation.
- Third-party risk assessment (if applicable).
- Risk register with likelihood and impact ratings.
- Mitigation plan with owners and timelines.
- Go/no-go recommendation with rationale.

## Quality Gate
- [ ] All data elements classified by sensitivity level.
- [ ] Applicable regulations identified and obligations documented.
- [ ] Consent requirements assessed against current consent flow.
- [ ] Data minimization review completed.
- [ ] Third-party risks assessed (if data sharing is involved).
- [ ] Risk register includes likelihood and impact for every risk.
- [ ] Mitigation plan has owners and timelines for every risk.
- [ ] Go/no-go recommendation is documented with clear rationale.

## Registry Update
- Log the PIA in `decision-registry` with the go/no-go outcome.
- Update `data-quality-registry` with compliance status.
- Log task completion in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** data-chief owns this task end-to-end.
- **Supporting agents:** avinash-kaushik contribute to their domain-specific steps.
- **Review:** data-chief reviews the final deliverable before it exits the squad.
- **Cross-squad delivery:** If the output is requested by another squad, deliver via the cross-squad-data-delivery-workflow with data-chief sign-off.

### Escalation Rules
- **Data blocker:** If required data is unavailable or unreliable, escalate to data-chief within 24 hours.
- **Stakeholder disagreement:** If stakeholders reject the methodology or conclusions, escalate to data-chief for mediation.
- **Deadline risk:** If the task cannot be completed on schedule, notify data-chief at least 48 hours before the deadline.

### Rework Loop
- **Trigger:** Any checklist item marked as fail, or reviewer requests changes.
- **Maximum iterations:** 2 rework cycles. If the deliverable fails after 2 reworks, escalate to data-chief for a scope review.
- **Between iterations:** The reviewing agent provides specific, written feedback on what must change. No vague "needs improvement" — every rework request cites a checklist item or specific deficiency.

### RalphLoop Gate
- **Applicable gate:** G5 -- Decision + Registry
- **Must-pass checklists:** `checklists/privacy-and-compliance-quality.md`, `checklists/security-privacy/pii-audit.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/data-quality-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [governance-layer](../../frameworks/governance-layer.md), [data-quality-triad](../../frameworks/data-quality-triad.md), [instrumentation-layer](../../frameworks/instrumentation-layer.md)
- **Checklists:** [privacy-and-compliance-quality](../../checklists/privacy-and-compliance-quality.md), [security-privacy/pii-audit](../../checklists/security-privacy/pii-audit.md), [security-privacy/retention-policy-qa](../../checklists/security-privacy/retention-policy-qa.md)
- **Templates:** [reports/data-quality-report](../../templates/reports/data-quality-report.md)
- **Workflows:** [ralphloop-quality-workflow](../../workflows/ralphloop-quality-workflow.md)
