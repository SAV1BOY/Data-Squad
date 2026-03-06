# Experiment Analysis Quality Checklist

> Gate type: Post-delivery
> Owner: Ellis (Growth / Experimentation Lead)
> Applies to: Any experiment readout, A/B test result report, or feature-flag analysis

## Purpose

Experiment readouts drive ship-or-kill decisions worth weeks of engineering time. A flawed analysis -- wrong MDE, misread p-value, ignored guardrail regression -- can send the team down a dead-end or quietly degrade the product. This gate ensures every experiment conclusion is defensible before it reaches a decision-maker.

## Checklist Items

1. - [ ] **Hypothesis stated before results** -- The document includes the original hypothesis exactly as registered pre-launch (or links to the experiment brief).
   - Pass criteria: Hypothesis is verbatim from the brief; no post-hoc rewording.
   - Fail signal: Hypothesis text differs from the brief or is missing entirely.
   - Action if fail: Restore the original hypothesis and flag any narrative that was rewritten around the result.

2. - [ ] **Sample size vs. MDE alignment** -- The achieved sample size is sufficient for the minimum detectable effect (MDE) that was planned.
   - Pass criteria: Actual sample >= required sample at the planned MDE and power (typically 80%).
   - Fail signal: Experiment stopped early or sample is < 90% of requirement.
   - Action if fail: Either extend the experiment or clearly label the result as underpowered and state the actual detectable effect.

3. - [ ] **Runtime meets minimum duration** -- The experiment ran for at least one full business cycle (typically 7 days minimum, 14 preferred).
   - Pass criteria: Start and end dates span >= 1 full week; no major holidays or incidents overlap.
   - Fail signal: Duration < 7 days, or a site incident affected > 5% of traffic during the window.
   - Action if fail: Extend or re-run. If an incident occurred, quantify its impact and exclude affected period if justified.

4. - [ ] **Randomization integrity verified** -- A Sample Ratio Mismatch (SRM) check has been performed and passed.
   - Pass criteria: Chi-squared SRM test p-value > 0.01; variant sizes within 1% of expected ratio.
   - Fail signal: SRM p-value <= 0.01 or variant imbalance > 2%.
   - Action if fail: Investigate assignment logic, bot filtering, or data pipeline bugs before interpreting any metric.

5. - [ ] **Primary metric result is unambiguous** -- Effect size, confidence interval, and p-value (or Bayesian posterior) are all reported for the primary metric.
   - Pass criteria: All three values present; CI does not span a practically meaningless range.
   - Fail signal: Only p-value reported without effect size, or CI is so wide it includes both meaningful positive and negative effects.
   - Action if fail: Add missing statistics. If CI is too wide, label the test as inconclusive.

6. - [ ] **Practical significance assessed** -- The observed lift is compared against the business-relevance threshold, not just statistical significance.
   - Pass criteria: Report states whether the lift exceeds the pre-defined practically significant threshold (e.g., +0.5% conversion).
   - Fail signal: Report says "significant" without mentioning whether the lift matters to the business.
   - Action if fail: Add a sentence comparing observed lift to the practical threshold and adjust the recommendation.

7. - [ ] **Guardrail metrics reviewed** -- All pre-registered guardrail metrics (e.g., latency, error rate, revenue per user) are checked for regression.
   - Pass criteria: Each guardrail metric listed with result and pass/fail status; none regressed beyond acceptable bounds.
   - Fail signal: Guardrails not mentioned, or a guardrail regressed and the report still recommends shipping.
   - Action if fail: Add guardrail section. If a guardrail regressed, the recommendation must address the trade-off explicitly.

8. - [ ] **Segmentation analysis is bounded** -- Any segment-level breakdowns are limited to pre-registered segments; exploratory cuts are clearly labeled.
   - Pass criteria: Pre-registered segments analyzed first; any additional cuts flagged as exploratory with multiple-comparison caveat.
   - Fail signal: Ten sub-segments explored post-hoc and one cherry-picked as "the real finding."
   - Action if fail: Move post-hoc findings to an "Exploratory" section and recommend a follow-up test for any promising segment.

9. - [ ] **Novelty and primacy effects considered** -- The analysis checks for time-based effect decay or ramp-up in the primary metric.
   - Pass criteria: A time-series chart of the metric by day is included; any trend noted.
   - Fail signal: No temporal view provided; a novelty spike could be inflating the result.
   - Action if fail: Add a daily trend chart. If effect decays significantly, note the steady-state estimate.

10. - [ ] **Conclusion matches evidence** -- The recommendation (ship / iterate / kill) logically follows from the data presented.
    - Pass criteria: Recommendation is consistent with primary metric result, guardrails, and practical significance.
    - Fail signal: Data shows inconclusive or negative result but recommendation is to ship anyway without justification.
    - Action if fail: Revise recommendation or add an explicit rationale for overriding the data (e.g., strategic bet).

11. - [ ] **Reproducibility artifacts linked** -- Query, notebook, or dashboard used for the analysis is linked and accessible.
    - Pass criteria: A working link to the analysis notebook or SQL query is in the document.
    - Fail signal: Analysis is described in prose only with no way to reproduce the numbers.
    - Action if fail: Attach or link the analysis artifact before the readout is shared.

## Cross-References

- See `ab-test-launch-quality.md` for the pre-launch counterpart of this checklist.
- See `data-storytelling-quality.md` for presentation standards when turning this analysis into a narrative.
- See `exec-report-quality.md` if the experiment result feeds into an executive summary.
