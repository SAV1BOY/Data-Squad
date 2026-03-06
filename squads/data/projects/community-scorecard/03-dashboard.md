# Community Scorecard - Dashboard

## Phase Objective

Build a community scorecard dashboard that presents health metrics in an intuitive, actionable format for all stakeholder audiences. The dashboard must surface the composite health index for quick assessment, enable drill-down into individual dimensions for diagnosis, and provide the trend context needed to distinguish normal fluctuation from meaningful change.

## Prerequisites

- All metrics instrumented and producing reliable data from Phase 02
- Access to the visualization tool (Looker, Tableau, Metabase, or similar)
- Stakeholder requirements documented from Phase 00 specifying which audiences need which views
- At least 4 weeks of metric data accumulated for meaningful trend display
- Design guidelines or brand standards for the organization's reporting

## Steps

1. **Design the Dashboard Architecture**: Plan a multi-level dashboard structure that serves different audiences. The top level is the Executive Scorecard: a single-page view showing the composite health index, dimension scores, and key business impact metrics with month-over-month trends. The second level is the Community Manager Dashboard: detailed operational metrics with daily granularity, member activity breakdowns, and content performance. The third level is the Diagnostic Views: drill-down pages for each dimension enabling root cause investigation when a dimension score declines.

2. **Build the Executive Scorecard**: Create a concise, high-impact visualization for leadership. Place the composite health index prominently with a clear indicator of whether health is improving, stable, or declining. Display each dimension score with a gauge or traffic light showing performance against target. Include the top 3 business impact metrics (support deflection savings, member retention advantage, referral generation). Add a trend sparkline for each metric showing the last 6 months. Limit this view to one screen with no scrolling required.

3. **Build the Community Manager Dashboard**: Create the operational view that community managers check daily. Include real-time or daily-refresh metrics: active members today, new posts and replies, questions awaiting answers, average response time, flagged content requiring moderation, and new member joins. Add weekly trend charts for engagement depth, contribution rate, and lurker-to-contributor ratio. Include a member activity heatmap showing when the community is most active by day of week and hour.

4. **Build Dimension Drill-Down Views**: For each health dimension (growth, engagement, contribution, belonging, business impact), create a dedicated analysis page. Each drill-down should display all metrics within the dimension, their current values, targets, and trends. Include segment breakdowns: engagement by member tenure, contribution by member type (power user, regular, occasional), and growth by acquisition source. Add comparison against prior periods and highlight statistically significant changes.

5. **Implement Trend Context and Annotations**: Raw metric trends are meaningless without context. Add year-over-year comparison lines to account for seasonality. Include moving averages (7-day and 30-day) alongside daily values to smooth noise. Build an annotation layer where the community team can mark significant events: product launches, community campaigns, platform changes, external events. Annotations explain metric shifts and prevent false interpretations.

6. **Create Member-Level Exploration**: Build a view that enables exploration of individual member behavior within the scorecard context. Include a sortable and filterable member table showing each member's activity metrics, engagement score, tenure, and contribution count. Enable filtering by segment, activity level, and join date. This view supports targeted outreach (identifying power users for recognition, identifying disengaging members for re-activation) and qualitative investigation of quantitative patterns.

7. **Add Comparative Benchmarks**: Where external benchmarks are available, display them alongside actual metrics. Show the community's engagement rate compared to the industry median. Show response time compared to best-in-class communities. Benchmarks transform abstract numbers into relative performance assessments. Where benchmarks are unavailable, display the community's own historical performance as the comparison.

8. **Configure Automated Reporting**: Set up scheduled delivery of scorecard summaries. Generate a weekly email digest for the community team containing key metric changes, notable trends, and items requiring attention. Generate a monthly executive summary for leadership with the composite health index, dimension highlights, and business impact quantification. Automate the generation so reports are delivered without manual effort.

9. **Conduct User Testing with Stakeholders**: Present the dashboard to each stakeholder audience and observe how they interact with it. Ask them to answer specific questions using the dashboard (e.g., "Is community engagement improving or declining?" or "Which content type generates the most value?"). Note where they struggle, where they misinterpret data, and what additional views they need. Iterate on the design based on observed usage patterns.

## Deliverables

- Executive scorecard showing composite health index and dimension scores on a single page
- Community manager operational dashboard with daily-refresh activity metrics
- Dimension drill-down views for each health dimension with segment breakdowns
- Trend context with year-over-year comparisons, moving averages, and annotation capability
- Member-level exploration view with sortable, filterable activity table
- Benchmark comparisons displayed alongside actual performance metrics
- Automated weekly digest and monthly executive summary reports
- User testing summary with feedback and implemented design iterations

## Quality Gate

The dashboard is complete when all of the following conditions are met:

- The executive scorecard answers the question "Is the community healthy?" within 10 seconds of viewing
- The community manager dashboard provides all metrics needed for daily operational decisions
- Dimension drill-downs enable diagnosis of any decline in less than 5 minutes of exploration
- Trend context includes annotations, comparisons, and moving averages that prevent misinterpretation
- All dashboards load within 8 seconds on standard hardware
- Automated reports are configured, tested, and delivering on schedule
- User testing has been completed with at least one representative from each stakeholder audience
- The community manager confirms the dashboard would replace or improve their current reporting workflow

## Next Phase

Proceed to **04-analysis.md** (Analysis) to perform the initial community health assessment, identify trends, and attribute community impact to business outcomes.
