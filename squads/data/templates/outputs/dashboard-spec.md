# Dashboard Specification

> Use this template to define the complete specification for a dashboard.
> This is the blueprint that the dashboard builder follows.
> Fill in each section; replace examples with your specifics.

---

## 1. Dashboard Overview [REQUIRED]

**Dashboard Name:** [Name]
**Purpose:** [One sentence describing what this dashboard is for]
**Owner:** [Name, Team]
**Tool:** [e.g., "Looker / Tableau / Metabase"]
**Date Created:** [YYYY-MM-DD]
**Status:** [Spec Draft / Building / In Review / Live]

_Example:_
**Dashboard Name:** Growth Funnel Health
**Purpose:** Monitor the end-to-end acquisition funnel from visit to paid activation, surface anomalies, and guide weekly growth decisions.
**Owner:** Tom Lee, Analytics
**Tool:** Looker
**Date Created:** 2026-03-06
**Status:** Spec Draft

---

## 2. Questions and Actions [REQUIRED]

Every chart on the dashboard must answer a question that drives an action.

| # | Question                                         | Chart / Visual              | Action if Anomaly                     |
|---|--------------------------------------------------|-----------------------------|---------------------------------------|
| 1 | [e.g., "Are visits trending up or down?"]       | [e.g., "Line chart"]       | [e.g., "Review channel mix"]         |
| 2 | [e.g., "Which step has the biggest funnel drop?"]| [e.g., "Funnel chart"]    | [e.g., "Prioritize that step for experiments"]|
| 3 | [e.g., "Is conversion rate on target?"]         | [e.g., "Scorecard + trend"]| [e.g., "Escalate if >2pp below target"]|

_Example:_

| # | Question                                     | Chart / Visual          | Action if Anomaly                     |
|---|----------------------------------------------|-------------------------|---------------------------------------|
| 1 | Are weekly visits growing?                   | Line chart (weekly)     | Review channel spend and SEO health   |
| 2 | Where is the biggest funnel drop-off?        | Funnel chart            | Prioritize that step for experimentation |
| 3 | Is trial-to-paid on track for quarterly goal?| Scorecard + trend line  | Escalate to exec if >2pp below target |
| 4 | Which channels drive highest-quality signups?| Stacked bar by channel  | Shift budget toward highest LTV channels |
| 5 | Are there device-type discrepancies?         | Comparison bar chart    | Flag mobile UX issues for product team |

---

## 3. Filters [REQUIRED]

| Filter Name            | Type            | Values                              | Default         | Affects        |
|------------------------|-----------------|--------------------------------------|-----------------|----------------|
| [e.g., "Date range"] | [Date picker]   | [e.g., "Any date range"]           | [e.g., "Last 90 days"]| [e.g., "All charts"]|
| [e.g., "Channel"]    | [Multi-select]  | [e.g., "organic, paid, referral"]  | [e.g., "All"]  | [e.g., "All charts"]|

_Example:_

| Filter Name     | Type          | Values                                  | Default       | Affects     |
|-----------------|---------------|-----------------------------------------|---------------|-------------|
| Date range      | Date picker   | Any range, presets: 7d, 30d, 90d, YTD  | Last 90 days  | All charts  |
| Channel         | Multi-select  | organic, paid, referral, direct, partner| All           | All charts  |
| Device type     | Dropdown      | desktop, mobile, tablet, all            | All           | All charts  |
| Plan type       | Multi-select  | starter, pro, business                  | All           | Charts 3-5  |

---

## 4. Data Sources [REQUIRED]

| Source Model / Table              | Description                          | Refresh    | Owner          |
|-----------------------------------|--------------------------------------|------------|----------------|
| [e.g., "analytics.fct_funnel"]  | [e.g., "Funnel step events"]       | [e.g., "Daily 6am"]| [e.g., "Data Eng"]|
| [e.g., "analytics.dim_channels"]| [e.g., "Channel attribution"]      | [e.g., "Daily 6am"]| [e.g., "Data Eng"]|

_Example:_

