# Decision Rubric Checklist

## Purpose

Provide a structured framework for translating experiment results into one of three actions: ship, iterate, or kill. This gate prevents decisions driven by cherry-picking, HiPPO (Highest Paid Person's Opinion), or sunk-cost fallacy.

---

## Checklist Items

### 1. Decision Criteria Are Pre-Registered

- **Pass:** Before the experiment launches, the team documents: which metric(s) must move, in which direction, by what minimum magnitude, and with what statistical confidence for each decision outcome (ship/iterate/kill).
- **Fail:** Decision criteria are defined after seeing results, or the criteria shift during the experiment.

### 2. Primary Metric Result Is Unambiguous

- **Pass:** The primary metric shows a statistically significant result (p < alpha) with a confidence interval that excludes the null and the practical significance threshold. Or, the result is clearly non-significant with a confidence interval narrow enough to rule out meaningful effects.
- **Fail:** The result is borderline (p near alpha), the confidence interval spans both meaningful and trivial effects, and no pre-registered rule addresses this case.

### 3. Guardrail Metrics Are All Clear

- **Pass:** No guardrail metric has degraded beyond its pre-defined threshold. If any guardrail triggered, the experiment is not shipped regardless of primary metric performance.
- **Fail:** Guardrail violations are dismissed or rationalized without investigation.

### 4. Secondary Metrics Tell a Coherent Story

- **Pass:** Secondary metrics are directionally consistent with the primary metric result and the feature's theory of change. Contradictions are investigated and explained.
- **Fail:** Secondary metrics contradict the primary metric but are ignored in the decision narrative.

### 5. Segment Analysis Does Not Override the Aggregate

- **Pass:** Segment-level analysis (by platform, geography, user tenure) is performed for learning, but the ship/kill decision is based on the overall result unless a strong prior existed for heterogeneous effects and the analysis was pre-registered.
- **Fail:** The overall result is non-significant, but the team cherry-picks a winning segment to justify shipping.

### 6. Iterate Path Has Specific Next Steps

- **Pass:** When the decision is "iterate," the write-up includes specific hypotheses for why the treatment underperformed, what changes to test next, and a timeline for the follow-up experiment.
- **Fail:** "Iterate" is used as a euphemism for indecision, with no concrete follow-up plan.

### 7. Kill Decision Is Respected

- **Pass:** When the decision is "kill," the feature is removed from the codebase within 2 weeks. The team documents learnings. No one reopens the same experiment without new evidence or a substantially different approach.
- **Fail:** Killed features linger as dead code, or the same experiment is re-run hoping for different results.

### 8. Decision Is Documented and Shared

- **Pass:** The experiment write-up includes: hypothesis, results (with confidence intervals), guardrail status, decision, rationale, and next steps. It is shared with stakeholders within 5 business days of the experiment ending.
- **Fail:** Results live in a notebook that nobody reads, or the decision is communicated verbally without documentation.

---

## Cross-References

- [Guardrails and Metrics](guardrails-and-metrics.md) -- Guardrail status is a mandatory input to the decision.
- [Sample Size and MDE](sample-size-and-mde.md) -- Underpowered experiments should default to "iterate," not "kill."
- [Randomization and Bias](randomization-and-bias.md) -- Detected bias should lower confidence and may change the decision.
