# Task: Weekly Data Ops Cadence
> Agent(s): data-chief
> Frameworks: ralphloop-data-ops, governance-layer
> Checklists: data-quality-quality
> Templates: (none)
> Registry: decision-registry

## Objective
Execute a weekly operational cadence that ensures data quality is maintained, stakeholder
requests are triaged, team priorities are aligned, and the data team operates efficiently
with clear visibility into workload and progress.

## Prerequisites
- Data team is established with defined roles.
- Metric registry, event registry, and dashboards are operational.
- Communication channels are set up (Slack, email, project management tool).
- Recurring calendar events are booked.

## Steps
1. **Monday: Pipeline health check** -- Start the week by verifying data infrastructure:
   - Check all pipeline runs from the weekend.
   - Verify data freshness on critical dashboards.
   - Review any alerts that fired over the weekend.
   - Resolve any pipeline failures before they affect stakeholders.
2. **Monday: Metric health check** -- Review key metrics:
   - Check the North Star Metric and input metrics for anomalies.
   - Review any automated anomaly detection alerts.
   - If anomalies are found, initiate the investigate-anomaly task.
3. **Tuesday: Stakeholder request triage** -- Process the incoming request queue:
   - Review all new data requests from stakeholders.
   - Classify each as: quick answer (< 1 hour), analysis (1-5 days), project (> 1 week).
   - Prioritize against existing work.
   - Respond to requesters with estimated timeline.
4. **Wednesday: Team standup and planning** -- Hold the weekly team meeting:
   - Each team member shares: what they completed, what they are working on, blockers.
   - Review the sprint/week plan. Adjust priorities if needed.
   - Discuss any cross-team dependencies.
   - Timebox to 30 minutes.
5. **Thursday: Analysis and deep work** -- Reserve Thursdays for uninterrupted deep work:
   - No meetings scheduled.
   - Focus on the highest-priority analysis or project.
   - Protect this time aggressively.
6. **Friday: Weekly review and documentation** -- Close out the week:
   - Update the task log with completed work.
   - Document any learnings or findings from the week.
   - Prepare the weekly summary for stakeholders.
   - Preview next week's priorities.
7. **Friday: Weekly data digest** -- Send a brief weekly summary to stakeholders:
   - Key metric performance (vs. target, vs. prior week).
   - Notable findings or insights.
   - Completed requests and analyses.
   - Upcoming priorities for next week.
8. **Ongoing: Slack channel monitoring** -- Throughout the week:
   - Monitor the data team Slack channel for urgent requests.
   - Respond to quick questions within 4 hours.
   - Route complex requests to the Tuesday triage.
9. **Ongoing: Alert response** -- When alerts fire:
   - Acknowledge within 30 minutes during business hours.
   - Investigate using the anomaly investigation playbook.
   - Communicate findings to affected stakeholders.
10. **Ongoing: Registry maintenance** -- As work is completed:
    - Update metric registry with any new or modified metrics.
    - Update event registry with tracking changes.
    - Keep the task log current.

## Deliverable
Weekly operational outputs:
- Pipeline and metric health check records.
- Triaged request queue with priorities and timelines.
- Team standup notes and updated sprint plan.
- Weekly data digest distributed to stakeholders.
- Updated task log.

## Quality Gate
- [ ] Pipeline health check is completed every Monday by 10 AM.
- [ ] Metric health check flags anomalies within 24 hours.
- [ ] All new requests are triaged within 48 hours of submission.
- [ ] Team standup occurs weekly and is timeboxed to 30 minutes.
- [ ] Weekly data digest is sent every Friday.
- [ ] Task log is updated with all completed work.
- [ ] Alerts are acknowledged within 30 minutes during business hours.
- [ ] No stakeholder request goes more than 5 business days without a response.

## Registry Update
- Update `task-log` with all completed work items weekly.
- Process any registry updates identified during the week.
- Log cadence execution in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** data-chief owns this task end-to-end.
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
- **Must-pass checklists:** `checklists/data-quality-quality.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [ralphloop-data-ops](../../frameworks/ralphloop-data-ops.md), [governance-layer](../../frameworks/governance-layer.md)
- **Checklists:** [data-quality-quality](../../checklists/data-quality-quality.md)
