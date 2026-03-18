# Task: Build Exec Report
> Agent(s): data-chief, wes-kao
> Frameworks: decision-layer, data-storytelling-framework
> Checklists: exec-report-quality, data-storytelling-quality
> Templates: reports/exec-weekly-report
> Registry: decision-registry

## Objective
Create a recurring executive report that distills the most important data insights into a
concise, decision-oriented format, keeping leadership informed on business performance
and key trends without requiring them to explore dashboards.

## Prerequisites
- North Star Metric and KPI tree are established.
- Dashboards and data sources are live and reliable.
- Report cadence is agreed upon (weekly, monthly, or quarterly).
- Executive audience and their priorities are understood.

## Steps
1. **Define the report scope** -- Determine what the report covers:
   - Which KPI tree metrics are included.
   - Time period (week-over-week, month-over-month, quarter-over-quarter).
   - Which segments or products are covered.
2. **Design the report template** -- Structure the report:
   - Page 1: Executive Summary (3-5 bullet points on what matters most this period).
   - Page 2: North Star Metric deep-dive (trend, input metrics, commentary).
   - Page 3-4: Key metric performance (vs. target, vs. prior period, vs. prior year).
   - Page 5: Highlights and lowlights (top wins and concerns).
   - Page 6: Forward-looking items (experiments in flight, upcoming launches, risks).
   - Appendix: detailed data tables.
3. **Automate data extraction** -- Build automated queries for all report metrics:
   - Current period value.
   - Prior period value and % change.
   - Target value and % to target.
   - Year-over-year comparison.
4. **Create the metric performance table** -- Build a standardized table:
   | Metric | Current | Prior | Change | Target | Status |
   Color-code status: green (on/above target), yellow (within 10%), red (below 10%+).
5. **Write the executive summary** -- After pulling data, write 3-5 bullets:
   - Start with the NSM performance.
   - Highlight the biggest positive and negative movements.
   - Note any anomalies or external factors.
   - Preview upcoming decisions or events.
6. **Add commentary for each section** -- For every metric section, include 1-2 sentences
   explaining WHY the metric moved, not just WHAT the number is.
7. **Include visualizations** -- Add charts that support the narrative:
   - NSM trend chart with target line.
   - Input metric small multiples.
   - Any relevant cohort or segment views.
8. **Add the forward-looking section** -- Include:
   - Active experiments with expected read-out dates.
   - Upcoming launches with expected metric impact.
   - Known risks or headwinds.
9. **Review for clarity** -- Read the report as an executive would:
   - Can the key message be understood in 60 seconds?
   - Is every number in context (vs. target, vs. prior period)?
   - Are recommendations clear and specific?
10. **Peer review** -- Have another analyst verify the numbers.
11. **Distribute** -- Send via the agreed channel (email, Slack, Notion) on the
    scheduled cadence.
12. **Collect feedback** -- After the first 3 reports, solicit feedback from executives
    on what to keep, add, or remove.

## Deliverable
A recurring executive report containing:
- Executive summary (3-5 key bullets).
- NSM performance with trend and commentary.
- Metric performance table with status indicators.
- Highlights and lowlights with root causes.
- Forward-looking section.
- Supporting visualizations.

## Quality Gate
- [ ] Executive summary can be read in 60 seconds.
- [ ] All metrics include prior period and target comparisons.
- [ ] Every metric movement has commentary explaining "why."
- [ ] Visualizations support (not duplicate) the narrative.
- [ ] Report follows a consistent template each period.
- [ ] Numbers are peer-verified before distribution.
- [ ] Report is distributed on schedule.
- [ ] Feedback loop is established with audience.

## Registry Update
- Log report in `analysis-registry` with period, distribution date, and audience.
- Update metric baselines in `metric-registry` if targets are revised.
- Log task completion in `task-log`.
