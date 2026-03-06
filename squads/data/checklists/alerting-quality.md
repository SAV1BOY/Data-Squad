# Alerting Quality Checklist

> Gate type: Pre-delivery
> Owner: Data Chief
> Applies to: Any new alert, threshold change, or alerting system configuration

## Purpose

Alerts are the nervous system of data operations. Too many alerts cause fatigue and get ignored; too few let incidents fester. A poorly configured alert -- wrong threshold, no owner, no runbook -- is worse than no alert because it creates a false sense of safety. This gate ensures every alert earns its place in the on-call rotation.

## Checklist Items

1. - [ ] **Alert has a single, named owner** -- One person (or one role/rotation) is designated as the primary responder for this alert.
   - Pass criteria: Owner name or rotation listed in the alert configuration and in the documentation.
   - Fail signal: Alert fires to a shared channel with no designated responder, or ownership says "team."
   - Action if fail: Assign a specific owner or on-call rotation before activating the alert.

2. - [ ] **Threshold is data-driven** -- The alerting threshold is based on historical data (e.g., 3 standard deviations from the 30-day mean), not a round number chosen by intuition.
   - Pass criteria: Threshold derivation documented with reference data (baseline mean, stddev, percentile).
   - Fail signal: Threshold is a round number (e.g., "> 1000 errors") with no statistical basis.
   - Action if fail: Analyze the last 90 days of the metric, compute a reasonable threshold, and document the method.

3. - [ ] **Alert has been backtested** -- The alert logic has been run against historical data to verify it would have caught known incidents and would not fire excessively.
   - Pass criteria: Backtest results show the alert would have fired for at least 80% of known incidents and fewer than 2 false positives per week.
   - Fail signal: No backtest performed; threshold was set and deployed without validation.
   - Action if fail: Run the alert against 30-90 days of data, count true positives and false positives, adjust threshold.

4. - [ ] **Severity level assigned** -- The alert has a severity (e.g., P1-critical, P2-high, P3-warning, P4-info) that maps to a response SLA.
   - Pass criteria: Severity documented with the expected response time (e.g., P2 = acknowledge within 30 minutes).
   - Fail signal: All alerts are the same severity, or severity is not assigned.
   - Action if fail: Classify the alert based on business impact and assign the appropriate severity and SLA.

5. - [ ] **Runbook linked** -- The alert links to a runbook or troubleshooting guide that tells the responder what to do when it fires.
   - Pass criteria: Alert description or metadata includes a URL to a runbook with diagnostic steps and escalation paths.
   - Fail signal: Alert fires with only a metric name and a number; responder has to figure out what to do.
   - Action if fail: Write a runbook (even a short one: check X, restart Y, escalate to Z) and link it in the alert.

6. - [ ] **Notification channel appropriate** -- The alert routes to the right channel (PagerDuty for P1, Slack for P3, email digest for P4) based on severity.
   - Pass criteria: Routing rules documented; P1/P2 alerts go to an interruptive channel; P3/P4 do not page.
   - Fail signal: P4 informational alerts page the on-call at 3 AM, or P1 alerts go to a low-traffic Slack channel.
   - Action if fail: Adjust routing to match severity. Verify the notification path works with a test alert.

7. - [ ] **Deduplication and grouping configured** -- Repeated firings of the same alert within a window are grouped, not sent as individual notifications.
   - Pass criteria: Deduplication window set (e.g., suppress re-alerts for 15 minutes after first fire).
   - Fail signal: The same alert fires 50 times in 10 minutes, flooding the channel.
   - Action if fail: Configure deduplication or grouping in the alerting platform.

8. - [ ] **Auto-resolve or clear condition defined** -- The alert automatically resolves when the metric returns to normal, or there is a manual clear process documented.
   - Pass criteria: Auto-resolve condition set, or the runbook includes a step to manually close the alert.
   - Fail signal: Alert fires and stays open indefinitely even after the issue is resolved, causing alert fatigue.
   - Action if fail: Add an auto-resolve condition or document the manual close process.

9. - [ ] **Scheduled maintenance windows respected** -- The alert suppresses during known maintenance windows to avoid false alarms.
   - Pass criteria: Maintenance window schedule documented; alert is silenced during those periods.
   - Fail signal: Alert fires every Sunday during the weekly ETL maintenance window, training responders to ignore it.
   - Action if fail: Configure maintenance window suppression in the alerting system.

10. - [ ] **Alert noise review scheduled** -- A periodic review (monthly or quarterly) is scheduled to evaluate alert volume, false positive rate, and fatigue.
    - Pass criteria: A recurring calendar event or task exists for alert hygiene review.
    - Fail signal: Alerts accumulate over time; no one reviews whether old alerts are still relevant.
    - Action if fail: Schedule a quarterly alert review and assign it to the Data Chief or on-call lead.

11. - [ ] **Context in alert message** -- The alert notification includes enough context (current value, threshold, affected system, time window) for the responder to triage without opening a dashboard.
    - Pass criteria: Alert message contains: metric name, current value, threshold, time of detection, and runbook link.
    - Fail signal: Alert says "Threshold exceeded" with no other information.
    - Action if fail: Update the alert template to include all required context fields.

12. - [ ] **Dependency alerts ordered** -- If this alert depends on upstream systems, the upstream alert fires first so responders are not investigating symptoms.
    - Pass criteria: Alert dependency chain documented; upstream alerts have equal or higher severity.
    - Fail signal: A downstream dashboard alert fires before the upstream pipeline-failure alert, causing confusion.
    - Action if fail: Map alert dependencies and adjust timing or add a dependency check to the alert logic.

## Cross-References

- See `data-quality-quality.md` for the data quality metrics that often trigger alerts.
- See `exec-report-quality.md` for how alert trends (MTTR, false positive rate) may feed into operational reports.
- See `cross-squad-data-request-quality.md` for alerting on SLA breaches for cross-squad requests.
