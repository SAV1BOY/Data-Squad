# Fader Heterogeneity Audit

## Purpose

Audit whether the organization genuinely accounts for customer heterogeneity -- the foundational Fader principle that customers are fundamentally different from each other in their buying behavior, and treating them as averages leads to poor decisions. This checklist tests whether heterogeneity is recognized in models, strategy, and operations.

---

## Checklist Items

### 1. Averages Are Not Used as the Primary Decision Input
- **Pass:** Key metrics (CLV, purchase frequency, order value, churn rate) are presented as distributions, not just averages. Decision-makers see the spread, not just the mean.
- **Fail:** All customer metrics are reported as single averages, hiding the enormous variation underneath.

### 2. Distribution Shape Is Documented
- **Pass:** The team has characterized the distribution of key behaviors (purchase frequency, monetary value, tenure). They know whether it is normal, log-normal, exponential, or power-law.
- **Fail:** Nobody has looked at the distribution. The implicit assumption is that all customers behave like the average.

### 3. Statistical Models Account for Heterogeneity
- **Pass:** CLV and behavioral models include heterogeneity parameters (e.g., gamma-distributed purchase rates in BG/NBD) rather than assuming all customers share the same rate.
- **Fail:** Models use pooled estimates (single purchase rate for all customers) or simple averages.

### 4. Segments Reflect Behavioral Differences, Not Just Labels
- **Pass:** Customer segments are defined by observed behavioral differences (purchase patterns, engagement, value) that are statistically significant and business-relevant.
- **Fail:** Segments are based on arbitrary criteria or demographics with no validation that behavior actually differs across segments.

### 5. Marketing Treatment Varies by Customer Type
- **Pass:** Different customer types receive different messages, offers, cadences, and channel strategies. The variation is deliberate and data-informed.
- **Fail:** All customers receive the same email, the same offer, at the same frequency -- the "one-size-fits-all" approach.

### 6. New-Customer Heterogeneity Is Acknowledged
- **Pass:** The organization recognizes that even at acquisition, customers arrive with different latent propensities (some will become high-value, some will churn quickly), and early signals are used to differentiate.
- **Fail:** All new customers are treated identically through a single onboarding path with no early differentiation.

### 7. Heterogeneity in Churn Is Modeled
- **Pass:** Churn analysis accounts for the fact that different customers have different hazard rates. The "bathtub curve" or survival analysis by segment is produced.
- **Fail:** A single churn rate is reported for the entire customer base, masking that some cohorts churn at 50% and others at 5%.

### 8. Product Usage Heterogeneity Is Mapped
- **Pass:** If the product has usage data, usage patterns are clustered to reveal distinct usage profiles (power users, occasional users, feature-specific users).
- **Fail:** Usage is reported as DAU/MAU ratios without examining the composition of usage behind those numbers.

### 9. The Cost of Ignoring Heterogeneity Is Quantified
- **Pass:** The team has estimated the cost of treating all customers the same -- e.g., over-investing in low-value customers and under-investing in high-value ones. This number motivates differential strategy.
- **Fail:** The case for differentiation is made conceptually but never quantified.

### 10. Heterogeneity Findings Are Refreshed
- **Pass:** Heterogeneity analysis is re-run at least semi-annually because the customer mix evolves as the business grows and the market changes.
- **Fail:** Heterogeneity was analyzed once and the findings are assumed to hold indefinitely.

---

## Cross-References

- [CLV Modeling Audit](clv-modeling-audit.md) -- CLV models must incorporate heterogeneity
- [Value Segmentation Audit](value-segmentation-audit.md) -- segmentation is heterogeneity made operational
- [Fader Whale Curve Audit](fader-whale-curve-audit.md) -- the whale curve is heterogeneity made visible
- [Customer Centricity Score](customer-centricity-score.md) -- customer centricity requires embracing heterogeneity
