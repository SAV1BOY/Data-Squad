# Discount Rate and Horizon Check

## Purpose

Audit the two most consequential and frequently mis-specified parameters in CLV modeling: the discount rate and the prediction horizon. Small changes in these parameters dramatically alter CLV estimates and the business decisions built on them. This checklist ensures these choices are deliberate, documented, and stress-tested.

---

## Checklist Items

### 1. A Discount Rate Is Applied
- **Pass:** Future cash flows are discounted to present value. The discount rate is explicitly stated in the model documentation.
- **Fail:** No discounting is applied, implying that revenue received in year 5 is worth the same as revenue received today.

### 2. Discount Rate Has a Stated Basis
- **Pass:** The chosen rate is justified by reference to the company's weighted average cost of capital (WACC), opportunity cost of investment, or an industry benchmark. The reasoning is documented.
- **Fail:** The rate is an arbitrary number ("we used 10% because it seemed reasonable") with no financial basis.

### 3. Discount Rate Sensitivity Analysis Is Performed
- **Pass:** CLV has been computed at the chosen rate and at least two alternative rates (e.g., +/- 3 percentage points). The impact on segment rankings and total customer equity is documented.
- **Fail:** Only one rate has been tried, and nobody knows how sensitive the results are to this assumption.

### 4. Prediction Horizon Is Explicitly Chosen
- **Pass:** The horizon (e.g., 3 years, 5 years) is documented and justified based on business planning cycles, data availability, and the reliability of long-range forecasts.
- **Fail:** The horizon is implied by the model's default settings or chosen without discussion.

### 5. Horizon Matches Data History
- **Pass:** The prediction horizon does not exceed 2x the available data history. Forecasting 5 years from 18 months of data is flagged as risky.
- **Fail:** Long horizons are projected from short histories, creating false confidence in distant predictions.

### 6. Horizon Sensitivity Analysis Is Performed
- **Pass:** CLV has been computed at the chosen horizon and at least one shorter and one longer horizon. The impact on total value and segment ordering is shown.
- **Fail:** Only one horizon has been tested, and nobody knows how different the picture looks at a shorter or longer window.

### 7. Infinite-Horizon Models Include Terminal Value Logic
- **Pass:** If the model uses an infinite horizon (common in some probabilistic models), the terminal value assumptions are explicit and the contribution of far-future cash flows is quantified.
- **Fail:** The infinite-horizon model runs without discussion of how much value comes from years 10+ (which may be unrealistic).

### 8. Parameter Choices Are Communicated to Stakeholders
- **Pass:** Reports and presentations that include CLV numbers state the discount rate and horizon used, so stakeholders understand what they are looking at.
- **Fail:** CLV numbers are presented as facts without any indication of the underlying assumptions.

### 9. Changes to Parameters Are Version-Controlled
- **Pass:** If the discount rate or horizon changes, the new values are documented, the reason for the change is recorded, and previous-period CLV is restated for comparability.
- **Fail:** Parameters change silently between analyses, making period-over-period comparison meaningless.

### 10. Combined Sensitivity Table Exists
- **Pass:** A two-way sensitivity table (discount rate x horizon) shows how CLV changes across a range of both parameters. This table is available to decision-makers.
- **Fail:** Sensitivity is tested on one parameter at a time but never in combination.

---

## Cross-References

- [CLV Modeling Audit](clv-modeling-audit.md) -- discount rate and horizon are core CLV parameters
- [Value Segmentation Audit](value-segmentation-audit.md) -- parameter changes can reshuffle segment membership
- [Fader Whale Curve Audit](fader-whale-curve-audit.md) -- whale curve shape is sensitive to these parameters
- [Customer Centricity Score](customer-centricity-score.md) -- wrong parameters undermine customer-centric decisions
