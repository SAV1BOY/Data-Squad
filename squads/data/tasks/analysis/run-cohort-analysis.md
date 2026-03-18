# Task: Run Cohort Analysis
> Agent(s): peter-fader, data-chief
> Frameworks: cohort-analysis, fader-customer-base-audit
> Checklists: cohort-analysis-quality, analytics/cohort-curve-reading
> Templates: outputs/cohort-report
> Registry: decision-registry

## Objective
Perform a cohort analysis to understand how user behavior, retention, or other key metrics
evolve over time for groups of users who share a common characteristic or starting point.

## Prerequisites
- Metric to analyze is defined in the metric registry.
- Sufficient historical data (minimum 3 months, ideally 6-12 months).
- Cohort definition criteria are agreed upon with stakeholders.
- Access to the data warehouse with user-level event data.

## Steps
1. **Define the cohort dimension** -- Determine how users will be grouped:
   - Time-based: signup week/month, first purchase date.
   - Behavior-based: first feature used, acquisition channel.
   - Attribute-based: plan type, geography, company size.
2. **Define the metric** -- Specify what is being measured for each cohort over time
   (retention rate, revenue per user, feature usage frequency).
3. **Set the time window** -- Define the cohort period (weekly or monthly cohorts) and
   the observation window (how many periods to track each cohort).
4. **Extract cohort data** -- Write the SQL query to:
   a. Assign each user to their cohort based on the chosen dimension.
   b. Calculate the metric for each cohort at each time period.
   c. Handle edge cases: users in multiple cohorts, churned and returned users.
5. **Build the cohort table** -- Create the triangular cohort matrix showing the metric
   value for each cohort at each period offset (Period 0, Period 1, ..., Period N).
6. **Calculate retention curves** -- Plot the retention/metric curve for each cohort.
   Overlay curves to compare cohort performance.
7. **Identify trends** -- Analyze:
   - Are newer cohorts performing better or worse than older ones?
   - At which period does the biggest drop-off occur?
   - Is there a flattening point where retention stabilizes?
   - Do any cohorts deviate significantly from the average?
8. **Segment within cohorts** -- If a cohort shows unusual behavior, drill into segments
   (platform, plan, geography) to find explanatory factors.
9. **Calculate summary statistics** -- Compute: average retention at key periods (Day 1,
   Day 7, Day 30), median time to churn, cohort half-life.
10. **Formulate insights** -- Write 3-5 actionable insights. Each insight should include:
    the observation, the hypothesized cause, and a recommended action.
11. **Document methodology** -- Record all assumptions, exclusions, and query logic.
12. **Present findings** -- Share with stakeholders. Discuss implications and next steps.

## Deliverable
A cohort analysis report containing:
- Cohort matrix table (heatmap visualization).
- Retention/metric curves overlaid by cohort.
- Trend analysis narrative.
- 3-5 actionable insights with recommendations.
- SQL queries and methodology documentation.

## Quality Gate
- [ ] Cohort definition is clearly documented.
- [ ] Minimum 5 cohorts are included in the analysis.
- [ ] Observation window is sufficient (at least 3 periods per cohort).
- [ ] Edge cases are handled (multi-cohort users, re-activations).
- [ ] Visualization includes both table and curve views.
- [ ] At least 3 actionable insights are documented.
- [ ] SQL queries are saved and reproducible.
- [ ] Results are validated against known benchmarks or totals.

## Registry Update
- Log analysis in `analysis-registry` with date, analyst, and artifact links.
- Reference relevant metrics from `metric-registry` in the analysis record.
- Log task completion in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** peter-fader owns this task end-to-end.
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
- **Applicable gate:** G4 -- Insight
- **Must-pass checklists:** `checklists/cohort-analysis-quality.md`, `checklists/analytics/cohort-curve-reading.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [cohort-analysis](../../frameworks/cohort-analysis.md), [fader-customer-base-audit](../../frameworks/fader-customer-base-audit.md)
- **Checklists:** [cohort-analysis-quality](../../checklists/cohort-analysis-quality.md), [analytics/cohort-curve-reading](../../checklists/analytics/cohort-curve-reading.md)
- **Templates:** [outputs/cohort-report](../../templates/outputs/cohort-report.md)
- **Workflows:** [retention-diagnostics-workflow](../../workflows/retention-diagnostics-workflow.md)
