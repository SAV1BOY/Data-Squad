# Task: Define Success Criteria
> Agent(s): Data Analyst, Product Manager, Data Strategist
> Frameworks: OKR Framework, SMART Goals, Hypothesis-Driven Development
> Checklists: success-criteria-checklist, measurability-checklist
> Template: success-criteria-template
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
