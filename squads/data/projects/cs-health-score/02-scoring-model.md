# CS Health Score - Scoring Model

## Phase Objective

Combine the selected input signals into a composite health score using an appropriate weighting algorithm and threshold structure. The model must produce scores that are accurate in predicting the target outcome, interpretable by customer success managers, and stable enough for operational use.

## Prerequisites

- Final signal set from Phase 01 with validated predictive power and coverage
- Historical data with outcome labels for model training and validation
- Signal data assembled for the full scored customer base
- Statistical modeling environment (Python, R) with classification libraries
- Baseline prediction method to benchmark against (e.g., CSM gut assessment, simple rules)

## Steps

1. **Choose the Scoring Approach**: Select between three main approaches based on the use case requirements. A rules-based approach uses expert-defined weights and thresholds; it is highly interpretable but may miss complex patterns. A statistical model (logistic regression) learns weights from data while remaining interpretable. A machine learning model (gradient boosting, random forest) maximizes predictive accuracy but may sacrifice interpretability. For most CS health scores, logistic regression or a constrained machine learning model provides the best balance.

2. **Prepare the Training Dataset**: Assemble the dataset with one row per customer-period and columns for all selected signals plus the outcome label. Use time-based train/validation/test splits to avoid data leakage. Ensure that signal values are calculated using only data available at prediction time, not data from the outcome window. Handle class imbalance if churn is rare: consider stratified sampling, class weighting, or evaluation metrics that are robust to imbalance.

3. **Train Candidate Models**: Fit multiple model types to the training data. Start with logistic regression as the interpretable baseline. Then fit gradient boosted trees for maximum accuracy. If rules-based scoring is required for adoption reasons, construct a weighted point system using the logistic regression coefficients as a guide. For each model, optimize hyperparameters using the validation set and record performance metrics.

4. **Evaluate Model Performance**: Compare candidate models on the test set using metrics appropriate for a health scoring system. Area Under the ROC Curve (AUC) measures overall discrimination ability. Precision-Recall curves are more informative when churn is rare. Calibration plots show whether predicted probabilities match observed rates. Calculate lift: how much better is the model at identifying at-risk customers compared to random selection or the current CSM-driven approach?

5. **Transform Model Output to Health Score**: Convert the raw model output (probability, decision function score) into an intuitive health score format. Common formats include a 0-100 scale where higher is healthier, a letter grade (A through F), or a color-coded system (green, yellow, red). Whatever format is chosen, ensure the transformation preserves the model's discriminative power and produces a distribution that is useful for prioritization (not bunched at one end).

6. **Define Health Score Thresholds**: Set the boundaries between health categories (healthy, at-risk, critical). Use the model's precision and recall at each threshold to inform the boundaries. A lower threshold for "critical" produces fewer false alarms but misses more truly at-risk customers. A higher threshold catches more risk but increases CSM workload from false positives. Optimize thresholds based on the operational capacity of the CS team and the cost of false positives versus false negatives.

7. **Generate Score Explanations**: For every health score, generate an explanation of which signals are driving the score in which direction. For logistic regression, this is straightforward: display the contribution of each signal to the overall score. For tree-based models, use SHAP values to attribute the prediction to individual signals. Explanations are critical for CSM adoption. A score without an explanation is a black box that CSMs will not trust.

8. **Test Score Stability**: Run the scoring model on multiple recent time periods and examine how scores change over time for the same customers. Scores should be responsive to genuine changes in customer health but not so volatile that they whipsaw between categories from one update to the next. If scores are too volatile, consider smoothing techniques such as exponential moving averages or requiring sustained signal changes before the score shifts.

9. **Validate with Customer Success Managers**: Present the health scores and explanations for a sample of 50-100 accounts to experienced CSMs. Ask them to rate whether each score matches their assessment and whether the explanation makes sense. Track agreement rate and investigate disagreements. Some disagreements reveal model limitations; others reveal CSM blind spots that the model can help address. Target an agreement rate of at least 70%.

## Deliverables

- Scoring approach selection document with rationale for chosen method
- Trained model artifacts with performance metrics on the test set
- Health score transformation specification (raw output to interpretable scale)
- Threshold definitions for health categories with precision/recall trade-off analysis
- Score explanation framework showing per-signal contribution to each score
- Stability analysis showing score volatility over multiple time periods
- CSM validation summary with agreement rate and disagreement analysis
- Technical documentation for the scoring pipeline including refresh cadence

## Quality Gate

The scoring model is complete when all of the following conditions are met:

- Model AUC on the test set exceeds 0.70 (or an improvement of at least 15% over the baseline method)
- The health score distribution produces actionable categories (not bunched at one extreme)
- Thresholds are set with explicit precision/recall trade-offs documented
- Every score has an accompanying explanation identifying the top contributing signals
- Score stability analysis shows less than 15% of customers change health category between consecutive updates without a genuine change in behavior
- CSM validation achieves at least 70% agreement between model scores and CSM assessments
- The scoring pipeline can produce updated scores at the required refresh cadence
- Score format and explanation format have been approved by CS leadership for operational use

## Next Phase

Proceed to **03-calibration.md** (Calibration) to validate the health score against actual churn outcomes, adjust thresholds, and refine signal weights based on real-world performance.
