# Task: Run Funnel Analysis
> Agent(s): sean-ellis, avinash-kaushik
> Frameworks: aarrr-pirate-metrics, ellis-activation-aha-moment
> Checklists: activation-funnel-quality, analytics/funnel-dropoff-diagnosis
> Templates: outputs/activation-audit
> Registry: decision-registry

## Objective
Analyze a multi-step user funnel to identify where users drop off, quantify conversion rates
at each step, and surface actionable opportunities to improve overall funnel throughput.

## Prerequisites
- Funnel steps are defined (e.g., Landing -> Signup -> Activation -> Purchase).
- Events for each funnel step are tracked and validated.
- Sufficient data volume (minimum 1,000 users entering the funnel in the analysis period).
- Access to the analytics platform or data warehouse.

## Steps
1. **Define the funnel** -- List the ordered steps. For each step, specify the qualifying
   event and any conditions (e.g., "Signup Completed" with property `method != 'SSO'`).
2. **Set parameters** -- Define:
   - Time period for analysis.
   - Conversion window (max time allowed between steps).
   - Whether the funnel is strict-order or any-order.
   - User vs. session-level analysis.
3. **Pull funnel data** -- Query the data to calculate:
   - Total users entering each step.
   - Step-to-step conversion rates.
   - Overall funnel conversion rate.
   - Median time between steps.
4. **Identify the biggest drop-off** -- Rank steps by absolute user loss (not just %).
   The step with the largest absolute drop is the highest-leverage improvement target.
5. **Segment the funnel** -- Break the funnel by key dimensions:
   - Acquisition channel.
   - Platform (web, iOS, Android).
   - User segment (new vs. returning, plan type).
   - Geography.
   Compare conversion rates across segments.
6. **Analyze time-to-convert** -- For each step, plot the distribution of time to complete.
   Identify if there is a critical window after which conversion probability drops sharply.
7. **Investigate drop-off reasons** -- For the top 2-3 drop-off points:
   - What do users do instead? (Next-event analysis after drop-off.)
   - Are there error events or rage-click patterns?
   - Do session recordings reveal UX friction?
8. **Compare time periods** -- Compare the funnel to a prior period (week-over-week or
   month-over-month). Identify if conversion is improving or degrading.
9. **Estimate impact** -- Calculate: if the biggest drop-off point improved by X%, how many
   additional users would convert? Translate to revenue or key metric impact.
10. **Formulate recommendations** -- Write 3-5 specific, actionable recommendations
    targeting the highest-leverage drop-off points.
11. **Document and share** -- Create the funnel analysis report and present to stakeholders.

## Deliverable
A funnel analysis report containing:
- Funnel visualization with conversion rates at each step.
- Segment comparison tables.
- Time-to-convert distributions.
- Drop-off investigation findings.
- Impact estimates for improvement scenarios.
- 3-5 actionable recommendations.

## Quality Gate
- [ ] All funnel steps are clearly defined with qualifying events.
- [ ] Minimum sample size of 1,000 users entering the funnel.
- [ ] Step-to-step and overall conversion rates are calculated.
- [ ] At least 3 segment breakdowns are included.
- [ ] Top drop-off points are investigated (not just identified).
- [ ] Impact estimates are calculated for improvement scenarios.
- [ ] Recommendations are specific and actionable.
- [ ] Results validated against dashboard totals (< 5% variance).

## Registry Update
- Log analysis in `analysis-registry` with funnel name, date, and findings.
- Update relevant metrics in `metric-registry` if new conversion metrics are defined.
- Log task completion in `task-log`.
