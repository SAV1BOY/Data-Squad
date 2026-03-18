# Statistical Testing Quick Reference

## Purpose

This document provides a quick reference for choosing the right statistical test, calculating sample sizes, interpreting effect sizes, and handling multiple comparisons. It is intended for data squad analysts who need to make sound statistical decisions without revisiting a textbook each time.

## Choosing the Right Test

### Decision Matrix

| Question | Data Type | Groups | Recommended Test |
|----------|-----------|--------|-----------------|
| Is there a difference in means? | Continuous, normal | 2 independent | Independent t-test |
| Is there a difference in means? | Continuous, normal | 2 paired | Paired t-test |
| Is there a difference in means? | Continuous, normal | 3+ independent | One-way ANOVA |
| Is there a difference in medians? | Continuous, non-normal | 2 independent | Mann-Whitney U |
| Is there a difference in medians? | Continuous, non-normal | 2 paired | Wilcoxon signed-rank |
| Is there a difference in medians? | Continuous, non-normal | 3+ independent | Kruskal-Wallis |
| Is there an association between categories? | Categorical | 2 variables | Chi-squared test |
| Is there an association (small samples)? | Categorical | 2x2 table | Fisher's exact test |
| Is there a difference in proportions? | Binary | 2 groups | Z-test for proportions |
| Is there a linear relationship? | Continuous | 2 variables | Pearson correlation |
| Is there a monotonic relationship? | Ordinal or non-normal | 2 variables | Spearman correlation |

### When to Use Non-Parametric Tests

Use non-parametric tests (Mann-Whitney, Kruskal-Wallis, Wilcoxon) when:
- Data is not normally distributed and sample size is small (n < 30).
- Data contains significant outliers that would distort means.
- Data is ordinal (rankings, Likert scales).
- The metric is highly skewed (revenue per user, session duration).

For large samples (n > 30), the Central Limit Theorem makes t-tests robust to non-normality. But for revenue and other heavily skewed metrics, non-parametric tests or bootstrapping are still preferred.

## Sample Size Calculation

### Formula for Two-Sample Proportions

For comparing two conversion rates (the most common A/B test scenario):

```
n = (Z_alpha/2 + Z_beta)^2 * (p1(1-p1) + p2(1-p2)) / (p1 - p2)^2
```

### Quick Reference Table

Baseline conversion rate with 80% power, alpha = 0.05, two-tailed:

| Baseline Rate | 5% Relative MDE | 10% Relative MDE | 20% Relative MDE |
|--------------|-----------------|-------------------|-------------------|
| 2% | 380,000/group | 96,000/group | 24,000/group |
| 5% | 122,000/group | 31,000/group | 8,000/group |
| 10% | 52,000/group | 13,000/group | 3,400/group |
| 20% | 21,000/group | 5,400/group | 1,400/group |
| 50% | 6,400/group | 1,600/group | 400/group |

Lower baseline rates require dramatically larger samples to detect the same relative change. A 5% relative lift on a 2% conversion rate means detecting a 0.1 percentage point change, which requires enormous samples.

### Continuous Metrics

For continuous metrics (revenue, session duration), sample size depends on the variance of the metric. Use historical data to estimate variance, then:

```
n = (Z_alpha/2 + Z_beta)^2 * 2 * sigma^2 / delta^2
```

Where sigma is the standard deviation and delta is the minimum detectable absolute difference.

**Variance reduction techniques:**
- **CUPED:** Uses pre-experiment data to reduce variance by 20-50%, effectively reducing required sample size.
- **Stratified randomization:** Ensures balanced groups on key covariates.
- **Metric transformation:** Log-transform highly skewed metrics before analysis.

## Effect Size Interpretation

### Cohen's d (Continuous Outcomes)

| d Value | Interpretation | Example |
|---------|---------------|---------|
| 0.2 | Small | Subtle UX change |
| 0.5 | Medium | Notable feature change |
| 0.8 | Large | Major redesign |

### Odds Ratio / Relative Risk (Binary Outcomes)

| Value | Interpretation |
|-------|---------------|
| 1.0 | No effect |
| 1.1 - 1.3 | Small effect |
| 1.3 - 2.0 | Medium effect |
| > 2.0 | Large effect |

### Practical vs. Statistical Significance

A result can be statistically significant but practically meaningless. Always report both:
- "The treatment increased conversion by 0.02 percentage points (p = 0.03)." Statistically significant, practically irrelevant.
- "The treatment increased conversion by 2.1 percentage points (p = 0.08)." Not statistically significant, but the effect size warrants a larger test.

Define the minimum practically meaningful effect before running the test.

## Multiple Comparison Corrections

### When Corrections Are Needed

Apply corrections when testing multiple hypotheses simultaneously on the same experiment. Common scenarios:
- Testing the same metric across 5 user segments.
- Testing 3 different metrics as co-primary endpoints.
- Comparing 4 variants against a control.

### Correction Methods

| Method | Approach | Strictness | When to Use |
|--------|----------|-----------|-------------|
| Bonferroni | Divide alpha by number of tests | Most strict | Few tests, independent hypotheses |
| Holm-Bonferroni | Step-down procedure | Moderate | Default choice for most situations |
| Benjamini-Hochberg (FDR) | Controls false discovery rate | Least strict | Exploratory analysis, many tests |
| No correction needed | — | — | Pre-registered primary metric only |

### Practical Guidance

1. **Best approach: have one primary metric.** No correction needed for one pre-registered hypothesis.
2. **Secondary metrics:** Report without correction but label as exploratory. Do not make ship/no-ship decisions on secondary metrics alone.
3. **Segment analysis:** Do not correct when checking pre-planned segments. Do correct when fishing across many segments post-hoc.
4. **Multiple variants:** When comparing 3+ variants against control, use Dunnett's test (designed for many-to-one comparisons).

## Confidence Intervals

Always report confidence intervals alongside p-values. CIs communicate both the precision and direction of the effect.

- A 95% CI of [0.5%, 3.2%] means the true effect is likely between 0.5% and 3.2%. The treatment works, but we are uncertain about magnitude.
- A 95% CI of [-0.3%, 2.8%] crosses zero. The effect is not statistically significant, but could still be meaningfully positive.
- A narrow CI near zero is a confident null result. A wide CI crossing zero is an inconclusive result. These require different follow-up actions.

## Common Pitfalls

1. **Using a t-test on revenue data without transformation.** Revenue is heavily right-skewed. Use Mann-Whitney, log-transform, or bootstrap.
2. **Running a chi-squared test with expected cell counts below 5.** Use Fisher's exact test instead.
3. **Treating p = 0.06 as "trending toward significance."** Either the result meets the pre-registered threshold or it does not.
4. **Ignoring the multiple comparisons problem.** Testing 20 segments guarantees one false positive at alpha = 0.05.
5. **Confusing one-tailed and two-tailed tests.** Default to two-tailed unless there is a strong prior reason to test only one direction.

## Cross-References

- **Experimentation Standards** (`reference/standards/experimentation-standards.md`) — Experiment design and decision rules.
- **Base Rate Neglect** (`reference/psychology/base-rate-neglect.md`) — Statistical reasoning biases.
