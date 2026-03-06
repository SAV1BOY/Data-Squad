# Dashboard Request Brief

> Use this template to request a new dashboard or major dashboard revision.
> A good dashboard answers specific questions and drives specific actions.
> Fill in each section before submitting to the data team.

---

## 1. Dashboard Overview [REQUIRED]

**Dashboard Name:** [Descriptive name]
**Requestor:** [Name, Team]
**Date:** [YYYY-MM-DD]
**Priority:** [High / Medium / Low]
**Type:** [New Dashboard / Major Revision / Minor Update]

_Example:_
**Dashboard Name:** Self-Serve Revenue Health Dashboard
**Requestor:** Jordan Lee, Revenue Operations
**Date:** 2026-03-06
**Priority:** High
**Type:** New Dashboard

---

## 2. Questions This Dashboard Must Answer [REQUIRED]

List the specific questions, in priority order, that the dashboard user needs answered.

| # | Question                                                    | Decision It Drives                          |
|---|-------------------------------------------------------------|---------------------------------------------|
| 1 | [e.g., "Is self-serve MRR on track for quarterly target?"] | [e.g., "Escalate to exec team if behind"]  |
| 2 | [e.g., "Which plan tier is growing or shrinking fastest?"] | [e.g., "Adjust pricing or packaging focus"]|
| 3 | [e.g., "What is the trial-to-paid conversion rate trend?"]  | [e.g., "Allocate resources to activation"] |

_Example:_

| # | Question                                                 | Decision It Drives                          |
|---|----------------------------------------------------------|---------------------------------------------|
| 1 | Is self-serve MRR on track for the quarterly target?     | Escalate to exec team if >5% behind pace    |
| 2 | Which plan tier is growing or shrinking fastest?         | Adjust product marketing focus              |
| 3 | What is the trial-to-paid conversion rate trend?         | Decide whether to invest in activation work |
| 4 | Are there geographic patterns in self-serve revenue?     | Inform localization and expansion decisions  |

---

## 3. Target Audience [REQUIRED]

Who will use this dashboard and how often?

| Audience             | Role / Level         | Frequency          | Primary Use Case                 |
|----------------------|----------------------|--------------------|----------------------------------|
| [e.g., "RevOps"]   | [e.g., "Manager"]   | [e.g., "Daily"]   | [e.g., "Monitor pacing"]       |
| [e.g., "VP Sales"] | [e.g., "Executive"] | [e.g., "Weekly"]  | [e.g., "Board prep"]           |

_Example:_

| Audience             | Role / Level  | Frequency | Primary Use Case                    |
|----------------------|---------------|-----------|-------------------------------------|
| RevOps team          | Manager/IC    | Daily     | Monitor pacing, investigate anomalies|
| VP Revenue           | Executive     | Weekly    | Exec standup, board prep            |
| Product team         | PM            | Bi-weekly | Prioritize pricing/packaging work   |

---

## 4. Data Sources [REQUIRED]

| Source                    | Table / Dataset                   | Owner            | Access Status       |
|---------------------------|-----------------------------------|------------------|---------------------|
| [e.g., "Stripe"]        | [e.g., "stripe.subscriptions"]   | [e.g., "FinOps"]| [Have / Need]      |
| [e.g., "Data Warehouse"]| [e.g., "analytics.mrr_daily"]    | [e.g., "Data"]  | [Have / Need]      |
| [e.g., "CRM"]           | [e.g., "salesforce.accounts"]    | [e.g., "Ops"]   | [Have / Need]      |

_Example:_

| Source              | Table / Dataset            | Owner    | Access Status |
|---------------------|----------------------------|----------|---------------|
| Stripe              | stripe.subscriptions       | FinOps   | Have          |
| Data Warehouse      | analytics.mrr_daily        | Data Eng | Have          |
| Salesforce          | salesforce.accounts        | Rev Ops  | Need          |
| Product DB          | core.users                 | Data Eng | Have          |

---

