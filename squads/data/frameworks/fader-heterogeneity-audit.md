# Fader Heterogeneity Audit

## Overview

The Heterogeneity Audit is Peter Fader's framework for diagnosing and quantifying the degree of
behavioral variation across a customer base. Most companies treat their customers as a single
aggregate, computing averages that describe nobody. The heterogeneity audit exposes the spread,
skewness, and clustering in customer behaviors to reveal whether the business is truly understanding
its customer base or merely averaging over fundamentally different groups.

## Origin

Developed by **Peter Fader** at the Wharton School, rooted in his research on the BG/NBD and
Gamma-Gamma models. A core principle of Fader's customer-centricity work is that individual-level
heterogeneity is not noise to be averaged away but signal to be understood and acted upon. This
framework operationalizes that principle into an actionable audit process.

## Core Principle

**"The average customer does not exist."** Customer behaviors follow distributions, not point
estimates. Any analysis that relies on averages without examining the underlying distribution is
hiding the most important patterns. The heterogeneity audit forces examination of distributions
before any strategic decision is made.

## Audit Dimensions

### Dimension 1: Transaction Frequency Heterogeneity

**What to examine:**
- Distribution of purchase/transaction counts per customer over a fixed period
- Shape of the distribution: Is it roughly geometric (many low, few high)? Or bimodal?
- Coefficient of variation (CV = std/mean) for transaction frequency
- Comparison of median vs. mean frequency (divergence indicates skewness)

**Key questions:**
- What percentage of customers transacted only once in the period?
- What is the ratio of top-decile frequency to bottom-decile?
- Does the frequency distribution change across acquisition cohorts?

**Red flags:**
- Mean frequency reported without distribution context
- Strategies built on "increasing average purchase frequency" without segment targeting
- Frequency distribution highly skewed but treated as normal in models

### Dimension 2: Monetary Value Heterogeneity

**What to examine:**
- Distribution of spend per customer (total and per-transaction)
- Whale curve analysis: what % of revenue comes from the top 20% of customers?
- Revenue concentration index (Gini coefficient for customer revenue)
- Average order value distribution shape and outlier presence

**Key questions:**
- Is the Gini coefficient above 0.6? (Indicates high concentration)
- Are there distinct spending tiers, or is the distribution continuous?
- Do high-value customers behave differently in timing and frequency?

**Red flags:**
- Revenue projections based on average spend per customer
- Flat pricing or incentive structures applied uniformly across value tiers
- Top 5% of customers generating >50% of revenue without dedicated strategies

### Dimension 3: Recency and Lapse Heterogeneity

**What to examine:**
- Distribution of time since last transaction (recency)
- Probability of being "alive" vs. lapsed, using BG/NBD or similar model
- How recency distributions differ across segments and cohorts
- Speed of lapse by acquisition channel

**Key questions:**
- What recency threshold best separates likely-active from likely-lapsed?
- Is there a bimodal pattern (clearly active vs. clearly gone)?
- How does the P(alive) distribution look? Is it concentrated near 0 and 1, or spread?

**Red flags:**
- Binary active/inactive classification using a single arbitrary cutoff
- Win-back campaigns targeting all lapsed customers uniformly
- No probabilistic modeling of customer "aliveness"

### Dimension 4: Cohort-Level Heterogeneity

**What to examine:**
- Do acquisition cohorts exhibit meaningfully different behavior patterns?
- Retention curve shape variation across cohorts
- CLV distribution differences by cohort vintage
- Whether cohort effects are confounded with seasonality or product changes

**Key questions:**
- Is there statistically significant variation between cohort retention curves?
- Are newer cohorts higher or lower quality than older ones?
- Do different channels produce cohorts with different heterogeneity profiles?

**Red flags:**
- All cohorts assumed to follow the same behavioral model
- Aggregate retention curves used instead of cohort-specific curves
- Channel mix changes without re-examining CLV projections by cohort

### Dimension 5: Cross-Behavioral Correlation

**What to examine:**
- Correlation between frequency and monetary value at the individual level
- Whether high-frequency customers are also high-value (or opposite)
- Independence assumptions in CLV models (Gamma-Gamma assumes independence)
- Multivariate heterogeneity: do behaviors cluster into natural segments?

**Key questions:**
- Is the correlation between frequency and monetary value weak enough to model independently?
- Are there natural clusters (e.g., "frequent low-value" vs. "infrequent high-value")?
- Does ignoring correlations meaningfully bias CLV estimates?

**Red flags:**
- CLV models assume independence without testing correlation
- Segmentation based on single dimensions without examining multivariate patterns
- Customer personas created from qualitative research without validation against behavioral data

## How to Conduct the Audit

### Step 1: Extract Behavioral Data
Pull individual-level transaction data for a defined observation period (minimum 12 months).
Include: customer_id, transaction_date, transaction_value.

### Step 2: Compute Distribution Statistics
For each dimension, compute: mean, median, standard deviation, coefficient of variation,
percentile breakpoints (10th, 25th, 50th, 75th, 90th), skewness, kurtosis.

### Step 3: Visualize Distributions
Create histograms, box plots, and Lorenz curves for each behavioral dimension. Overlay cohort
or segment lines where relevant.

### Step 4: Quantify Heterogeneity
- Frequency: Report CV and % of one-time customers
- Monetary: Report Gini coefficient and whale curve
- Recency: Report % likely alive (from probabilistic model) and bimodality
- Cohorts: Report between-cohort variance vs. within-cohort variance

### Step 5: Assess Impact on Strategy
For each dimension, ask: "If we ignored this heterogeneity, what decisions would we get wrong?"
Document specific examples.

### Step 6: Recommend Actions
Based on heterogeneity findings, recommend:
- Where uniform strategies should be replaced with segmented approaches
- Which CLV model assumptions need revision
- Where further investigation is needed (sub-segments, causal analysis)

## Output

The audit produces a Heterogeneity Report containing:
- Distribution visualizations for all 5 dimensions
- Summary statistics table with heterogeneity indices
- Impact assessment: which current strategies are undermined by ignoring heterogeneity
- Actionable recommendations with priority ranking
- Data appendix with queries and methodology

## Quality Gate

Before publishing, verify:
- [ ] All 5 dimensions are covered with distribution analysis
- [ ] Distributions are based on individual-level data, not aggregates
- [ ] Observation period is at least 12 months
- [ ] Gini coefficient and CV are computed and interpreted
- [ ] Cohort comparisons use statistical tests for significance
- [ ] Recommendations specify which strategies to change and how
- [ ] Results registered in segment-registry and decision-registry

## Cross-References
- [Value-Based Segmentation (Fader)](value-based-segmentation-fader.md)
- [Whale Curve Framework (Fader)](fader-whale-curve-framework.md)
- [CLV Modeling](clv-modeling.md)
- [Fader Customer Base Audit](fader-customer-base-audit.md)
- [Fader Probability Models](fader-probability-models.md)
