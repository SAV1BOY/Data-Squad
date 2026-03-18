# Task: Investigate Anomaly
> Agent(s): avinash-kaushik, data-chief
> Frameworks: analysis-layer
> Checklists: analytics/anomaly-investigation, analytics/metric-drift-detection
> Templates: (none)
> Registry: decision-registry

## Objective
Systematically investigate an unexpected change in a key metric to determine whether it is
a real behavioral shift, a data quality issue, or an external factor, and recommend the
appropriate response.

## Prerequisites
- An anomaly has been detected (via alert, dashboard, or stakeholder report).
- The affected metric is defined in the metric registry.
- Access to the data warehouse and analytics tools.
- Baseline expectations for the metric are known.

## Steps
1. **Quantify the anomaly** -- Document: which metric, what value, expected value, magnitude
   of deviation (% and absolute), when it started, and whether it is ongoing.
2. **Rule out data quality issues** -- Before investigating behavior, check:
   - Did tracking break? Check event volumes for upstream events.
   - Was there a deployment that could affect tracking?
   - Are data pipelines running on schedule? Check ETL logs.
   - Is the anomaly present in raw data or only in transformed data?
3. **Check for known causes** -- Consult:
   - Deployment log: was there a product release?
   - Marketing calendar: was there a campaign launch?
   - External events: holidays, press coverage, competitor actions?
   - Infrastructure: outages, performance degradation?
4. **Isolate the anomaly** -- Segment the metric by:
   - Platform (web, iOS, Android).
   - Geography.
   - User segment (new vs. existing).
   - Acquisition channel.
   Identify which segment(s) are driving the anomaly.
5. **Drill into the timeline** -- Plot the metric at hourly granularity around the anomaly
   start time. Identify the exact onset point.
6. **Trace upstream metrics** -- Walk up the KPI tree. If the anomalous metric is a ratio,
   check numerator and denominator independently.
7. **Apply 5-Whys** -- Starting from the observation, ask "Why?" iteratively until you
   reach a root cause or a testable hypothesis.
8. **Validate the hypothesis** -- Use data to confirm or reject the hypothesized cause.
   If possible, find a natural control group unaffected by the cause.
9. **Assess impact** -- Quantify the business impact: how many users affected, revenue
   impact, and projected impact if the anomaly continues.
10. **Recommend action** -- Based on findings, recommend one of:
    - No action (expected variation or self-correcting).
    - Fix required (data quality or tracking issue).
    - Product response (behavioral shift requiring intervention).
    - Monitor closely (uncertain cause, watch for 48 hours).
11. **Document findings** -- Write the investigation report with timeline, findings,
    root cause, and recommendation.
12. **Follow up** -- If action was taken, verify the metric returns to expected levels.

## Deliverable
An anomaly investigation report containing:
- Anomaly quantification (metric, magnitude, timing).
- Data quality check results.
- Segmentation analysis showing which segments are affected.
- Root cause determination (or top hypotheses if uncertain).
- Business impact assessment.
- Recommended action and follow-up plan.

## Quality Gate
- [ ] Anomaly is quantified with exact magnitude and timing.
- [ ] Data quality has been ruled out or identified as the cause.
- [ ] At least 4 segmentation dimensions are checked.
- [ ] Root cause is identified or top 2-3 hypotheses are documented.
- [ ] Business impact is estimated in user and revenue terms.
- [ ] Recommendation is specific and actionable.
- [ ] Investigation completed within 24 hours of detection.
- [ ] Report is filed and accessible to stakeholders.

## Registry Update
- Log investigation in `incident-registry` with root cause and resolution.
- If data quality issue found, create remediation ticket and link in `event-registry`.
- Log task completion in `task-log` and `analysis-registry`.
