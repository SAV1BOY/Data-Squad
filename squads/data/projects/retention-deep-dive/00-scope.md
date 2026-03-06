# Retention Deep Dive - Scope

## Phase Objective

Define the specific retention problem to investigate, the time periods and user segments under analysis, and the success criteria for the project. Retention is a broad topic, and without tight scoping this work will sprawl into an unfocused data exploration that produces interesting charts but no actionable outcomes.

## Prerequisites

- Access to product analytics with user-level event data spanning at least 12 months
- Access to subscription or transaction data showing user lifecycle states
- Stakeholder alignment on which retention problem is the highest priority
- Defined product or business context (B2B SaaS, marketplace, consumer app, etc.)
- Baseline retention metrics currently reported by the organization

## Steps

1. **Clarify the Retention Type**: Retention means different things in different contexts. Specify whether this deep dive focuses on user retention (users returning to the product), revenue retention (maintaining or growing revenue from existing customers), engagement retention (sustained feature usage), or contractual retention (subscription renewals). Each type has different measurement approaches and intervention strategies.

2. **Define the Time Horizon**: Specify the retention windows relevant to the business. For a consumer app, Day 1, Day 7, and Day 30 retention may be appropriate. For B2B SaaS, monthly and annual retention rates matter more. For a marketplace, retention might be measured in repeat purchases per quarter. Choose time horizons that align with the business's natural usage cycles and contractual periods.

3. **Identify the Target Segments**: Determine which user segments will be analyzed. Options include all users, users acquired in a specific date range, users on a specific plan tier, users from a specific acquisition channel, or users in a specific geography. Narrower scopes produce more actionable insights but may lack statistical power. Balance specificity with sample size.

4. **Establish Baseline Metrics**: Pull current retention metrics for the defined scope. Calculate overall retention at each time horizon, segment-level retention, and retention trend over time (is it improving, declining, or stable). These baselines serve as the reference point for all subsequent analysis and intervention measurement.

5. **Quantify the Business Impact**: Calculate the revenue impact of the current retention rate. Model the impact of improving retention by 1, 5, and 10 percentage points. Compare the value of retention improvement against the cost of acquisition. This financial framing ensures the deep dive stays focused on commercially significant patterns rather than intellectually interesting but low-impact findings.

6. **Define the Analysis Questions**: Write down the specific questions this deep dive must answer. Examples: What is the retention rate by acquisition cohort and how has it trended? At what point in the lifecycle do most users churn? Which user segments have the highest and lowest retention? What behaviors in the first 7 days predict long-term retention? Are there seasonal patterns in churn? Each question should be answerable with available data.

7. **Set Success Criteria**: Define what a successful deep dive looks like. This might include identifying the top 3 actionable drivers of churn, producing a retention segmentation that the customer success team can act on, or generating hypotheses for 5 retention experiments. Success criteria should be specific enough to know when the work is done.

8. **Agree on Timeline and Resources**: Set a fixed timeline for the deep dive, typically 2-4 weeks. Assign the analyst, data engineer support if needed, and stakeholder reviewers. A fixed timeline prevents analysis paralysis and forces prioritization of the most impactful analyses.

## Deliverables

- Scope document specifying retention type, time horizons, and target segments
- Baseline retention metrics dashboard or report
- Business impact model showing revenue effect of retention changes
- Prioritized analysis questions list
- Success criteria with specific, measurable outcomes
- Project timeline with milestones and assigned resources

## Quality Gate

Scoping is complete when all of the following conditions are met:

- The retention type is explicitly defined and agreed upon by all stakeholders
- Time horizons are specified and aligned with the business's natural cycles
- Target segments are defined with sufficient sample sizes confirmed
- Baseline metrics are calculated and validated against existing reports
- The business impact model has been reviewed by finance or business leadership
- Analysis questions are prioritized and the top questions can be answered with available data
- Success criteria are specific enough that completion can be objectively assessed
- A fixed timeline with milestones is set and analyst resources are formally allocated
- Data access has been confirmed for all sources needed to answer the prioritized analysis questions
- The retention definition (what constitutes an active user) is documented and agreed upon by all stakeholders
- The business impact model quantifies the revenue value of retention improvements at multiple scenarios

## Next Phase

Proceed to **01-cohort-analysis.md** (Cohort Analysis) to define user cohorts, build retention curves, and compare cohort performance to identify patterns and trends. The retention definition, time horizons, and target segments from this scope document directly structure the cohort analysis approach.
