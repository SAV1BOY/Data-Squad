# Community Scorecard - Analysis

## Phase Objective

Perform the initial comprehensive analysis of community health using the scorecard, identify meaningful trends and patterns, and rigorously attribute community participation to business outcomes. This analysis establishes the baseline understanding of community performance and demonstrates the community's business value with data.

## Prerequisites

- Community scorecard dashboard operational from Phase 03
- At least 3 months of scorecard data accumulated for trend analysis
- Access to business outcome data (churn, revenue, support tickets) for attribution analysis
- Statistical analysis tools (Python, R, or equivalent) for causal analysis
- Community manager context for interpreting patterns and validating findings

## Steps

1. **Establish the Baseline Health Assessment**: Using the first full quarter of scorecard data, document the baseline state of each health dimension. For each metric, report the average value, trend direction, volatility, and performance against target. Classify each dimension as healthy (meeting or exceeding targets), developing (improving but below targets), or concerning (declining or significantly below targets). This baseline is the reference point for all future assessments.

2. **Analyze Growth Dynamics**: Examine the community's growth patterns in detail. Calculate the member lifecycle funnel: visitors who join, joiners who activate, active members who become regular contributors, and regular contributors who become power users. Identify where the largest drop-offs occur. Analyze acquisition sources to determine which channels bring the most engaged members versus the most short-lived members. Model the community's sustainable growth rate based on current activation and retention rates.

3. **Analyze Engagement Patterns**: Map engagement across multiple dimensions. Identify the time patterns: which days and hours see peak activity. Identify the content patterns: which topic categories generate the most discussion, which content formats receive the most engagement, and which types of questions get the fastest responses. Identify the member patterns: what distinguishes highly engaged members from lurkers, and at what tenure do members typically reach peak engagement or begin to disengage.

4. **Analyze Contribution Quality and Distribution**: Examine the Pareto distribution of contributions. Calculate what percentage of total value (answers, resources, discussions) is produced by the top 1%, 5%, and 10% of contributors. Assess the bus factor: if the top 5 contributors stopped participating, how much would community output decline? Evaluate content quality trends: are answer acceptance rates improving, is time-to-resolution decreasing, and is the knowledge base growing in coverage.

5. **Assess Belonging and Social Health**: Analyze the structural health of the community's social network. Calculate reciprocity (are the same members always giving and never receiving, or is value exchange balanced), clustering (are there distinct sub-communities or is the community a single cohesive group), and bridging (are there members who connect otherwise separate groups). Combine behavioral analysis with survey data on belonging to identify segments where belonging is strong versus where members feel peripheral.

6. **Perform Business Impact Attribution**: This is the most critical and most challenging analysis. Use quasi-experimental methods to isolate the community's causal impact on business outcomes. Compare outcomes for community members versus matched non-members using propensity score matching to control for self-selection bias (members who join the community may already be more engaged customers). Calculate the retention lift, support ticket reduction, and revenue impact attributable to community participation after controlling for confounders.

7. **Build the ROI Calculation**: Using the attributed business impact, calculate the community's return on investment. Sum the quantifiable benefits: support cost savings from ticket deflection, incremental revenue from retained community members versus matched non-members, referral revenue from community-driven acquisitions, and product development value from community-sourced feedback that informed shipped features. Subtract the community's total cost: platform costs, community team salaries, content creation, and events. Present the ROI as both a ratio and an absolute dollar figure.

8. **Identify Opportunities and Risks**: Based on the comprehensive analysis, identify the top 3 opportunities for community improvement and the top 3 risks to community health. Opportunities might include untapped segments that could be activated, content categories that are underserved, or community-driven programs that could scale. Risks might include over-reliance on a small number of contributors, declining engagement among a key segment, or growing dissatisfaction detected in belonging surveys.

9. **Produce the Community Health Report**: Compile all analysis findings into a comprehensive community health report. Structure the report in layers: an executive summary with the composite health index and ROI headline, a dimension-by-dimension assessment with trends and key findings, a deep-dive section with methodology and detailed analysis, and a recommendations section with prioritized opportunities and risk mitigation strategies. Present the report to all stakeholder audiences with tailored emphasis for each group.

## Deliverables

- Baseline health assessment documenting initial performance across all dimensions
- Growth dynamics analysis with member lifecycle funnel and acquisition source evaluation
- Engagement pattern analysis with temporal, content, and member-level insights
- Contribution distribution analysis with concentration metrics and bus factor assessment
- Belonging and social health analysis combining behavioral and survey data
- Business impact attribution report using quasi-experimental methods
- Community ROI calculation with benefits, costs, and net value
- Opportunity and risk identification with prioritized recommendations
- Comprehensive community health report for all stakeholder audiences

## Quality Gate

Analysis is complete when all of the following conditions are met:

- Baseline values are documented for every scorecard metric with trend direction and target comparison
- Growth, engagement, contribution, and belonging dimensions each have dedicated analysis findings
- Business impact attribution uses a methodology that controls for self-selection bias
- ROI calculation is documented with transparent assumptions and has been reviewed by finance
- At least 3 opportunities and 3 risks are identified with specific, actionable recommendations
- The community health report has been presented to all key stakeholders
- The community manager has validated that findings align with their operational observations
- Analysis methodology is documented so the assessment can be repeated in future periods

## Next Phase

This is the final phase of the Community Scorecard project. The scorecard is now operational with defined metrics, instrumented data collection, a live dashboard, and an initial analysis establishing baselines and business impact. Ongoing activities include weekly scorecard reviews by the community team, monthly trend monitoring, quarterly belonging surveys, and semi-annual comprehensive health assessments following the methodology established in this phase.
