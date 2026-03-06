# Dashboard Quality Checklist
> Gate type: Post-delivery
> Owner: Kaushik
> Applies to: Dashboards, reports, and data visualisation deliverables

## Purpose
A dashboard must answer a specific question, drive a specific action, and be interpretable by its intended audience without the analyst present. This gate ensures every dashboard is purposeful, visually clear, consistently filtered, and actionable rather than merely decorative.

## Checklist Items

1. - [ ] **Stated question** -- The dashboard header or description explicitly states the question it answers.
   - Pass criteria: A one-sentence question is visible on the dashboard (e.g., "How is onboarding performing this week?").
   - Fail signal: Dashboard has a generic title like "Marketing Dashboard" with no guiding question.
   - Action if fail: Add a subtitle or description block with the specific question the dashboard answers.

2. - [ ] **Target audience defined** -- The intended viewer and their decision context are documented.
   - Pass criteria: A metadata field or companion doc names the audience (e.g., "VP Marketing, weekly pipeline review").
   - Fail signal: No audience specified; dashboard designed for "everyone."
   - Action if fail: Identify the primary decision-maker and tailor the dashboard to their context.

3. - [ ] **Action enabled** -- Every chart leads to a possible action; no chart is purely informational with no decision consequence.
   - Pass criteria: For each chart, the analyst can state "If this metric moves beyond X, we do Y."
   - Fail signal: Charts present data with no threshold, target, or action guidance.
   - Action if fail: Add targets, thresholds, or annotations that tell the viewer when to act and what to do.

4. - [ ] **Metric definitions visible** -- Each metric on the dashboard has an accessible definition (tooltip, footnote, or glossary link).
   - Pass criteria: Hovering or clicking a metric reveals its formula, source table, and any filters applied.
   - Fail signal: Metrics shown as bare numbers with no definition; viewers must ask the analyst what they mean.
   - Action if fail: Add tooltips or a definitions section at the bottom of the dashboard.

5. - [ ] **Filter consistency** -- All charts on the dashboard respond to the same global filters (date range, segment, geography).
   - Pass criteria: Changing a global filter updates every chart simultaneously; no chart uses hardcoded filters that override globals.
   - Fail signal: Some charts ignore global filters or use different date ranges.
   - Action if fail: Rewire charts to use shared filter parameters; document any intentional exceptions.

6. - [ ] **Date range and grain alignment** -- All charts use the same time grain (daily, weekly, monthly) unless explicitly justified.
   - Pass criteria: Time grain is consistent or differences are labeled (e.g., "Note: this chart shows monthly totals").
   - Fail signal: Adjacent charts mix daily and weekly data without explanation.
   - Action if fail: Standardise grain or add clear labels explaining the difference.

7. - [ ] **Visual hierarchy** -- The most important metric is the most visually prominent element on the dashboard.
   - Pass criteria: The primary KPI is a large number or hero chart at the top; supporting metrics are smaller and lower.
   - Fail signal: All charts are the same size; the key metric is buried among secondary visuals.
   - Action if fail: Resize and reorder charts so the primary KPI dominates the layout.

8. - [ ] **Chart type appropriateness** -- Each chart uses the most effective chart type for its data (no pie charts for 15 categories, no bar charts for time series).
   - Pass criteria: Time-based data uses line charts; comparisons use bar charts; proportions with few categories use pie or donut.
   - Fail signal: Misleading chart types (e.g., 3D charts, dual-axis with unrelated scales, pie with too many slices).
   - Action if fail: Replace inappropriate chart types with clearer alternatives.

9. - [ ] **Data freshness indicator** -- The dashboard shows when the data was last refreshed.
   - Pass criteria: A "Last updated" timestamp is visible, ideally with refresh frequency noted.
   - Fail signal: No freshness indicator; viewer cannot tell if data is current.
   - Action if fail: Add a last-refreshed timestamp widget or footer.

10. - [ ] **Comparison context** -- Metrics include comparison values (prior period, target, benchmark) so the viewer can judge performance.
    - Pass criteria: Each KPI shows at least one comparison (e.g., week-over-week change, target line, industry benchmark).
    - Fail signal: Absolute numbers only; no way to tell if performance is good or bad.
    - Action if fail: Add period-over-period deltas or target lines to key metrics.

11. - [ ] **Load performance** -- The dashboard loads within an acceptable time (under 10 seconds for interactive use).
    - Pass criteria: Full render measured at under 10 seconds on a standard connection.
    - Fail signal: Dashboard takes more than 15 seconds or times out.
    - Action if fail: Optimise queries, reduce chart count, or pre-aggregate data.

12. - [ ] **Access control** -- The dashboard is shared only with its intended audience; sensitive data is restricted.
    - Pass criteria: Permissions reviewed; no public link for internal dashboards; row-level security applied where needed.
    - Fail signal: Dashboard is publicly accessible or shared with groups that should not see the data.
    - Action if fail: Restrict sharing settings and apply row-level security if needed.

## Cross-References
- [Metric Definition Quality Checklist](metric-definition-quality.md)
- [KPI Tree Quality Checklist](kpi-tree-quality.md)
- [Analytics Audit Quality Checklist](analytics-audit-quality.md)
