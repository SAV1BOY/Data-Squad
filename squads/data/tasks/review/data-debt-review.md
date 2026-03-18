# Task: Data Debt Review
> Agent(s): data-chief, avinash-kaushik
> Frameworks: data-quality-triad, governance-layer
> Checklists: data-quality-quality, governance/data-debt-audit
> Templates: reports/data-quality-report
> Registry: data-debt-registry, data-quality-registry

## Objective
Identify, catalog, and prioritize data debt across the analytics stack -- including broken
tracking, outdated definitions, manual processes, and architectural shortcuts -- to create
a remediation roadmap that prevents data quality erosion.

## Prerequisites
- Access to the data warehouse, pipelines, analytics platforms, and code repositories.
- Event and metric registries are available.
- Results from recent data quality reviews (if any).
- Engineering and analyst team availability for assessment.

## Steps
1. **Define data debt categories** -- Establish the taxonomy of debt:
   - Tracking debt: broken, missing, or outdated event tracking.
   - Definition debt: metrics with ambiguous, outdated, or conflicting definitions.
   - Pipeline debt: fragile, slow, or undocumented data pipelines.
   - Documentation debt: missing or stale documentation.
   - Architecture debt: suboptimal data models, missing semantic layer.
   - Process debt: manual steps that should be automated.
   - Tool debt: unused tools still incurring cost, or missing tools.
2. **Audit tracking debt** -- Review the event registry:
   - Events that fire but are never used in any analysis.
   - Events that should fire but are missing.
   - Events with known data quality issues that have not been fixed.
   - Tracking that was temporarily implemented and never cleaned up.
3. **Audit definition debt** -- Review the metric registry:
   - Metrics without formal definitions.
   - Metrics with multiple conflicting definitions across teams.
   - Metrics that have drifted from their original definition.
   - Deprecated metrics still appearing in dashboards.
4. **Audit pipeline debt** -- Review data pipelines:
   - Pipelines with no error handling or alerting.
   - Pipelines with hardcoded values or magic numbers.
   - Pipelines that are single points of failure (no redundancy).
   - Pipelines with no documentation or owner.
5. **Audit documentation debt** -- Assess documentation coverage:
   - What % of metrics have complete documentation?
   - What % of pipelines have runbooks?
   - When was documentation last updated?
   - Are there tribal knowledge dependencies (only one person knows)?
6. **Audit architecture debt** -- Evaluate the data architecture:
   - Is there a semantic layer or single source of truth?
   - Are there data silos that should be integrated?
   - Are there performance bottlenecks in the warehouse?
   - Is the schema design optimal for common query patterns?
7. **Audit process debt** -- Identify manual processes:
   - Reports generated manually (copy-paste from dashboards).
   - Data checks done manually that should be automated.
   - Approval workflows that are informal or inconsistent.
8. **Score each debt item** -- For every identified item:
   - Impact: how much damage is this causing? (1-5)
   - Risk: what is the probability of a negative incident? (1-5)
   - Effort: how hard is it to fix? (1-5, where 5 = easiest)
   - Priority Score = Impact x Risk x Effort.
9. **Calculate total data debt cost** -- Estimate the annual cost of data debt:
   - Analyst time spent on workarounds.
   - Decision errors from inaccurate data.
   - Incident response costs.
   - Opportunity cost of delayed analyses.
10. **Build the remediation roadmap** -- Sort items by priority score. Group into:
    - Quick wins (high priority, low effort): fix within 2 weeks.
    - Medium-term projects (high priority, medium effort): plan for next quarter.
    - Strategic investments (high priority, high effort): plan for next half.
11. **Assign owners** -- Every remediation item needs an owner and a deadline.
12. **Present and commit** -- Share the data debt review with leadership. Get commitment
    to allocate a % of data team capacity to debt remediation (recommend 20%).

## Deliverable
A data debt review report containing:
- Debt inventory by category.
- Priority scores for each debt item.
- Total data debt cost estimate.
- Remediation roadmap (quick wins, medium-term, strategic).
- Owner assignments.
- Recommendation for ongoing debt management.

## Quality Gate
- [ ] All six debt categories are assessed.
- [ ] Each debt item has Impact, Risk, and Effort scores.
- [ ] Total data debt cost is estimated.
- [ ] Remediation roadmap has three horizons (quick wins, medium, strategic).
- [ ] Every remediation item has an owner.
- [ ] Leadership commitment to remediation capacity is secured.
- [ ] Quick wins are actionable within 2 weeks.
- [ ] Review findings are shared with the full data team.

## Registry Update
- Flag affected items in `event-registry` and `metric-registry` with debt tags.
- Create remediation tickets linked to registry entries.
- Log review in `task-log` with debt count and estimated cost.

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
- **Must-pass checklists:** `checklists/data-quality-quality.md`, `checklists/governance/data-debt-audit.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/data-debt-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/data-quality-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [data-quality-triad](../../frameworks/data-quality-triad.md), [governance-layer](../../frameworks/governance-layer.md)
- **Checklists:** [data-quality-quality](../../checklists/data-quality-quality.md), [governance/data-debt-audit](../../checklists/governance/data-debt-audit.md)
- **Templates:** [reports/data-quality-report](../../templates/reports/data-quality-report.md)
