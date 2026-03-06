# Task: CS Early Warning Setup
> Agent(s): Customer Success Analyst, Data Engineer
> Frameworks: Early Warning System Framework, Signal Detection Theory
> Checklists: alerting-checklist, early-warning-checklist
> Template: early-warning-setup-template
> Registry: metric-registry, incident-registry

## Objective
Set up an automated early warning system that detects signs of customer distress, usage
decline, or churn risk before the customer reaches a critical state, giving the CS team
time to intervene proactively.

## Prerequisites
- Customer health score is designed (see cs-health-score-design).
- Usage data pipelines deliver data within 24 hours.
- Alerting infrastructure is available (email, Slack, CRM triggers).
- CS team workflows are documented for alert response.

## Steps
1. **Identify early warning signals** -- Define the signals that indicate emerging risk:
   - Usage decline: login frequency drops > 30% week-over-week.
   - Feature abandonment: key feature usage drops to zero.
   - Support escalation: critical ticket or negative CSAT response.
   - Champion departure: primary user deactivates or leaves company.
   - Payment issues: failed payment or downgrade request.
   - Health score drop: composite score crosses tier boundary.
2. **Set thresholds** -- For each signal, define the trigger threshold:
   - Absolute thresholds (usage below X).
   - Relative thresholds (usage declined by Y%).
   - Trend thresholds (declining for Z consecutive periods).
   Base thresholds on historical data: what levels preceded past churn?
3. **Define severity levels** -- Create a severity scale:
   - Warning: early signal, monitor closely.
   - Alert: significant risk, schedule outreach within 48 hours.
   - Critical: immediate risk, contact within 24 hours.
4. **Build detection logic** -- Implement the detection queries:
   - Scheduled SQL queries or pipeline jobs that run daily.
   - Compare current signal values against thresholds.
   - Generate alerts when thresholds are breached.
5. **Configure alert routing** -- Set up alert delivery:
   - Route to the assigned CSM for the account.
   - Escalate critical alerts to CS leadership.
   - Log all alerts in the CRM or CS platform.
6. **Build the alert dashboard** -- Create a dashboard showing:
   - Active alerts by severity.
   - Alert trend over time.
   - Alert-to-action completion rate.
   - Alert-to-churn conversion rate (how often alerts precede actual churn).
7. **Define response playbooks** -- For each alert type, write a response playbook:
   - What to investigate first.
   - What outreach to send.
   - What escalation path to follow.
   - When to close the alert.
8. **Test the system** -- Before going live:
   - Back-test alerts against historical data. Would these alerts have caught past churn?
   - Check for false positive rate. Target < 30% false positive rate.
   - Verify alert routing reaches the correct CSMs.
9. **Launch and monitor** -- Activate the early warning system. Monitor for the first
   2 weeks to calibrate thresholds.
10. **Iterate on thresholds** -- After 30 days, review:
    - Alert volume (too many = threshold too sensitive).
    - Miss rate (churn without prior alert = threshold too lenient).
    - Adjust thresholds based on outcomes.
11. **Document the system** -- Write operational documentation for the CS team.

## Deliverable
An early warning system package containing:
- Signal definitions with thresholds and severity levels.
- Detection logic (SQL queries or pipeline code).
- Alert routing configuration.
- Response playbooks for each alert type.
- Alert dashboard.
- Back-test results (historical detection rate).
- Operational documentation.

## Quality Gate
- [ ] Minimum 5 early warning signals are defined.
- [ ] Thresholds are based on historical churn analysis.
- [ ] Severity levels are defined with response SLAs.
- [ ] Alert routing delivers to the correct CSM.
- [ ] Back-test shows > 60% of historical churn would have been alerted.
- [ ] False positive rate is below 30%.
- [ ] Response playbooks exist for each alert type.
- [ ] System is documented and CS team is trained.

## Registry Update
- Add early warning signals to `metric-registry` with thresholds.
- Configure alerts in the alerting system.
- Log task completion in `task-log` with back-test results.
