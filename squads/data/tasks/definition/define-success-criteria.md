# Task: Define Success Criteria
> Agent(s): data-chief, sean-ellis, avinash-kaushik
> Frameworks: kpi-tree, north-star-metric
> Checklists: metric-definition-quality, kpi-tree-quality
> Templates: outputs/metric-definition
> Registry: metric-registry, experiment-registry

## Objective
Establish clear, measurable success criteria for a product initiative, feature launch, or
project so that the team knows exactly what "done and successful" looks like before work begins.

## Prerequisites
- Initiative or feature brief is written and approved.
- Relevant metrics are defined in the metric registry.
- Baseline data is available for target-setting.
- Stakeholders have agreed on the initiative scope.

## Steps
1. **Clarify the initiative** -- Summarize the initiative in one sentence. Identify the
   target user segment and the problem being solved.
2. **State the hypothesis** -- Write a falsifiable hypothesis: "We believe that [change]
   will cause [outcome] for [segment], measured by [metric] moving from [baseline] to
   [target] within [timeframe]."
3. **Select primary metric** -- Choose the single metric that best measures success. It
   must exist in the metric registry or be defined first (see define-metric-officially).
4. **Select secondary metrics** -- Choose 2-4 supporting metrics that provide additional
   signal. Include at least one guardrail metric (a metric that must NOT degrade).
5. **Set baselines** -- Pull current values for all selected metrics. Document the data
   source, time range, and any seasonality considerations.
6. **Set targets** -- For each metric, define:
   - Minimum success threshold (the floor for shipping).
   - Target value (the expected outcome).
   - Stretch goal (best-case scenario).
   Document the rationale for each threshold.
7. **Define the measurement window** -- Specify when measurement begins (e.g., launch date)
   and when the success decision will be made (e.g., 4 weeks post-launch).
8. **Define segments** -- Specify if success criteria differ by segment (e.g., new users vs.
   returning users, mobile vs. desktop).
9. **Specify the decision rule** -- Write the explicit rule: "We will consider this
   initiative successful if [primary metric] exceeds [minimum threshold] AND [guardrail
   metrics] do not degrade by more than [X%]."
10. **Document risks and caveats** -- Note known risks: seasonality, concurrent launches,
    data quality concerns, or external factors that could confound measurement.
11. **Get sign-off** -- Review criteria with PM, engineering lead, and data lead. All must
    agree before development starts.
12. **Publish** -- Record the success criteria document and link it to the initiative.

## Deliverable
A success criteria document containing:
- Initiative summary and hypothesis.
- Primary metric with baseline, thresholds, and target.
- Secondary and guardrail metrics with baselines and targets.
- Measurement window and decision rule.
- Segment-specific criteria (if applicable).
- Risk register and stakeholder sign-off.

## Quality Gate
- [ ] Hypothesis is falsifiable and specific.
- [ ] Primary metric exists in the metric registry.
- [ ] Baselines are pulled from real data (not estimated).
- [ ] Minimum threshold, target, and stretch goal are all defined.
- [ ] At least one guardrail metric is included.
- [ ] Measurement window has a defined start and end date.
- [ ] Decision rule is explicit and unambiguous.
- [ ] At least 3 stakeholders have signed off.

## Registry Update
- Link success criteria to the initiative in `experiment-registry` (if experiment) or
  `metric-registry` (if ongoing metric target).
- Record baseline snapshots in `metric-registry` with `baseline_date` tag.
- Log task completion in `task-log` with initiative ID and artifact links.

---

## Operational Details

### Handoff Rules
- **Lead agent:** data-chief owns this task end-to-end.
- **Supporting agents:** sean-ellis, avinash-kaushik contribute to their domain-specific steps.
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
- **Must-pass checklists:** `checklists/metric-definition-quality.md`, `checklists/kpi-tree-quality.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/metric-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/experiment-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [kpi-tree](../../frameworks/kpi-tree.md), [north-star-metric](../../frameworks/north-star-metric.md)
- **Checklists:** [metric-definition-quality](../../checklists/metric-definition-quality.md), [kpi-tree-quality](../../checklists/kpi-tree-quality.md)
- **Templates:** [outputs/metric-definition](../../templates/outputs/metric-definition.md)
