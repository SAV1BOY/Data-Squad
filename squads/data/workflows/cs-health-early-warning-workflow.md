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
- **nick-mehta**: Owns the health scoring model and intervention design
- **avinash-kaushik**: Builds and maintains the health score pipeline
- **avinash-kaushik**: Monitors data freshness and score reliability
- **wes-kao**: Communicates alerts and outcomes to CS and leadership

## Steps

### Phase 1: Health Score Computation (Continuous)
1. **avinash-kaushik** maintains the health score model using weighted inputs: product usage frequency, feature breadth, support sentiment, NPS, contract utilization, and engagement trend.
2. **avinash-kaushik** computes scores daily and writes them to the customer health table.
3. **avinash-kaushik** monitors score distribution for anomalies: sudden shifts, missing data, or score inflation/deflation.
4. **nick-mehta** reviews and recalibrates score weights quarterly based on churn correlation analysis.

### Phase 2: Alert Generation (Continuous)
5. **avinash-kaushik** runs the alert engine: flags accounts that cross from "Healthy" to "Warning" or from "Warning" to "Critical."
6. **avinash-kaushik** enriches alerts with context: which score components changed, recent usage patterns, open support tickets.
7. **wes-kao** formats alerts for CS managers: account name, score change, contributing factors, and recommended first action.
8. **wes-kao** routes alerts via the appropriate channel: Slack for Warning, Slack + email for Critical.

### Phase 3: Intervention Coordination (Within 48 hours of alert)
9. **nick-mehta** triages Critical alerts and assigns an intervention playbook based on the primary risk factor.
10. **nick-mehta** coordinates with CS team: schedule a customer check-in, offer training, escalate technical issues.
11. **nick-mehta** defines the intervention success criteria: target score recovery within 30 days, or specific engagement milestones.
12. **wes-kao** logs the intervention plan in the account record for tracking.

### Phase 4: Intervention Execution (1-30 days)
13. CS team executes the intervention playbook (outreach, training, product fix, account review).
14. **nick-mehta** monitors the account health score weekly during the intervention period.
15. **avinash-kaushik** ensures the health score reflects any changes from the intervention accurately.
16. **nick-mehta** adjusts the intervention if the score does not respond within 14 days.

### Phase 5: Result Measurement (30-60 days post-alert)
17. **nick-mehta** evaluates the intervention outcome: did the health score recover? Did the customer renew?
18. **avinash-kaushik** adds the outcome to the intervention effectiveness dataset for model improvement.
19. **wes-kao** produces a monthly early warning report: alerts generated, interventions launched, outcomes, and save rate.
20. **nick-mehta** feeds learnings back into the health score model and intervention playbooks.

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
| G1: Score Calibrated | Health score predicts churn with >70% precision at the Critical threshold | nick-mehta |
| G2: Alert Timely | Critical alerts delivered within 4 hours of score computation | avinash-kaushik |
| G3: Intervention Fast | Intervention initiated within 48 hours of Critical alert | nick-mehta |
| G4: Outcome Tracked | Every intervention has a documented outcome within 60 days | nick-mehta |
| G5: Model Updated | Score weights recalibrated quarterly using latest churn data | avinash-kaushik |

## Registry Updates
- **Metric Registry**: Health score registered as an official metric with model version and weight documentation.
- **Alert Registry**: Record alert thresholds, routing rules, and escalation paths.
- **Intervention Playbook Library**: Update playbooks based on intervention effectiveness data.
- **Change Log**: Document any model recalibration with before/after performance metrics.
