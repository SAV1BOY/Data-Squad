# Survivorship Bias in Analytics

## What It Is

Survivorship bias is the error of focusing on entities that passed a selection process while ignoring those that did not. In analytics, this means analyzing only the users, customers, or cohorts that "survived" (stayed active, completed a flow, remained customers) and drawing conclusions that ignore the ones who dropped off.

## The Classic Example

During World War II, the Allied forces examined returning bombers to determine where to add armor. The obvious answer: reinforce the areas with the most bullet holes. Statistician Abraham Wald pointed out the flaw: they were only looking at planes that survived. The bullet holes showed where a plane could be hit and still return. The areas without holes were where a hit was fatal. Armor should go on the areas with no holes on surviving planes.

The same logic applies to analytics. The data you have is from survivors. The data you are missing is from the ones who did not make it.

## How Survivorship Bias Appears in Analytics

### Cohort Analysis

**The mistake:** "Our 2024 Q1 cohort has 80% retention at 12 months!"

**The problem:** The 2024 Q1 cohort started with 10,000 users. By month 3, 6,000 had churned. The 4,000 who remained were inherently more engaged. Of course their 12-month retention looks great -- you already lost the weak ones. The "80% retention at month 12" is really "80% retention among the users who survived to month 3," which is a very different statement.

**The fix:** Always show retention from the starting cohort size. If 10,000 started and 3,200 remain at month 12, that is 32% retention, not 80%.

### Funnel Analysis

**The mistake:** "Users who reach step 3 of checkout have a 90% completion rate!"

**The problem:** Most drop-off happens at steps 1 and 2. By step 3, only the most committed users remain. The 90% completion rate at step 3 tells you nothing about the 70% who never got past step 1.

**The fix:** Report funnel metrics from the entry point. "Of all users who viewed a product, 12% completed purchase." Then break down by step to find where the friction is.

### Customer Surveys

**The mistake:** "Customer satisfaction is 4.5 out of 5!"

**The problem:** You surveyed current customers. The dissatisfied ones already left. They are not in your survey population. Your satisfaction score reflects the satisfaction of survivors, not the satisfaction of all people who tried your product.

**The fix:**
- Survey users at every stage, including during cancellation.
- Track satisfaction of churned users (exit surveys).
- Weight survey results by the size of each population segment.
- Report response rate alongside satisfaction scores.

### Feature Adoption Analysis

**The mistake:** "Users who adopt Feature X have 3x higher retention!"

**The problem:** This could mean Feature X drives retention. Or it could mean that highly engaged users (who would have retained anyway) are the ones who discover and adopt Feature X. You are observing the survivors (engaged users) and attributing their survival to the feature.

**The fix:**
- Use causal methods: A/B test the feature, or use propensity score matching to compare similar users who did and did not adopt.
- Control for prior engagement level.
- Look at the timing: did engagement increase after adoption, or were these already engaged users?

### User Research Participant Selection

**The mistake:** Recruiting interview participants from active users.

**The problem:** Active users tell you why the product works. Churned users would tell you why it does not. If you only talk to survivors, you get a biased view of the product experience.

**The fix:** Include churned users, trial-expired users, and users who signed up but never activated in your research pool.

### Benchmarking Against Successful Companies

**The mistake:** "Successful SaaS companies have NRR above 120%. Let us target 120%."

**The problem:** You are looking at companies that survived and succeeded. The companies that tried and failed are not in the benchmark dataset. The survivors may have had unique advantages (timing, funding, market conditions) that are not replicable.

**The fix:** Include failed companies in your analysis when possible. Understand the distribution of outcomes, not just the top performers.

### Content Performance Analysis

**The mistake:** "Our top 10 blog posts average 50,000 views!"

**The problem:** You published 500 blog posts. You are looking at the top 2%. The median post might have 200 views. The top 10 survived a selection process (SEO, social sharing, timing), and their performance is not representative of your content strategy's effectiveness.

**The fix:** Report the full distribution: median views, 25th percentile, 75th percentile. Evaluate the content strategy on aggregate performance, not cherry-picked winners.

### Revenue Cohort Analysis

**The mistake:** "Our average customer now pays $500/month, up from $300 two years ago!"

**The problem:** Small customers churned. The average went up not because customers are paying more, but because low-paying customers left the denominator. This is mathematical survivorship, not actual expansion.

**The fix:** Track revenue changes for the same set of customers over time (same-store analysis). Separate the effects of expansion, contraction, and churn on the average.

## Detecting Survivorship Bias

Ask these questions about any analysis:

1. **Who is missing from this dataset?** Who dropped off, churned, or was filtered out before this analysis?
2. **What is the starting population?** All metrics should be reportable from the original population, not just the current population.
3. **Is the denominator shrinking?** If the population shrinks over time, any per-capita metric will improve naturally.
4. **Could the correlation be reversed?** Does Feature X cause retention, or does retention cause Feature X adoption?
5. **Are we looking at winners only?** If benchmarking, are we including failures?

## Survivorship Bias in Common Metrics

| Metric | Survivorship Risk | Mitigation |
|--------|------------------|------------|
| Active user retention | Only measures users who stayed past initial period | Report retention from signup date for full cohort |
| Average revenue per user (ARPU) | Low-revenue users churn, inflating ARPU | Track ARPU for consistent cohorts over time |
| Feature adoption rate | Denominator is "active users," excluding churned | Include all users who had access, not just active |
| NPS | Only surveys current customers | Include exit surveys, track response rates |
| Session duration (average) | Short sessions from bounced users may be excluded | Include all sessions, show distribution |
| Conversion rate over time | If traffic quality changes, rate changes without product changes | Segment by traffic source, control for mix shifts |
| Employee satisfaction | Unhappy employees leave, survivors are more satisfied | Track satisfaction trend alongside attrition data |

## Structural Solutions

### Preserve the Full Dataset

Never delete records of churned users, dropped-off visitors, or failed experiments from your analytical database. You need the non-survivors to compute accurate metrics.

### Build Cohort Tables That Start at the Beginning

```sql
-- Good: Retention from signup
SELECT
    DATE_TRUNC('month', u.created_at) AS signup_month,
    COUNT(DISTINCT u.user_id) AS cohort_size,
    COUNT(DISTINCT CASE WHEN a.activity_month = DATE_TRUNC('month', u.created_at) + INTERVAL '1 month'
                        THEN a.user_id END) AS retained_month_1
FROM users u
LEFT JOIN monthly_activity a ON u.user_id = a.user_id
GROUP BY 1;

-- Bad: Retention from "first active month" (already filtered to survivors)
```

### Use Intent-to-Treat Analysis

Borrowed from clinical trials: analyze everyone who was exposed, not just those who completed the treatment. In product analytics:

- Analyze all users who were shown a feature, not just those who used it.
- Analyze all users in an experiment, not just those who engaged with the variant.
- Analyze all trial signups, not just those who completed onboarding.

### Report Distributions, Not Just Averages

Averages hide survivorship effects. Distributions reveal them. If the median and mean diverge significantly, survivorship bias may be at play.

## Key Takeaway

The most dangerous aspect of survivorship bias is that it makes everything look better than it is. Survivors are, by definition, the successful ones. When you only analyze survivors, your product looks more engaging, your customers look more satisfied, and your strategies look more effective than they actually are.

Always ask: "Who is not in this dataset, and what would the picture look like if they were?"
