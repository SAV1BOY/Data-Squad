# Task: Analyze Feature Adoption
> Agent(s): Product Analyst, Data Analyst
> Frameworks: Feature Adoption Framework, AARRR Funnel for Features
> Checklists: analysis-rigor-checklist, feature-adoption-checklist
> Template: feature-adoption-template
> Registry: analysis-registry

## Objective
Measure and analyze the adoption trajectory of a product feature to determine whether it is
meeting expectations, identify barriers to adoption, and recommend actions to improve uptake.

## Prerequisites
- Feature is launched and tracking is implemented for feature-specific events.
- Success criteria for the feature were defined pre-launch (see define-success-criteria).
- Access to user-level event data covering pre-launch and post-launch periods.
- Feature flag or launch date is documented.

## Steps
1. **Define adoption metrics** -- Establish the feature adoption funnel:
   - Awareness: % of eligible users who saw the feature entry point.
   - Activation: % of aware users who tried the feature at least once.
   - Engagement: frequency and depth of usage among activated users.
   - Retention: % of activated users who return to the feature (Day 7, Day 30).
2. **Set the analysis window** -- Define the post-launch period to analyze. Typically
   2-4 weeks for initial analysis, 8-12 weeks for mature analysis.
3. **Calculate adoption curve** -- Plot cumulative adoption (% of eligible users who have
   used the feature) over time since launch. Compare to benchmarks or prior features.
4. **Measure the adoption funnel** -- Calculate conversion rates at each stage of the
   adoption funnel (awareness -> activation -> engagement -> retention).
5. **Segment adoption** -- Break adoption rates by:
   - User tenure (new vs. existing users).
   - Plan type (free vs. paid).
   - Platform.
   - Acquisition channel.
   Identify which segments adopt fastest and slowest.
6. **Analyze usage patterns** -- For activated users, measure:
   - Frequency of use (daily, weekly, monthly).
   - Depth of use (which sub-features are used, how many steps completed).
   - Time spent per session with the feature.
7. **Identify barriers** -- Investigate why users do not adopt:
   - Where in the adoption funnel is the biggest drop-off?
   - Do users who see the feature but do not try it differ systematically?
   - Are there UX friction points (error events, rage clicks, back-navigation)?
8. **Measure impact on core metrics** -- Compare feature adopters vs. non-adopters on
   core metrics (retention, engagement, revenue). Control for selection bias using
   propensity score matching or similar technique.
9. **Compare to success criteria** -- Evaluate adoption against the pre-defined success
   criteria. Is the feature meeting, exceeding, or falling short of targets?
10. **Formulate recommendations** -- Based on findings, recommend:
    - Feature improvements to remove adoption barriers.
    - Discovery improvements to increase awareness.
    - Targeting changes to reach high-potential segments.
    - Ship/iterate/kill decision if applicable.
11. **Document and present** -- Create the feature adoption report and share with the
    product team.

## Deliverable
A feature adoption analysis report containing:
- Adoption curve with benchmark comparison.
- Adoption funnel with conversion rates.
- Segment analysis showing differential adoption.
- Usage pattern analysis for activated users.
- Barrier identification with evidence.
- Impact on core metrics (with selection bias controls).
- Comparison to success criteria.
- Recommendations for next steps.

## Quality Gate
- [ ] Adoption metrics are clearly defined (awareness through retention).
- [ ] Adoption curve is plotted with sufficient data points.
- [ ] At least 3 segment breakdowns are analyzed.
- [ ] Barriers to adoption are identified with data evidence.
- [ ] Impact analysis controls for selection bias.
- [ ] Results compared to pre-defined success criteria.
- [ ] Recommendations are specific and actionable.
- [ ] Report shared with product team within the agreed timeline.

## Registry Update
- Log analysis in `analysis-registry` with feature name and adoption metrics.
- Update feature success criteria status in `experiment-registry`.
- Log task completion in `task-log`.
