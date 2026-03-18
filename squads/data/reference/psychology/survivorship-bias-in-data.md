# Survivorship Bias in Data

## What Is Survivorship Bias

Survivorship bias occurs when analysis focuses only on subjects that passed a selection filter, ignoring those that did not. The "survivors" are visible; the "non-survivors" are invisible. Conclusions drawn from survivors alone are systematically distorted because they do not represent the full population.

The classic example is WWII aircraft armor analysis. Engineers studied bullet holes on returning planes and proposed reinforcing the most-hit areas. Abraham Wald recognized the error: the planes that came back were the ones that survived hits in those areas. The planes that did not return were likely hit in the areas with no visible damage on survivors. The armor should go where the bullet holes were not.

## Survivorship Bias Patterns in Analytics

### Cohort Selection Errors

**The problem:** When analyzing user behavior, analysts often query "users who did X" without accounting for users who were eligible but did not do X.

**Example:** "Users who completed onboarding have 45% D30 retention." This is true but misleading. It excludes users who dropped off during onboarding — who have 0% retention. The real D30 retention for the full cohort may be 18%.

**Common manifestations:**
- Analyzing only users who reached a feature, ignoring those who never discovered it.
- Measuring satisfaction only among users who responded to a survey (respondent bias).
- Calculating average order value only for customers who purchased (ignoring browsers).

**Mitigation:** Always define the denominator as the full eligible population, not just the population that took the action. Report both: "18% of all signups are retained at D30. Among those who completed onboarding, retention is 45%."

### Success-Only Analysis

**The problem:** Studying only successful outcomes and reverse-engineering what made them successful, without examining whether unsuccessful outcomes share the same characteristics.

**Example:** "Our highest-LTV customers all used Feature X in their first week." This observation is meaningless without knowing what percentage of users who used Feature X in their first week became high-LTV. If 90% of all users try Feature X, it has no predictive power.

**Common manifestations:**
- Identifying traits of churned users without comparing to retained users.
- Studying converted leads without examining unconverted leads with similar traits.
- Analyzing successful campaigns without examining campaigns with similar characteristics that failed.

**Mitigation:** Always use a comparison group. For every "successful" cohort analysis, ask: "What does the unsuccessful cohort look like on the same dimensions?" Use relative metrics (lift, odds ratio) rather than absolute metrics.

### Lost User Blindness

**The problem:** Users who leave the product stop generating data. Over time, the active user base becomes increasingly self-selected for users who find value. Metrics improve not because the product improved but because dissatisfied users left.

**Example:** NPS increases from 30 to 45 over 6 months. The product did not change. What changed is that detractors churned, leaving a higher concentration of promoters among remaining users.

**Manifestations:**
- Rising engagement metrics during a retention crisis (fewer users, but survivors are engaged).
- Improving satisfaction scores after a controversial change (dissatisfied users left).
- Session duration increasing while user count decreases (casual users leave first).

**Mitigation:**
- Track metrics on a cohort basis, not just for the current active base.
- Monitor absolute numbers alongside rates: "Engagement rate increased from 40% to 50%, but the denominator shrank from 10,000 to 6,000 users."
- Include churned users in retrospective analyses by using their last-known data.

### Deactivated Account Exclusion

**The problem:** When users delete accounts or are deactivated, their data may be removed from the dataset entirely. Analysis then proceeds as if these users never existed, biasing every metric that uses historical user counts.

**Example:** A company deletes data for users who request account deletion (GDPR compliance). Over 12 months, 8% of users request deletion. LTV calculations that exclude these users are inflated because low-value users are more likely to delete accounts.

**Manifestations:**
- Historical cohort sizes shrink over time, making retention curves look better than reality.
- Revenue per user increases as low-spending deleted users disappear from the denominator.
- Funnel analysis excludes users who attempted the funnel but later deleted their accounts.

**Mitigation:**
- Maintain anonymized aggregate records even after individual deletion (count of users in each cohort, aggregate revenue by cohort).
- Snapshot cohort sizes at the time of cohort creation, not at the time of analysis.
- Flag analyses that may be affected by data deletion and note the potential direction of bias.

## Survivorship Bias in A/B Testing

### Conditional Analysis

Analyzing experiment results conditional on a post-treatment outcome introduces survivorship bias.

**Example:** "Among users who completed the checkout flow, the treatment group had 10% higher revenue." This excludes users who did not complete checkout — and if the treatment changed checkout completion rates, the surviving populations are not comparable.

**Rule:** Never condition on post-treatment outcomes when analyzing experiments. Compare all users assigned to treatment vs. control, regardless of what they did after assignment.

### Attrition Bias

If more users drop out of the treatment group than the control group, the remaining treatment users are a self-selected subset. Comparing these survivors to the full control group is invalid.

**Mitigation:** Report attrition rates by variant. If attrition differs by more than 2 percentage points, flag the experiment results as potentially biased. Use intent-to-treat analysis (analyze all assigned users) as the primary analysis.

## Detecting Survivorship Bias

### Warning Signs

1. Metrics that improve over time without corresponding product changes.
2. Analyses that start with "Among users who..." — the filter may be excluding non-survivors.
3. Cohort sizes that shrink faster than expected due to data deletion or account deactivation.
4. Engagement metrics rising while user counts decline.
5. Funnel conversion rates that are suspiciously high because the denominator excludes users who never started.

### Diagnostic Questions

- "Who is excluded from this analysis, and why?"
- "Would the conclusion change if we included users who left/churned/were deleted?"
- "Does the denominator represent everyone who was eligible, or only those who took an action?"
- "Are we studying survivors or the full population?"

## Practical Debiasing Techniques

1. **Define the denominator first.** Before running any analysis, explicitly state who is included and who is excluded.
2. **Analyze the excluded group.** How large is it? How different is it from the included group?
3. **Use intent-to-treat analysis** in experiments. Analyze everyone who was assigned, not just those who engaged.
4. **Snapshot cohort sizes** at creation time. Do not let data deletion erode historical denominators.
5. **Report rates alongside absolute numbers.** A rising rate with a shrinking denominator tells a different story than a rising rate with a growing denominator.

## Cross-References

- **Experimentation Standards** (`reference/standards/experimentation-standards.md`) — Intent-to-treat analysis requirements.
- **Base Rate Neglect** (`reference/psychology/base-rate-neglect.md`) — Related bias in denominator handling.
- **Simpson's Paradox Guide** (`reference/psychology/simpsons-paradox-guide.md`) — When subgroup analysis reverses conclusions.
