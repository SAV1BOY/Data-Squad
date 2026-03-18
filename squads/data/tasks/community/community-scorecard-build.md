# Task: Community Scorecard Build
> Agent(s): david-spinks, peter-fader, data-chief
> Frameworks: community-led-growth-metrics, spinks-orbit-model, spinks-community-roi-framework
> Checklists: community-metrics-quality, spinks/community-loop-design, spinks/community-impact-attribution
> Templates: outputs/community-scorecard
> Registry: community-registry, decision-registry

## Objective
Build a comprehensive community scorecard that tracks the health, engagement, and business
impact of the community, giving leadership clear visibility into community performance and ROI.

## Prerequisites
- Community platform is operational with data export capability.
- Community goals and strategy are documented.
- Access to community platform analytics and the data warehouse.
- Business metrics (product usage, retention, revenue) are available for community members.

## Steps
1. **Define scorecard dimensions** -- Using the SPACES model or similar:
   - Support: deflection rate, answer quality, response time.
   - Product: feedback collected, feature requests, beta participation.
   - Acquisition: referrals, organic traffic, signup attribution.
   - Contribution: content created, answers provided, events attended.
   - Engagement: active members, DAU/MAU ratio, return rates.
   - Success: member satisfaction, learning outcomes.
2. **Select metrics for each dimension** -- Choose 2-3 metrics per dimension. Ensure each
   metric is measurable with current data. Prioritize metrics with business impact linkage.
3. **Define each metric** -- For every scorecard metric, write:
   - Name, formula, data source.
   - Reporting granularity (weekly, monthly).
   - Target value and benchmark.
4. **Establish baselines** -- Pull current values for all metrics. If the community is new,
   set initial baselines from the first full month of data.
5. **Set targets** -- For each metric, define quarterly targets:
   - Conservative target (90% confidence of achieving).
   - Stretch target (50% confidence).
   Base targets on growth rates of similar communities or company growth rate.
6. **Build data pipelines** -- Ensure all metrics can be automatically calculated:
   - Extract community platform data (API or export).
   - Join with product/business data in the warehouse.
   - Schedule daily or weekly data refreshes.
7. **Create the scorecard visualization** -- Build a dashboard with:
   - One section per dimension.
   - Traffic light status (green/yellow/red) for each metric vs. target.
   - Trend sparklines for the past 12 weeks.
   - Month-over-month and year-over-year comparisons.
8. **Add business impact section** -- Include metrics that link community to business:
   - Community members vs. non-members: retention comparison.
   - Community members vs. non-members: expansion rate comparison.
   - Support ticket deflection value (tickets avoided x cost per ticket).
9. **Define the review cadence** -- Specify when and how the scorecard is reviewed:
   - Weekly: community team reviews engagement metrics.
   - Monthly: cross-functional review of all dimensions.
   - Quarterly: executive review with ROI analysis.
10. **Test and validate** -- Verify all metrics calculate correctly. Cross-check totals
    against community platform native analytics.
11. **Document** -- Write scorecard documentation including metric definitions, data
    sources, refresh schedule, and interpretation guide.
12. **Launch and train** -- Present the scorecard to stakeholders. Train the community
    team on how to read and act on it.

## Deliverable
A community scorecard package containing:
- Scorecard dashboard with all dimensions.
- Metric definitions for every scorecard item.
- Baseline values and quarterly targets.
- Business impact analysis section.
- Review cadence documentation.
- Interpretation guide.

## Quality Gate
- [ ] At least 5 dimensions are covered with 2+ metrics each.
- [ ] Every metric has a formal definition and data source.
- [ ] Baselines are established from real data.
- [ ] Targets are set for all metrics.
- [ ] Business impact section links community to retention/revenue.
- [ ] Data refresh is automated (not manual).
- [ ] Scorecard is validated against platform native analytics.
- [ ] Review cadence is established and communicated.

## Registry Update
- Add all community metrics to `metric-registry` with community domain tag.
- Log scorecard build in `task-log` with metric count and coverage.
