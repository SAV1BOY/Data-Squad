# Sequential Testing QA Checklist

## Purpose

Validate that sequential (or continuous monitoring) testing methods are correctly implemented when the team needs to check results before the full sample is collected. This gate prevents inflated false positive rates from naive peeking while enabling legitimate early stopping.

---

## Checklist Items

### 1. Sequential Method Is Explicitly Chosen

- **Pass:** The experiment plan specifies the sequential testing framework being used (e.g., group sequential design with O'Brien-Fleming boundaries, always-valid confidence intervals, mSPRT). The choice is justified based on the use case.
- **Fail:** The team peeks at a fixed-horizon test "just to check" without adjusting for multiple looks.

### 2. Spending Function or Boundary Is Pre-Defined

- **Pass:** The alpha spending function (e.g., O'Brien-Fleming, Pocock) or confidence sequence parameters are locked before the experiment starts. The total number of planned interim looks is specified.
- **Fail:** Boundaries are not defined, or the team decides when to look based on convenience or curiosity.

### 3. Peek Schedule Is Fixed and Documented

- **Pass:** The calendar dates or sample-size milestones for each interim analysis are documented in the experiment plan. Analyses happen only at these pre-defined points.
- **Fail:** The team looks at results daily "just in case" without any formal peek schedule.

### 4. Early Stopping for Futility Is Considered

- **Pass:** The sequential design includes futility boundaries (beta-spending) so that clearly ineffective treatments can be stopped early, freeing traffic for other experiments.
- **Fail:** Only efficacy boundaries exist; a clearly losing treatment runs to full duration, wasting resources.

### 5. Adjusted Confidence Intervals Are Reported

- **Pass:** At each interim look and at the final analysis, confidence intervals are computed using the sequential method's adjustment (e.g., stage-wise ordering, always-valid intervals). Unadjusted p-values are never used for decisions.
- **Fail:** Standard (fixed-horizon) confidence intervals are reported at interim looks, understating the true uncertainty.

### 6. Information Fraction Is Tracked

- **Pass:** The proportion of total planned information (sample size or events) collected at each look is recorded. Decisions account for the remaining uncertainty at early stops.
- **Fail:** An early stop at 30% information is treated with the same confidence as a full-sample result.

### 7. Infrastructure Supports Correct Implementation

- **Pass:** The experimentation platform computes sequential boundaries automatically, or the data team has validated custom code against reference implementations with simulated data.
- **Fail:** Sequential testing is done in ad-hoc spreadsheets or notebooks without validation against known correct results.

### 8. Post-Decision Documentation Includes Stopping Rationale

- **Pass:** If the experiment stopped early (for efficacy, harm, or futility), the write-up states at which look it stopped, the boundary values, and the observed test statistic at that point.
- **Fail:** The experiment is reported as if it ran to completion, hiding the fact that it was stopped early.

---

## Cross-References

- [Sample Size and MDE](sample-size-and-mde.md) -- Sequential testing does not eliminate the need for power analysis; it modifies how alpha is spent.
- [Decision Rubric](decision-rubric.md) -- Early stopping decisions must still follow the pre-registered rubric.
- [Guardrails and Metrics](guardrails-and-metrics.md) -- Guardrail monitoring is inherently sequential and must use appropriate methods.
