# Experimentation Handbook

## Purpose

This handbook defines the standards, rules, and culture of experimentation in the Data Squad. Experiments are how we learn what works. Sloppy experiments teach us nothing and waste time. Rigorous experiments build a compounding knowledge advantage.

## Experimentation Standards

### Before You Start

**Every experiment must have a pre-registered document that includes:**
- Hypothesis: specific, falsifiable, and connected to a business outcome. "We believe [change] will cause [metric] to [increase/decrease] by [amount] because [mechanism]."
- Primary metric: the one metric that determines success or failure.
- Secondary metrics: additional metrics that provide context but do not determine the decision.
- Guardrail metrics: metrics that must not degrade. If they do, the experiment fails regardless of primary metric movement.
- Sample size: calculated via power analysis with specified minimum detectable effect, significance level (default 0.05), and power (default 0.80).
- Duration: estimated based on sample size and traffic.
- Analysis plan: the statistical test, correction method for multiple comparisons, and segment analyses planned.

### During the Experiment

**No peeking.** Do not check results before the pre-registered sample size is reached. Early results are noise. If you must check for operational reasons (e.g., ensuring the test is running), do not make decisions based on what you see.

**Monitor for validity threats:**
- Sample Ratio Mismatch (SRM): check daily that the split between control and treatment matches the expected ratio within tolerance. SRM invalidates results.
- Data quality: ensure events are firing correctly for both groups. A tracking bug in one variant poisons the comparison.
- External contamination: major product changes, marketing campaigns, or outages during the experiment period must be documented and accounted for.

**Do not extend experiments to reach significance.** If the experiment reaches the planned sample size and the result is not significant, the result is "no detectable effect." This is a valid and valuable finding.

### Reading Results

**Report effect sizes, not just p-values.** A statistically significant result with a tiny effect size may not be practically significant. A non-significant result with a large effect size may indicate insufficient power.

**Check guardrails first.** If a guardrail metric degraded, the experiment fails even if the primary metric improved.

**Run the pre-registered segment analysis.** Do not data-mine for segments that show a positive result. If you want to explore segments, document it as exploratory and do not make decisions based on post-hoc segment analysis without a follow-up test.

**Document everything.** The experiment report includes: hypothesis, setup, duration, sample sizes, primary and secondary metric results with confidence intervals, guardrail check, segment analysis, and the decision.

## Rules (Non-Negotiable)

1. No experiment launches without a pre-registered document.
2. No decisions based on peeked results.
3. SRM detected means the experiment is invalid. Investigate and rerun.
4. Guardrail violation means the experiment fails.
5. Every experiment ends with a documented decision: ship, iterate, or kill.
6. Post-hoc segment findings are hypotheses for future experiments, not evidence for current decisions.

## Culture of Experimentation

**Celebrate learning, not winning.** An experiment that teaches us something valuable is a success, even if the treatment lost. Punishing "failed" experiments kills the willingness to test bold ideas.

**Test before you build.** The cheapest way to validate an idea is a well-designed experiment. Building a full feature based on intuition alone wastes engineering time when a quick test could have provided evidence.

**Small bets, fast cycles.** Prefer many small experiments over a few large ones. Faster feedback loops compound learning.

**Intellectual honesty.** Do not rationalize away negative results. Do not cherry-pick segments. Do not extend experiments hoping for a different outcome. The data is what it is.

## Common Experiment Types

| Type | When to Use | Typical Duration |
|------|------------|-----------------|
| A/B test | Two variants, one change | 2-4 weeks |
| Multivariate | Multiple changes simultaneously | 4-6 weeks |
| Holdback | Measuring the impact of an already-shipped feature | 4-8 weeks |
| Quasi-experiment | When randomization is not possible | Varies |
| Feature flag rollout | Gradual launch with monitoring | 1-2 weeks |

## Statistical Defaults

- Significance level (alpha): 0.05
- Power: 0.80
- Minimum detectable effect: defined per experiment based on practical significance
- Correction for multiple comparisons: Bonferroni for primary metrics, no correction for exploratory analysis (but findings are labeled as exploratory)
- SRM check: chi-squared test, p < 0.01 threshold for flagging

## Experiment Registry

Every experiment is logged in the experiment registry with: experiment ID, hypothesis, dates, variants, primary metric result, decision, and learnings. The registry is the institutional memory of what we have tested and what we have learned.
