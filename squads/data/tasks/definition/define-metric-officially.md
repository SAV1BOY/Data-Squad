# Task: Define Metric Officially
> Agent(s): data-chief, avinash-kaushik
> Frameworks: metric-lifecycle-framework, kaushik-10-90-rule
> Checklists: metric-definition-quality, kaushik/metrics-that-matter-filter
> Templates: outputs/metric-definition
> Registry: metric-registry, glossary

## Objective
Create a complete, unambiguous, official definition for a single metric so that every team
member calculates and interprets it identically, eliminating metric discrepancies across tools.

## Prerequisites
- The metric need has been identified (from KPI tree, stakeholder request, or project brief).
- Access to the data warehouse schema documentation.
- Understanding of the business context the metric serves.
- Metric registry is accessible for duplicate checks.

## Steps
1. **Check for duplicates** -- Search the metric registry for existing metrics that may
   already cover the same concept. If a duplicate exists, update it instead of creating new.
2. **State the business question** -- Write the plain-language question this metric answers.
   Example: "How many users complete onboarding within their first 7 days?"
3. **Choose metric type** -- Classify as: count, ratio, rate, average, percentile, or
   composite. Document the rationale.
4. **Write the formula** -- Define numerator and denominator (if applicable). Specify
   aggregation method (SUM, COUNT DISTINCT, AVG, etc.).
5. **Specify filters and exclusions** -- Document which records are included and excluded.
   Examples: test accounts, internal users, specific geographies.
6. **Define dimensions** -- List the standard breakdowns: time grain, platform, geography,
   user segment, plan type.
7. **Set granularity** -- Specify the finest grain (event-level, daily, weekly) and standard
   reporting grain.
8. **Identify data source** -- Document the exact table(s), column(s), and any joins needed.
   Include the SQL or pseudocode for the canonical calculation.
9. **Define SLA** -- Specify data freshness requirement (e.g., T+1 by 08:00 UTC) and
   acceptable latency.
10. **Assign ownership** -- Name the metric owner (team and individual) responsible for
    accuracy and maintenance.
11. **Document known caveats** -- List edge cases, known data quality issues, and
    interpretation warnings.
12. **Peer review** -- Have another analyst independently calculate the metric from the
    definition and compare results. Discrepancies must be resolved.
13. **Publish to registry** -- Add the finalized definition to the metric registry.

## Deliverable
A metric definition record containing:
- Metric name (following naming convention: `domain_entity_measure_granularity`).
- Business question answered.
- Formula with SQL reference implementation.
- Filters, exclusions, dimensions, and granularity.
- Data source references.
- Owner and SLA.
- Caveats and interpretation guide.

## Quality Gate
- [ ] Metric name follows naming convention.
- [ ] No duplicate exists in the metric registry.
- [ ] Formula is unambiguous and includes SQL reference.
- [ ] Filters and exclusions are explicitly documented.
- [ ] At least one dimension breakdown is specified.
- [ ] Data source and table references are valid.
- [ ] Peer review completed with matching results (< 1% variance).
- [ ] Owner is assigned and has acknowledged ownership.

## Registry Update
- Add metric to `metric-registry` with all fields populated.
- Set `status: active` and `created_date: <today>`.
- Link to parent metric in KPI tree if applicable.
- Log in `task-log` with metric ID and author.

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
- **Applicable gate:** G1 -- Definition
- **Must-pass checklists:** `checklists/metric-definition-quality.md`, `checklists/kaushik/metrics-that-matter-filter.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/metric-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/glossary.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [metric-lifecycle-framework](../../frameworks/metric-lifecycle-framework.md), [kaushik-10-90-rule](../../frameworks/kaushik-10-90-rule.md)
- **Checklists:** [metric-definition-quality](../../checklists/metric-definition-quality.md), [kaushik/metrics-that-matter-filter](../../checklists/kaushik/metrics-that-matter-filter.md)
- **Templates:** [outputs/metric-definition](../../templates/outputs/metric-definition.md)
- **Workflows:** [metric-deprecation-workflow](../../workflows/metric-deprecation-workflow.md)
