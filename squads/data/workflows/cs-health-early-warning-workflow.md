# CS Health Early Warning Workflow

## Purpose
Proactively identify at-risk customers through health scoring, trigger timely alerts, coordinate interventions, and measure outcomes to prevent churn before it becomes irreversible.

## Trigger
- Customer health score drops below warning threshold
- Usage pattern changes significantly (sudden drop, feature abandonment)
- Support ticket volume spikes for an account
- Contract renewal window opens (90 days out)
- NPS response indicates detractor status

## Agents Involved
- **Retention Strategist**: Owns the health scoring model and intervention design
- **Analytics Architect**: Builds and maintains the health score pipeline
- **Data Quality Sentinel**: Monitors data freshness and score reliability
- **Insight Narrator**: Communicates alerts and outcomes to CS and leadership

## Steps

### Phase 1: Health Score Computation (Continuous)
1. **Analytics Architect** maintains the health score model using weighted inputs: product usage frequency, feature breadth, support sentiment, NPS, contract utilization, and engagement trend.
2. **Analytics Architect** computes scores daily and writes them to the customer health table.
3. **Data Quality Sentinel** monitors score distribution for anomalies: sudden shifts, missing data, or score inflation/deflation.
4. **Retention Strategist** reviews and recalibrates score weights quarterly based on churn correlation analysis.

### Phase 2: Alert Generation (Continuous)
5. **Analytics Architect** runs the alert engine: flags accounts that cross from "Healthy" to "Warning" or from "Warning" to "Critical."
6. **Analytics Architect** enriches alerts with context: which score components changed, recent usage patterns, open support tickets.
7. **Insight Narrator** formats alerts for CS managers: account name, score change, contributing factors, and recommended first action.
8. **Insight Narrator** routes alerts via the appropriate channel: Slack for Warning, Slack + email for Critical.

### Phase 3: Intervention Coordination (Within 48 hours of alert)
9. **Retention Strategist** triages Critical alerts and assigns an intervention playbook based on the primary risk factor.
10. **Retention Strategist** coordinates with CS team: schedule a customer check-in, offer training, escalate technical issues.
11. **Retention Strategist** defines the intervention success criteria: target score recovery within 30 days, or specific engagement milestones.
12. **Insight Narrator** logs the intervention plan in the account record for tracking.

### Phase 4: Intervention Execution (1-30 days)
13. CS team executes the intervention playbook (outreach, training, product fix, account review).
14. **Retention Strategist** monitors the account health score weekly during the intervention period.
15. **Data Quality Sentinel** ensures the health score reflects any changes from the intervention accurately.
16. **Retention Strategist** adjusts the intervention if the score does not respond within 14 days.

### Phase 5: Result Measurement (30-60 days post-alert)
17. **Retention Strategist** evaluates the intervention outcome: did the health score recover? Did the customer renew?
18. **Analytics Architect** adds the outcome to the intervention effectiveness dataset for model improvement.
19. **Insight Narrator** produces a monthly early warning report: alerts generated, interventions launched, outcomes, and save rate.
20. **Retention Strategist** feeds learnings back into the health score model and intervention playbooks.

## Inputs
- Product usage data (daily)
- Support ticket data and sentiment
- NPS and survey responses
- Contract and billing information
- Historical churn data for model training

## Outputs
- Daily customer health scores
- Automated alerts with context and recommended actions
- Intervention plans logged per account
- Monthly early warning effectiveness report
- Quarterly model recalibration report

## Quality Gates

| Gate | Criteria | Owner |
|------|----------|-------|
| G1: Score Calibrated | Health score predicts churn with >70% precision at the Critical threshold | Retention Strategist |
| G2: Alert Timely | Critical alerts delivered within 4 hours of score computation | Analytics Architect |
| G3: Intervention Fast | Intervention initiated within 48 hours of Critical alert | Retention Strategist |
| G4: Outcome Tracked | Every intervention has a documented outcome within 60 days | Retention Strategist |
| G5: Model Updated | Score weights recalibrated quarterly using latest churn data | Analytics Architect |

## Registry Updates
- **Metric Registry**: Health score registered as an official metric with model version and weight documentation.
- **Alert Registry**: Record alert thresholds, routing rules, and escalation paths.
- **Intervention Playbook Library**: Update playbooks based on intervention effectiveness data.
- **Change Log**: Document any model recalibration with before/after performance metrics.
