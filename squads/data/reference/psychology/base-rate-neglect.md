# Base Rate Neglect in Experiments and Analytics

## What It Is

Base rate neglect is the tendency to ignore general statistical information (the base rate) in favor of specific, vivid, or case-level information. When evaluating probabilities or interpreting results, people often forget to account for how common or rare something is in the overall population.

## The Taxi Cab Problem

Kahneman and Tversky's classic illustration: A city has 85% green taxis and 15% blue taxis. A witness to an accident says the taxi was blue. The witness correctly identifies taxi color 80% of the time. What is the probability the taxi was actually blue?

Most people say about 80% (anchoring on the witness's accuracy). The correct answer is about 41%. The base rate (only 15% of taxis are blue) dramatically changes the calculation. Even a reasonably accurate witness is more likely to be wrong about a blue taxi simply because blue taxis are rare.

## How Base Rate Neglect Affects Analytics

### Experiment Interpretation

**Scenario:** Your A/B test shows a statistically significant 5% improvement in conversion rate (p = 0.04).

**What most people conclude:** "The treatment works! Ship it."

**What they miss:** If only 10% of experiments at your company produce a real effect, and you test at alpha = 0.05, then even a "significant" result has a substantial probability of being a false positive. The base rate of true effects matters enormously.

| Base Rate of True Effects | Probability Result is Real (given p < 0.05) |
|--------------------------|----------------------------------------------|
| 50% (half of ideas work) | ~95% |
| 25% (one in four) | ~87% |
| 10% (one in ten) | ~67% |
| 5% (one in twenty) | ~50% |

If only 5% of your ideas actually produce a real effect, half of your "significant" experiment results are false positives. This is the Positive Predictive Value problem.

**Mitigation:**
- Use higher statistical power (0.90 instead of 0.80).
- Use lower alpha (0.01 instead of 0.05) when the base rate of success is low.
- Require replication for surprising results.
- Consider the prior probability of the hypothesis being true.

### Fraud Detection

**Scenario:** Your fraud model has 99% accuracy and flags 1% of transactions as fraudulent.

**Base rate:** Only 0.1% of transactions are actually fraudulent.

**Calculation:**
- Out of 100,000 transactions: 100 are truly fraudulent, 99,900 are legitimate.
- Model correctly identifies 99 of 100 fraudulent transactions (true positives).
- Model incorrectly flags 999 of 99,900 legitimate transactions (false positives).
- Of 1,098 flagged transactions, only 99 (9%) are actually fraudulent.

Despite 99% accuracy, 91% of flagged transactions are false positives. The low base rate of fraud means even a very accurate model produces mostly false alarms.

**Mitigation:**
- Report precision (positive predictive value), not just accuracy.
- Communicate the expected false positive rate to the operations team.
- Design workflows that can handle the volume of false positives without alert fatigue.

### Rare Event Analysis

**Scenario:** "Users who contact support are 5x more likely to churn!"

**Base rate:** Only 3% of users contact support. If 15% of support-contacters churn vs. 3% of non-contacters, the 5x relative risk sounds alarming. But in absolute terms, 85% of support-contacters do NOT churn, and the vast majority of all churned users never contacted support.

**What gets missed:** Most churn happens among users who never reached out. Focusing interventions only on support-contacters misses the larger problem.

**Mitigation:**
- Present both relative risk (5x) and absolute risk (15% vs. 3%).
- Calculate the population attributable risk: how much churn would be prevented if we eliminated the support-contact risk factor entirely?
- Ensure interventions address the largest absolute sources of churn, not just the highest relative-risk segments.

### Segment-Level Metrics

**Scenario:** "Enterprise customers have a 95% retention rate!"

**Base rate:** Enterprise customers are 5% of your customer base. 95% retention in 5% of customers is nice but does not save the company if the other 95% of customers (SMB) have 70% retention.

**Mitigation:**
- Always show the segment size alongside the segment metric.
- Calculate weighted impact: how much does each segment contribute to the overall metric?
- Prioritize based on absolute impact, not just segment-level rates.

### Attribution Modeling

**Scenario:** "Users who read our blog are 3x more likely to convert!"

**Base rate:** Blog readers are a self-selected group. People who are already interested in your product are more likely to both read your blog AND convert. The blog may not be causing conversions; both behaviors may share a common cause (interest in the problem you solve).

**Mitigation:**
- Use holdout experiments: randomly suppress blog exposure for a group and measure the difference.
- Control for intent signals: compare blog readers to non-readers with similar behavior patterns.
- Be skeptical of any attribution that relies solely on correlation.

### Health Score Interpretation

**Scenario:** Your customer health model flags 20% of accounts as "at risk."

If historically 10% of accounts churn per year, and the model correctly identifies 80% of eventual churners, what is the positive predictive value?

- 1,000 accounts. 100 will churn. 900 will renew.
- Model correctly flags 80 of 100 churners (true positives).
- Model incorrectly flags 120 of 900 renewers (false positives, assuming 80% specificity).
- Of 200 flagged accounts, only 80 (40%) actually churn.

CSMs who treat every "at risk" flag as a certain churn will waste 60% of their intervention effort on accounts that would have renewed anyway.

**Mitigation:**
- Communicate the expected false positive rate to CSMs.
- Use health scores to prioritize, not to predict with certainty.
- Track the accuracy of predictions over time and recalibrate.

## Base Rate Neglect in Communication

### The "X% More Likely" Problem

Headlines and reports love relative risk because it sounds dramatic:
- "Feature X users are 200% more likely to upgrade!"
- "Users from Channel Y convert at 3x the rate!"

Without the base rate, these statements can be misleading:
- If the base upgrade rate is 0.5%, a 200% increase means 1.5%. Notable, but not earth-shattering.
- If Channel Y drives 50 users per month and the default channel drives 50,000, the 3x conversion rate is irrelevant at scale.

**Rule:** Always include:
1. The base rate.
2. The absolute numbers.
3. The volume or population size.

### The Rare Disease Testing Analogy

When screening for rare conditions, even accurate tests produce mostly false positives. This is directly applicable to any analytics scenario where you are looking for rare events: fraud, churn in high-retention segments, critical bugs, or security breaches.

## Bayesian Thinking as an Antidote

Bayes' theorem formally incorporates base rates into probability calculations:

```
P(A|B) = P(B|A) * P(A) / P(B)
```

In plain language: the probability of something being true given the evidence depends on:
1. How well the evidence predicts the thing (likelihood).
2. How common the thing is in the first place (prior/base rate).
3. How common the evidence is overall.

**Practical application:** Before interpreting any result, ask:
- How common is this outcome in general? (base rate)
- How reliable is my detection method? (likelihood)
- What is the expected false positive rate given the base rate?

## Checklist for Avoiding Base Rate Neglect

- [ ] Have I stated the base rate of the phenomenon I am analyzing?
- [ ] Am I presenting both relative and absolute changes?
- [ ] Have I calculated the positive predictive value of my model or flag?
- [ ] Do I know how common this outcome is in the overall population?
- [ ] Am I accounting for segment size when interpreting segment-level metrics?
- [ ] Have I considered how the base rate of true effects influences my experiment interpretation?
- [ ] Am I distinguishing between "this segment performs better" and "this segment is large enough to matter"?
