# Statistical Significance Guide

A pragmatic guide for data practitioners who need to make decisions using statistical tests. Covers p-values, confidence intervals, effect sizes, and statistical power without requiring a statistics degree.

---

## The Big Picture

Statistical significance answers one question: **"Is the difference I observed likely due to the treatment, or could it be random chance?"**

It does NOT answer:
- "Is the difference meaningful to the business?" (That is effect size and business judgment.)
- "Will this result hold in the future?" (That is generalizability.)
- "Is this the best possible treatment?" (That requires comparing alternatives.)

---

## P-Values

### What a P-Value Is

The p-value is the probability of seeing a result as extreme as (or more extreme than) the one observed, assuming there is actually no difference between groups (the null hypothesis is true).

- p = 0.05 means: "If there were truly no difference, there is a 5% chance we would see a result this extreme by random chance."
- p = 0.01 means: "1% chance."

### What a P-Value Is NOT

- It is NOT the probability that the treatment does not work.
- It is NOT the probability that your result is wrong.
- A small p-value does NOT mean the effect is large or important.
- A large p-value does NOT mean there is no effect (you may just lack statistical power).

### Standard Thresholds

| p-value   | Interpretation                                        | Typical Action              |
|-----------|-------------------------------------------------------|-----------------------------|
| < 0.01    | Strong evidence against the null hypothesis            | High confidence in result   |
| 0.01-0.05 | Moderate evidence against the null hypothesis          | Standard threshold for shipping |
| 0.05-0.10 | Weak evidence; suggestive but not conclusive           | Consider extending the test |
| > 0.10    | Insufficient evidence to reject the null hypothesis    | Do not ship based on this   |

### Common Pitfalls

- **Peeking:** Checking p-values repeatedly during an experiment inflates false positive rates. Either use sequential testing methods or commit to checking only at the planned end date.
- **Multiple comparisons:** Testing 20 metrics simultaneously means you expect 1 false positive at p < 0.05 by chance alone. Apply Bonferroni correction (divide alpha by number of tests) or use False Discovery Rate (FDR) control.
- **P-hacking:** Trying different filters, time windows, or subgroups until finding p < 0.05 produces unreliable results.

---

## Confidence Intervals

### What They Are

A 95% confidence interval is a range of values that, if the experiment were repeated many times, would contain the true effect 95% of the time.

### Why They Matter More Than P-Values

- A confidence interval tells you the **range of plausible effect sizes**, not just whether the effect is "significant."
- Example: "Conversion rate increased by 1.2pp (95% CI: 0.3pp to 2.1pp)" is far more useful than "p = 0.008."

### How to Interpret

| Confidence Interval           | Interpretation                                       |
|-------------------------------|------------------------------------------------------|
| CI is entirely above zero     | Statistically significant positive effect             |
| CI includes zero              | Not statistically significant                         |
| CI is entirely below zero     | Statistically significant negative effect             |
| CI is narrow                  | High precision; large sample or low variance          |
| CI is wide                    | Low precision; consider running longer or increasing sample |

### Practical Example

Treatment effect on conversion rate: +1.2pp (95% CI: 0.3pp to 2.1pp)

- The CI does not include zero, so this is statistically significant at the 5% level.
- The worst plausible outcome is still positive (+0.3pp), so even in the pessimistic case, the treatment helps.
- The best plausible outcome is +2.1pp, which would be a substantial business impact.

---

## Effect Size

### What It Is

Effect size measures the magnitude of the difference, independent of sample size. A statistically significant result can have a trivially small effect size (with a large enough sample, you can detect even a 0.01% difference).

### Common Measures

| Measure                  | Formula                                    | Use Case                    |
|--------------------------|--------------------------------------------|-----------------------------|
| Absolute difference      | Treatment mean - Control mean              | Most intuitive for business |
| Relative difference (%)  | (Treatment - Control) / Control * 100      | Useful for comparison across metrics |
| Cohen's d                | (Mean1 - Mean2) / pooled_std_dev           | Comparing across studies    |

### Cohen's d Benchmarks

| d Value | Interpretation |
|---------|---------------|
| 0.2     | Small effect   |
| 0.5     | Medium effect  |
| 0.8     | Large effect   |

### Business Significance vs. Statistical Significance

Always ask: **"Even if this result is statistically significant, is the effect size large enough to matter?"**

Framework:
1. Calculate the annualized business impact of the observed effect (e.g., +0.5pp conversion = $X revenue per year).
2. Compare to the cost of implementation and maintenance.
3. If impact > cost by a meaningful margin, ship. If not, the result is statistically significant but not worth acting on.

---

## Statistical Power

### What It Is

Power is the probability of detecting a true effect when one exists. Power = 1 - beta, where beta is the false negative rate.

### Standard Target

- **80% power** is the conventional minimum (20% chance of missing a real effect).
- **90% power** is preferred for high-stakes experiments.

### What Affects Power

| Factor               | Effect on Power                              | How to Improve                    |
|----------------------|----------------------------------------------|-----------------------------------|
| Sample size          | More samples = more power                    | Run longer or increase traffic allocation |
| Effect size (MDE)    | Larger expected effect = more power           | Accept a larger MDE (detect only big effects) |
| Variance             | Lower variance = more power                  | Use variance reduction techniques (CUPED, stratification) |
| Significance level   | Higher alpha = more power (but more false positives) | Usually keep at 0.05            |

### Sample Size Calculation

For a two-proportion z-test (e.g., conversion rates):

```
n_per_group = (Z_alpha/2 + Z_beta)^2 * (p1*(1-p1) + p2*(1-p2)) / (p1 - p2)^2

Where:
  Z_alpha/2 = 1.96 for 95% confidence (alpha = 0.05)
  Z_beta    = 0.84 for 80% power
  p1        = control conversion rate
  p2        = treatment conversion rate (p1 + MDE)
```

**Quick reference table** (80% power, alpha = 0.05, two-sided):

| Baseline Rate | MDE (relative) | MDE (absolute) | Sample per Group |
|---------------|---------------|-----------------|------------------|
| 5%            | 10%           | 0.5pp           | ~31,000          |
| 5%            | 20%           | 1.0pp           | ~8,000           |
| 10%           | 10%           | 1.0pp           | ~14,000          |
| 10%           | 20%           | 2.0pp           | ~3,600           |
| 20%           | 10%           | 2.0pp           | ~6,000           |
| 20%           | 20%           | 4.0pp           | ~1,500           |

---

## Decision Framework

Putting it all together for experiment decisions:

| Result                                              | Recommendation                            |
|-----------------------------------------------------|-------------------------------------------|
| p < 0.05, effect size is business-meaningful, no guardrail violations | Ship                      |
| p < 0.05, effect size is trivially small            | Do not ship (cost of change outweighs impact) |
| p > 0.05, experiment was well-powered               | No effect detected. Kill or redesign.      |
| p > 0.05, experiment was under-powered               | Inconclusive. Extend, increase sample, or accept uncertainty. |
| p < 0.05, but guardrail violated                    | Do not ship. Investigate the guardrail violation. |
| p < 0.05, but SRM detected                          | Results are unreliable. Investigate instrumentation. |
