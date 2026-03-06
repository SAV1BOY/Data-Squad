# Community Scorecard - Metrics Definition

## Phase Objective

Define the specific, measurable metrics for each community health dimension identified in the brief. Each metric must have a precise formula, a data source, a calculation method, and an interpretation guide. The metrics collectively form the scorecard that enables data-driven community management.

## Prerequisites

- Community health dimension framework from Phase 00 with defined dimensions
- Data availability assessment confirming which signals are accessible
- Community platform API documentation for data extraction
- Benchmark data from industry reports or comparable communities
- Community manager input on which metrics would change their operational decisions

## Steps

1. **Define Growth Metrics**: Growth measures whether the community is attracting and retaining members at a sustainable rate. Key metrics include Net New Members (new joins minus departures per period), Activation Rate (percentage of new members who take their first meaningful action within 7 days of joining), Member Retention Rate (percentage of members active in the current period who were also active in the previous period), and Growth Rate (month-over-month change in total active members). For each metric, specify the formula, the data source, and what constitutes a healthy range.

2. **Define Engagement Metrics**: Engagement measures the depth and breadth of member participation beyond passive consumption. Key metrics include DAU/MAU Ratio (daily active users divided by monthly active users, indicating visit frequency), Engagement Depth (average actions per active member per session, including posts, replies, reactions, and shares), Lurker-to-Contributor Ratio (percentage of active members who consume content versus those who create it), and Return Frequency (average days between visits for active members). Distinguish between lightweight engagement (viewing, reacting) and heavy engagement (posting, replying, mentoring).

3. **Define Contribution Metrics**: Contribution measures whether the community is generating valuable content and accumulating knowledge. Key metrics include Content Creation Rate (new threads, articles, or resources created per period), Answer Quality (percentage of questions that receive an accepted or highly-rated answer), Time to First Response (median time between a question being posted and receiving its first substantive reply), Knowledge Base Growth (net new searchable, reusable content pieces per period), and Content Reuse Rate (percentage of content that is viewed or referenced more than 30 days after creation).

4. **Define Belonging Metrics**: Belonging measures whether members feel connected to each other and identify with the community. These metrics often require survey instruments since belonging is an internal state not fully captured by behavioral data. Key metrics include Net Promoter Score for the community (would you recommend this community to a peer), Belonging Index (survey-based measure of connection, trust, and identity), Reciprocity Rate (percentage of members who both give and receive help), and Cross-Connection Density (average number of distinct members each active member has interacted with).

5. **Define Business Impact Metrics**: Business impact measures whether the community delivers the business value articulated in the brief. Metrics depend on the community's purpose. For support deflection: Support Ticket Deflection Rate (questions answered in community that would otherwise be support tickets, measured by comparing community topic overlap with ticket topics) and Cost Savings (deflected tickets multiplied by average ticket cost). For retention: Community Member Churn Rate versus Non-Member Churn Rate. For advocacy: Referrals Generated from community members and User-Generated Content volume (case studies, reviews, social posts).

6. **Build the Composite Scorecard Index**: Create a single composite score that summarizes overall community health. Weight each dimension based on its importance to the community's stated purpose. For a support-focused community, contribution and business impact might receive higher weights. For a belonging-focused community, engagement and belonging receive higher weights. Normalize each dimension to a 0-100 scale before combining. The composite index provides a quick health check while the dimensional scores provide diagnostic detail.

7. **Define Metric Interpretation Guides**: For each metric, write a plain-language interpretation guide that helps community managers and stakeholders understand what the number means. Include what a healthy value looks like, what an unhealthy value indicates, what actions to consider when the metric is trending in the wrong direction, and what limitations the metric has. This prevents misinterpretation and ensures the scorecard drives correct decisions.

8. **Establish Benchmarks and Targets**: For each metric, set a target based on available benchmarks. Use industry benchmarks (CMX, FeverBee, and platform-specific reports publish community metric benchmarks), internal historical trends, and business requirements. Where external benchmarks are unavailable, set targets based on the community's own improvement trajectory. Document the benchmark source and the rationale for each target.

9. **Create the Metric Data Dictionary**: Compile a formal data dictionary entry for every metric in the scorecard. Each entry includes the metric name, definition, formula, data source, calculation frequency, responsible owner, target value, alert threshold, and interpretation notes. This dictionary becomes the authoritative reference for anyone working with community data.

## Deliverables

- Growth metrics definitions with formulas, data sources, and healthy ranges
- Engagement metrics definitions distinguishing lightweight and heavy participation
- Contribution metrics definitions measuring content quality and knowledge accumulation
- Belonging metrics definitions with survey instrument specifications
- Business impact metrics definitions tied to the community's stated purpose
- Composite scorecard index formula with dimension weights and normalization approach
- Metric interpretation guides for each metric in plain language
- Benchmark and target document with sources and rationale
- Complete metric data dictionary as the authoritative reference

## Quality Gate

Metrics definition is complete when all of the following conditions are met:

- Every health dimension from the brief has at least 3 defined metrics with precise formulas
- Each metric has an identified data source that is accessible and reliable
- The composite scorecard index formula has been defined with dimension weights justified by purpose
- Interpretation guides are written in language accessible to non-technical stakeholders
- Targets are set for every metric with documented benchmark sources
- The metric data dictionary is complete and reviewed by both the data team and community team
- The community manager confirms that the metrics would meaningfully change their operational decisions
- No metric relies on data that is unavailable or has coverage below 70%

## Next Phase

Proceed to **02-instrumentation.md** (Instrumentation) to implement the tracking and data collection needed to calculate the defined metrics.
