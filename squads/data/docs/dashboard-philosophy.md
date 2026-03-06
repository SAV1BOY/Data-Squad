# Dashboard Philosophy

## Core Principle: Dashboards That Decide

A dashboard is not art. It is not a trophy. It is a tool that helps someone make a better decision, faster. If a dashboard does not change what someone does, it should not exist.

## The Three Questions Test

Before building any dashboard, answer these three questions. If you cannot, stop and go back to the requester.

1. **What question does this dashboard answer?** One question. Not "give me all the data." A specific question that a specific person needs answered to do their job.

2. **What decision will the viewer make?** "When I see X, I will do Y." If the viewer cannot articulate the decision, the dashboard is a vanity project.

3. **How often is this decision made?** The refresh rate of the dashboard should match the decision cadence. A weekly decision does not need a real-time dashboard.

## Design Principles

### Lead with the answer, not the data
The most important number goes in the top-left corner. The viewer should know the answer within 3 seconds of opening the dashboard. Supporting detail goes below and to the right.

### Every chart earns its place
Each visualization must answer a sub-question that supports the main question. If you cannot explain why a chart is on the dashboard in one sentence, remove it. "It might be interesting" is not a justification.

### Context over raw numbers
A number without context is meaningless. Always include:
- **Comparison:** vs. last period, vs. target, vs. benchmark
- **Trend:** is it going up or down?
- **Annotation:** what happened on dates with unusual movements?

### Choose the right chart type
- **Trend over time:** line chart. Not bar charts for time series.
- **Comparison between categories:** horizontal bar chart. Sorted by value, not alphabetically.
- **Part of whole:** only if 3-4 categories. Avoid pie charts with more than 4 slices.
- **Single important number:** big number (KPI card) with comparison to target/previous period.
- **Detailed exploration:** table with conditional formatting. Use sparingly.

### Action layer
Every section of the dashboard should include guidance on what to do when the metric is above or below threshold. This can be a text annotation, a link to a runbook, or a conditional color that triggers a specific workflow.

## Anti-Patterns to Avoid

**The "data dump" dashboard.** Thirty charts covering every metric imaginable. Nobody looks at it because nobody knows where to start. Cure: one question per dashboard.

**The "art gallery" dashboard.** Beautiful visualizations that are hard to interpret. Fancy charts that require a legend to read. Cure: clarity beats aesthetics. Use the simplest chart that conveys the information.

**The "real-time" dashboard for weekly decisions.** Costs more, refreshes constantly, and creates anxiety. Cure: match refresh to decision cadence.

**The "no owner" dashboard.** Built once, never maintained, data breaks silently. Cure: every dashboard has a named owner in the registry and a review date.

**The "everybody's dashboard."** Tries to serve multiple audiences with different needs. Ends up serving none. Cure: one audience per dashboard.

## Dashboard Lifecycle

1. **Request:** Stakeholder has a question. Use the dashboard-build-workflow to scope it.
2. **Build:** Follow the workflow through question definition, data preparation, visual design, and action layer.
3. **Launch:** Pass through the RalphLoop quality gates. Publish with an interpretation guide.
4. **Maintain:** Review monthly. Is the question still relevant? Is the data still accurate? Is anyone using it?
5. **Retire:** If usage drops below threshold or the question is no longer relevant, deprecate the dashboard. Follow the metric-deprecation-workflow for any unique metrics it contains.

## Technical Standards

- All dashboards use the BI tool's standard color palette. No custom colors without justification.
- Date filters default to the natural decision cadence period (weekly for weekly decisions, monthly for monthly decisions).
- All dashboards include a "last updated" timestamp visible without scrolling.
- Drill-down paths must lead to actionable detail, not just more data.
- Dashboard names follow the naming conventions in naming-conventions.md.
