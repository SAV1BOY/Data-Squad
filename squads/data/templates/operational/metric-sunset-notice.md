# Metric Sunset Notice

> Use this template to formally communicate the deprecation of a metric.
> Ensures all impacted stakeholders are notified, replacement metrics are defined, and migration is planned.

---

## 1. Sunset Overview [REQUIRED]

**Notice ID:** [SUN-YYYY-NNN]
**Date Issued:** [YYYY-MM-DD]
**Issued By:** [Name, Role]
**Status:** [Announced / Migration In Progress / Deprecated / Fully Removed]

---

## 2. Metric Being Deprecated [REQUIRED]

| Field                  | Value                                      |
|------------------------|--------------------------------------------|
| Metric Name            | [e.g., "Legacy Churn Rate"]                |
| Metric ID / Code       | [e.g., "metric_churn_v1"]                  |
| Definition             | [Current formula or calculation]           |
| Data Source             | [e.g., "BigQuery: analytics.kpis"]         |
| Current Owner          | [Name, Team]                               |
| Dashboards Using It    | [List of dashboards or reports]            |

---

## 3. Sunset Timeline [REQUIRED]

| Milestone                          | Date           | Status     |
|------------------------------------|----------------|------------|
| Sunset notice issued               | [YYYY-MM-DD]   | [Done]     |
| Replacement metric available       | [YYYY-MM-DD]   | [Pending]  |
| Migration support window opens     | [YYYY-MM-DD]   | [Pending]  |
| Soft deprecation (warnings added)  | [YYYY-MM-DD]   | [Pending]  |
| Hard deprecation (metric removed)  | [YYYY-MM-DD]   | [Pending]  |
| Migration support window closes    | [YYYY-MM-DD]   | [Pending]  |

---

## 4. Replacement Metric [REQUIRED]

| Field                  | Value                                      |
|------------------------|--------------------------------------------|
| Replacement Metric     | [e.g., "Net Revenue Churn Rate"]           |
| Definition             | [New formula or calculation]               |
| Data Source             | [e.g., "BigQuery: analytics.kpis_v2"]      |
| Owner                  | [Name, Team]                               |
| Documentation Link     | [Link to metric definition doc]            |

### Why the Change

[2-3 sentences explaining why the old metric is being deprecated and how the replacement improves accuracy, consistency, or alignment with business goals.]

### Key Differences

| Aspect                | Old Metric                   | New Metric                    |
|-----------------------|------------------------------|-------------------------------|
| [e.g., "Scope"]      | [e.g., "All accounts"]      | [e.g., "Active accounts only"]|
| [e.g., "Calculation"] | [e.g., "Simple count-based"]| [e.g., "Revenue-weighted"]    |
| [e.g., "Granularity"] | [e.g., "Monthly"]           | [e.g., "Weekly + Monthly"]    |

---

## 5. Impacted Stakeholders [REQUIRED]

| Stakeholder / Team      | How They Use the Metric          | Migration Contact    | Status       |
|--------------------------|----------------------------------|----------------------|--------------|
| [e.g., "Exec team"]     | [e.g., "Weekly report"]         | [Name]               | [Notified]   |
| [e.g., "Product"]       | [e.g., "OKR tracking"]         | [Name]               | [Notified]   |
| [e.g., "Finance"]       | [e.g., "Board deck"]           | [Name]               | [Pending]    |

---

## 6. Migration Steps

1. [ ] Review replacement metric definition and confirm understanding
2. [ ] Update dashboards to use the replacement metric
3. [ ] Update any automated reports or scheduled queries
4. [ ] Update OKR or goal tracking references
5. [ ] Validate replacement metric values against expected ranges
6. [ ] Confirm migration complete and notify data team

---

## 7. Support and Questions

| Question Type                | Contact        | Channel                  |
|------------------------------|----------------|--------------------------|
| Metric definition questions  | [Name]         | [e.g., "Slack #data-help"]|
| Migration assistance         | [Name]         | [e.g., "Slack #data-help"]|
| Dashboard update help        | [Name]         | [e.g., "Slack #data-help"]|
| Escalation                   | [Name]         | [e.g., "Direct message"]  |

---

## 8. Acknowledgment

| Stakeholder / Team     | Acknowledged By | Date       | Migration Complete |
|-------------------------|-----------------|------------|--------------------|
| [Team 1]                |                 |            | [ ]                |
| [Team 2]                |                 |            | [ ]                |
| [Team 3]                |                 |            | [ ]                |
