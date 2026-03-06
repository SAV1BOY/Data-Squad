# Multi-Touch Attribution Sanity Checklist

## Purpose

Apply sanity checks to multi-touch attribution (MTA) models before their outputs influence budget allocation. MTA models are useful but inherently limited -- this gate ensures the team understands the assumptions, validates the outputs, and does not over-trust the model.

---

## Checklist Items

### 1. Touchpoint Coverage Is Sufficient

- **Pass:** The model ingests touchpoints from all major channels: paid search, paid social, organic, email, direct, referral, and offline (if applicable). No channel contributing more than 5% of conversions is excluded.
- **Fail:** Key channels are missing (e.g., organic search is excluded), biasing credit toward channels that are tracked.

### 2. Identity Resolution Is Reasonable

- **Pass:** The model's cross-device and cross-session identity stitching is documented. The team knows the match rate and the method (deterministic, probabilistic, or hybrid). Unmatched touchpoints are quantified.
- **Fail:** The model assumes perfect identity resolution, or the match rate is unknown.

### 3. Model Assumptions Are Documented

- **Pass:** The attribution model type (linear, time-decay, position-based, data-driven/Shapley) is explicitly stated. The team can articulate what the model assumes about touchpoint interaction effects and where those assumptions break.
- **Fail:** The model is a black box selected by default in a platform, and no one can explain its logic.

### 4. Output Sums to Total Conversions

- **Pass:** The total attributed conversions across all channels equals (or is within 2% of) the actual total conversions. If modeled conversions exceed actuals, double-counting exists.
- **Fail:** Attributed conversions exceed actual conversions by more than 5%, indicating credit is inflated.

### 5. Results Are Compared Against Last-Click and First-Click

- **Pass:** MTA results are presented alongside last-click and first-click attribution for the same period. The team examines where MTA shifts credit and whether the shifts are directionally plausible given channel roles.
- **Fail:** MTA results are presented in isolation with no benchmark, making it impossible to assess reasonableness.

### 6. Channel ROI Estimates Pass a Smell Test

- **Pass:** The implied ROI for each channel is reviewed for face validity. If the model claims a channel with broad, upper-funnel reach has 10x ROI while a bottom-funnel channel has 0.5x, the team investigates rather than accepts.
- **Fail:** Model outputs are taken at face value and used directly for budget reallocation without scrutiny.

### 7. Holdout or Incrementality Validation Exists

- **Pass:** At least once per year, the MTA model's top recommendation (e.g., "increase spend on channel X") is validated with a geo-holdout or randomized incrementality test. Model predictions and actual lift are compared.
- **Fail:** The MTA model has never been validated against a causal experiment.

### 8. Model Is Refreshed and Recalibrated Periodically

- **Pass:** The model is retrained or recalibrated at least quarterly to account for changing user behavior, new channels, and seasonality. Stale models are flagged.
- **Fail:** The model was built once and has not been updated in over 6 months.

---

## Cross-References

- [UTM Standard](utm-standard.md) -- Attribution models are only as good as the input data; clean UTMs are essential.
- [Incrementality Test QA](incrementality-test-qa.md) -- Incrementality tests provide causal validation for MTA outputs.
- [Media Mix Model QA](media-mix-model-qa.md) -- MMM and MTA should be used as complementary views, not competing truths.
