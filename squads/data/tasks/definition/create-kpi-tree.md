# Task: Create KPI Tree
> Agent(s): data-chief, avinash-kaushik, sean-ellis
> Frameworks: kpi-tree, dmmm-kaushik, aarrr-pirate-metrics
> Checklists: kpi-tree-quality, kaushik/dmmm-measurement-model-audit
> Templates: outputs/kpi-tree
> Registry: metric-registry

## Objective
Build a hierarchical KPI tree that decomposes the North Star Metric into actionable input
metrics across multiple levels, giving every team a clear metric they own and can influence.

## Prerequisites
- North Star Metric is defined and documented in the metric registry.
- Business model and revenue drivers are understood.
- Product feature map is available.
- Team structure and ownership boundaries are known.
- Access to analytics data warehouse.

## Steps
1. **Start from the NSM** -- Place the North Star Metric at the root of the tree. Document
   its current value and target.
2. **Decompose Level 1** -- Break the NSM into 3-5 input metrics using the breadth / depth /
   frequency / efficiency framework. Ensure the decomposition is MECE (mutually exclusive,
   collectively exhaustive).
3. **Decompose Level 2** -- For each Level 1 metric, identify 2-4 sub-metrics that are
   directly influenceable by a specific team or initiative.
4. **Decompose Level 3 (optional)** -- If needed, break Level 2 metrics into operational
   metrics that map to specific features or workflows.
5. **Assign ownership** -- For each metric at Level 2 and below, assign a team owner.
   Confirm with team leads that they accept ownership.
6. **Define each metric** -- For every node in the tree, write a formal metric definition:
   name, formula, data source, granularity, and owner.
7. **Validate mathematical consistency** -- Verify that child metrics mathematically roll up
   to parent metrics. Document the roll-up formulas.
8. **Set targets** -- For each metric, establish a baseline (current value) and a target
   (desired value with timeframe).
9. **Identify leading vs. lagging** -- Tag each metric as leading or lagging. Ensure each
   team has at least one leading indicator.
10. **Visualize the tree** -- Create a visual diagram of the full KPI tree. Include metric
    names, owners, baselines, and targets.
11. **Review and iterate** -- Present the tree to all stakeholders. Adjust based on feedback.
12. **Publish** -- Add all metrics to the metric registry with parent-child relationships.

## Deliverable
A complete KPI tree document containing:
- Visual tree diagram (3-4 levels deep).
- Formal definition for every metric node.
- Owner assignment for each metric.
- Baseline and target values.
- Roll-up formulas proving mathematical consistency.

## Quality Gate
- [ ] Tree is rooted at the documented North Star Metric.
- [ ] Decomposition is MECE at every level.
- [ ] Every Level 2+ metric has an assigned team owner.
- [ ] Roll-up math is validated and documented.
- [ ] Every metric has a formal written definition.
- [ ] Baselines are set from real data (not estimates).
- [ ] Targets are time-bound and approved by stakeholders.
- [ ] Tree has been reviewed by at least 2 cross-functional leads.

## Registry Update
- Add all new metrics to `metric-registry` with `parent` field linking to their parent node.
- Tag each metric with `level: 1|2|3` and `owner: <team>`.
- Log task completion in `task-log` with artifact links.

---

## Operational Details

### Handoff Rules
- **Lead agent:** data-chief owns this task end-to-end.
- **Supporting agents:** avinash-kaushik, sean-ellis contribute to their domain-specific steps.
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
- **Applicable gate:** G1 -- Definition
- **Must-pass checklists:** `checklists/kpi-tree-quality.md`, `checklists/kaushik/dmmm-measurement-model-audit.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/metric-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [kpi-tree](../../frameworks/kpi-tree.md), [dmmm-kaushik](../../frameworks/dmmm-kaushik.md), [aarrr-pirate-metrics](../../frameworks/aarrr-pirate-metrics.md)
- **Checklists:** [kpi-tree-quality](../../checklists/kpi-tree-quality.md), [kaushik/dmmm-measurement-model-audit](../../checklists/kaushik/dmmm-measurement-model-audit.md)
- **Templates:** [outputs/kpi-tree](../../templates/outputs/kpi-tree.md)
- **Workflows:** [north-star-definition-workflow](../../workflows/north-star-definition-workflow.md)
