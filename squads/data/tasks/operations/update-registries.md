# Task: Update Registries
> Agent(s): data-chief
> Frameworks: governance-layer, metric-lifecycle-framework
> Checklists: governance/metric-governance, governance/data-catalog-quality
> Templates: (none)
> Registry: metric-registry, event-registry, experiment-registry, dashboard-registry

## Objective
Perform a periodic update of all data registries to ensure they reflect the current state
of metrics, events, experiments, and dashboards, maintaining the registries as the trusted
source of truth for the data ecosystem.

## Prerequisites
- All registries are accessible and editable.
- Recent work log is available (completed analyses, new tracking, experiments).
- Access to analytics platforms for cross-referencing.
- Registry schema and field requirements are documented.

## Steps
1. **Review the task log** -- Pull all completed tasks since the last registry update.
   Identify which tasks produced new metrics, events, experiments, or dashboards.
2. **Update the metric registry** -- For each new or modified metric:
   - Add new entries with all required fields (name, formula, source, owner).
   - Update existing entries if definitions or sources changed.
   - Change status for deprecated metrics.
   - Verify owner assignments are current.
3. **Update the event registry** -- For each tracking change:
   - Add new events with properties, trigger conditions, and platform scope.
   - Update modified events (new properties, changed trigger conditions).
   - Mark deprecated events with status and deprecation date.
   - Verify implementation status (planned, implemented, validated).
4. **Update the experiment registry** -- For each experiment:
   - Add new experiments with hypothesis, metrics, and design parameters.
   - Update running experiments with interim status.
   - Record results for completed experiments (shipped, killed, iterating).
   - Link to analysis artifacts and decision documents.
5. **Update the dashboard registry** -- For dashboard changes:
   - Add new dashboards with URL, owner, audience, and metric list.
   - Update modified dashboards.
   - Archive or remove deleted dashboards.
   - Verify all dashboard URLs are still valid.
6. **Update the segment registry** -- If applicable:
   - Add new segment definitions.
   - Update segment criteria if changed.
   - Record refresh dates and current sizes.
7. **Cross-reference for consistency** -- Verify registry consistency:
   - Metrics referenced in experiments exist in the metric registry.
   - Events referenced in metrics exist in the event registry.
   - Dashboards reference valid metrics.
   Flag and resolve any broken references.
8. **Check for completeness** -- For each registry, verify:
   - All required fields are populated.
   - No blank owners, missing formulas, or empty descriptions.
   - Dates are current (created, modified, reviewed).
9. **Generate registry statistics** -- Calculate:
   - Total entries per registry.
   - Entries added since last update.
   - Entries deprecated since last update.
   - Completeness score (% of entries with all fields populated).
10. **Communicate updates** -- Notify the team of significant registry changes:
    - New metrics or events added.
    - Deprecated items.
    - Owner reassignments.

## Deliverable
Updated registries with:
- All new entries from recent work.
- Modified entries reflecting current state.
- Deprecated entries marked appropriately.
- Registry statistics summary.
- Change log documenting what was updated.

## Quality Gate
- [ ] All completed tasks from the task log are reflected in registries.
- [ ] Every new metric has all required fields populated.
- [ ] Every new event has properties and implementation status.
- [ ] Experiment registry reflects current experiment states.
- [ ] Cross-references between registries are consistent.
- [ ] No broken references exist.
- [ ] Registry completeness score is above 90%.
- [ ] Change log is documented.

## Registry Update
- This task IS the registry update. All registries are updated as part of execution.
- Log the registry update itself in `task-log` with statistics.
- Set the next scheduled update date.

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
- **Must-pass checklists:** `checklists/governance/metric-governance.md`, `checklists/governance/data-catalog-quality.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/metric-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/event-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/experiment-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/dashboard-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [governance-layer](../../frameworks/governance-layer.md), [metric-lifecycle-framework](../../frameworks/metric-lifecycle-framework.md)
- **Checklists:** [governance/metric-governance](../../checklists/governance/metric-governance.md), [governance/data-catalog-quality](../../checklists/governance/data-catalog-quality.md)
