# Task: Metric Governance Review
> Agent(s): data-chief, avinash-kaushik
> Frameworks: governance-layer, metric-lifecycle-framework
> Checklists: governance/metric-governance, governance/data-catalog-quality
> Templates: (none)
> Registry: metric-registry

## Objective
Conduct a periodic review of the metric registry and governance processes to ensure all
metrics remain accurate, relevant, consistently defined, and properly owned, preventing
metric sprawl and definition drift.

## Prerequisites
- Metric registry exists with defined metrics.
- Previous governance review results (if any).
- Access to dashboards and reports using these metrics.
- Metric owners are identifiable.

## Steps
1. **Pull the metric inventory** -- Export the full metric registry. Note total count,
   status distribution (active, deprecated, draft), and ownership coverage.
2. **Check definition completeness** -- For each active metric, verify:
   - Name follows naming convention.
   - Formula is documented and unambiguous.
   - Data source is specified.
   - Owner is assigned and current.
   - Last review date is within the governance cycle.
   Flag incomplete metrics.
3. **Check for duplicates** -- Identify metrics that measure the same thing with
   different names or slightly different definitions. These create confusion and must
   be consolidated.
4. **Check for orphans** -- Identify metrics that are:
   - Not used in any dashboard or report.
   - Not referenced by any team or process.
   - Not part of the KPI tree.
   Recommend deprecation for unused metrics.
5. **Validate metric accuracy** -- For a sample of 10 metrics:
   - Recalculate from raw data using the documented formula.
   - Compare to the value shown in dashboards.
   - Flag discrepancies > 1%.
6. **Check cross-tool consistency** -- For metrics that appear in multiple tools
   (BI platform, analytics tool, spreadsheets), verify they show the same value.
   Document any discrepancies and root causes.
7. **Review ownership** -- Verify that every metric has an active owner:
   - Has the owner left the team or company?
   - Does the owner still acknowledge responsibility?
   - Are there metrics with no owner?
   Reassign orphaned metrics.
8. **Review naming conventions** -- Check if the naming convention is consistently
   applied across all metrics. Flag violations and recommend corrections.
9. **Assess metric proliferation** -- Evaluate the total metric count:
   - Is the registry growing faster than necessary?
   - Are there metrics that should be combined?
   - Is there a clear rationale for every metric?
10. **Update the governance policy** -- Based on findings, update:
    - Definition requirements (any new mandatory fields).
    - Review cadence (increase or decrease frequency).
    - Approval process for new metrics.
    - Deprecation process for unused metrics.
11. **Remediate findings** -- Create tickets for:
    - Incomplete definitions to be updated.
    - Duplicates to be consolidated.
    - Orphans to be deprecated.
    - Ownership to be reassigned.
12. **Report and communicate** -- Share the governance review findings with all metric
    owners and stakeholders.

## Deliverable
A metric governance review report containing:
- Metric inventory summary (count, status, completeness).
- Duplicate and orphan metric lists.
- Accuracy validation results.
- Cross-tool consistency findings.
- Ownership audit results.
- Naming convention compliance report.
- Updated governance policy.
- Remediation plan with tickets.

## Quality Gate
- [ ] All active metrics are reviewed for completeness.
- [ ] Duplicate metrics are identified and consolidation plan exists.
- [ ] Orphan metrics are flagged for deprecation.
- [ ] At least 10 metrics are validated for accuracy.
- [ ] Cross-tool consistency is checked for key metrics.
- [ ] Every metric has an active, acknowledged owner.
- [ ] Remediation tickets are created for all findings.
- [ ] Governance policy is updated if needed.

## Registry Update
- Update `metric-registry` with review dates and status changes.
- Deprecate orphan metrics with `status: deprecated`.
- Reassign ownership where needed.
- Log review in `task-log` with finding counts and remediation ticket links.

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
- **Applicable gate:** G5 -- Decision + Registry
- **Must-pass checklists:** `checklists/governance/metric-governance.md`, `checklists/governance/data-catalog-quality.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/metric-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [governance-layer](../../frameworks/governance-layer.md), [metric-lifecycle-framework](../../frameworks/metric-lifecycle-framework.md)
- **Checklists:** [governance/metric-governance](../../checklists/governance/metric-governance.md), [governance/data-catalog-quality](../../checklists/governance/data-catalog-quality.md)
- **Workflows:** [metric-deprecation-workflow](../../workflows/metric-deprecation-workflow.md)
