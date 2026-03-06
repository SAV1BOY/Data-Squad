# Alert Runbook

> Use this template to document an operational alert: what triggers it,
> how severe it is, and exactly what to do when it fires.
> One runbook entry per alert. Keep it actionable and step-by-step.

---

## Alert: [Alert Name]

**Alert ID:** [e.g., "ALERT-DATA-001"]
**Owner:** [Name, Team]
**Date Created:** [YYYY-MM-DD]
**Last Updated:** [YYYY-MM-DD]
**Status:** [Active / Disabled / Under Review]

---

## 1. What This Alert Detects [REQUIRED]

**Description:** [Plain-language description of what the alert monitors]
**Condition:** [Exact trigger condition]
**Threshold:** [Specific threshold value(s)]
**Evaluation Window:** [How often the condition is checked]
**Data Source:** [Where the monitored data comes from]

_Example:_
**Description:** Detects when the daily event volume from Segment drops significantly, indicating a potential tracking outage or data pipeline failure.
**Condition:** Daily event count falls below 70% of the 7-day rolling average
**Threshold:** event_count_today < (avg_event_count_7d * 0.70)
**Evaluation Window:** Checked every hour, looking at the trailing 24 hours
**Data Source:** BigQuery: `analytics.raw_segment_events` (row count by day)

---

## 2. Severity [REQUIRED]

**Severity Level:** [Critical / High / Medium / Low / Informational]

| Severity      | Definition                                           | Response Time |
|---------------|------------------------------------------------------|---------------|
| Critical      | Business-critical data is missing or wrong; decisions affected | <30 min  |
| High          | Important data degraded; dashboards unreliable       | <2 hours      |
| Medium        | Data quality issue; workaround available             | <1 business day|
| Low           | Minor issue; no immediate business impact            | Next sprint   |
| Informational | FYI; no action required unless pattern continues     | Review weekly |

**This alert is:** [Severity level with justification]

_Example:_
**This alert is:** **High** - A >30% drop in event volume means dashboards and reports are showing incomplete data. Stakeholders may make decisions on partial information.

---

## 3. Notification [REQUIRED]

| Channel                  | Recipients                        | When                    |
|--------------------------|-----------------------------------|-------------------------|
| [e.g., "Slack"]         | [e.g., "#data-alerts channel"]   | [e.g., "Immediately"] |
| [e.g., "PagerDuty"]     | [e.g., "Data on-call"]          | [e.g., "If Critical"] |
| [e.g., "Email"]         | [e.g., "data-team@company.com"] | [e.g., "Daily digest"] |

_Example:_

| Channel    | Recipients            | When                              |
|------------|-----------------------|-----------------------------------|
| Slack      | #data-alerts          | Immediately when alert fires      |
| Slack DM   | Data on-call engineer | Immediately (Critical/High only)  |
| Email      | data-team@acme.com    | Summary in daily digest           |

---

## 4. Diagnosis Steps [REQUIRED]

Follow these steps in order when the alert fires.

### Step 1: Confirm the Alert Is Real
- [e.g., "Check the monitoring dashboard: [link]"]
- [e.g., "Run validation query to confirm event volume drop"]
- [e.g., "Rule out false positives: holidays, known maintenance windows, timezone issues"]

### Step 2: Identify Scope
- [e.g., "Is the drop across all event types or specific events?"]
- [e.g., "Is it affecting all platforms (web, mobile) or one?"]
- [e.g., "Check Segment Status page: https://status.segment.com"]

### Step 3: Identify Root Cause
- [e.g., "Check for recent deploys: [link to deploy log]"]
- [e.g., "Check Segment source debugger for errors"]
- [e.g., "Check pipeline logs: [link to Airflow/logs]"]
- [e.g., "Check upstream service health: [link]"]

_Example:_

### Step 1: Confirm the Alert Is Real
- Open monitoring dashboard: `[link to dashboard]`
- Run this query to confirm:
```sql
SELECT DATE(received_at) as dt, COUNT(*) as events
FROM analytics.raw_segment_events
WHERE received_at >= CURRENT_DATE - 3
GROUP BY 1 ORDER BY 1;
```
- Check if today is a holiday or known low-traffic day (see: [holiday calendar link])

