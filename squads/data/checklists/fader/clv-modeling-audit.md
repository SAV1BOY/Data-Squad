# CLV Modeling Audit

## Purpose

Audit the Customer Lifetime Value model for methodological soundness, assumption transparency, and predictive validity. Following Peter Fader's work, CLV is not a single number but a probabilistic forecast that must be built on defensible assumptions and validated against reality.

---

## Checklist Items

### 1. CLV Model Type Is Explicitly Chosen and Justified
- **Pass:** The team has documented which CLV model is used (BG/NBD, Pareto/NBD, contractual, simple heuristic) and why it fits the business context (contractual vs. non-contractual, continuous vs. discrete).
- **Fail:** CLV is calculated as "average revenue x average lifespan" with no model selection rationale.

### 2. Key Assumptions Are Documented
- **Pass:** Assumptions about purchase frequency distribution, dropout process, monetary value distribution, and independence between frequency and monetary value are written down.
- **Fail:** The model is a black box with no stated assumptions, making it impossible to evaluate or challenge.

### 3. Historical Data Inputs Are Validated
- **Pass:** Input data (recency, frequency, monetary value, tenure) has been cleaned, outliers have been examined, and data coverage is sufficient (at least 2x the repeat purchase cycle).
- **Fail:** The model is trained on dirty data with duplicates, test transactions, or insufficient history.

### 4. Cohort-Level Validation Is Performed
- **Pass:** The model's predictions are compared against actual outcomes for held-out cohorts. Predicted vs. actual revenue is plotted and the fit is within 10-15%.
- **Fail:** No holdout validation has been performed. The model has never been tested against reality.

### 5. Individual-Level Predictions Are Sanity-Checked
- **Pass:** Predicted CLV for specific customers (highest, lowest, median) has been reviewed by someone with business context and passes a reasonableness check.
- **Fail:** Individual predictions are used without anyone reviewing whether they make business sense.

### 6. Discount Rate Is Explicitly Set
- **Pass:** The discount rate used to compute present value of future cash flows is documented, justified (cost of capital, opportunity cost), and sensitivity analysis has been run.
- **Fail:** No discount rate is applied (implying $1 in 5 years = $1 today), or the rate is arbitrary.

### 7. Prediction Horizon Is Appropriate
- **Pass:** The forecast horizon matches the business planning cycle (1-3 years for most businesses) and the team understands that longer horizons have wider confidence intervals.
- **Fail:** CLV is projected over 10+ years for a business with 18 months of data, creating false precision.

### 8. CLV Is Used for Decisions, Not Just Reporting
- **Pass:** CLV estimates feed into acquisition spend limits, segmentation strategies, retention investment, or customer-level resource allocation.
- **Fail:** CLV is computed and reported but does not influence any business decision.

### 9. Model Is Re-Estimated on a Regular Cadence
- **Pass:** The model is re-estimated at least quarterly with fresh data, and parameter drift is monitored.
- **Fail:** The model was estimated once and parameters are frozen indefinitely.

### 10. Confidence Intervals Are Communicated
- **Pass:** CLV estimates are presented with uncertainty ranges (e.g., "Expected CLV: $450, 80% CI: $280-$620"), not as single point estimates.
- **Fail:** CLV is presented as a precise number (e.g., "$437.22") with no indication of uncertainty.

---

## Cross-References

- [Value Segmentation Audit](value-segmentation-audit.md) -- CLV enables value-based segmentation
- [Discount Rate and Horizon Check](discount-rate-and-horizon-check.md) -- deep dive on horizon and discounting
- [Fader Whale Curve Audit](fader-whale-curve-audit.md) -- CLV distribution drives whale curve analysis
- [Fader Heterogeneity Audit](fader-heterogeneity-audit.md) -- CLV models must account for customer heterogeneity
