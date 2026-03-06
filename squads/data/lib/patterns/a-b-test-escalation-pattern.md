# A/B Test Escalation Pattern

When and how to escalate A/B test results beyond the immediate experiment team. Covers surprising results, guardrail violations, stakeholder conflicts, and decision deadlocks.

---

## Escalation Triggers

### Trigger 1: Guardrail Violation

A guardrail metric has breached its threshold.

| Severity              | Criteria                                    | Action                                      |
|-----------------------|---------------------------------------------|---------------------------------------------|
| Auto-pause            | Any guardrail metric degrades beyond the pre-defined limit | System automatically pauses the experiment. Notify experiment owner and on-call. |
| Manual review         | Guardrail metric is trending toward the limit but has not breached | Experiment owner reviews daily. Alert stakeholders. |
| Post-hoc discovery    | Guardrail violation discovered after experiment concluded | Re-evaluate the ship decision. Notify all stakeholders. |

**Escalation path:**
1. Experiment owner pauses the experiment (or confirms auto-pause).
2. Owner investigates: Is it a real effect or a data issue?
3. If real: Notify the product lead and relevant VP within 24 hours.
4. Decision: Fix the treatment and re-run, or kill the experiment.

### Trigger 2: Surprising Positive Result

The treatment effect is unexpectedly large (e.g., 3x the MDE or larger than any prior experiment).

**Why escalate:** Very large effects are more likely to be measurement errors, novelty effects, or segment-specific artifacts than genuine improvements at that magnitude.

**Escalation steps:**
1. Verify instrumentation: Are both control and treatment logging correctly?
2. Check for sample ratio mismatch (SRM): Is the traffic split as expected?
3. Examine segment-level results: Is the effect driven by a single segment?
4. Check for novelty: Is the effect decaying over time within the experiment window?
5. If all checks pass, flag the result as "high confidence, high impact" and route to the product lead and data science lead for independent review before shipping.

### Trigger 3: Surprising Negative Result

The treatment significantly harms the primary metric.

**Escalation steps:**
1. Confirm the result is statistically significant and not a false positive.
2. Investigate mechanism: Which step in the funnel degraded? Which segments are most affected?
3. Determine if the negative result reveals a broader insight about user behavior.
4. Share findings with the product team and adjacent teams who might be affected.
5. Document learnings thoroughly (see post-mortem pattern for experiments).

### Trigger 4: Inconclusive Result with High Stakes

The experiment ran for the planned duration but the result is not statistically significant, and the decision is consequential.

**Options to present to stakeholders:**

| Option                        | When Appropriate                              |
|-------------------------------|-----------------------------------------------|
| Extend the experiment         | If more data could plausibly reach significance (power analysis shows it is close) |
| Accept directional result     | If the effect is directionally positive and the cost of being wrong is low |
| Re-run with larger MDE        | If the original MDE was too ambitious; accept a smaller detectable effect |
| Kill the experiment           | If the opportunity cost of continuing is high (resources, user exposure) |
| Redesign the treatment        | If the treatment was weak; iterate on the intervention |

**Escalation path:** Present options with data to the product lead. If no consensus, escalate to the VP with a recommendation.

### Trigger 5: Stakeholder Conflict

Two or more stakeholders disagree on the interpretation or the ship decision.

**Common conflicts:**

| Conflict                              | Resolution Approach                          |
|---------------------------------------|----------------------------------------------|
| PM wants to ship; DS says result is not significant | Defer to pre-registered success criteria. If criteria were not met, default to "do not ship." |
| Two metrics conflict (primary up, secondary down) | Prioritize the primary metric per the experiment plan. Escalate if the secondary degradation is severe. |
| Short-term gain vs. long-term risk    | Run a longer holdout to measure long-term effects. Present trade-offs to leadership. |
| "My intuition says otherwise"         | Acknowledge the intuition, but default to the data unless there is a specific, articulable flaw in the experiment. |

**Escalation path:**
1. Experiment owner presents the data and both interpretations to all stakeholders.
2. Reference the pre-registered success criteria as the default decision framework.
3. If no resolution: Escalate to the decision-maker one level above the disagreeing parties.
4. Document the decision and rationale regardless of outcome.

---

## Escalation Matrix

| Trigger                    | First Contact          | Second Contact        | Final Escalation     | Timeline           |
|----------------------------|------------------------|-----------------------|----------------------|--------------------|
| Guardrail violation        | Experiment owner       | Product lead          | VP of Product        | Within 24 hours    |
| Surprising positive (>3x MDE) | Data science lead  | Experiment owner + PM | VP of Product        | Before ship decision|
| Surprising negative        | Experiment owner       | Product lead          | VP (if broad impact) | Within 48 hours    |
| Inconclusive + high stakes | Experiment owner       | Product lead + DS lead| VP of Product        | Within 1 week      |
| Stakeholder conflict       | All disagreeing parties| One level up manager  | VP of Product        | Within 1 week      |

---

## Documentation Requirements

Every escalation must be documented with:

1. **What triggered the escalation.**
2. **Data presented** (charts, tables, statistical results).
3. **Options considered** with pros and cons.
4. **Decision made** and by whom.
5. **Rationale** for the decision.
6. **Follow-up actions** with owners and deadlines.

This documentation is appended to the experiment one-pager and stored in the experiment archive.
