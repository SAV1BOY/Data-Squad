# Task: Build Measurement Plan
> Agent(s): data-chief, avinash-kaushik
> Frameworks: dmmm-kaushik, stdc-kaushik, instrumentation-layer
> Checklists: tracking-plan-quality, event-taxonomy-quality, kaushik/dmmm-measurement-model-audit, kaushik/see-think-do-care-mapping
> Templates: outputs/measurement-plan, outputs/tracking-spec
> Registry: event-registry, metric-registry

## Objective
Create a comprehensive measurement plan that maps business questions to metrics, metrics to
events, and events to implementation requirements, ensuring nothing important goes unmeasured.

## Prerequisites
- KPI tree or metric definitions are available.
- Event taxonomy exists or will be built concurrently.
- Product roadmap or feature brief is available for scope.
- Analytics platform is selected and accessible.

## Steps
1. **Define scope** -- Identify the product area, feature, or initiative the measurement
   plan covers. Set boundaries on what is in-scope vs. out-of-scope.
2. **List business questions** -- Enumerate every question stakeholders need answered.
   Group by theme (acquisition, activation, engagement, retention, monetization).
3. **Map questions to metrics** -- For each question, identify the metric(s) that answer it.
   Reference the metric registry. Flag gaps where no metric exists yet.
4. **Map metrics to events** -- For each metric, identify which events and properties are
   needed to calculate it. Reference the event taxonomy. Flag gaps.
5. **Create the measurement matrix** -- Build a table with columns: Business Question |
   Metric | Event(s) | Properties | Data Source | Implementation Status.
6. **Prioritize** -- Rank each row by importance (must-have, should-have, nice-to-have)
   based on stakeholder needs and implementation effort.
7. **Identify gaps** -- List all missing events, undefined metrics, and data source gaps.
   Create tickets for each gap.
8. **Define implementation requirements** -- For each new event or tracking change, write
   the implementation spec: where it fires, what properties it carries, and platform scope.
9. **Create RACI** -- Assign Responsible, Accountable, Consulted, Informed for each
   implementation item.
10. **Set timeline** -- Establish milestones: spec complete, implementation start,
    QA complete, data validated, plan live.
11. **Review with stakeholders** -- Walk through the plan with PM, engineering, and data
    team. Confirm completeness and priorities.
12. **Publish** -- Finalize and store the measurement plan. Link to relevant registries.

## Deliverable
A measurement plan document containing:
- Scoped business questions (15-50 typically).
- Measurement matrix mapping questions to metrics to events.
- Gap analysis with remediation plan.
- Implementation specs for new tracking.
- RACI and timeline.
- Stakeholder sign-off.

## Quality Gate
- [ ] Every must-have business question has a mapped metric.
- [ ] Every metric has mapped events with identified data sources.
- [ ] All gaps are documented with remediation tickets created.
- [ ] Implementation specs are detailed enough for engineering.
- [ ] RACI is complete with no unassigned items.
- [ ] Timeline has concrete milestones with dates.
- [ ] Plan reviewed by PM, engineering, and data leads.
- [ ] Measurement matrix is stored in a shared, versioned location.

## Registry Update
- Update `event-registry` with any new events identified.
- Update `metric-registry` with any new metrics identified.
- Log task completion in `task-log` with plan version and scope reference.

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
- **Applicable gate:** G2 -- Instrumentation
- **Must-pass checklists:** `checklists/tracking-plan-quality.md`, `checklists/event-taxonomy-quality.md`, `checklists/kaushik/dmmm-measurement-model-audit.md`, `checklists/kaushik/see-think-do-care-mapping.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/event-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/metric-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [dmmm-kaushik](../../frameworks/dmmm-kaushik.md), [stdc-kaushik](../../frameworks/stdc-kaushik.md), [instrumentation-layer](../../frameworks/instrumentation-layer.md)
- **Checklists:** [tracking-plan-quality](../../checklists/tracking-plan-quality.md), [event-taxonomy-quality](../../checklists/event-taxonomy-quality.md), [kaushik/dmmm-measurement-model-audit](../../checklists/kaushik/dmmm-measurement-model-audit.md), [kaushik/see-think-do-care-mapping](../../checklists/kaushik/see-think-do-care-mapping.md)
- **Templates:** [outputs/measurement-plan](../../templates/outputs/measurement-plan.md), [outputs/tracking-spec](../../templates/outputs/tracking-spec.md)
- **Workflows:** [tracking-implementation-workflow](../../workflows/tracking-implementation-workflow.md)