| Source Model / Table         | Description                    | Refresh      | Owner     |
|------------------------------|--------------------------------|--------------|-----------|
| analytics.fct_funnel_events  | Funnel step events with user_id| Daily 6am ET | Data Eng  |
| analytics.dim_channels       | Channel attribution mapping    | Daily 6am ET | Data Eng  |
| analytics.fct_conversions    | Trial-to-paid conversion facts | Daily 6am ET | Data Eng  |
| analytics.dim_dates          | Date dimension with fiscal cal | Static       | Data Eng  |

---

## 5. Layout and Sections

Describe the dashboard layout from top to bottom.

### Section 1: [Section Name]
**Purpose:** [What this section tells the user]
**Charts:**

| Chart Name                  | Type          | X-Axis       | Y-Axis / Value         | Comparison         |
|-----------------------------|---------------|--------------|-------------------------|--------------------|
| [e.g., "Weekly visits"]   | [Line]        | [Week]       | [Unique visitors]      | [vs prior period] |
| [e.g., "Conversion KPIs"] | [Scorecard]   | [N/A]        | [Rate values]          | [vs target]       |

### Section 2: [Section Name]
**Purpose:** [What this section tells the user]
**Charts:**

| Chart Name                  | Type          | X-Axis       | Y-Axis / Value         | Comparison         |
|-----------------------------|---------------|--------------|-------------------------|--------------------|
| [e.g., "Funnel"]          | [Funnel]      | [Step]       | [Users]                | [vs prior period] |

_Example:_

### Section 1: Top-Line KPIs
**Purpose:** At-a-glance health check - answer "are we on track?" in 5 seconds
**Charts:**

| Chart Name              | Type       | Value                    | Comparison          |
|-------------------------|------------|--------------------------|---------------------|
| Weekly visits           | Scorecard  | Unique visitors (7d)     | vs prior 7d, % chg |
| Trial starts            | Scorecard  | Trial signups (7d)       | vs prior 7d, % chg |
| Trial-to-paid rate      | Scorecard  | Conversion % (mature cohort) | vs target, vs prior period |
| Revenue from new        | Scorecard  | New MRR (7d)             | vs prior 7d, % chg |

### Section 2: Funnel Detail
**Purpose:** Identify where users drop off and which step needs attention
**Charts:**

| Chart Name              | Type       | X-Axis     | Y-Axis           | Comparison     |
|-------------------------|------------|------------|-------------------|----------------|
| Conversion funnel       | Funnel     | Step name  | Users, conv. rate | vs prior period|
| Drop-off by step        | Bar        | Step name  | Drop-off %        | vs 4-wk avg   |

### Section 3: Channel Breakdown
**Purpose:** Understand which channels drive volume and quality
**Charts:**

| Chart Name              | Type        | X-Axis  | Y-Axis            | Breakdown     |
|-------------------------|-------------|---------|---------------------|---------------|
| Visits by channel       | Stacked bar | Week    | Unique visitors     | Channel       |
| Conversion by channel   | Grouped bar | Channel | Trial-to-paid rate  | None          |

---

## 6. Interactivity and Drill-Downs

| Interaction                    | Behavior                                       |
|--------------------------------|-------------------------------------------------|
| [e.g., "Click funnel step"]  | [e.g., "Drill into step detail page"]          |
| [e.g., "Click channel bar"] | [e.g., "Filter entire dashboard to that channel"]|

---

## 7. Alerting

| Alert Condition                              | Channel                    | Recipients        |
|----------------------------------------------|----------------------------|--------------------|
| [e.g., "Trial-to-paid drops >3pp WoW"]     | [e.g., "Slack #growth"]  | [e.g., "Growth team"]|
| [e.g., "Visit volume drops >20% WoW"]      | [e.g., "Email"]          | [e.g., "Marketing"]|

---

## 8. Access and Permissions

| Group / Role                | Access Level          |
|-----------------------------|-----------------------|
| [e.g., "Analytics team"]  | Edit                  |
| [e.g., "Growth team"]     | View + Filter         |
| [e.g., "All employees"]   | View only             |

---

## 9. Build Timeline

| Milestone            | Date     | Owner  |
|----------------------|----------|--------|
| Spec finalized       | [Date]   | [Name] |
| Data models ready    | [Date]   | [Name] |
| V1 built             | [Date]   | [Name] |
| Stakeholder review   | [Date]   | [Name] |
| Go-live              | [Date]   | [Name] |
