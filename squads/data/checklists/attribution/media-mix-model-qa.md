# Media Mix Model QA Checklist

## Purpose

Validate that Media Mix Models (MMM) are built on sound inputs, reasonable assumptions, and produce outputs that are checked against reality. MMMs are powerful for budget allocation across channels but are sensitive to data quality and modeling choices. This gate ensures rigor.

---

## Checklist Items

### 1. Input Data Quality Is Verified

- **Pass:** Spend data for every channel is complete, accurate to the day/week level, and reconciled against finance records. Impression, click, and conversion data are sourced from verified exports. At least 2 years of historical data are included.
- **Fail:** Spend data has gaps, is monthly-only when the model is weekly, or is pulled from unreconciled platform dashboards.

### 2. External Variables Are Included

- **Pass:** The model includes relevant external factors: seasonality indicators, macroeconomic variables (if relevant), competitor spend proxies, promotions/pricing changes, and any major events (COVID, product launches). Each variable's inclusion is justified.
- **Fail:** The model only includes media spend, attributing all outcome variation to advertising and ignoring baseline demand drivers.

### 3. Adstock and Saturation Assumptions Are Explicit

- **Pass:** The adstock (carryover) decay rate and saturation curve shape for each channel are documented. Values are either estimated from data or informed by industry benchmarks, and sensitivity analysis shows how results change under alternative assumptions.
- **Fail:** Default decay rates are used for all channels, or saturation curves are not modeled, implying constant returns to spend.

### 4. Model Fit Metrics Are Acceptable

- **Pass:** The model explains at least 80% of outcome variance (R-squared or equivalent). Residuals show no systematic patterns. Out-of-sample validation (e.g., last 8 weeks held out) shows MAPE below 10%.
- **Fail:** The model has poor fit, overfits the training period, or no out-of-sample validation is performed.

### 5. Channel Contribution Estimates Are Face-Valid

- **Pass:** The model's estimated contribution of each channel is reviewed by marketing and finance stakeholders for plausibility. If the model says TV contributes 50% of conversions when TV spend is 5% of budget, the result is investigated.
- **Fail:** Model outputs are accepted without stakeholder review or plausibility checks.

### 6. Decomposition Sums to Actual Outcome

- **Pass:** The sum of base demand plus all channel contributions plus external variable effects equals the actual observed outcome (within model error). No unexplained gap exceeding 5% exists.
- **Fail:** A large residual category ("other") absorbs 20%+ of outcomes, masking model limitations.

### 7. Budget Optimization Recommendations Are Stress-Tested

- **Pass:** The model's recommended budget reallocation is tested under multiple scenarios (optimistic, baseline, pessimistic saturation curves). Recommendations that shift more than 30% of budget to a single channel are flagged for additional scrutiny.
- **Fail:** The optimizer recommends putting 80% of budget into one channel, and the team follows the recommendation without questioning it.

### 8. Model Is Calibrated Against Incrementality Results

- **Pass:** Where incrementality test results exist (geo-holdouts, lift tests), the MMM's channel contribution estimates are compared against causal lift measurements. Discrepancies are investigated and the model is recalibrated.
- **Fail:** The MMM and incrementality tests show contradictory results for the same channel, and no reconciliation is attempted.

---

## Cross-References

- [Incrementality Test QA](incrementality-test-qa.md) -- Incrementality tests provide causal ground truth for MMM calibration.
- [Multi-Touch Attribution Sanity](multi-touch-attribution-sanity.md) -- MTA and MMM should be triangulated, not used as competing truths.
- [UTM Standard](utm-standard.md) -- Clean channel-level data from UTMs feeds into MMM input preparation.
