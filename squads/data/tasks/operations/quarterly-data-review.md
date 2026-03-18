# Task: Quarterly Data Review
> Agent(s): data-chief
> Frameworks: governance-layer, ralphloop-data-ops
> Checklists: (none)
> Templates: reports/quarterly-data-review
> Registry: decision-registry, lessons-learned-registry

## Objective
Conduct a comprehensive quarterly review of the data team's performance, the analytics
ecosystem health, and strategic alignment, producing a plan for the next quarter that
maximizes the data team's impact on the business.

## Prerequisites
- Quarter's work is completed and logged.
- Metric registry, experiment registry, and task log are current.
- Stakeholder feedback is gathered (or will be gathered in this task).
- Data quality review and governance review results are available.

## Steps
1. **Review team output** -- Summarize the quarter's deliverables:
   - Analyses completed (count, types, impact).
   - Experiments supported (count, win rate, shipped impact).
   - Dashboards built or improved.
   - Data infrastructure improvements.
   - Metrics defined or refined.
2. **Assess OKR/goal achievement** -- Review the quarter's goals:
   - For each goal, measure actual vs. target.
   - Classify as: exceeded, met, partially met, or missed.
   - Document the root cause for missed goals.
3. **Review data quality** -- Summarize the state of data quality:
   - Current Data Quality Index (from data-quality-review).
   - Trend vs. prior quarter.
   - Outstanding data quality issues and remediation progress.
4. **Review metric governance** -- Summarize governance health:
   - Metric registry completeness.
   - Duplicate and orphan metric status.
   - Naming convention compliance.
5. **Review experiment program** -- Summarize experimentation:
   - Total experiments run.
   - Win rate and cumulative shipped impact.
   - Experiment velocity (experiments per month).
   - Process improvements made.
6. **Gather stakeholder feedback** -- Survey or interview key stakeholders:
   - How satisfied are you with data team responsiveness? (1-5)
   - How much do you trust the data? (1-5)
   - What was the most impactful analysis this quarter?
   - What data capability is most needed next quarter?
7. **Assess team health** -- Review internal team factors:
   - Team capacity utilization (overloaded or underloaded?).
   - Skill gaps identified.
   - Tool and infrastructure pain points.
   - Team satisfaction and morale.
8. **Review the data debt register** -- Check progress on data debt remediation:
   - Quick wins completed.
   - Medium-term projects progressing.
   - New debt accumulated.
9. **Identify top learnings** -- Document the 5 most important things learned:
   - About the business.
   - About users.
   - About the data infrastructure.
   - About the team's process.
10. **Plan next quarter** -- Based on all inputs, define next quarter's plan:
    - 3-5 OKRs or major goals.
    - Prioritized project list.
    - Capacity allocation (% to analysis, experiments, infrastructure, debt).
    - Hiring or skill development needs.
    - Process improvements to implement.
11. **Present the review** -- Share the quarterly review with:
    - Data team (internal retrospective).
    - Leadership (strategic alignment and resource requests).
    - Stakeholders (feedback acknowledgment and next quarter preview).
12. **Document and archive** -- Save the quarterly review document for future reference.

## Deliverable
A quarterly data review document containing:
- Team output summary.
- OKR achievement assessment.
- Data quality and governance status.
- Experiment program performance.
- Stakeholder feedback summary.
- Team health assessment.
- Top 5 learnings.
- Next quarter plan with OKRs and priorities.

## Quality Gate
- [ ] All major deliverables from the quarter are cataloged.
- [ ] OKR achievement is measured with actual vs. target.
- [ ] Data quality trend is documented (improving or declining).
- [ ] At least 5 stakeholders provided feedback.
- [ ] Team health is assessed honestly.
- [ ] Next quarter has 3-5 defined OKRs.
- [ ] Capacity allocation is specified.
- [ ] Review is presented to leadership.

## Registry Update
- Archive current quarter metrics baselines in `metric-registry`.
- Update `analysis-registry` with quarter summary.
- Set new quarter's OKR targets in `task-log`.
- Log review completion in `task-log`.

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
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/lessons-learned-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [governance-layer](../../frameworks/governance-layer.md), [ralphloop-data-ops](../../frameworks/ralphloop-data-ops.md)
- **Templates:** [reports/quarterly-data-review](../../templates/reports/quarterly-data-review.md)
- **Workflows:** [quarterly-data-review-workflow](../../workflows/quarterly-data-review-workflow.md)
