# Task: Alerting Setup
> Agent(s): data-chief, avinash-kaushik
> Frameworks: data-quality-triad, governance-layer
> Checklists: alerting-quality, data-quality-quality
> Templates: reports/alert-runbook
> Registry: alert-registry, data-quality-registry

## Objective
Set up a comprehensive alerting system that monitors key metrics and data pipelines,
detecting anomalies and failures early enough for the team to respond before business
impact occurs.

## Prerequisites
- Key metrics are defined in the metric registry.
- Data pipelines are documented with expected schedules.
- Alerting platform is available (PagerDuty, Slack, email, or built-in BI alerts).
- On-call rotation is defined (or will be defined in this task).

## Steps
1. **Categorize alerts** -- Define three alert categories:
   - Pipeline alerts: data pipeline failures, delays, or schema changes.
   - Metric alerts: key metrics exceeding thresholds or showing anomalies.
   - Data quality alerts: completeness, freshness, or validity issues.
2. **Select metrics for alerting** -- Not every metric needs an alert. Select:
   - North Star Metric and Level 1 KPI tree metrics.
   - Revenue and transaction metrics.
   - Metrics with known instability.
   - Metrics with direct user impact.
   Aim for 10-20 metric alerts total (avoid alert fatigue).
3. **Define alert thresholds** -- For each metric alert, set:
   - Static thresholds: absolute values that indicate a problem.
   - Dynamic thresholds: deviation from moving average (e.g., > 2 standard deviations).
   - Trend thresholds: X consecutive periods of decline.
   Document the rationale for each threshold.
4. **Define pipeline alerts** -- For each critical pipeline:
   - Failure alert: pipeline did not complete successfully.
   - Delay alert: pipeline completed but later than SLA.
   - Volume alert: output row count deviates > 20% from expected.
   - Schema alert: unexpected column changes detected.
5. **Define data quality alerts** -- Set up checks for:
   - Freshness: data not updated within expected window.
   - Completeness: null rate for required fields exceeds threshold.
   - Uniqueness: duplicate rate exceeds threshold.
   - Distribution: value distribution shifts significantly.
6. **Configure alert routing** -- Set up delivery:
   - Severity 1 (critical): page on-call immediately (PagerDuty/phone).
   - Severity 2 (warning): Slack channel notification.
   - Severity 3 (informational): email digest.
   Map each alert to a severity level.
7. **Define on-call rotation** -- If not already established:
   - Set up a weekly rotation among data team members.
   - Define response SLAs by severity (Sev 1: 15 min, Sev 2: 2 hours, Sev 3: next day).
   - Document escalation paths.
8. **Create alert runbooks** -- For each alert, write a runbook:
   - What the alert means.
   - Likely root causes.
   - Investigation steps.
   - Resolution steps.
   - Who to escalate to if unresolvable.
9. **Test the alerting system** -- Before going live:
   - Trigger test alerts for each severity level.
   - Verify routing delivers to the correct channel.
   - Verify runbooks are accessible from the alert notification.
10. **Calibrate thresholds** -- After 2 weeks of live operation:
    - Review alert frequency. If > 5 alerts/day, thresholds are too sensitive.
    - Review false positive rate. Target < 20% false positives.
    - Adjust thresholds based on operational experience.
11. **Document the alerting system** -- Write documentation covering:
    - All active alerts and their thresholds.
    - Routing and escalation paths.
    - On-call rotation schedule.
    - Runbook locations.
12. **Establish review cadence** -- Review alerting effectiveness monthly:
    - Alert volume trends.
    - False positive rates.
    - Mean time to acknowledge and resolve.

## Deliverable
An alerting system package containing:
- Alert inventory (metric, pipeline, data quality alerts).
- Threshold definitions with rationale.
- Routing configuration (severity -> channel).
- On-call rotation schedule.
- Runbooks for each alert.
- Testing confirmation.
- Documentation.

## Quality Gate
- [ ] All three alert categories are covered (pipeline, metric, data quality).
- [ ] 10-20 metric alerts are configured (not too few, not too many).
- [ ] Thresholds have documented rationale.
- [ ] Alert routing is configured and tested.
- [ ] On-call rotation is defined with response SLAs.
- [ ] Runbooks exist for every alert.
- [ ] False positive rate is below 20% after calibration.
- [ ] Monthly review cadence is established.

## Registry Update
- Link alerts to metrics in `metric-registry` via `alert_configured: true`.
- Log alert history in `incident-registry`.
- Log task completion in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** data-chief owns this task end-to-end.
- **Supporting agents:** avinash-kaushik contribute to their domain-specific steps.
- **Review:** avinash-kaushik reviews the final deliverable before it exits the squad.
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
- **Applicable gate:** G5 -- Decision + Registry
- **Must-pass checklists:** `checklists/alerting-quality.md`, `checklists/data-quality-quality.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/alert-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/data-quality-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [data-quality-triad](../../frameworks/data-quality-triad.md), [governance-layer](../../frameworks/governance-layer.md)
- **Checklists:** [alerting-quality](../../checklists/alerting-quality.md), [data-quality-quality](../../checklists/data-quality-quality.md)
- **Templates:** [reports/alert-runbook](../../templates/reports/alert-runbook.md)
