# Experiment Type Taxonomy

A classification of experiment types, when to use each, and their key design considerations.

---

## Type 1: A/B Test (Split Test)

The most common experiment type. Traffic is randomly split between a control (A) and one treatment (B).

| Attribute            | Details                                              |
|----------------------|------------------------------------------------------|
| **Variants**         | 2 (control + 1 treatment)                            |
| **Randomization**    | User-level or session-level                          |
| **Best For**         | Testing a single change with a clear hypothesis      |
| **Sample Size**      | Determined by MDE, baseline rate, and desired power  |
| **Analysis**         | Two-sample z-test or t-test; chi-squared for proportions |

**When to use:**
- You have one specific change to test.
- You can clearly define a primary metric.
- You have sufficient traffic for the required sample size.
- The change is independent (does not interact with other changes).

**When NOT to use:**
- You want to test multiple variables simultaneously (use multivariate).
- You need to measure long-term or cumulative effects (use holdout).
- You want to continuously optimize rather than test a hypothesis (use bandit).

**Design checklist:**
- [ ] Single primary metric defined with MDE.
- [ ] Sample size calculated with 80%+ power.
- [ ] Randomization unit is appropriate (user-level for most cases).
- [ ] Guardrails defined.
- [ ] Duration covers at least one full business cycle.

---

## Type 2: A/B/n Test (Multi-Variant)

An extension of A/B testing with multiple treatment variants.

| Attribute            | Details                                              |
|----------------------|------------------------------------------------------|
| **Variants**         | 3+ (control + 2 or more treatments)                  |
| **Randomization**    | User-level                                           |
| **Best For**         | Comparing several discrete alternatives              |
| **Sample Size**      | Larger than A/B (divided across more variants)       |
| **Analysis**         | ANOVA or pairwise comparisons with multiple comparison correction |

**When to use:**
- You have 2-4 distinct alternatives to compare (e.g., different pricing tiers, different CTA copy).
- Each variant is a standalone option, not a combination of factors.

**Key considerations:**
- Apply Bonferroni or Holm correction for multiple comparisons.
- Each variant needs the full sample size calculated for a 2-arm test, so total sample = n_variants x n_per_arm.
- More variants = longer runtime. Keep variants to 4 or fewer.

---

## Type 3: Multivariate Test (MVT)

Tests multiple factors simultaneously to understand interactions between them.

| Attribute            | Details                                              |
|----------------------|------------------------------------------------------|
| **Variants**         | All combinations of factor levels (full factorial) or a subset (fractional factorial) |
| **Randomization**    | User-level                                           |
| **Best For**         | Understanding how multiple changes interact          |
| **Sample Size**      | Very large (grows multiplicatively with factors)     |
| **Analysis**         | Factorial ANOVA; interaction effects                 |

**Example:** Testing 2 headline variants x 3 CTA button colors = 6 combinations.

**When to use:**
- You suspect interaction effects between changes (e.g., headline + image combination matters).
- You have very high traffic volume.
- You want to optimize multiple elements at once.

**When NOT to use:**
- Traffic is limited (sample size requirements are large).
- Factors are independent and can be tested sequentially with A/B tests.

**Key considerations:**
- Full factorial design tests all combinations but requires the most traffic.
- Fractional factorial reduces traffic needs but cannot detect all interaction effects.
- Clearly define which interactions you care about before designing the experiment.

---

## Type 4: Multi-Armed Bandit

An adaptive algorithm that shifts traffic toward winning variants during the experiment.

| Attribute            | Details                                              |
|----------------------|------------------------------------------------------|
| **Variants**         | 2+ (dynamically allocated)                           |
| **Randomization**    | Adaptive (not fixed split)                           |
| **Best For**         | Optimization when you want to minimize regret (lost conversions) |
| **Sample Size**      | Not fixed; runs until convergence                    |
| **Analysis**         | Thompson Sampling or UCB algorithm                   |

**When to use:**
- The cost of showing a losing variant is high (e.g., promotional offers, landing pages with direct revenue impact).
- You want to optimize rather than rigorously test a hypothesis.
- You need to handle many variants efficiently.

**When NOT to use:**
- You need a rigorous causal inference with p-values and confidence intervals.
- The metric takes a long time to observe (delayed conversions).
- You need to understand WHY something works, not just which variant is best.

**Key considerations:**
- Bandits optimize for one metric only. Define it carefully.
- Bandits struggle with delayed reward signals (e.g., 30-day retention).
- Results are harder to communicate to stakeholders accustomed to A/B test reports.
- Consider using a "pure exploration" phase (fixed split) before switching to bandit allocation.

---

## Type 5: Holdout Experiment

A portion of users is permanently excluded from a feature or set of features to measure long-term cumulative impact.

| Attribute            | Details                                              |
|----------------------|------------------------------------------------------|
| **Variants**         | 2 (holdout group without feature + everyone else)    |
| **Randomization**    | User-level, long-term assignment                     |
| **Best For**         | Measuring the cumulative, long-term impact of a feature or set of features |
| **Sample Size**      | Typically 5-10% holdout                              |
| **Analysis**         | Periodic comparison of holdout vs. treatment on key metrics |

**When to use:**
- You shipped a feature based on a short-term A/B test but want to verify long-term impact.
- You want to measure the cumulative effect of multiple features launched over time.
- You need to quantify the total value of a product area.

**When NOT to use:**
- The feature is table-stakes and withholding it causes user harm or support burden.
- The holdout group is too small to detect meaningful differences.

**Key considerations:**
- Holdout groups should be stable (same users over time).
- Refresh holdout assignment annually to avoid the holdout population becoming unrepresentative due to differential churn.
- Communicate clearly to stakeholders that holdout users intentionally receive a degraded experience.

---

## Type 6: Incrementality Test (Lift Test)

Measures the causal, incremental impact of a marketing treatment (ad exposure, email, promotion) beyond what would have happened organically.

| Attribute            | Details                                              |
|----------------------|------------------------------------------------------|
| **Variants**         | 2 (exposed vs. ghost/control)                        |
| **Randomization**    | User-level or geo-level                              |
| **Best For**         | Measuring the true causal effect of marketing spend  |
| **Sample Size**      | Depends on expected incremental lift                 |
| **Analysis**         | Lift = (Treatment conversion - Control conversion) / Control conversion |

**When to use:**
- You want to know if an ad campaign caused conversions, or if those users would have converted anyway.
- You need to justify marketing spend with causal evidence.
- You suspect attribution models are over-counting (last-click inflation).

**Designs:**

| Design               | How It Works                                         |
|----------------------|------------------------------------------------------|
| Ghost ads            | Control group sees a blank/PSA ad instead of the real ad |
| Geo-based            | Randomly assign geographic regions to treatment/control |
| Intent-to-treat      | Randomize eligibility; compare based on assignment, not exposure |

**Key considerations:**
- Ghost ad tests require ad platform support (not all platforms offer this).
- Geo-based tests have lower power due to fewer randomization units.
- Account for spillover effects in geo-based tests (users travel between regions).

---

## Decision Guide

| Situation                                          | Recommended Type        |
|----------------------------------------------------|-------------------------|
| Testing one UI change                              | A/B Test                |
| Comparing 3 pricing options                        | A/B/n Test              |
| Testing headline + image combinations              | Multivariate Test       |
| Optimizing a landing page in real-time             | Multi-Armed Bandit      |
| Measuring long-term impact of a shipped feature    | Holdout Experiment      |
| Measuring true ROI of ad spend                     | Incrementality Test     |
| Low traffic, one change at a time                  | A/B Test                |
| High traffic, many options to explore              | Multi-Armed Bandit      |
