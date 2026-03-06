# Growth Experiment Sprint - Analysis

## Phase Objective

Analyze experiment results with statistical rigor to determine whether the treatment produced a meaningful effect on the primary metric, assess impact on secondary and guardrail metrics, and quantify the effect size to inform the ship/iterate/kill decision.

## Prerequisites

- Experiment has run for the full planned duration from Phase 02
- Required sample size has been reached per the power analysis
- No significant technical issues occurred during the experiment run
- Access to the experimentation platform's statistical analysis tools
- Raw event data accessible for custom analysis if needed

## Steps

1. **Verify Experiment Integrity Before Analysis**: Before looking at results, verify that the experiment ran cleanly. Check that the sample ratio matches the intended allocation (a sample ratio mismatch, or SRM, indicates a randomization bug and invalidates results). Verify that no other changes were deployed during the experiment window that could confound results. Confirm that the experiment ran for at least one full business cycle.

2. **Analyze the Primary Metric**: Calculate the treatment effect on the primary metric. Report the absolute difference, relative lift, confidence interval, and p-value. Use the appropriate statistical test based on the metric type: a t-test or Mann-Whitney U for continuous metrics, a chi-squared or Fisher's exact test for proportions, and a time-to-event analysis for duration metrics. Do not peek at results before the planned end date unless using sequential testing with proper alpha spending.

3. **Assess Statistical Significance**: Determine whether the observed effect is statistically significant at the pre-defined alpha level (typically 0.05). If using Bayesian methods, report the posterior probability that the treatment is better than control and the credible interval. Regardless of method, clearly state whether the result meets the decision threshold defined in the experiment design.

4. **Evaluate Practical Significance**: A statistically significant result is not automatically worth shipping. Calculate the practical impact by multiplying the observed lift by the total addressable population and the metric's monetary value. A 0.3% lift in conversion rate might be worth millions annually for a high-traffic product or negligible for a small one. Compare the projected impact against the cost of maintaining the change.

5. **Check Guardrail Metrics**: Examine every guardrail metric defined in the experiment design. Verify that none have degraded beyond the pre-defined thresholds. If a guardrail metric shows degradation, investigate whether it is a real trade-off or a statistical artifact. A treatment that improves the primary metric but degrades a guardrail requires careful judgment about whether the net effect is positive.

6. **Analyze Pre-Registered Segments**: Run the pre-registered segmentation analysis. Compare treatment effects across the defined segments (device type, user tenure, plan type, geography). Use appropriate corrections for multiple comparisons (Bonferroni or false discovery rate). Flag segments where the treatment effect is significantly different from the overall effect, as these may inform targeted rollout strategies.

7. **Investigate Unexpected Patterns**: Look for patterns not covered by the pre-registered analysis. Examine time series of the treatment effect to check for novelty effects (initial spike that fades) or delayed effects (no initial impact that builds over time). Check whether the treatment effect differs between users who were exposed early versus late. These exploratory findings should be labeled as hypothesis-generating, not confirmatory.

8. **Calculate Long-Term Impact Estimate**: If the experiment ran for a short duration, estimate the long-term impact by analyzing whether the treatment effect was stable, growing, or decaying during the experiment window. For subscription or retention experiments, model the projected lifetime impact using observed short-term effects and historical decay curves.

9. **Compile the Analysis Report**: Write a comprehensive analysis report that includes the hypothesis, experimental setup, results for all metrics, statistical details, segment analysis, and a clear recommendation. Present data visually with charts showing metric trends, confidence intervals, and segment comparisons. The report should be understandable by both technical and non-technical stakeholders.

## Deliverables

- Experiment integrity verification report (SRM check, confound analysis)
- Primary metric analysis with absolute lift, relative lift, confidence interval, and p-value
- Guardrail metrics assessment with pass/fail status for each
- Segment analysis results with multiple comparison corrections
- Practical significance calculation with projected annual impact
- Long-term impact estimate with supporting methodology
- Comprehensive analysis report with visualizations and recommendation

## Quality Gate

Analysis is complete when all of the following conditions are met:

- Sample ratio mismatch check confirms randomization integrity (p > 0.01 on SRM test)
- Primary metric result is reported with confidence interval and practical significance assessment
- All guardrail metrics have been evaluated against pre-defined thresholds
- Pre-registered segment analyses are complete with appropriate multiple comparison corrections
- Exploratory findings are clearly labeled as hypothesis-generating
- The analysis report includes a clear recommendation (ship, iterate, or kill)
- At least one peer has reviewed the analysis methodology and confirmed its validity
- The analysis report is stored in the shared repository and linked to the experiment brief for traceability

## Next Phase

Proceed to **04-decision.md** (Decision) to formalize the ship, iterate, or kill decision based on the analysis results and document the rationale.
