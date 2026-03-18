# Task: Metric Sunset
> Agent(s): data-chief
> Frameworks: metric-lifecycle-framework, governance-layer, goodhart-law-framework
> Checklists: metric-definition-quality, governance/metric-governance, governance/data-catalog-quality
> Templates: outputs/metric-definition, operational/metric-change-request
> Registry: metric-registry, glossary

## Objective
Execute a formal deprecation process for metrics that no longer serve active decisions — removing
them from dashboards, reports, and registries to reduce confusion and maintenance overhead.

## Prerequisites
- Access to the metric registry with usage and ownership data.
- Dashboard registry to identify where the metric is displayed.
- Stakeholder list for metrics under review.
- Replacement metric identified (if the underlying business question still matters).

## Steps
1. **Identify sunset candidates** -- Review the metric registry for metrics that meet any criterion:
   - No dashboard or report references the metric in the last 90 days.
   - The metric's owner has left the organization with no successor.
   - The business question the metric answers is no longer relevant.
   - The metric has been superseded by a more accurate or comprehensive metric.
   - The metric exhibits Goodhart's Law effects (being gamed or optimized at the expense of outcomes).
2. **Validate with usage data** -- For each candidate, pull:
   - Query frequency from the data warehouse (how often the underlying table/column is queried).
   - Dashboard view counts where the metric appears.
   - Report inclusion (is it in any scheduled report?).
   - API consumers (is any downstream system pulling this metric?).
3. **Assess impact** -- For each candidate, document:
   - Which teams currently reference the metric.
   - Whether any OKRs, KPIs, or compensation structures depend on it.
   - Whether any contractual or regulatory reporting requires it.
   - The replacement metric (if applicable) and its readiness.
4. **Draft sunset proposal** -- For each metric, write a brief containing:
   - Metric name and current definition.
   - Reason for deprecation.
   - Impact assessment summary.
   - Proposed replacement (or "no replacement needed" with justification).
   - Proposed sunset date (minimum 30 days from notification).
5. **Notify stakeholders** -- Send the sunset proposal to all identified consumers:
   - Allow a 14-day objection window.
   - Provide clear migration instructions if a replacement exists.
   - Offer a 1:1 walkthrough for teams heavily dependent on the metric.
6. **Resolve objections** -- For each objection:
   - If the metric is genuinely needed, remove from the sunset list.
   - If the need can be met by the replacement, document the migration path.
   - If the objection is based on habit rather than decision value, escalate to data-chief.
7. **Execute sunset** -- On the agreed date:
   - Set `status: deprecated` in the metric registry.
   - Remove the metric from active dashboards (replace with the successor if applicable).
   - Remove from scheduled reports.
   - Archive the metric definition (do not delete — retain for historical reference).
8. **Update downstream systems** -- Notify API consumers and downstream pipelines:
   - Provide a deprecation timeline for programmatic consumers.
   - Coordinate with engineering to remove deprecated metric calculations.
9. **Update glossary** -- Remove the metric from the active glossary. Add to the "deprecated
   metrics" section with a pointer to the replacement.
10. **Document lessons learned** -- Record:
    - Why the metric was created and why it failed to remain useful.
    - What could have prevented the need for deprecation.
    - Patterns to watch for in future metric definitions.

## Deliverable
A metric sunset package containing:
- List of deprecated metrics with rationale.
- Impact assessment for each metric.
- Stakeholder notification log and objection resolutions.
- Migration guide for replacement metrics.
- Updated metric registry and glossary.
- Lessons learned summary.

## Quality Gate
- [ ] All sunset candidates validated with usage data.
- [ ] Impact assessment completed for every candidate.
- [ ] Stakeholders notified with 14-day objection window honored.
- [ ] Objections resolved and documented.
- [ ] Metric registry updated with `status: deprecated`.
- [ ] Dashboards and reports updated to remove deprecated metrics.
- [ ] Glossary updated with deprecated section.
- [ ] Lessons learned documented.

## Registry Update
- Update `metric-registry` with `status: deprecated` and `sunset_date`.
- Update `glossary` to move metrics to the deprecated section.
- Log task completion in `task-log`.

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
- **Must-pass checklists:** `checklists/metric-definition-quality.md`, `checklists/governance/metric-governance.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/metric-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/glossary.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [metric-lifecycle-framework](../../frameworks/metric-lifecycle-framework.md), [governance-layer](../../frameworks/governance-layer.md), [goodhart-law-framework](../../frameworks/goodhart-law-framework.md)
- **Checklists:** [metric-definition-quality](../../checklists/metric-definition-quality.md), [governance/metric-governance](../../checklists/governance/metric-governance.md), [governance/data-catalog-quality](../../checklists/governance/data-catalog-quality.md)
- **Templates:** [outputs/metric-definition](../../templates/outputs/metric-definition.md), [operational/metric-change-request](../../templates/operational/metric-change-request.md)
- **Workflows:** [metric-deprecation-workflow](../../workflows/metric-deprecation-workflow.md)
