# Task: Build Dashboard
> Agent(s): avinash-kaushik, data-chief
> Frameworks: visualization-layer, data-storytelling-framework
> Checklists: dashboard-quality, kaushik/dashboard-storytelling-audit
> Templates: outputs/dashboard-spec
> Registry: dashboard-registry

## Objective
Design and build a self-serve dashboard that provides stakeholders with always-current
visibility into key metrics, reducing ad-hoc reporting requests and enabling data-driven
decisions.

## Prerequisites
- Metrics to display are defined in the metric registry.
- Data sources are available and refreshed on a reliable schedule.
- BI platform is selected and accessible (Looker, Tableau, Metabase, etc.).
- Stakeholder requirements have been gathered.

## Steps
1. **Gather requirements** -- Interview the dashboard audience:
   - What decisions will this dashboard support?
   - What questions need to be answered at a glance?
   - What is the review cadence (daily, weekly, monthly)?
   - Who are the primary and secondary users?
2. **Define the metric hierarchy** -- Organize metrics into tiers:
   - Tier 1 (headline): 3-5 key metrics visible at the top.
   - Tier 2 (supporting): 5-10 metrics providing context.
   - Tier 3 (detail): drill-down metrics for investigation.
3. **Design the layout** -- Sketch the dashboard layout:
   - Top section: headline metrics with sparklines and vs-target indicators.
   - Middle section: trend charts and comparisons.
   - Bottom section: detailed tables and drill-downs.
   - Filters: time range, segment, platform (positioned prominently).
4. **Select chart types** -- For each metric, choose the optimal visualization:
   - KPI cards for headline numbers.
   - Line charts for trends over time.
   - Bar charts for comparisons across segments.
   - Tables for detailed, scannable data.
   - Heatmaps for cohort or time-based patterns.
5. **Write the queries** -- For each chart/metric, write the SQL query:
   - Optimize for performance (pre-aggregate where possible).
   - Include appropriate filters and parameters.
   - Document the query logic.
6. **Build the dashboard** -- Implement in the BI platform:
   - Create data sources/connections.
   - Build each chart.
   - Configure filters and interactivity.
   - Apply consistent formatting (colors, fonts, number formats).
7. **Add context elements** -- Include:
   - Chart titles that state the insight, not just the metric name.
   - Benchmark lines or target indicators.
   - Date stamps showing data freshness.
   - Help text or tooltips explaining metric definitions.
8. **Optimize performance** -- Ensure the dashboard loads in < 5 seconds:
   - Use materialized views or aggregation tables.
   - Limit default date range.
   - Minimize the number of queries per page load.
9. **Test with users** -- Share the draft dashboard with 2-3 target users:
   - Can they answer their key questions within 30 seconds?
   - Are there confusing charts or labels?
   - Is anything missing?
   Iterate based on feedback.
10. **Set up data freshness alerts** -- Configure alerts if the data pipeline fails
    and the dashboard goes stale.
11. **Document the dashboard** -- Write documentation:
    - Purpose and audience.
    - Metric definitions (link to metric registry).
    - Data sources and refresh schedule.
    - Known limitations.
12. **Publish and communicate** -- Share the dashboard URL with stakeholders. Include
    in relevant Slack channels or email digests.

## Deliverable
A published dashboard containing:
- Headline KPI section with 3-5 key metrics.
- Trend visualizations with appropriate timeframes.
- Segment breakdowns and comparisons.
- Interactive filters (time, segment, platform).
- Documentation with metric definitions.

## Quality Gate
- [ ] Dashboard answers the stated business questions.
- [ ] Metric values match the metric registry definitions.
- [ ] Dashboard loads in under 5 seconds.
- [ ] At least 2 users have tested and provided feedback.
- [ ] All charts have descriptive titles and context.
- [ ] Filters are functional and intuitive.
- [ ] Data freshness indicator is present.
- [ ] Documentation is complete and linked.

## Registry Update
- Add dashboard to `dashboard-registry` with URL, owner, audience, and metrics listed.
- Link dashboard metrics back to `metric-registry` entries.
- Log task completion in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** avinash-kaushik owns this task end-to-end.
- **Supporting agents:** data-chief contribute to their domain-specific steps.
- **Review:** data-chief reviews the final deliverable before it exits the squad.
- **Cross-squad delivery:** If the output is requested by another squad, deliver via the cross-squad-data-delivery-workflow with data-chief sign-off.

### Escalation Rules
- **Data blocker:** If required data is unavailable or unreliable, escalate to data-chief within 24 hours.
- **Stakeholder disagreement:** If stakeholders reject the methodology or conclusions, escalate to data-chief for mediation.
- **Deadline risk:** If the task cannot be completed on schedule, notify data-chief at least 48 hours before the deadline.

### Rework Loop
- **Trigger:** Any checklist item marked as fail, or reviewer requests changes.
- **Maximum iterations:** 2 rework cycles. If the deliverable fails after 2 reworks, escalate to data-chief for a scope review.
- **Between iterations:** The reviewing agent provides specific, written feedback on what must change. No vague "needs improvement" — every rework request cites a checklist item or specific deficiency.

### RalphLoop Gate
- **Applicable gate:** G5 -- Decision + Registry
- **Must-pass checklists:** `checklists/dashboard-quality.md`, `checklists/kaushik/dashboard-storytelling-audit.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/dashboard-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [visualization-layer](../../frameworks/visualization-layer.md), [data-storytelling-framework](../../frameworks/data-storytelling-framework.md)
- **Checklists:** [dashboard-quality](../../checklists/dashboard-quality.md), [kaushik/dashboard-storytelling-audit](../../checklists/kaushik/dashboard-storytelling-audit.md)
- **Templates:** [outputs/dashboard-spec](../../templates/outputs/dashboard-spec.md)
- **Workflows:** [dashboard-build-workflow](../../workflows/dashboard-build-workflow.md)
