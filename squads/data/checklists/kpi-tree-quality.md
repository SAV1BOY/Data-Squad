# KPI Tree Quality Checklist
> Gate type: Review
> Owner: Data Chief
> Applies to: KPI tree diagrams, metric hierarchy documents, and north-star metric frameworks

## Purpose
A KPI tree translates a company's north-star metric into a decomposition of drivers, inputs, and levers that individual teams can influence. A poorly constructed tree creates confusion about what teams should optimise, hides trade-offs, and disconnects operational metrics from business outcomes. This gate ensures the tree is logically sound, owned, and actionable.

## Checklist Items

1. - [ ] **North-star metric stated** -- The top of the tree declares a single north-star metric with its definition.
   - Pass criteria: One metric at the apex; its formula, source, and time window are referenced or linked.
   - Fail signal: Multiple metrics at the top with no declared primary; or north-star metric undefined.
   - Action if fail: Agree on a single north-star metric with leadership and place it at the apex.

2. - [ ] **Mathematical decomposition** -- Each level of the tree decomposes the parent metric through arithmetic (multiplication, addition, ratio).
   - Pass criteria: Parent = f(children) is verifiable; e.g., Revenue = Users x ARPU, and the math checks out with real data.
   - Fail signal: Children are thematically related but do not mathematically sum or multiply to the parent.
   - Action if fail: Rework the decomposition so the relationship is arithmetic, not just conceptual.

3. - [ ] **Driver completeness** -- All material drivers are represented; no major lever is missing.
   - Pass criteria: Sensitivity analysis shows that the included drivers explain at least 90% of variance in the parent metric.
   - Fail signal: Known drivers omitted (e.g., pricing absent from a revenue tree); residual variance unexplained.
   - Action if fail: Identify missing drivers through variance analysis and add them to the tree.

4. - [ ] **No orphan metrics** -- Every metric in the tree connects upward to the north star; no metric floats disconnected.
   - Pass criteria: Tracing any leaf metric upward reaches the north-star metric through documented relationships.
   - Fail signal: Metrics appear on the tree diagram but have no connecting line to a parent.
   - Action if fail: Either connect orphan metrics to a parent or remove them from the tree.

5. - [ ] **Leaf-level actionability** -- Every leaf metric can be directly influenced by a specific team's actions.
   - Pass criteria: Each leaf has a named team and at least one example action that would move the metric.
   - Fail signal: Leaf metrics are too abstract (e.g., "brand awareness") with no actionable lever.
   - Action if fail: Decompose further until the leaf is something a team can run an experiment on.

6. - [ ] **Owner assignment** -- Every node in the tree has a named owner (team or individual).
   - Pass criteria: Owner column or label present on every node; no node says "TBD" or is blank.
   - Fail signal: Owners missing or assigned to defunct teams.
   - Action if fail: Assign current team or individual owners and confirm accountability.

7. - [ ] **Target values** -- Each metric in the tree has a current value and a target value for the planning period.
   - Pass criteria: Current and target columns filled; targets are quantitative and time-bound.
   - Fail signal: Targets missing, aspirational without basis, or expressed as "improve."
   - Action if fail: Set targets based on historical trends, benchmarks, or leadership guidance.

8. - [ ] **Trade-off identification** -- The tree documents known trade-offs between sibling metrics.
   - Pass criteria: At least the top two trade-offs are noted (e.g., "increasing acquisition volume may decrease lead quality").
   - Fail signal: No trade-offs mentioned; tree implies all metrics can be maximised simultaneously.
   - Action if fail: Identify trade-offs through stakeholder interviews and add annotations.

9. - [ ] **Data availability** -- Every metric in the tree can be computed from data that currently exists in the warehouse.
   - Pass criteria: Each metric links to a metric definition with confirmed data source.
   - Fail signal: Metrics in the tree have no data source or require instrumentation that does not yet exist.
   - Action if fail: Flag data gaps, create instrumentation tickets, and mark the metric as "pending data."

10. - [ ] **Refresh cadence** -- The tree specifies how often each metric is reviewed and the tree itself is updated.
    - Pass criteria: Cadence stated (e.g., "leaf metrics reviewed weekly; tree structure reviewed quarterly").
    - Fail signal: No cadence defined; tree becomes stale without anyone noticing.
    - Action if fail: Set review cadences per tree level and assign a calendar owner.

11. - [ ] **Visual clarity** -- The tree diagram is readable without explanation; relationships, directions, and labels are clear.
    - Pass criteria: A new team member can read the tree and explain the decomposition without guidance.
    - Fail signal: Diagram is cluttered, uses ambiguous arrows, or requires a verbal walkthrough to understand.
    - Action if fail: Simplify the layout, add labels to connections, and test readability with a fresh viewer.

## Cross-References
- [Metric Definition Quality Checklist](metric-definition-quality.md)
- [Dashboard Quality Checklist](dashboard-quality.md)
- [Activation Funnel Quality Checklist](activation-funnel-quality.md)
- [Retention Quality Checklist](retention-quality.md)
