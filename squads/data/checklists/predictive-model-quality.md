# Predictive Model Quality Checklist

> Gate type: Review
> Owner: Fader (Predictive Analytics / Customer Lifetime Value Lead)
> Applies to: Any predictive model, scoring algorithm, or ML-based decision system before deployment or refresh

## Purpose

A predictive model that is not validated, monitored, and connected to a business decision is a liability disguised as sophistication. Overfitted models give false confidence, drifting models degrade silently, and models without clear utility waste engineering resources. This gate ensures every model is useful, trustworthy, and maintainable before it reaches production.

## Checklist Items

1. - [ ] **Business problem clearly stated** -- The model exists to solve a specific, well-defined business problem with a measurable outcome.
   - Pass criteria: A one-sentence problem statement exists (e.g., "Predict which accounts will churn in the next 90 days to prioritize CSM outreach").
   - Fail signal: The model was built because "we had the data" or "ML seemed like a good idea" with no defined use case.
   - Action if fail: Define the business problem and the decision the model will inform before proceeding with validation.

2. - [ ] **Input features documented and justified** -- Every feature in the model is listed with its source, transformation, and rationale for inclusion.
   - Pass criteria: A feature table exists with column name, source system, transformation logic, and why it was included.
   - Fail signal: Features are a black box; no one can explain what inputs the model uses.
   - Action if fail: Document the feature set. Remove any feature that cannot be justified or sourced reliably.

3. - [ ] **No data leakage in features** -- No feature contains information that would not be available at prediction time in production.
   - Pass criteria: Each feature's availability at prediction time is confirmed; no future-looking variables or target-derived features.
   - Fail signal: A feature like "days_until_churn" or "final_invoice_amount" is used to predict churn.
   - Action if fail: Remove leaking features, retrain, and re-evaluate. This is a critical defect.

4. - [ ] **Train/test split is temporally valid** -- The test set uses data from a period after the training set, simulating real-world deployment.
   - Pass criteria: Training data ends before the test data begins; no random shuffling across time periods.
   - Fail signal: Random 80/20 split on time-series data, allowing the model to "see the future."
   - Action if fail: Implement a temporal split (e.g., train on months 1-9, test on months 10-12) and retrain.

5. - [ ] **Evaluation metrics match business goals** -- The primary evaluation metric aligns with the business problem (e.g., precision if false positives are costly, recall if misses are costly).
   - Pass criteria: Metric choice is justified in writing (e.g., "We optimize for recall because missing a churn risk is costlier than a false alarm").
   - Fail signal: Only accuracy is reported on an imbalanced dataset, or the metric is chosen by default (e.g., AUC without justification).
   - Action if fail: Select the metric that matches the business cost structure and re-evaluate the model.

6. - [ ] **Baseline model compared** -- The model's performance is benchmarked against a simple baseline (e.g., random, majority class, last-value, or rule-based heuristic).
   - Pass criteria: Baseline performance stated alongside model performance; the model meaningfully outperforms the baseline.
   - Fail signal: Model AUC of 0.72 presented as good with no comparison to a baseline that might achieve 0.70.
   - Action if fail: Compute the baseline. If the model does not meaningfully beat it, reconsider whether ML is needed.

7. - [ ] **Overfitting checked** -- Training performance and test performance are compared; the gap is within acceptable bounds.
   - Pass criteria: Train/test metric difference is < 5 percentage points (or reasonable for the domain); cross-validation results are stable.
   - Fail signal: Training AUC is 0.99 but test AUC is 0.65.
   - Action if fail: Regularize the model, reduce feature count, or increase training data. Re-evaluate.

8. - [ ] **Feature importance interpretable** -- The top contributing features are identified and make business sense.
   - Pass criteria: Top 10 features listed with their importance scores (SHAP, permutation importance, or coefficients); they align with domain knowledge.
   - Fail signal: The most important feature is an ID column or an artifact of data processing.
   - Action if fail: Investigate suspicious features. Remove artifacts and retrain.

9. - [ ] **Calibration assessed** -- For probabilistic models, predicted probabilities reflect true outcome rates.
   - Pass criteria: A calibration plot or Brier score shows predicted probabilities are well-calibrated.
   - Fail signal: The model predicts 80% churn probability for a group that actually churns at 30%.
   - Action if fail: Apply calibration (Platt scaling, isotonic regression) and re-assess.

10. - [ ] **Drift monitoring plan in place** -- A mechanism exists to detect when input distributions or model performance degrade over time.
    - Pass criteria: Monitoring dashboards or automated checks track feature distributions and prediction accuracy on a schedule (weekly or monthly).
    - Fail signal: Model deployed with no plan to check whether it still works in 3 months.
    - Action if fail: Set up drift monitoring (e.g., PSI for features, performance metric tracking on labeled data) before deployment.

11. - [ ] **Retraining cadence defined** -- A schedule for retraining the model is established based on expected data drift and business cycles.
    - Pass criteria: Retraining frequency documented (e.g., quarterly) with a trigger for ad-hoc retraining if drift is detected.
    - Fail signal: Model trained once and expected to work indefinitely.
    - Action if fail: Define a retraining cadence and add it to the data team's operational calendar.

12. - [ ] **Utility validated with stakeholders** -- The model's output has been reviewed with the end users (e.g., CSMs, product managers) to confirm it is actionable and trusted.
    - Pass criteria: At least one stakeholder has reviewed sample predictions and confirmed they are useful for their workflow.
    - Fail signal: Model built in isolation with no user feedback; stakeholders do not trust or use the predictions.
    - Action if fail: Conduct a stakeholder review session. Incorporate feedback before full deployment.

13. - [ ] **Privacy and fairness reviewed** -- The model does not use prohibited attributes and has been checked for bias across protected groups.
    - Pass criteria: No prohibited features (race, gender, etc.) used directly or via proxies; performance parity checked across key segments.
    - Fail signal: Model performance varies dramatically across demographic groups, or PII is used as a feature.
    - Action if fail: Remove prohibited features, check for proxy discrimination, and re-evaluate fairness metrics.

14. - [ ] **Rollback mechanism exists** -- A previous model version or rule-based fallback can be restored quickly if the new model underperforms.
    - Pass criteria: Previous model version is archived and can be swapped in within 1 hour; fallback logic documented.
    - Fail signal: Only the current model exists; a failure requires rebuilding from scratch.
    - Action if fail: Archive the current production model before deploying the new one. Document the rollback process.

## Cross-References

- See `churn-analysis-quality.md` for the churn definitions and leading indicators that often feed churn prediction models.
- See `data-quality-quality.md` for input data quality standards that models depend on.
- See `privacy-and-compliance-quality.md` for privacy requirements when models process personal data.
