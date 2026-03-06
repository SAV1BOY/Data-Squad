# Task: Analyze Experiment
> Agent(s): Data Scientist, Data Analyst
> Frameworks: Statistical Hypothesis Testing, Bayesian A/B Analysis
> Checklists: experiment-analysis-checklist, statistical-validity-checklist
> Template: experiment-results-template
> Registry: experiment-registry

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
