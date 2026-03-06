# Task: CS Health Score Design
> Agent(s): Customer Success Analyst, Data Scientist
> Frameworks: Health Score Framework, Predictive Scoring Methodology
> Checklists: health-score-checklist, model-validation-checklist
> Template: health-score-design-template
> Registry: metric-registry, segment-registry

## Objective
Design and implement a customer health score that aggregates multiple signals into a single
actionable indicator of account health, enabling the customer success team to prioritize
outreach and intervene before customers churn.

## Prerequisites
- Customer usage data is available at the account level.
- Churn data with dates for at least 12 months.
- Support ticket and NPS/CSAT data (if available).
- Customer success platform or CRM for score delivery.

## Steps
1. **Define health score objectives** -- Clarify what the score predicts:
   - Likelihood of renewal.
   - Likelihood of expansion.
   - Overall account engagement level.
   Document the primary use case (churn prevention, upsell targeting, or both).
2. **Identify candidate signals** -- List all available data signals:
   - Product usage: login frequency, feature adoption, API calls.
   - Engagement: support tickets, community participation, webinar attendance.
   - Sentiment: NPS score, CSAT ratings, customer feedback.
   - Financial: payment timeliness, contract value trend.
   - Relationship: executive sponsor engagement, champion activity.
   Aim for 10-20 candidate signals.
3. **Analyze signal-to-outcome correlation** -- For each signal, calculate the correlation
   with churn (or renewal). Rank signals by predictive power.
4. **Select final signals** -- Choose 5-10 signals that are:
   - Strongly correlated with the outcome.
   - Available and reliably measurable.
   - Actionable (CS team can influence them).
   - Not redundant with each other.
5. **Define scoring methodology** -- Choose the approach:
   - Rule-based: manual weights and thresholds for each signal.
   - Statistical: logistic regression or random forest to derive weights.
   - Hybrid: statistical weights with manual overrides for known factors.
6. **Set signal thresholds** -- For each signal, define:
   - Green (healthy): [threshold range].
   - Yellow (at risk): [threshold range].
   - Red (critical): [threshold range].
   Base thresholds on historical data distributions and churn correlations.
7. **Calculate composite score** -- Combine signals into a single score (0-100 scale):
   Health Score = SUM(signal_score x weight) for all signals.
   Normalize to 0-100.
8. **Validate the score** -- Test the health score against historical data:
   - Do accounts that churned have significantly lower scores?
   - What is the AUC-ROC for predicting churn?
   - At what score threshold does churn probability exceed 50%?
   Target AUC > 0.70.
9. **Define health tiers** -- Create actionable categories:
   - Healthy (70-100): standard engagement cadence.
   - At Risk (40-69): increased outreach, success plan.
   - Critical (0-39): immediate intervention, escalation.
10. **Build the delivery mechanism** -- Integrate the score into:
    - CS platform / CRM for daily visibility.
    - Alerting system for score drops.
    - Dashboards for leadership reporting.
11. **Define the refresh cadence** -- Specify how often the score is recalculated
    (daily recommended for product signals, weekly for composite score).
12. **Document and train** -- Write documentation for the CS team. Conduct training on
    how to interpret and act on the score.

## Deliverable
A health score design document containing:
- Signal inventory with correlation analysis.
- Selected signals with weights and thresholds.
- Scoring methodology documentation.
- Validation results (AUC, churn rate by tier).
- Health tier definitions with recommended actions.
- Delivery mechanism and refresh cadence.
- CS team training materials.

## Quality Gate
- [ ] Minimum 10 candidate signals analyzed.
- [ ] Selected signals are correlated with churn (p < 0.05).
- [ ] Scoring methodology is documented and reproducible.
- [ ] AUC-ROC exceeds 0.70 on validation data.
- [ ] Health tiers are defined with specific action protocols.
- [ ] Score is integrated into CS workflow tools.
- [ ] Refresh cadence is defined and automated.
- [ ] CS team is trained on score interpretation.

## Registry Update
- Add health score to `metric-registry` with formula and refresh schedule.
- Add health tiers to `segment-registry`.
- Log task completion in `task-log` with validation metrics.
