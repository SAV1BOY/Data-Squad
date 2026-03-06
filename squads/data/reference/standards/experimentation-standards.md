# Experimentation Standards

## Purpose

This document establishes the standards for running experiments (A/B tests, multivariate tests, feature rollouts) across the organization. It ensures statistical rigor, consistent decision-making, and institutional learning.

## Pre-Experiment Requirements

### Hypothesis Documentation

Every experiment must have a written hypothesis before launch:

- **Format:** "We believe that [change] will cause [effect] on [metric] because [rationale]."
- **Primary metric:** One metric that determines success or failure. No changing this after launch.
- **Secondary metrics:** Up to 3 supporting metrics that provide context.
- **Guardrail metrics:** Metrics that must not degrade (e.g., error rate, page load time, revenue per user).

### Sample Size Calculation

- Use a power analysis calculator before launching any experiment.
- Standard parameters unless justified otherwise:
  - Significance level (alpha): 0.05 (two-tailed)
  - Statistical power (1 - beta): 0.80
  - Minimum Detectable Effect (MDE): defined by the business stakeholder
- Document the expected sample size and estimated runtime before launch.
- If the required sample takes more than 8 weeks to collect, reconsider the MDE or the experiment design.

### Traffic Allocation

- Default split: 50/50 for two-variant tests.
- For risky changes, start with 10/90 (treatment/control) and ramp up after 48 hours if guardrails hold.
- Never allocate less than 5% to any variant (results will be unreliable).
- Ensure randomization unit is consistent (typically user-level, not session-level).

## Duration Rules

### Minimum Duration

- Every experiment must run for at least 7 full days to capture day-of-week effects.
- For B2B products with weekly cycles, minimum is 14 days.
- For products with monthly billing cycles, consider running for at least one full billing cycle.

### Maximum Duration

- No experiment should run longer than 12 weeks without explicit approval from the Head of Analytics.
- If results are not significant after the planned duration, the experiment is inconclusive (not negative).

### Early Stopping Rules

- Do NOT stop an experiment early because results "look significant." Sequential testing or always-valid p-values are required for early stopping.
- You MAY stop an experiment early if:
  - A guardrail metric degrades by more than 5% with statistical significance.
  - A critical bug is found in the treatment.
  - External events invalidate the test (major outage, PR crisis, etc.).
- Document the reason for early stopping.

## Guardrail Metrics

### Mandatory Guardrails

Every experiment must monitor these guardrails regardless of what is being tested:

| Guardrail | Threshold |
|-----------|-----------|
| Error rate (client + server) | Must not increase by more than 0.5 percentage points |
| P95 page load time | Must not increase by more than 200ms |
| Revenue per user (if applicable) | Must not decrease by more than 1% |
| Support ticket rate | Must not increase by more than 10% |

### Custom Guardrails

- Teams may add domain-specific guardrails (e.g., churn rate for subscription changes).
- All guardrails must be defined before the experiment launches.

## Statistical Methods

### Frequentist Approach (Default)

- Two-sample t-test or z-test for continuous metrics.
- Chi-squared test or Fisher's exact test for proportions.
- Use Bonferroni correction when testing multiple primary metrics (avoid this by having one primary metric).

### Bayesian Approach (Optional)

- Acceptable when the team has established priors from previous experiments.
- Report the posterior probability of the treatment being better, not just a point estimate.
- Decision threshold: 95% posterior probability of improvement for the primary metric.

### Sequential Testing

- If you need the option to stop early, use a sequential testing framework (e.g., mSPRT, always-valid p-values).
- Pre-register the number of looks and the adjusted significance levels.

## Decision Rules

### Clear Win

- Primary metric is statistically significant in the expected direction.
- No guardrail metric is significantly degraded.
- Decision: **Ship the treatment.**

### Clear Loss

- Primary metric is statistically significant in the wrong direction, OR a guardrail is significantly degraded.
- Decision: **Do not ship. Document learnings.**

### Inconclusive

- Primary metric is not statistically significant after the planned duration.
- Decision: **Do not ship.** The status quo wins in a tie. Discuss whether a larger test or different approach is warranted.

### Mixed Results

- Primary metric wins, but a secondary or guardrail metric degrades.
- Decision: **Escalate to product and analytics leadership.** Document the trade-off explicitly.

## Reporting

### Required Report Elements

1. Experiment name, hypothesis, and dates.
2. Sample sizes per variant.
3. Primary metric results with confidence intervals.
4. Secondary metric results.
5. Guardrail metric results.
6. Segmentation analysis (at least by platform and user tenure).
7. Decision and rationale.

### Segmentation

- Always check results by key segments (new vs. returning users, mobile vs. desktop, geography).
- Do NOT use segment-level results to override the overall result unless there is a strong prior reason.
- Fishing for significant segments is p-hacking. If you find an interesting segment, validate it in a follow-up experiment.

## Anti-Patterns to Avoid

1. **Peeking:** Checking results daily and stopping when significant. Use sequential testing instead.
2. **HiPPO decisions:** Ignoring experiment results because the highest-paid person has an opinion.
3. **Underpowered tests:** Running experiments that can only detect unrealistically large effects.
4. **Multiple testing:** Testing 10 metrics and celebrating the one that is significant.
5. **Novelty/primacy effects:** Not accounting for user adaptation to changes. Wait for metrics to stabilize.
6. **Survivorship bias:** Only analyzing users who completed the flow, ignoring those who dropped off.
7. **Sunk cost:** Continuing a losing experiment because "we already built it." See `sunk-cost-in-experiments.md`.

## Experiment Registry

- All experiments must be registered in the experiment tracking system before launch.
- The registry entry must include: hypothesis, metrics, duration, traffic allocation, and owner.
- Post-experiment, the registry is updated with results and the decision.
- The registry is the institutional memory for experiments. It prevents re-running tests that have already been conclusive.

## Review Cadence

- Weekly experiment review meeting: discuss active experiments, flag issues, share learnings.
- Monthly experiment retrospective: review decision quality, identify process improvements.
- Quarterly experiment velocity report: number of experiments, win rate, impact on key metrics.
