# Guardrails and Metrics Checklist

## Purpose

Ensure every experiment defines guardrail metrics that protect against unintended harm. Guardrails are non-negotiable safety boundaries -- if they degrade beyond threshold, the experiment must be stopped regardless of primary metric performance.

---

## Checklist Items

### 1. Guardrail Metrics Are Defined Before Launch

- **Pass:** At least three guardrail metrics are specified in the experiment design document: one technical (e.g., latency, crash rate), one business (e.g., cancellation rate, refund rate), and one UX-related (e.g., error page views, rage clicks).
- **Fail:** No guardrails are defined, or they are added retroactively after seeing results.

### 2. Thresholds Are Quantified With Acceptable Degradation Limits

- **Pass:** Each guardrail has a numeric threshold (e.g., "P95 latency must not increase by more than 50ms", "crash rate must stay below 0.5%"). Thresholds are based on historical baselines, not arbitrary round numbers.
- **Fail:** Thresholds are vague ("latency should not get worse") or missing entirely.

### 3. Monitoring Is Real-Time or Near-Real-Time

- **Pass:** Guardrail metrics are tracked on a dashboard updated at least hourly during the experiment. Automated alerts fire when any guardrail breaches its threshold.
- **Fail:** Guardrails are only checked at the end of the experiment, or no alerting exists.

### 4. Stopping Rules Are Pre-Committed

- **Pass:** The experiment plan states: "If guardrail X exceeds threshold Y for Z consecutive hours, the experiment will be paused within 1 hour." The on-call team has authority and tooling to pause.
- **Fail:** No stopping rules exist, or pausing requires executive approval that delays response.

### 5. Guardrails Cover Downstream Effects

- **Pass:** Metrics include effects outside the immediate feature scope (e.g., a checkout experiment also monitors customer support ticket volume and payment failure rate).
- **Fail:** Only the treated feature area is monitored; downstream impact is invisible.

### 6. Interaction With Other Running Experiments Is Assessed

- **Pass:** Before launch, the team verifies that guardrail metrics are not shared with or confounded by other concurrent experiments. If overlap exists, the analysis plan accounts for it.
- **Fail:** Multiple experiments affect the same guardrails simultaneously with no coordination.

### 7. Guardrail Results Are Included in the Decision Report

- **Pass:** The experiment write-up explicitly states guardrail metric performance alongside primary and secondary metrics. Guardrail status influences the ship/no-ship decision.
- **Fail:** The decision is based solely on the primary metric; guardrail data is omitted or ignored.

### 8. Post-Ship Monitoring Continues

- **Pass:** After full rollout, guardrail metrics are monitored for at least 2 weeks to catch delayed effects (e.g., slow churn increase). Thresholds remain active during this period.
- **Fail:** Monitoring stops the moment the experiment is shipped to 100%.

---

## Cross-References

- [Sample Size and MDE](sample-size-and-mde.md) -- Guardrails need sufficient sample size to detect degradation.
- [Decision Rubric](decision-rubric.md) -- Guardrail breaches override positive primary metric results.
- [Anomaly Investigation](../analytics/anomaly-investigation.md) -- Guardrail alerts follow the same investigation protocol.
