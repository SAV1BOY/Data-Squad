# Task: Define North Star Metric
> Agent(s): data-chief, sean-ellis, wes-kao, avinash-kaushik
> Frameworks: north-star-metric, kpi-tree, ellis-growth-equation, kao-spiky-pov-framework
> Checklists: kpi-tree-quality, metric-definition-quality, ellis/north-star-metric-audit, kao/growth-strategy-clarity
> Templates: outputs/kpi-tree, outputs/metric-definition
> Registry: metric-registry, decision-registry

## Objective
Identify and formally define the single North Star Metric (NSM) that best captures the core value
the product delivers to customers, aligning the entire organization around one measurable outcome.

## Prerequisites
- Product vision and mission statement are documented.
- Business model canvas or lean canvas is available.
- Access to historical product usage data (minimum 6 months).
- Stakeholder alignment on what "value delivered to customers" means.
- Existing KPI documentation (if any) has been reviewed.

## Steps
1. **Gather context** -- Review the product vision, mission, and current business model.
   Collect any existing metric definitions and dashboards.
2. **Map value exchange** -- Identify the core action that represents value delivery to the
   customer. Document who the customer is, what value they receive, and how frequency of
   that value correlates with retention and revenue.
3. **Brainstorm candidate metrics** -- Generate a long-list of 5-10 candidate metrics.
   For each, note: definition, data source, current measurement capability, and alignment
   with the value exchange.
4. **Apply NSM filters** -- Score each candidate against six criteria:
   a. Expresses value delivered to the customer.
   b. Represents the product vision and strategy.
   c. Is a leading indicator of revenue.
   d. Is measurable with current or near-term instrumentation.
   e. Is actionable by multiple teams.
   f. Is understandable by non-technical stakeholders.
5. **Select the NSM** -- Choose the highest-scoring metric. If there is a tie, prefer the
   metric with stronger leading-indicator properties.
6. **Define precisely** -- Write the formal metric definition including:
   - Metric name
   - Business question it answers
   - Numerator / denominator (if ratio)
   - Unit of measurement
   - Granularity (daily / weekly / monthly)
   - Segments and dimensions
   - Data source and table references
   - Known caveats or exclusions
7. **Identify input metrics** -- Decompose the NSM into 3-5 input metrics (breadth, depth,
   frequency, efficiency). These form the first level of the KPI tree.
8. **Validate with data** -- Pull historical data for the chosen NSM. Confirm it correlates
   with retention (r > 0.5) and revenue (r > 0.3). Document the validation.
9. **Stress-test with stakeholders** -- Present the proposed NSM to leadership, product, and
   engineering. Gather objections and iterate.
10. **Document and publish** -- Finalize the NSM definition document and publish to the
    metric registry.

## Deliverable
A completed North Star Metric definition document containing:
- The chosen NSM with full formal definition.
- Rationale for selection with scoring against criteria.
- Input metric decomposition diagram.
- Historical validation charts and correlation analysis.
- Stakeholder sign-off record.

## Quality Gate
- [ ] NSM has a single, unambiguous written definition.
- [ ] NSM passes all six filter criteria with score >= 4/5 each.
- [ ] Correlation with retention validated (r > 0.5).
- [ ] Correlation with revenue validated (r > 0.3).
- [ ] Input metrics identified (minimum 3).
- [ ] At least 3 stakeholders have reviewed and approved.
- [ ] Definition is recorded in the metric registry.
- [ ] Historical baseline is established (min 6 months of data).

## Registry Update
- Add NSM entry to `metric-registry` with status `active`.
- Record input metrics with `parent: <NSM-id>` linkage.
- Log task completion in `task-log` with date, author, and artifact links.

---

## Operational Details

### Handoff Rules
- **Lead agent:** data-chief owns this task end-to-end.
- **Supporting agents:** sean-ellis, wes-kao, avinash-kaushik contribute to their domain-specific steps.
- **Review:** sean-ellis reviews the final deliverable before it exits the squad.
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
- **Must-pass checklists:** `checklists/kpi-tree-quality.md`, `checklists/metric-definition-quality.md`, `checklists/ellis/north-star-metric-audit.md`, `checklists/kao/growth-strategy-clarity.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/metric-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [north-star-metric](../../frameworks/north-star-metric.md), [kpi-tree](../../frameworks/kpi-tree.md), [ellis-growth-equation](../../frameworks/ellis-growth-equation.md), [kao-spiky-pov-framework](../../frameworks/kao-spiky-pov-framework.md)
- **Checklists:** [kpi-tree-quality](../../checklists/kpi-tree-quality.md), [metric-definition-quality](../../checklists/metric-definition-quality.md), [ellis/north-star-metric-audit](../../checklists/ellis/north-star-metric-audit.md), [kao/growth-strategy-clarity](../../checklists/kao/growth-strategy-clarity.md)
- **Templates:** [outputs/kpi-tree](../../templates/outputs/kpi-tree.md), [outputs/metric-definition](../../templates/outputs/metric-definition.md)
- **Workflows:** [north-star-definition-workflow](../../workflows/north-star-definition-workflow.md)
