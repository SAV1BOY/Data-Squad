# CS Health Score - Calibration

## Phase Objective

Validate the health score against actual customer outcomes in production, adjust thresholds and signal weights based on observed performance, and ensure the score accurately distinguishes healthy customers from those at genuine risk. Calibration bridges the gap between model performance on historical data and real-world operational effectiveness.

## Prerequisites

- Health score deployed in a pilot or shadow mode from Phase 02
- At least 60-90 days of score history accumulated alongside actual customer outcomes
- Access to churn, contraction, and expansion events for scored customers
- CSM feedback collected during the pilot period
- Statistical tools for recalibration analysis

## Steps

1. **Assess Prediction Calibration**: Compare the health score's predicted risk levels against observed churn rates. Group customers by score decile and calculate the actual churn rate within each decile. Plot predicted risk against observed risk (calibration curve). A well-calibrated model produces a diagonal line: customers scored as 20% risk actually churn at 20%. If the calibration curve deviates, the model is either overconfident or underconfident at certain score ranges.

2. **Measure Discrimination Performance**: Calculate the production AUC by comparing scores assigned during the pilot period against subsequent churn outcomes. Compare production AUC against the historical test set AUC from the modeling phase. A significant drop (more than 0.05 AUC) indicates that the model generalizes poorly to new data or that business conditions have changed since training. Investigate the cause of any performance gap.

3. **Analyze False Positives**: Examine customers who received low health scores (predicted at risk) but did not churn. Categorize false positives: some are customers who were genuinely at risk but were saved by CSM intervention (these are actually model successes, not failures), some exhibited temporary dips in engagement that recovered naturally, and some had data quality issues that depressed their scores artificially. Understanding false positive types is essential for threshold optimization.

4. **Analyze False Negatives**: Examine customers who received healthy scores but subsequently churned. These missed risks are the most dangerous failure mode. Categorize false negatives by the reason for churn: some churned due to sudden external events (acquisition, budget cuts) that no model could predict, some showed signals that the model did not include (executive stakeholder departure, competitive threat), and some showed signals that the model underweighted. False negative analysis directly informs signal and weight adjustments.

5. **Recalibrate Thresholds**: Based on the calibration analysis, adjust the boundaries between health categories. If the "critical" category has too many false positives (CSMs are wasting time on accounts that are actually healthy), raise the threshold to increase specificity. If too many churning customers were scored as "healthy" (false negatives), lower the threshold to increase sensitivity. Re-optimize thresholds using the production data, not just the historical training data.

6. **Adjust Signal Weights**: If specific signals are contributing to systematic prediction errors, adjust their weights or transformations. A signal that was highly predictive in historical data but less useful in production may have changed in meaning (e.g., usage patterns shifted after a product redesign). Add new signals that the false negative analysis reveals as important but currently absent. Remove signals that contribute to false positives without improving true positive detection.

7. **Incorporate CSM Override Feedback**: During the pilot period, CSMs may have overridden the health score for accounts where they had additional context. Analyze these overrides: when CSMs override a healthy score to flag risk, are they subsequently proven right? When they override a critical score to mark an account as healthy, does the account churn anyway? Override patterns reveal where the model has blind spots and where CSMs add unique value.

8. **Re-validate with Updated Model**: After adjustments, re-run the calibration analysis on a fresh holdout period. Confirm that changes improved calibration, reduced false positive and false negative rates, and maintained or improved discrimination. If changes worsen performance on the holdout data, roll back and investigate further. Continue iterating until the calibrated model outperforms the original on production data.

9. **Document Calibration Results and Schedule**: Record all calibration adjustments, their rationale, and their measured impact. Establish a recurring calibration schedule: monthly for the first 6 months, then quarterly once the model stabilizes. Define trigger conditions for off-cycle recalibration, such as a significant product change, a pricing restructure, or a sudden shift in churn patterns.

## Deliverables

- Calibration curve comparing predicted risk against observed churn rates by score decile
- Production AUC comparison against historical test performance
- False positive analysis with categorization and count by type
- False negative analysis with categorization, root causes, and missing signal identification
- Recalibrated threshold definitions with updated precision/recall characteristics
- Adjusted signal weight documentation with rationale for each change
- CSM override analysis showing when human judgment adds value beyond the model
- Updated model with post-calibration performance metrics on holdout data
- Calibration schedule with recurring cadence and off-cycle trigger conditions

## Quality Gate

Calibration is complete when all of the following conditions are met:

- Calibration curve shows predicted risk within 10 percentage points of observed churn at each decile
- Production AUC is within 0.05 of the historical test set AUC or exceeds it
- False positive rate in the critical category is below 40% (at least 60% of flagged accounts have genuine risk)
- False negative analysis has been completed and actionable findings incorporated into signal adjustments
- Recalibrated thresholds have been validated on a fresh holdout period
- CSM override analysis is documented with recommendations for incorporating human context
- The calibration schedule is established and added to the team calendar
- CS leadership has reviewed calibration results and approved the score for full deployment

## Next Phase

Proceed to **04-alerting.md** (Alerting) to configure threshold-based alerts that notify the right people when customer health changes require attention.