## 5. Filters and Interactivity [REQUIRED]

List the filters and interactive elements users need.

| Filter / Control           | Type                    | Default Value              |
|----------------------------|-------------------------|----------------------------|
| [e.g., "Date range"]     | [Dropdown / Date picker]| [e.g., "Last 90 days"]   |
| [e.g., "Plan tier"]      | [Multi-select]          | [e.g., "All plans"]      |
| [e.g., "Region"]         | [Dropdown]              | [e.g., "Global"]         |

_Example:_

| Filter / Control      | Type          | Default Value   |
|-----------------------|---------------|-----------------|
| Date range            | Date picker   | Last 90 days    |
| Plan tier             | Multi-select  | All plans       |
| Region                | Dropdown      | Global          |
| New vs Expansion      | Toggle        | Combined view   |

---

## 6. Key Metrics and Visualizations

Describe the metrics and how you envision them displayed.

| Metric                      | Visualization Type       | Granularity      | Comparison           |
|-----------------------------|--------------------------|------------------|----------------------|
| [e.g., "MRR"]             | [e.g., "Line chart"]    | [e.g., "Daily"] | [e.g., "vs target"] |
| [e.g., "Conversion rate"] | [e.g., "Scorecard"]     | [e.g., "Weekly"]| [e.g., "vs prior period"]|

_Example:_

| Metric                    | Visualization Type | Granularity | Comparison          |
|---------------------------|--------------------|-------------|---------------------|
| Self-serve MRR            | Line chart         | Daily       | vs quarterly target |
| MRR by plan tier          | Stacked bar        | Monthly     | vs prior quarter    |
| Trial-to-paid conversion  | Scorecard + trend  | Weekly      | vs 4-week average   |
| Revenue by region         | Geo heatmap        | Monthly     | vs prior month      |
| Net new subscriptions     | Bar chart          | Weekly      | vs same period LY   |

---

## 7. Actions and Alerts

What actions should this dashboard trigger?

| Condition                                         | Action                                      | Who Acts          |
|---------------------------------------------------|---------------------------------------------|-------------------|
| [e.g., "MRR pacing >5% behind target"]          | [e.g., "Flag in exec standup"]             | [e.g., "VP Rev"] |
| [e.g., "Conversion rate drops >3pp week-over-week"]| [e.g., "Investigate funnel for bugs"]     | [e.g., "Product"]|

_Example:_

| Condition                                    | Action                              | Who Acts     |
|----------------------------------------------|-------------------------------------|--------------|
| MRR pacing >5% behind quarterly target       | Escalate in exec standup            | VP Revenue   |
| Trial-to-paid drops >3pp WoW                 | Investigate activation funnel       | Product + Data|
| Any region declines >15% MoM                 | Review localization and pricing     | Growth team  |

---

## 8. Refresh Requirements

**Data freshness:** [e.g., "Updated daily by 8am ET" or "Real-time"]
**Acceptable latency:** [e.g., "T-1 day is acceptable"]
**Tool / Platform:** [e.g., "Looker" or "Tableau" or "Metabase"]

---

## 9. Timeline

| Milestone              | Target Date | Owner   |
|------------------------|-------------|---------|
| Brief approved         | [Date]      | [Name]  |
| Data model confirmed   | [Date]      | [Name]  |
| V1 draft delivered     | [Date]      | [Name]  |
| Feedback incorporated  | [Date]      | [Name]  |
| Go-live                | [Date]      | [Name]  |

---

## 10. Existing Resources

List any related dashboards, reports, or spreadsheets that exist today.

- [e.g., "Manual MRR tracker in Google Sheets (link)"]
- [e.g., "Old Looker dashboard /dashboards/42 (partially broken)"]

---

## Approval

| Role         | Name | Date | Status             |
|--------------|------|------|--------------------|
| Requestor    |      |      | Submitted          |
| Data Lead    |      |      | Pending / Approved |
| Eng (if needed)|    |      | Pending / Approved |
