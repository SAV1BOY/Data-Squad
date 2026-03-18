# Task: Design Experiment
> Agent(s): sean-ellis, wes-kao, data-chief
> Frameworks: experiment-framework, ellis-high-tempo-testing, ice-pie-rice-prioritization
> Checklists: experiment-design-quality, experimentation/sample-size-and-mde, experimentation/randomization-and-bias, experimentation/guardrails-and-metrics
> Templates: outputs/experiment-onepager
> Registry: experiment-registry

## Objective
Design a rigorous experiment (A/B test) with proper statistical methodology, clear hypotheses,
and pre-registered success criteria to measure the causal impact of a product change.

## Prerequisites
- Feature or change to test is defined and technically feasible.
- Success criteria task has been completed for this initiative.
- Sufficient traffic/user volume for statistical power.
- Experimentation platform is set up and functional.
- No conflicting experiments running on the same user population.

## Steps
1. **State the hypothesis** -- Write a specific, falsifiable hypothesis: "Changing [X] will
   cause [metric] to increase/decrease by [minimum detectable effect] for [population]."
2. **Select metrics** -- Define:
   - Primary metric: the single metric that determines success.
   - Secondary metrics: additional signals (2-4 metrics).
   - Guardrail metrics: metrics that must not degrade (1-3 metrics).
3. **Calculate sample size** -- Using power analysis, determine the required sample size:
   - Baseline conversion rate or metric mean.
   - Minimum detectable effect (MDE) in absolute or relative terms.
   - Statistical significance level (alpha = 0.05 typically).
   - Statistical power (1 - beta = 0.80 typically).
   Document the calculation and tool used.
4. **Estimate experiment duration** -- Based on sample size and daily traffic, calculate
   how long the experiment must run. Add buffer for weekly cyclicality (run full weeks).
5. **Define randomization unit** -- Specify: user-level, session-level, or device-level.
   User-level is preferred. Document the hashing mechanism.
6. **Define variants** -- Describe each variant:
   - Control: current experience (describe precisely).
   - Treatment(s): changed experience (describe precisely).
   - Traffic allocation per variant (50/50 for two-variant).
7. **Identify exclusions** -- Define who is excluded from the experiment: internal users,
   bots, users in other experiments, specific segments.
8. **Pre-register the analysis plan** -- Document before launch:
   - Statistical test to use (t-test, chi-squared, Mann-Whitney, etc.).
   - One-tailed vs. two-tailed test.
   - How to handle multiple comparisons (Bonferroni, FDR).
   - Segment analyses planned.
   - Decision criteria: what result leads to ship, iterate, or kill.
9. **Check for interaction effects** -- Review active experiments. Ensure no interference
   with concurrent tests. If overlap exists, plan for interaction analysis.
10. **Set up monitoring** -- Define what to monitor during the experiment:
    - Sample ratio mismatch (SRM) check.
    - Guardrail metric alerts.
    - Data quality checks.
11. **Document the experiment** -- Write the full experiment design document and register it.
12. **Review with stakeholders** -- Get sign-off from PM, engineering, and data team before
    launching.

## Deliverable
An experiment design document containing:
- Hypothesis statement.
- Metric selection (primary, secondary, guardrail).
- Power analysis with sample size and duration.
- Randomization and allocation plan.
- Variant descriptions.
- Pre-registered analysis plan.
- Monitoring plan.
- Stakeholder sign-off.

## Quality Gate
- [ ] Hypothesis is specific and falsifiable.
- [ ] Primary metric is defined in the metric registry.
- [ ] Power analysis is documented with all parameters.
- [ ] Experiment duration accounts for weekly cyclicality.
- [ ] At least one guardrail metric is defined.
- [ ] Analysis plan is pre-registered before launch.
- [ ] No conflicting experiments on the same population.
- [ ] Design document is reviewed by at least 2 team members.

## Registry Update
- Create entry in `experiment-registry` with status `designed`.
- Link to metric definitions in `metric-registry`.
- Log task completion in `task-log` with experiment ID.

---

## Operational Details

### Handoff Rules
- **Lead agent:** sean-ellis owns this task end-to-end.
- **Supporting agents:** wes-kao, data-chief contribute to their domain-specific steps.
- **Review:** data-chief reviews the final deliverable before it exits the squad.
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
- **Applicable gate:** G4 -- Insight
- **Must-pass checklists:** `checklists/experiment-design-quality.md`, `checklists/experimentation/sample-size-and-mde.md`, `checklists/experimentation/randomization-and-bias.md`, `checklists/experimentation/guardrails-and-metrics.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/experiment-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [experiment-framework](../../frameworks/experiment-framework.md), [ellis-high-tempo-testing](../../frameworks/ellis-high-tempo-testing.md), [ice-pie-rice-prioritization](../../frameworks/ice-pie-rice-prioritization.md)
- **Checklists:** [experiment-design-quality](../../checklists/experiment-design-quality.md), [experimentation/sample-size-and-mde](../../checklists/experimentation/sample-size-and-mde.md), [experimentation/randomization-and-bias](../../checklists/experimentation/randomization-and-bias.md), [experimentation/guardrails-and-metrics](../../checklists/experimentation/guardrails-and-metrics.md)
- **Templates:** [outputs/experiment-onepager](../../templates/outputs/experiment-onepager.md)
- **Workflows:** [experiment-cycle-workflow](../../workflows/experiment-cycle-workflow.md)
