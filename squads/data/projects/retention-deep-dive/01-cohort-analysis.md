# Retention Deep Dive - Cohort Analysis

## Phase Objective

Build comprehensive cohort retention curves that reveal how user retention varies by acquisition period, segment, and behavior. Cohort analysis is the foundational analytical technique for understanding retention because it controls for the confounding effect of user mix changes over time.

## Prerequisites

- Completed scope document from Phase 00 with defined retention type and time horizons
- User-level event data with timestamps spanning the full analysis window
- User registration or first-activity dates for cohort assignment
- Validated baseline retention metrics
- SQL access to the data warehouse or analytics tool with cohort analysis capabilities

## Steps

1. **Define Cohort Boundaries**: Determine how cohorts will be grouped. Weekly cohorts provide granularity for fast-moving consumer products. Monthly cohorts are appropriate for B2B SaaS and subscription businesses. Quarterly cohorts work for low-frequency products like travel or insurance. Align cohort boundaries with calendar periods to simplify interpretation and communication.

2. **Build the Standard Retention Table**: Create a cohort retention matrix where each row is a cohort (defined by signup week or month) and each column is a time period since signup (period 0, period 1, period 2, etc.). Each cell contains the percentage of the cohort that was active during that period. Use the retention definition established in the scope: active means logged in, completed a key action, or made a purchase, depending on the retention type chosen.

3. **Visualize Retention Curves**: Plot retention curves for each cohort on the same chart. The x-axis is time since signup, and the y-axis is the percentage of the cohort still active. Look for the overall shape of the curve: a steep initial drop followed by flattening suggests a product that retains a core audience after initial churn. A steadily declining curve without flattening suggests a fundamental retention problem.

4. **Compare Cohort Performance Over Time**: Examine whether newer cohorts retain better or worse than older cohorts. Improving cohort curves indicate that product changes are having a positive effect. Declining cohort curves indicate deteriorating product-market fit or degrading user quality. Calculate the retention rate at a fixed time horizon (e.g., Day 30 or Month 3) across cohorts to create a trend line.

5. **Segment Cohorts by Acquisition Channel**: Rebuild the retention table for each major acquisition channel (organic search, paid search, social media, referral, direct). Compare curves to identify which channels produce the highest-retaining users. Large differences between channels suggest that user intent and expectations vary by source, which has implications for both acquisition strategy and onboarding design.

6. **Segment Cohorts by User Characteristics**: Create retention curves segmented by user attributes such as plan tier, company size, geography, device type, and demographic factors where available. Identify segments with significantly higher or lower retention than the overall average. These segments become candidates for targeted retention interventions in later phases.

7. **Segment Cohorts by Early Behavior**: This is often the most actionable analysis. Segment users by what they did in their first session, first day, or first week. Compare retention curves for users who completed onboarding versus those who did not, users who used a specific feature versus those who did not, and users who invited a teammate versus those who did not. Behaviors that strongly predict retention become candidates for activation optimization.

8. **Identify the Retention Inflection Point**: Find the time period after which retention stabilizes. This is the point where the curve flattens. Users who make it past this point are likely to be long-term retained. For consumer apps, this might be Day 7 or Day 14. For B2B SaaS, it might be Month 2 or Month 3. This inflection point defines the critical window for retention interventions.

9. **Calculate Statistical Confidence**: For all segment comparisons, calculate whether observed differences in retention rates are statistically significant given the sample sizes. Small segments may show dramatic differences that are purely noise. Use chi-squared tests or confidence intervals to distinguish real patterns from random variation.

## Deliverables

- Cohort retention matrix (table format) with all cohorts and time periods
- Retention curve visualizations comparing cohorts over time
- Cohort trend analysis showing whether retention is improving or declining
- Channel-segmented retention comparison with significance testing
- User characteristic segmented retention comparison
- Early behavior segmented retention comparison with identified predictive behaviors
- Retention inflection point analysis with recommended intervention window

## Quality Gate

Cohort analysis is complete when all of the following conditions are met:

- Retention curves have been built for at least 12 cohorts spanning the full analysis window
- At least three segmentation dimensions have been analyzed (channel, characteristic, behavior)
- Statistical significance has been calculated for all segment comparisons
- The retention inflection point has been identified with supporting data
- Early behaviors that predict long-term retention have been identified and ranked
- Results have been validated by cross-referencing with known business events (product launches, pricing changes)
- The retention inflection point has been identified with supporting data and recommended intervention window
- Findings are documented with clear visualizations accessible to non-technical stakeholders

## Next Phase

Proceed to **02-churn-investigation.md** (Churn Investigation) to examine the users who churned in detail, understanding the types, causes, and patterns of churn.
