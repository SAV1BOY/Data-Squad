# Renewal Risk Audit Checklist

## Purpose

Systematically identify accounts at risk of non-renewal before it is too late to intervene. This gate shifts renewal management from reactive ("they told us they're leaving") to predictive, giving CS teams time to address issues while the customer still cares enough to engage.

---

## Checklist Items

### 1. Risk Scoring Model Exists and Uses Behavioral Data

- **Pass:** A renewal risk score is computed for each account using product usage data (login frequency, feature adoption, milestone progression), support data (ticket volume, sentiment), and engagement data (meeting attendance, NPS, champion activity). The model is updated at least weekly.
- **Fail:** Risk is assessed based on gut feeling, or only flagged when the customer explicitly says they may not renew.

### 2. Risk Signals Are Weighted and Validated

- **Pass:** Each risk signal (usage decline, champion departure, support escalation) has a validated weight based on historical correlation with actual non-renewal. The model's precision and recall are measured against past data.
- **Fail:** All signals are weighted equally, or the model has never been backtested.

### 3. Risk Thresholds Trigger Specific Actions

- **Pass:** Risk is categorized into levels (green/yellow/red or equivalent). Each level has a defined response: green = standard cadence, yellow = executive check-in within 2 weeks, red = save plan activated within 1 week. Escalation rules are documented.
- **Fail:** A "high risk" label exists but triggers no specific action or timeline.

### 4. Champion Health Is Monitored

- **Pass:** The primary champion and key stakeholders are tracked. Changes in champion engagement (fewer meetings, slower response times) and organizational changes (champion leaves the company, reorg) are detected and flagged as risk events.
- **Fail:** The risk model only looks at product usage; a champion departure goes unnoticed until renewal conversation reveals a new decision-maker.

### 5. Usage Trends Are Evaluated, Not Just Current State

- **Pass:** Risk assessment looks at the trajectory (e.g., "DAU declined 30% over the last 60 days") in addition to the current level. An account with high current usage but a declining trend is flagged differently from one with stable low usage.
- **Fail:** Only a snapshot of current usage is used; a gradual decline is invisible.

### 6. Financial and Contract Context Is Included

- **Pass:** Contract end date, ARR value, multi-year vs. annual terms, price increase history, and payment behavior (late payments, disputes) are factored into the risk assessment and prioritization.
- **Fail:** A $5K account and a $500K account at the same risk level receive the same intervention priority.

### 7. Save Plays Have Documented Outcomes

- **Pass:** When a red-risk account is saved (renewed), the save play used (executive escalation, product concession, pricing adjustment, roadmap commitment) is logged. Win rates by save play type are tracked to identify what works.
- **Fail:** Saves happen ad-hoc with no documentation, making it impossible to learn from successes or failures.

### 8. Post-Mortem on Lost Renewals Is Mandatory

- **Pass:** Every non-renewal (above a defined ARR threshold) triggers a brief post-mortem: when was risk first identified, what intervention was attempted, what was the stated reason for leaving, and what could be done differently. Findings feed back into the risk model.
- **Fail:** Lost renewals are recorded in the CRM and forgotten.

---

## Cross-References

- [Adoption Milestones](adoption-milestones.md) -- Stalled adoption is a leading risk indicator.
- [Onboarding Success](onboarding-success.md) -- Failed onboarding predicts early non-renewal.
- [Churn Taxonomy](../retention/churn-taxonomy.md) -- Risk signals map to churn types.