### Step 2: Identify Scope
- Break down by event type: is it all events or specific ones?
- Break down by source (web SDK, mobile SDK, server): which source dropped?
- Check Segment Status: https://status.segment.com

### Step 3: Identify Root Cause
- Check deploy log for frontend/backend changes in last 24h: `[link]`
- Open Segment debugger for affected source(s)
- Check BigQuery pipeline logs in Airflow: `[link]`
- If Segment is healthy, check if the website/app itself is down

---

## 5. Resolution Actions [REQUIRED]

### If Root Cause: [Scenario 1]
**Action:**
1. [Step 1, e.g., "Revert the latest deploy"]
2. [Step 2, e.g., "Verify event volume recovers within 1 hour"]
3. [Step 3, e.g., "Notify stakeholders of data gap"]

### If Root Cause: [Scenario 2]
**Action:**
1. [Step 1]
2. [Step 2]

### If Root Cause: Unknown
**Action:**
1. [e.g., "Escalate to Segment support with ticket"]
2. [e.g., "Notify data team lead"]
3. [e.g., "Add warning banner to affected dashboards"]

_Example:_

### If Root Cause: Frontend Deploy Broke Tracking
1. Notify engineering on-call to revert the deploy
2. Verify event volume recovers within 1 hour of revert
3. Add a note to affected dashboards: "Data gap [time range] due to tracking outage"
4. File a bug to fix the tracking issue before re-deploying

### If Root Cause: Segment Outage
1. Check Segment status page for estimated resolution time
2. Post update to #data-alerts with ETA
3. No action needed on our side; data will backfill when Segment recovers
4. Verify backfill completeness within 24 hours of resolution

### If Root Cause: Pipeline Failure (BigQuery/Airflow)
1. Check Airflow for failed DAG: `[link]`
2. Retry the failed task
3. If retry fails, check BigQuery quota and permissions
4. Escalate to data engineering if unresolved in 1 hour

---

## 6. Communication Template

Use this to notify stakeholders when the alert fires.

```
ALERT: [Alert Name] - [Severity]
Time detected: [timestamp]
Impact: [What is affected - which dashboards/reports]
Root cause: [Known / Investigating]
ETA to resolution: [estimate or "TBD"]
Action needed from you: [None / Avoid using X dashboard / etc.]
Updates: [Where to follow - e.g., #data-alerts thread]
```

_Example:_
```
ALERT: Event Volume Drop - HIGH
Time detected: 2026-03-06 08:15 ET
Impact: Segment event volume down ~35%. Dashboards showing partial data for today.
Root cause: Investigating - appears isolated to web SDK events
ETA to resolution: Targeting fix by 10:00 ET
Action needed from you: Avoid pulling today's data for reports until resolved
Updates: Follow the thread in #data-alerts
```

---

## 7. Post-Incident

After resolution, complete this section.

**Resolution Time:** [Total time from alert to resolution]
**Data Gap:** [Time period of missing/bad data, if any]
**Backfill Needed?** [Yes/No - and status]
**Post-Incident Review?** [Yes/No - link if yes]

### Preventive Actions

| # | Action                                        | Owner   | Due Date |
|---|-----------------------------------------------|---------|----------|
| 1 | [e.g., "Add tracking validation to CI/CD"]   | [Name]  | [Date]   |
| 2 | [e.g., "Improve alert threshold logic"]      | [Name]  | [Date]   |

---

## 8. Alert History

| Date       | Triggered? | Root Cause                   | Resolution Time | False Positive? |
|------------|------------|------------------------------|-----------------|-----------------|
| [Date]     | [Yes]      | [e.g., "Frontend deploy"]  | [e.g., "45min"]| [No]            |
| [Date]     | [Yes]      | [e.g., "Holiday traffic"]  | [e.g., "N/A"]  | [Yes]           |

---

## Metadata

**Alert Configuration Location:** [e.g., "Datadog monitor #1234" or "dbt test in models/staging/"]
**Related Alerts:** [List related alerts that may fire alongside this one]
**Related Runbooks:** [Links to other runbooks for related systems]
**Escalation Path:** On-call engineer -> Data team lead -> VP Engineering
