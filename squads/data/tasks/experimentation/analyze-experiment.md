# Task: Analyze Experiment
> Agent(s): sean-ellis, data-chief
> Frameworks: experiment-framework, bayesian-vs-frequentist-testing
> Checklists: experiment-analysis-quality, experimentation/decision-rubric
> Templates: outputs/experiment-analysis, reports/experiment-results-report
> Registry: experiment-registry, decision-registry, lessons-learned-registry

## Objective
Analyze a completed experiment with statistical rigor, following the pre-registered analysis
plan, to determine whether the treatment had a significant causal effect on the primary metric.

## Prerequisites
- Experiment has run for the pre-determined duration.
- Pre-registered analysis plan is available.
- Data has been extracted and validated.
- No known data quality issues during the experiment period.

## Steps
1. **Verify experiment integrity** -- Before analyzing results:
   a. Check for Sample Ratio Mismatch (SRM): actual allocation vs. expected allocation.
      Flag if chi-squared p-value < 0.01.
   b. Verify experiment duration matches the design (full weeks).
   c. Check that no other experiments interfered.
   d. Verify data completeness (no missing days or tracking gaps).
2. **Prepare data** -- Extract user-level data with variant assignment and metric values.
   Apply pre-registered exclusions (bots, internal users, etc.).
3. **Analyze primary metric** -- Following the pre-registered plan:
   a. Calculate metric mean and variance for each variant.
   b. Run the specified statistical test.
   c. Calculate the p-value and confidence interval.
   d. Calculate the observed effect size (absolute and relative).
   e. Determine if the result is statistically significant at alpha = 0.05.
4. **Analyze secondary metrics** -- Repeat statistical tests for each secondary metric.
   Apply multiple comparison correction if pre-registered.
5. **Check guardrail metrics** -- Verify that guardrail metrics did not degrade beyond
   acceptable thresholds. Any guardrail violation is a red flag regardless of primary
   metric results.
6. **Run segment analysis** -- Analyze the primary metric across pre-registered segments:
   - Platform, geography, user tenure, plan type.
   - Check for heterogeneous treatment effects.
   - Flag segments where the effect is directionally different from overall.
7. **Sensitivity analysis** -- Test robustness:
   - Remove outliers (cap at 99th percentile) and re-analyze.
   - Use alternative statistical methods (e.g., Bayesian if frequentist was primary).
   - Check results at different time windows (first week vs. full period).
8. **Estimate practical significance** -- Beyond statistical significance, estimate:
   - Annualized impact on the metric.
   - Revenue or business impact translation.
   - Is the effect large enough to justify the engineering cost?
9. **Formulate recommendation** -- Based on results, recommend:
   - Ship: significant positive effect, no guardrail violations.
   - Iterate: directionally positive but not significant, or mixed segments.
   - Kill: no effect or negative effect.
   - Extend: insufficient power, need more data.
10. **Write the results report** -- Document all findings following the experiment results
    template.
11. **Peer review** -- Have another data scientist review the analysis for correctness.
12. **Present to stakeholders** -- Share results and recommendation. Drive the ship/kill
    decision.

## Deliverable
An experiment results report containing:
- Integrity checks (SRM, duration, data quality).
- Primary metric results with p-value, CI, and effect size.
- Secondary and guardrail metric results.
- Segment analysis findings.
- Sensitivity analysis results.
- Practical significance estimate.
- Clear recommendation (ship/iterate/kill/extend).

## Quality Gate
- [ ] SRM check is passed (or flagged and explained).
- [ ] Analysis follows the pre-registered plan.
- [ ] Primary metric has p-value, confidence interval, and effect size.
- [ ] Guardrail metrics are checked and no violations are unexplained.
- [ ] At least 2 segment breakdowns are analyzed.
- [ ] Sensitivity analysis is performed (outlier removal at minimum).
- [ ] Practical significance is estimated in business terms.
- [ ] Analysis is peer-reviewed by another data scientist.

## Registry Update
- Update `experiment-registry` entry with results and status (`shipped`/`killed`/`iterating`).
- Record effect sizes for shipped experiments in `metric-registry` as benchmark data.
- Log task completion in `task-log` with experiment ID and decision.

---

## Operational Details

### Handoff Rules
- **Lead agent:** sean-ellis owns this task end-to-end.
- **Supporting agents:** data-chief contribute to their domain-specific steps.
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
- **Must-pass checklists:** `checklists/experiment-analysis-quality.md`, `checklists/experimentation/decision-rubric.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/experiment-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/lessons-learned-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [experiment-framework](../../frameworks/experiment-framework.md), [bayesian-vs-frequentist-testing](../../frameworks/bayesian-vs-frequentist-testing.md)
- **Checklists:** [experiment-analysis-quality](../../checklists/experiment-analysis-quality.md), [experimentation/decision-rubric](../../checklists/experimentation/decision-rubric.md)
- **Templates:** [outputs/experiment-analysis](../../templates/outputs/experiment-analysis.md), [reports/experiment-results-report](../../templates/reports/experiment-results-report.md)
- **Workflows:** [experiment-cycle-workflow](../../workflows/experiment-cycle-workflow.md)
