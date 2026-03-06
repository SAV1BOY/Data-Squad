# Task: Dashboard Effectiveness Review
> Agent(s): Data Analyst, BI Developer
> Frameworks: Dashboard Effectiveness Framework, Usability Assessment
> Checklists: dashboard-review-checklist, usability-checklist
> Template: dashboard-review-template
> Registry: dashboard-registry

## Objective
Review all active dashboards to assess their usage, accuracy, performance, and effectiveness
at driving decisions, identifying dashboards to improve, consolidate, or retire.

## Prerequisites
- Dashboard registry exists or can be compiled.
- BI platform usage analytics are accessible (view counts, user counts).
- Dashboard owners are identifiable.
- Access to at least 5 stakeholders for feedback.

## Steps
1. **Inventory all dashboards** -- Compile a complete list of dashboards across all BI
   platforms. For each, record: name, owner, creation date, last modified date, platform,
   and stated purpose.
2. **Pull usage analytics** -- For each dashboard, extract:
   - Total views in the last 30/60/90 days.
   - Unique viewers in the last 30 days.
   - View frequency distribution (daily, weekly, occasional, never).
   - Average time on dashboard.
3. **Classify dashboards** -- Based on usage data, categorize each dashboard:
   - Active: regular views by multiple users.
   - Low-use: fewer than 5 views in 30 days.
   - Abandoned: zero views in 60+ days.
   - Single-user: only the creator views it.
4. **Assess accuracy** -- For a sample of 10 active dashboards:
   - Verify that metric values match the metric registry definitions.
   - Check that filters work correctly.
   - Verify data freshness (is the data as current as expected?).
5. **Assess performance** -- Measure load times for active dashboards:
   - Target: < 5 seconds.
   - Flag dashboards taking > 10 seconds.
   - Identify performance bottlenecks (complex queries, large datasets).
6. **Assess design quality** -- Evaluate each active dashboard:
   - Is the layout logical and scannable?
   - Are chart types appropriate for the data?
   - Are titles and labels clear?
   - Is there appropriate context (targets, benchmarks, time comparisons)?
7. **Gather user feedback** -- Interview 5-10 dashboard users:
   - Which dashboards do you use most and why?
   - Which dashboards are confusing or unhelpful?
   - What questions can you not answer with current dashboards?
   - What would make the dashboards more useful?
8. **Identify consolidation opportunities** -- Find dashboards that:
   - Cover overlapping metrics or topics.
   - Serve the same audience.
   - Could be combined into a single, better dashboard.
9. **Recommend actions** -- For each dashboard:
   - Active + effective: keep and maintain.
   - Active + needs improvement: create improvement tickets.
   - Low-use: investigate why. Improve or retire.
   - Abandoned: archive or delete.
10. **Update the dashboard registry** -- Ensure all dashboards are registered with
    current metadata.
11. **Set review cadence** -- Establish a regular review cycle (quarterly recommended).
12. **Communicate findings** -- Share the review with dashboard owners and stakeholders.

## Deliverable
A dashboard effectiveness review report containing:
- Dashboard inventory with usage metrics.
- Classification (active, low-use, abandoned, single-user).
- Accuracy and performance audit results.
- Design quality assessment.
- User feedback summary.
- Consolidation opportunities.
- Action recommendations for each dashboard.

## Quality Gate
- [ ] All dashboards across all platforms are inventoried.
- [ ] Usage metrics are pulled for every dashboard.
- [ ] Each dashboard is classified by usage level.
- [ ] At least 10 dashboards are audited for accuracy.
- [ ] Performance is measured for active dashboards.
- [ ] At least 5 users provided feedback.
- [ ] Consolidation opportunities are identified.
- [ ] Action recommendation exists for every dashboard.

## Registry Update
- Update `dashboard-registry` with usage metrics and review dates.
- Archive abandoned dashboards with `status: archived`.
- Log review in `task-log` with dashboard counts by classification.
