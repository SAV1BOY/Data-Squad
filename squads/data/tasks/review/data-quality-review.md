# Task: Data Quality Review
> Agent(s): Data Engineer, Data Analyst
> Frameworks: Data Quality Framework, Six Dimensions of Data Quality
> Checklists: data-quality-checklist, pipeline-health-checklist
> Template: data-quality-review-template
> Registry: metric-registry, event-registry

## Objective
Conduct a systematic review of data quality across the analytics stack, identifying issues
in completeness, accuracy, consistency, timeliness, validity, and uniqueness, and driving
remediation to maintain trust in data-driven decisions.

## Prerequisites
- Access to the data warehouse, analytics platforms, and ETL/ELT pipelines.
- Event registry and metric registry are available.
- Pipeline monitoring tools are accessible.
- Previous data quality review results (if any).

## Steps
1. **Define quality dimensions** -- Assess data against six dimensions:
   - Completeness: are expected records present?
   - Accuracy: do values reflect reality?
   - Consistency: do the same metrics match across sources?
   - Timeliness: is data arriving on schedule?
   - Validity: do values conform to expected formats and ranges?
   - Uniqueness: are there duplicate records?
2. **Audit event completeness** -- For the top 20 events by importance:
   - Compare event volumes to expected baselines (day-over-day).
   - Check for missing properties (% of events with null required properties).
   - Check for missing platforms (events expected from web + mobile, only web present).
3. **Audit data accuracy** -- Select 5 key metrics and validate:
   - Recalculate from raw event data.
   - Compare to the dashboard value.
   - Compare to the analytics platform native value.
   - Flag discrepancies > 1%.
4. **Audit data consistency** -- Check cross-source consistency:
   - Billing system revenue vs. data warehouse revenue.
   - Analytics platform user counts vs. application database user counts.
   - CRM opportunity data vs. data warehouse deal data.
5. **Audit data timeliness** -- Review pipeline freshness:
   - For each critical pipeline, check the last successful run.
   - Calculate the average delay (actual delivery time - SLA).
   - Identify pipelines that frequently miss SLA.
6. **Audit data validity** -- Check value distributions:
   - Numeric fields: min, max, mean, median, standard deviation. Flag outliers.
   - Categorical fields: unique values vs. expected enums. Flag unexpected values.
   - Date fields: check for future dates, dates before company founding, nulls.
   - ID fields: check for invalid formats.
7. **Audit data uniqueness** -- Check for duplicates:
   - Duplicate events (same user, same action, same timestamp).
   - Duplicate user records.
   - Duplicate transactions.
8. **Check pipeline health** -- Review ETL/ELT infrastructure:
   - Failed jobs in the last 30 days.
   - Job duration trends (are jobs slowing down?).
   - Resource utilization (approaching capacity limits?).
9. **Score overall data quality** -- Create a scorecard:
   - Score each dimension 1-5 for each data source.
   - Calculate an overall Data Quality Index (weighted average).
   - Compare to the previous review period.
10. **Prioritize remediation** -- Rank issues by:
    - Business impact (which decisions are affected?).
    - Frequency (how often does this occur?).
    - Effort to fix (quick win vs. major project).
11. **Create remediation plan** -- For each issue, document:
    - Description and root cause.
    - Impact assessment.
    - Proposed fix and owner.
    - Timeline.
12. **Report and communicate** -- Share the data quality review with data and engineering
    teams. Escalate critical issues to leadership.

## Deliverable
A data quality review report containing:
- Quality scorecard across six dimensions.
- Event completeness audit results.
- Accuracy validation findings.
- Consistency check results.
- Timeliness and pipeline health assessment.
- Validity and uniqueness audit findings.
- Overall Data Quality Index.
- Prioritized remediation plan.

## Quality Gate
- [ ] All six quality dimensions are assessed.
- [ ] Top 20 events are audited for completeness.
- [ ] At least 5 metrics are validated for accuracy.
- [ ] Cross-source consistency is checked for 3+ sources.
- [ ] Pipeline health is reviewed (failures, delays).
- [ ] Data Quality Index is calculated and compared to prior period.
- [ ] Remediation plan has owners and timelines.
- [ ] Critical issues are escalated appropriately.

## Registry Update
- Update `event-registry` with data quality flags for affected events.
- Update `metric-registry` with accuracy validation dates.
- Log review in `task-log` with DQI score and remediation ticket count.
