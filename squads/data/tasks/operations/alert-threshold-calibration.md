# Task: Alert Threshold Calibration
> Agent(s): avinash-kaushik
> Frameworks: data-quality-triad, ralphloop-data-ops
> Checklists: alerting-quality, analytics/anomaly-investigation, analytics/metric-drift-detection
> Templates: reports/alert-runbook
> Registry: alert-registry, data-quality-registry

## Objective
Review and recalibrate all active alert thresholds to reduce false-positive noise, catch real
issues earlier, and ensure alerting sensitivity matches current data patterns and business context.

## Prerequisites
- Access to the alerting platform and historical alert data (minimum 30 days).
- Current alert inventory with configured thresholds.
- Incident log to cross-reference alerts against confirmed incidents.
- On-call team available for qualitative feedback on alert quality.

## Steps
1. **Export alert history** -- Pull all alerts fired in the last 90 days. For each alert, record:
   - Alert name and type (pipeline, metric, data quality).
   - Timestamp fired.
   - Whether it was acknowledged, resolved, or ignored.
   - Time to acknowledge and time to resolve.
2. **Calculate alert metrics** -- For the full alert corpus, compute:
   - Total alerts per week (trend over time).
   - False positive rate (alerts that required no action / total alerts).
   - True positive rate (alerts tied to confirmed incidents).
   - Signal-to-noise ratio (true positives / total alerts).
   Target: < 20% false positive rate, > 60% signal-to-noise ratio.
3. **Identify noisy alerts** -- Flag alerts with:
   - More than 3 firings per week without confirmed incidents.
   - > 50% false positive rate.
   - Consistent "ignore" behavior from on-call (acknowledged but no action taken).
4. **Identify silent failures** -- Cross-reference the incident log against alert history:
   - Incidents that had no corresponding alert (missed detections).
   - Incidents where the alert fired too late (detection delay > 1 hour).
   - Categories of issues with no alert coverage.
5. **Interview on-call team** -- Gather qualitative feedback:
   - Which alerts are consistently useful?
   - Which alerts cause fatigue?
   - What incidents were missed that should have been caught?
   - Are severity levels appropriate?
6. **Recalibrate thresholds** -- For each noisy alert:
   - Widen static thresholds by analyzing the historical distribution.
   - Switch from static to dynamic thresholds where appropriate.
   - Increase minimum consecutive periods before firing.
   - Consider downgrading severity if the impact is low.
7. **Add missing alerts** -- For each identified coverage gap:
   - Define the alert with appropriate thresholds.
   - Assign severity and routing.
   - Write or update the runbook.
8. **Update runbooks** -- Review runbooks for all modified alerts:
   - Ensure investigation steps reflect current architecture.
   - Update escalation paths if team structure has changed.
   - Add learnings from recent incidents.
9. **Deploy and monitor** -- Roll out calibrated thresholds:
   - Deploy changes in a staged manner (high-severity alerts first).
   - Monitor for 7 days to validate improvement.
   - Track false positive rate daily during the monitoring period.
10. **Document calibration results** -- Record:
    - Before vs. after alert volume.
    - Before vs. after false positive rate.
    - New alerts added and removed.
    - Schedule next calibration review (recommended monthly).

## Deliverable
An alert calibration report containing:
- Alert inventory with before/after thresholds.
- False positive and signal-to-noise metrics (before vs. after).
- Coverage gap analysis with new alerts added.
- Updated runbooks for modified alerts.
- On-call team feedback summary.
- 7-day monitoring results post-calibration.

## Quality Gate
- [ ] All active alerts reviewed (100% coverage).
- [ ] False positive rate calculated with 90-day data.
- [ ] Noisy alerts identified and thresholds recalibrated.
- [ ] Coverage gaps documented and new alerts created.
- [ ] On-call team interviewed (minimum 3 team members).
- [ ] Runbooks updated for all modified alerts.
- [ ] 7-day post-calibration monitoring completed.
- [ ] Next calibration date scheduled.

## Registry Update
- Update threshold values in `alert-registry`.
- Log calibration results in `data-quality-registry`.
- Log task completion in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** avinash-kaushik owns this task end-to-end.
- **Supporting agents:** data-chief contribute to their domain-specific steps.
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
- **Applicable gate:** G3 -- Quality
- **Must-pass checklists:** `checklists/alerting-quality.md`, `checklists/analytics/anomaly-investigation.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/alert-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/data-quality-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [data-quality-triad](../../frameworks/data-quality-triad.md), [ralphloop-data-ops](../../frameworks/ralphloop-data-ops.md)
- **Checklists:** [alerting-quality](../../checklists/alerting-quality.md), [analytics/anomaly-investigation](../../checklists/analytics/anomaly-investigation.md), [analytics/metric-drift-detection](../../checklists/analytics/metric-drift-detection.md)
- **Templates:** [reports/alert-runbook](../../templates/reports/alert-runbook.md)
- **Workflows:** [data-quality-improvement-workflow](../../workflows/data-quality-improvement-workflow.md)
