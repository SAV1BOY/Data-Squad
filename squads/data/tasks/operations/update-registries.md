# Task: Update Registries
> Agent(s): Data Analyst, Data Team Lead
> Frameworks: Registry Management Framework, Data Catalog Standards
> Checklists: registry-update-checklist, completeness-checklist
> Template: registry-entry-template
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
