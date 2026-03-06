# Incrementality Test QA Checklist

## Purpose

Validate that lift tests (geo-holdout, ghost ads, PSA tests, randomized budget experiments) are correctly designed and interpreted. Incrementality is the gold standard for measuring true causal impact of marketing spend, but poorly executed tests produce misleading results.

---

## Checklist Items

### 1. The Test Question Is Specific

- **Pass:** The test answers a precise question: "What is the incremental impact of spending $X/week on Channel Y in Region Z on metric M over period P?" All parameters are defined before launch.
- **Fail:** The question is vague: "Does Facebook work?" -- too broad to produce actionable results.

### 2. Test and Control Groups Are Comparable

- **Pass:** For geo-holdouts, matched markets are selected based on historical performance, size, and seasonality. Market similarity is validated with pre-test data (at least 8 weeks). For user-level tests, randomization is verified with balance checks.
- **Fail:** Test and control regions were chosen for convenience (e.g., "we'll hold out Montana") without matching.

### 3. Contamination and Spillover Are Minimized

- **Pass:** For geo tests, DMA/metro boundaries are used and adjacent markets are excluded from both test and control to create a buffer zone. For user tests, cross-device exposure is accounted for.
- **Fail:** Users in the control geo are exposed to the treatment channel through national buys, digital spillover, or cross-geo commuting.

### 4. Test Duration and Power Are Sufficient

- **Pass:** The test runs long enough to capture the full conversion cycle (including consideration periods). Power analysis confirms the test can detect the minimum economically meaningful lift.
- **Fail:** The test runs for one week on a product with a 30-day consideration cycle, or no power analysis was done.

### 5. Spend Changes Are Clean

- **Pass:** The treatment is a clean on/off or a significant budget change (e.g., 0% vs. 100%, or 50% reduction). Partial or noisy spend changes muddy the treatment signal.
- **Fail:** The treatment is a 10% spend increase, well within normal variation, making it impossible to isolate the effect.

### 6. External Confounds During the Test Are Logged

- **Pass:** Promotions, competitor campaigns, seasonality events, and product launches during the test period are documented. Their potential impact on test and control groups is assessed.
- **Fail:** A competitor ran a massive campaign in the control market during the test, biasing results upward.

### 7. Lift Calculation Methodology Is Sound

- **Pass:** Incremental lift is computed as (treatment outcome - counterfactual outcome) / counterfactual outcome. The counterfactual is derived from pre-test trends, not just the control group's raw performance. Confidence intervals are reported.
- **Fail:** Lift is computed as a simple percentage difference without adjusting for pre-test differences or providing confidence intervals.

### 8. Results Are Translated Into Actionable Recommendations

- **Pass:** The test output includes: incremental CPA, incremental ROAS, recommended budget range, and confidence level. Recommendations specify whether to scale, maintain, reduce, or cut the channel.
- **Fail:** The result is "the test showed 15% lift" with no translation into financial terms or budget guidance.

---

## Cross-References

- [Multi-Touch Attribution Sanity](multi-touch-attribution-sanity.md) -- Incrementality tests validate MTA model outputs.
- [Media Mix Model QA](media-mix-model-qa.md) -- Incrementality results can calibrate MMM saturation curves.
- [Guardrails and Metrics](../experimentation/guardrails-and-metrics.md) -- Marketing tests also need guardrails (e.g., brand health, organic traffic).
