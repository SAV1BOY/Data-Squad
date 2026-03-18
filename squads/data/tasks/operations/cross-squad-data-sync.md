# Task: Cross-Squad Data Sync
> Agent(s): data-chief
> Frameworks: (none)
> Checklists: cross-squad-data-request-quality
> Templates: operational/cross-squad-data-handoff
> Registry: decision-registry

## Objective
Facilitate regular data sync meetings between the data squad and other squads (product,
engineering, marketing, customer success) to align on data needs, share insights, resolve
data issues, and ensure the data team's work is maximally impactful across the organization.

## Prerequisites
- Data team and other squads are established with known leads.
- Shared communication channels exist.
- Data team capacity and current priorities are documented.
- Meeting cadence is agreed upon (recommended: bi-weekly per squad).

## Steps
1. **Map the squads** -- Identify all squads that depend on data or produce data:
   - Product squads (each feature team).
   - Engineering squad (data infrastructure, tracking).
   - Marketing squad (attribution, campaigns).
   - Customer Success squad (health scores, renewals).
   - Finance squad (revenue, forecasting).
   - Community squad (community metrics).
2. **Assign data liaisons** -- For each squad, assign a data team member as the primary
   liaison. This person is the first point of contact for data needs.
3. **Set up recurring syncs** -- Schedule bi-weekly 30-minute meetings with each squad.
   Alternate weeks so the data team has at most 2-3 syncs per week.
4. **Pre-sync preparation** -- Before each sync, the data liaison prepares:
   - Status update on in-flight requests from this squad.
   - Any data quality issues affecting this squad's metrics.
   - Relevant insights or findings from recent analyses.
   - Questions about upcoming squad plans that may have data implications.
5. **Run the sync meeting** -- Agenda (30 minutes):
   - (5 min) Data team updates: completed work, findings, alerts.
   - (5 min) Squad updates: upcoming launches, tracking needs, new questions.
   - (10 min) Discussion: prioritize new requests, clarify requirements.
   - (5 min) Data quality: any issues affecting this squad.
   - (5 min) Action items and next steps.
6. **Capture action items** -- Document every action item with:
   - Description.
   - Owner (data team or squad).
   - Deadline.
   - Priority.
7. **Track request pipeline** -- Maintain a request tracker per squad:
   - New requests submitted.
   - In-progress requests with status.
   - Completed requests with links to deliverables.
   Share visibility with the squad.
8. **Share insights proactively** -- Do not wait for the sync to share relevant findings.
   If an analysis reveals something relevant to a squad, share it immediately via Slack.
9. **Identify cross-squad patterns** -- As the data team syncs with multiple squads,
   look for patterns:
   - Are multiple squads asking similar questions?
   - Are there conflicting metric definitions across squads?
   - Are there shared data needs that could be addressed once?
10. **Resolve cross-squad conflicts** -- When different squads have conflicting
    interpretations of the same metric:
    - Convene a joint session to align on the single source of truth.
    - Update the metric registry with the agreed definition.
    - Communicate the resolution to all affected parties.
11. **Report sync effectiveness** -- Quarterly, assess:
    - Number of requests processed per squad.
    - Average turnaround time.
    - Stakeholder satisfaction (quick survey).
    - Identified improvements.
12. **Iterate on the process** -- Based on feedback, adjust:
    - Sync frequency (more or less often).
    - Agenda format.
    - Communication channels.

## Deliverable
A cross-squad data sync program consisting of:
- Squad-to-liaison mapping.
- Recurring sync schedule.
- Request tracker per squad.
- Sync meeting notes and action items.
- Quarterly effectiveness assessment.

## Quality Gate
- [ ] Every squad with data dependencies has an assigned liaison.
- [ ] Syncs occur at the scheduled cadence (bi-weekly minimum).
- [ ] Action items are captured with owners and deadlines.
- [ ] Request pipeline is visible to each squad.
- [ ] Cross-squad conflicts are identified and resolved.
- [ ] Insights are shared proactively (not hoarded for sync meetings).
- [ ] Quarterly effectiveness assessment is completed.
- [ ] Stakeholder satisfaction is measured.

## Registry Update
- Log sync activities in `task-log`.
- Update `metric-registry` when cross-squad alignment produces definition changes.
- Track request completion metrics for data team performance reviews.

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
- **Must-pass checklists:** `checklists/cross-squad-data-request-quality.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Checklists:** [cross-squad-data-request-quality](../../checklists/cross-squad-data-request-quality.md)
- **Templates:** [operational/cross-squad-data-handoff](../../templates/operational/cross-squad-data-handoff.md)
- **Workflows:** [cross-squad-data-delivery-workflow](../../workflows/cross-squad-data-delivery-workflow.md)
