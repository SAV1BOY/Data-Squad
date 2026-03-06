# Experiment Kill Report

> Use this template when an experiment is stopped early (before reaching
> planned duration or sample size). Document why it was killed, what was
> learned, and what happens next.

---

## 1. Kill Summary [REQUIRED]

**Experiment:** [Title]
**ID:** [EXP-YYYY-NNN]
**Kill Date:** [YYYY-MM-DD]
**Kill Decision By:** [Name, Role]
**Report Author:** [Name, Team]
**Original Planned End Date:** [Date]
**Days Run:** [# out of planned #]

_Example:_
**Experiment:** Checkout Urgency Timer ("Only 2 spots left at this price")
**ID:** EXP-2026-012
**Kill Date:** 2026-02-10
**Kill Decision By:** Marcus Chen, Head of Growth
**Report Author:** Sarah Kim, Analytics
**Original Planned End Date:** 2026-02-24
**Days Run:** 10 out of 21 planned

---

## 2. Kill Reason [REQUIRED]

**Category:** [Guardrail Breach / Negative Primary Metric / Technical Issue / External Factor / Business Decision]

**Description:**
[2-3 sentences explaining exactly why the experiment was stopped]

**Trigger:**
[The specific data point or event that triggered the kill decision]

_Example:_
**Category:** Guardrail Breach + Negative Primary Metric

**Description:**
The urgency timer treatment caused a significant increase in support tickets (+45% in the treatment arm) and showed a negative trend on the primary metric (checkout completion rate). Additionally, 12 customers explicitly complained about the urgency messaging, calling it "manipulative."

**Trigger:**
Support ticket volume from treatment users exceeded the guardrail threshold (>15% increase) for 5 consecutive days. Primary metric was trending -2.1pp with p=0.08 (approaching significance in the wrong direction).

---

## 3. Data at Time of Kill [REQUIRED]

| Metric                    | Control  | Treatment | Difference     | p-value | Notes                     |
|---------------------------|----------|-----------|----------------|---------|---------------------------|
| [Primary metric]          | [value]  | [value]   | [+/- change]   | [p]     | [Notes]                   |
| [Secondary metric]        | [value]  | [value]   | [+/- change]   | [p]     | [Notes]                   |
| [Guardrail metric]        | [value]  | [value]   | [+/- change]   | [p]     | [BREACHED / Safe]         |

_Example:_

| Metric                     | Control | Treatment | Difference    | p-value | Notes           |
|----------------------------|---------|-----------|---------------|---------|-----------------|
| Checkout completion rate   | 34.2%   | 32.1%     | -2.1pp (-6.1%)| 0.08    | Trending negative|
| Revenue per visitor        | $12.40  | $11.80    | -$0.60 (-4.8%)| 0.14    | Negative trend  |
| Support tickets (daily avg)| 8.2     | 11.9      | +3.7 (+45%)   | 0.002   | BREACHED        |
| Page load time (p95)       | 2.1s    | 2.2s      | +100ms        | 0.31    | Safe            |

**Sample Size at Kill:**
- Control: [#]
- Treatment: [#]
- Required for significance: [#]
- Achieved: [%] of required

_Example:_
- Control: 1,840
- Treatment: 1,860
- Required for significance: 3,200 per arm
- Achieved: 58% of required

---

## 4. Kill Criteria Assessment

Which pre-defined kill criteria were met?

| Kill Criterion                                    | Met?  | Evidence                              |
|---------------------------------------------------|-------|---------------------------------------|
| [e.g., "Primary metric degrades >5pp for 5+ days"]| [Y/N]| [e.g., "Trending at -2.1pp for 7 days"]|
| [e.g., "Any guardrail breach for 3+ days"]       | [Y/N] | [e.g., "Support tickets +45% for 5 days"]|
| [e.g., "Critical bug in treatment"]              | [Y/N] | [e.g., "No bugs detected"]           |

_Example:_

| Kill Criterion                                  | Met? | Evidence                                |
|-------------------------------------------------|------|-----------------------------------------|
| Primary metric degrades >5pp for 5+ consecutive days | No | -2.1pp avg, not sustained at >5pp    |
| Guardrail metric breaches threshold for 3+ days | Yes  | Support tickets +45% for 5 consecutive days |
| Critical UX bug detected                        | No   | No bugs                                |
| Customer complaints exceed threshold             | Yes  | 12 direct complaints about urgency messaging |

---

## 5. What We Learned [REQUIRED]

**Key Learnings:**

1. [Learning 1, e.g., "Artificial urgency backfires with our audience"]
2. [Learning 2, e.g., "Support ticket volume is a sensitive leading indicator of UX problems"]
3. [Learning 3, e.g., "Our users actively resist perceived manipulation tactics"]

**Hypothesis Evaluation:**
[Was the original hypothesis wrong, partially right, or was it the execution?]

_Example:_
**Key Learnings:**

1. **Artificial urgency backfires with our B2B audience.** Unlike B2C e-commerce, our users perceive countdown timers and scarcity messaging as dishonest. This aligns with our audience profile (technical decision-makers who value transparency).

2. **Support ticket volume is a fast-reacting guardrail.** Tickets spiked within 48 hours of launch, making it our earliest warning signal. Worth adding to all future experiment monitoring.

3. **Negative signals compound.** The combination of metric degradation and customer complaints creates reputational risk that exceeds the potential metric upside.

**Hypothesis Evaluation:**
The hypothesis ("urgency cues will increase checkout completion") was wrong for this audience. The underlying assumption that our users respond to scarcity like B2C shoppers does not hold. Future conversion experiments should focus on value clarity, not urgency.

---

## 6. Actions Taken

| Action                                  | Owner      | Date       | Status |
|-----------------------------------------|------------|------------|--------|
| [e.g., "Reverted treatment to control"]| [Name]     | [Date]     | [Done] |
| [e.g., "Responded to customer complaints"]| [Name]  | [Date]     | [Done] |
| [e.g., "Removed from experiment backlog"]| [Name]   | [Date]     | [Done] |

_Example:_

| Action                                    | Owner        | Date       | Status |
|-------------------------------------------|--------------|------------|--------|
| Reverted treatment to control (100% off) | Dev Patel    | 2026-02-10 | Done   |
| Responded to 12 customer complaints       | CS team      | 2026-02-11 | Done   |
| Updated experiment backlog                 | Marcus Chen  | 2026-02-12 | Done   |
| Verified support tickets returned to normal| Sarah Kim   | 2026-02-13 | Done   |
| Documented in experiment knowledge base    | Sarah Kim   | 2026-02-14 | Done   |

---

## 7. Recommendations

**Should this experiment be retried?** [Yes with modifications / No / Maybe - needs research]

**If yes, what should change:**
- [e.g., "Test value-based messaging instead of urgency"]
- [e.g., "Softer language (e.g., 'popular plan' vs 'only 2 left')"]

**If no, why not:**
- [e.g., "Our audience fundamentally rejects urgency tactics"]

**Alternative experiments to pursue:**
- [e.g., "Test checkout page that emphasizes ROI calculator"]
- [e.g., "Test social proof (customer count) instead of scarcity"]

_Example:_
**Should this experiment be retried?** No - not with urgency/scarcity framing.

**Alternative experiments to pursue:**
1. Test checkout page with ROI calculator showing projected value (value > urgency)
2. Test social proof badge ("Join 2,400+ teams") instead of scarcity messaging
3. Test simplified checkout flow (fewer form fields) to reduce friction

---

## 8. Verification

Confirm the kill was clean and no residual effects remain.

- [ ] Treatment fully reverted (0% traffic)
- [ ] Feature flag disabled or removed
- [ ] Support ticket volume returned to baseline
- [ ] Primary metric recovered to pre-experiment levels
- [ ] No lingering customer complaints
- [ ] Experiment status updated in tracking system
- [ ] Knowledge base / wiki updated with learnings

---

## Sign-Off

| Role            | Name | Date | Acknowledged |
|-----------------|------|------|-------------|
| Experiment Owner|      |      |             |
| Data Analyst    |      |      |             |
| Product Owner   |      |      |             |
