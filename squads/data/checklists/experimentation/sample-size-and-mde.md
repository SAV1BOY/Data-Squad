# Sample Size and MDE Checklist

## Purpose

Verify that experiments are properly powered before launch. An underpowered experiment wastes time and produces inconclusive results. An overpowered experiment wastes traffic that could serve other tests. This gate enforces disciplined power analysis.

---

## Checklist Items

### 1. Minimum Detectable Effect Is Business-Justified

- **Pass:** The MDE is set based on the smallest effect that would justify the cost of building and maintaining the feature. Product and data teams agree on this number before the power calculation.
- **Fail:** MDE is arbitrary (e.g., "let's detect a 1% lift" without considering whether 1% matters), or not defined at all.

### 2. Baseline Metric Values Are Current

- **Pass:** The baseline conversion rate (or mean/variance for continuous metrics) used in the power calculation comes from the last 30 days of production data, filtered for the same population that will be in the experiment.
- **Fail:** Baseline values are from a different time period, different population, or are guessed.

### 3. Statistical Parameters Are Explicit

- **Pass:** The power calculation specifies: significance level (alpha, typically 0.05), power (1 - beta, typically 0.80), test type (one-sided vs. two-sided), and the statistical test being used. These are documented in the experiment plan.
- **Fail:** Parameters are defaults that nobody reviewed, or the test type does not match the hypothesis.

### 4. Required Sample Size Is Feasible

- **Pass:** Given current traffic, the experiment can reach the required sample size within a reasonable window (typically 2-6 weeks). If it takes longer than 6 weeks, the team considers increasing MDE or using variance reduction techniques.
- **Fail:** The required runtime exceeds 8 weeks, but the experiment launches anyway "to see what happens."

### 5. Traffic Allocation Is Optimal

- **Pass:** Treatment/control split is chosen to minimize runtime while maintaining statistical validity. For high-risk changes, a smaller treatment allocation (e.g., 10/90) is used initially, with a plan to ramp up.
- **Fail:** Default 50/50 split is used without considering risk, or unequal splits are used without adjusting the power calculation.

### 6. Metric Variance Is Accounted For

- **Pass:** For high-variance metrics (e.g., revenue per user), the team applies variance reduction techniques (CUPED, stratification) or adjusts sample size accordingly. The power calculation uses the post-reduction variance estimate.
- **Fail:** High-variance metrics are used with naive sample size calculations, leading to underpowered tests.

### 7. Multiple Metrics and Corrections Are Planned

- **Pass:** If the experiment tracks more than one primary metric, the analysis plan specifies how multiple comparisons will be handled (Bonferroni, Holm, FDR control). The power calculation accounts for the correction.
- **Fail:** Multiple primary metrics are analyzed without any correction, inflating false positive risk.

### 8. Sample Size Is Locked Before Launch

- **Pass:** The required sample size is documented and committed before the experiment starts. The team will not extend or shorten the experiment based on interim results (unless using sequential testing with pre-defined boundaries).
- **Fail:** Sample size is decided "when the results look significant" -- classic p-hacking.

---

## Cross-References

- [Sequential Testing QA](sequential-testing-qa.md) -- If interim analysis is needed, use sequential testing frameworks instead of adjusting sample size ad-hoc.
- [Guardrails and Metrics](guardrails-and-metrics.md) -- Guardrails also need sufficient power to detect degradation.
- [Decision Rubric](decision-rubric.md) -- Inconclusive results from underpowered tests should map to "iterate," not "ship."
