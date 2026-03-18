# Alert Escalation Playbook

> Use this playbook to define escalation procedures for data alerts by severity level (P0-P3).
> Ensures consistent response times, clear notification chains, and proper resolution tracking.

---

## 1. Playbook Overview [REQUIRED]

**Playbook ID:** [PB-YYYY-NNN]
**System / Domain:** [e.g., "Data Pipeline Monitoring" or "KPI Alert System"]
**Owner:** [Name, Role]
**Last Reviewed:** [YYYY-MM-DD]
**Status:** [Draft / Active / Under Review]

---

## 2. Severity Definitions [REQUIRED]

| Severity | Definition                                      | Example                                      | Response SLA     | Resolution SLA   |
|----------|-------------------------------------------------|----------------------------------------------|------------------|------------------|
| P0       | [Critical: complete data outage or corruption]  | [e.g., "Pipeline down, no data flowing"]     | [e.g., "15 min"] | [e.g., "2 hrs"]  |
| P1       | [High: major metric anomaly or partial outage]  | [e.g., "Revenue metric off by >20%"]         | [e.g., "30 min"] | [e.g., "4 hrs"]  |
| P2       | [Medium: data quality degradation, non-blocking]| [e.g., "Delayed data refresh by 2+ hours"]   | [e.g., "2 hrs"]  | [e.g., "1 day"]  |
| P3       | [Low: minor inconsistency, cosmetic issue]      | [e.g., "Dashboard label mismatch"]           | [e.g., "1 day"]  | [e.g., "1 week"] |

---

## 3. Notification Chains [REQUIRED]

### P0 - Critical

| Step | Notify                        | Channel                    | Within     |
|------|-------------------------------|----------------------------|------------|
| 1    | [On-call data engineer]       | [e.g., "PagerDuty + Slack"]| [Immediate]|
| 2    | [Data team lead]              | [e.g., "Phone + Slack"]    | [5 min]    |
| 3    | [VP Engineering / VP Data]    | [e.g., "Phone + Email"]    | [15 min]   |
| 4    | [Affected stakeholders]       | [e.g., "Slack channel"]    | [30 min]   |

### P1 - High

| Step | Notify                        | Channel                    | Within     |
|------|-------------------------------|----------------------------|------------|
| 1    | [On-call data engineer]       | [e.g., "Slack + PagerDuty"]| [5 min]    |
| 2    | [Data team lead]              | [e.g., "Slack"]            | [15 min]   |
| 3    | [Affected stakeholders]       | [e.g., "Slack channel"]    | [1 hr]     |

### P2 - Medium

| Step | Notify                        | Channel                    | Within     |
|------|-------------------------------|----------------------------|------------|
| 1    | [Assigned data engineer]      | [e.g., "Slack"]            | [30 min]   |
| 2    | [Data team lead]              | [e.g., "Slack"]            | [2 hrs]    |

### P3 - Low

| Step | Notify                        | Channel                    | Within     |
|------|-------------------------------|----------------------------|------------|
| 1    | [Assigned data engineer]      | [e.g., "Jira ticket"]     | [Next business day]|

---

## 4. Response Procedures [REQUIRED]

### Initial Response Checklist
- [ ] Acknowledge the alert within SLA
- [ ] Verify the alert is not a false positive
- [ ] Assess severity and confirm or re-classify
- [ ] Open an incident ticket with severity tag
- [ ] Begin notification chain per severity level

### Investigation Steps
1. [Check data pipeline status and recent job runs]
2. [Review source system health and upstream dependencies]
3. [Query affected tables for data freshness and row counts]
4. [Compare current values against historical baselines]
5. [Identify root cause or narrow down to component]

### Communication Template
> **Alert:** [Alert name]
> **Severity:** [P0/P1/P2/P3]
> **Detected:** [Timestamp]
> **Impact:** [What is affected and who is impacted]
> **Status:** [Investigating / Mitigating / Resolved]
> **ETA to Resolution:** [Estimate]
> **Next Update:** [Time of next update]

---

## 5. Resolution Tracking [REQUIRED]

| Field                  | Value                              |
|------------------------|------------------------------------|
| Incident ID            | [INC-YYYY-NNN]                     |
| Alert Name             | [Name of the triggered alert]      |
| Severity               | [P0 / P1 / P2 / P3]               |
| Detected At            | [YYYY-MM-DD HH:MM]                |
| Acknowledged At        | [YYYY-MM-DD HH:MM]                |
| Resolved At            | [YYYY-MM-DD HH:MM]                |
| Root Cause             | [Description of root cause]        |
| Resolution             | [What was done to fix it]          |
| Data Impact            | [Rows affected, time range, scope] |
| Follow-Up Actions      | [Preventive measures identified]   |

---

## 6. Post-Incident Review

- [ ] Root cause analysis documented
- [ ] Alert thresholds reviewed and adjusted if needed
- [ ] Runbook updated with learnings
- [ ] Stakeholders notified of resolution and any data corrections
- [ ] Follow-up actions assigned with owners and due dates
