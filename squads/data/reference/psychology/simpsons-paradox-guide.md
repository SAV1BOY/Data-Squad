# Simpson's Paradox Guide

## What Is Simpson's Paradox

Simpson's Paradox occurs when a trend that appears in aggregated data reverses or disappears when the data is divided into subgroups. It is not a statistical anomaly or error — it arises from the structure of the data, specifically from a confounding variable that affects both the grouping and the outcome.

**The classic example:** A treatment has a higher recovery rate than a control in both mild and severe patient groups. But when combined, the control appears to have the higher recovery rate. This happens because the treatment was disproportionately given to severe patients, who have lower recovery rates overall.

## How Simpson's Paradox Appears in Analytics

### A/B Testing

**Scenario:** Variant B has higher conversion than Variant A overall (5.2% vs. 4.8%). But when segmented by device:

| Segment | Variant A | Variant B |
|---------|-----------|-----------|
| Mobile | 3.5% (7,000 users) | 3.2% (2,000 users) |
| Desktop | 6.0% (3,000 users) | 5.8% (8,000 users) |
| **Overall** | **4.8% (10,000)** | **5.2% (10,000)** |

Variant A wins in both segments but loses overall. The paradox occurs because Variant B received more desktop traffic (which converts higher regardless of variant), inflating its aggregate rate.

**Why this happens in experiments:** Traffic allocation should be random, making this rare in well-randomized tests. But it occurs when:
- Randomization has a bug (device-dependent hash collisions).
- The experiment ran during different time periods with different traffic mixes.
- A segment was added or removed mid-experiment.

### Retention Analysis

**Scenario:** Overall 90-day retention improved from Q1 to Q2 (28% to 31%). But retention declined in every acquisition channel:

| Channel | Q1 Retention | Q2 Retention |
|---------|-------------|-------------|
| Organic | 35% | 33% |
| Paid Social | 22% | 20% |
| Referral | 40% | 38% |
| **Overall** | **28%** | **31%** |

The paradox: the mix shifted toward higher-retention channels (organic and referral grew, paid social shrank). The aggregate improvement is a composition effect, not a real retention improvement.

### Revenue Analysis

**Scenario:** Average revenue per customer increased year-over-year. But average revenue declined in both the SMB and Enterprise segments.

This happens when the customer mix shifts toward Enterprise (higher ARPU). The company has a pricing or value delivery problem in both segments, masked by favorable mix shift.

## Detection Methods

### When to Suspect Simpson's Paradox

1. **Aggregate trends that contradict intuition.** If a product change had no logical reason to improve a metric, check whether mix shift explains the improvement.
2. **Different conclusions at different levels of granularity.** If a segment-level analysis contradicts the aggregate, Simpson's Paradox may be present.
3. **Changing population composition.** When the mix of user types, traffic sources, or product tiers shifts between periods, aggregate metrics can mislead.

### Systematic Detection

1. **Always segment key metrics by the most important confounding variables:** device, acquisition source, user tenure, plan tier, geography.
2. **Compare both rates and volumes.** If the rate changes but the volume composition also changed, investigate the composition effect.
3. **Use standardized (adjusted) rates.** Apply the same population weights to both periods to see whether the rate changed independently of mix.

**Standardization example:**
```
Adjusted Q2 retention = (Q1 organic share * Q2 organic retention)
                      + (Q1 paid share * Q2 paid retention)
                      + (Q1 referral share * Q2 referral retention)
```

If the adjusted rate is lower than Q1's rate, the improvement was entirely driven by mix shift.

4. **Build a decomposition framework.** Break metric changes into three components:
   - Rate effect: did the rate change within segments?
   - Mix effect: did the segment composition change?
   - Interaction effect: did both change simultaneously?

## When to Report Disaggregated Data

### Always Disaggregate When

- **Making causal claims.** If you are saying "X caused Y to improve," you must verify the effect holds within relevant subgroups, not just in aggregate.
- **Evaluating A/B tests with uneven traffic splits.** Check that the effect is consistent across key segments.
- **Comparing time periods with different population mixes.** Year-over-year comparisons are especially susceptible because the customer base evolves.
- **Reporting to audiences who will make segment-level decisions.** A marketing team allocating budget by channel needs channel-level data, not a blended average.

### Aggregate Is Sufficient When

- The population composition is stable between comparison periods.
- The metric is not affected by known confounders.
- The audience needs a high-level summary and segment-level detail is available on demand.

### How to Present It

When Simpson's Paradox is present, present both views:

1. **Headline:** "Overall retention improved from 28% to 31%."
2. **Context:** "However, retention declined in every individual channel. The aggregate improvement is driven by a shift in channel mix toward higher-retention channels."
3. **Recommendation:** "We should investigate the retention decline within each channel rather than celebrating the aggregate improvement."

Do not hide the paradox. Do not choose whichever level of analysis supports the preferred narrative.

## Examples from Common Business Contexts

### Pricing Changes

A company raises prices and sees average revenue per user increase. But ARPU declined in both the self-serve and enterprise segments. The increase came from low-ARPU self-serve users churning, shifting the mix toward enterprise.

### Feature Adoption

A new feature shows higher engagement among adopters than the old feature. But when segmented by user tenure, the old feature has higher engagement in every tenure cohort. The new feature was disproportionately adopted by power users (high tenure), who are more engaged with everything.

### Hiring and Admission

A university appears to have higher female admission rates overall, but lower rates in every department. The paradox arises because women disproportionately applied to more competitive departments.

## Common Pitfalls

1. **Always trusting the aggregate.** Aggregate metrics are the default view in most dashboards. They can mislead when composition shifts.
2. **Always trusting the subgroups.** In some cases, the aggregate is the correct level of analysis (when the subgroup split is itself influenced by the treatment).
3. **Not identifying the confounding variable.** The paradox only makes sense when you find the variable driving the composition change.
4. **Over-segmenting to find a reversal.** If you segment by enough variables, you will find reversals by chance. Focus on pre-identified, meaningful confounders.
5. **Using Simpson's Paradox to cherry-pick results.** The correct interpretation depends on the causal structure, not on which level gives the preferred answer.

## Cross-References

- **Experimentation Standards** (`reference/standards/experimentation-standards.md`) — Segmentation analysis guidelines.
- **Survivorship Bias in Data** (`reference/psychology/survivorship-bias-in-data.md`) — Related selection bias.
- **Base Rate Neglect** (`reference/psychology/base-rate-neglect.md`) — Denominator-related reasoning errors.
