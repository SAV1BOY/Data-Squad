# Task: CS Health Score Design
> Agent(s): nick-mehta, peter-fader, data-chief
> Frameworks: cs-health-score, mehta-customer-health-score-design, value-based-segmentation-fader
> Checklists: cs-health-score-quality, mehta/health-score-design, fader/value-segmentation-audit
> Templates: outputs/cs-health-score, reports/alert-runbook
> Registry: cs-health-registry, decision-registry

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

---

## Operational Details

### Handoff Rules
- **Lead agent:** nick-mehta owns this task end-to-end.
- **Supporting agents:** peter-fader, data-chief contribute to their domain-specific steps.
- **Review:** data-chief reviews the final deliverable before it exits the squad.
- **Cross-squad delivery:** If the output is requested by another squad, deliver via the cross-squad-data-delivery-workflow with data-chief sign-off.

### Escalation Rules
- **Data blocker:** If required data is unavailable or unreliable, escalate to data-chief within 24 hours.
- **Stakeholder disagreement:** If stakeholders reject the methodology or conclusions, escalate to data-chief for mediation.
- **Deadline risk:** If the task cannot be completed on schedule, notify data-chief at least 48 hours before the deadline.

### Rework Loop
- **Trigger:** Any checklist item marked as fail, or reviewer requests changes.
- **Maximum iterations:** 2 rework cycles. If the deliverable fails after 2 reworks, escalate to data-chief for a scope review.
- **Between iterations:** The reviewing agent provides specific, written feedback on what must change. No vague "needs improvement" — every rework request cites a checklist item or specific deficiency.

### RalphLoop Gate
- **Applicable gate:** G4 -- Insight
- **Must-pass checklists:** `checklists/cs-health-score-quality.md`, `checklists/mehta/health-score-design.md`, `checklists/fader/value-segmentation-audit.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/cs-health-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [cs-health-score](../../frameworks/cs-health-score.md), [mehta-customer-health-score-design](../../frameworks/mehta-customer-health-score-design.md), [value-based-segmentation-fader](../../frameworks/value-based-segmentation-fader.md)
- **Checklists:** [cs-health-score-quality](../../checklists/cs-health-score-quality.md), [mehta/health-score-design](../../checklists/mehta/health-score-design.md), [fader/value-segmentation-audit](../../checklists/fader/value-segmentation-audit.md)
- **Templates:** [outputs/cs-health-score](../../templates/outputs/cs-health-score.md), [reports/alert-runbook](../../templates/reports/alert-runbook.md)
- **Workflows:** [cs-health-early-warning-workflow](../../workflows/cs-health-early-warning-workflow.md)
