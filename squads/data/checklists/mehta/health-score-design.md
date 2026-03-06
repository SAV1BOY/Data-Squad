# Health Score Design

## Purpose

Audit the customer health score for input quality, weighting logic, predictive validity, and operational usefulness. Mehta emphasizes that health scores must predict outcomes, not just describe current state. A health score that does not predict churn or expansion is decoration, not a tool.

---

## Checklist Items

### 1. Health Score Inputs Are Defined and Documented
- **Pass:** Every input to the health score is documented: what it measures, where the data comes from, how it is normalized, and why it is included. Inputs span product usage, support interactions, relationship signals, and financial indicators.
- **Fail:** The health score is a black box. Team members cannot explain what goes into it.

### 2. Inputs Are Diverse, Not Monolithic
- **Pass:** The score incorporates at least 3 categories of inputs (e.g., product usage, support sentiment, engagement frequency, contract health). No single category dominates.
- **Fail:** The score is essentially one metric relabeled (e.g., "health score" that is really just login count).

### 3. Weights Are Justified, Not Arbitrary
- **Pass:** Input weights are set based on statistical analysis (correlation with renewal/churn) or structured expert judgment. The weighting rationale is documented.
- **Fail:** Weights are arbitrary round numbers (each input is 20%) with no analytical or experiential basis.

### 4. The Score Predicts Outcomes
- **Pass:** Backtesting shows that the health score predicts renewal, churn, or expansion outcomes with meaningful accuracy. A lift chart or ROC curve is available.
- **Fail:** The score has never been validated against actual outcomes. Nobody knows whether a "healthy" customer actually renews.

### 5. Score Thresholds Trigger Actions
- **Pass:** Clear thresholds are defined (e.g., red/yellow/green) with specific actions for each: red triggers an intervention playbook, yellow triggers a check-in, green triggers an expansion conversation.
- **Fail:** The score is displayed but no defined actions follow from different score levels.

### 6. Score Drift Is Monitored
- **Pass:** The distribution of health scores is monitored over time. If the average score drifts (all customers gradually turn green or red), the inputs and weights are recalibrated.
- **Fail:** The score was calibrated once and nobody checks whether the distribution has shifted.

### 7. False Positives and False Negatives Are Tracked
- **Pass:** The team tracks "surprise churns" (customers who scored healthy but churned) and "false alarms" (customers who scored unhealthy but renewed). These cases inform model improvement.
- **Fail:** Prediction errors are not tracked, so the score never improves.

### 8. CSMs Trust and Use the Score
- **Pass:** CSMs reference the health score in their workflow and find it useful. Adoption is above 70%. CSM feedback on score accuracy is collected and acted upon.
- **Fail:** CSMs ignore the score because they do not trust it, or they have never been trained on how to use it.

### 9. The Score Is Recalibrated Regularly
- **Pass:** The health score model (inputs, weights, thresholds) is re-evaluated at least semi-annually using recent outcome data.
- **Fail:** The model has not been updated since it was first built, despite changes in the product, customer base, and market.

### 10. The Score Is Not Gameable by CSMs
- **Pass:** Inputs are primarily objective (product usage data, support ticket patterns) rather than subjective (CSM-entered sentiment), reducing the ability to inflate scores.
- **Fail:** CSMs can mark their accounts as "healthy" based on subjective judgment with no objective validation, creating a biased picture.

---

## Cross-References

- [NRR/GRR Definition and Reconciliation](nrr-grr-definition-and-recon.md) -- health scores should predict NRR/GRR
- [CS Early Warning System](cs-early-warning-system.md) -- health score is a key input to early warnings
- [QBR Quality](qbr-quality.md) -- health scores should inform QBR discussions
- [Mehta Customer Outcome Audit](mehta-customer-outcome-audit.md) -- health should reflect customer outcomes, not just activity
