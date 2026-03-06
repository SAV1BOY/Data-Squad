# Cross-Squad Data Handoff

> Use this template when sharing data, analysis, or data assets between squads.
> Ensures the receiving squad has context, knows limitations, and can use the data correctly.

---

## 1. Handoff Overview [REQUIRED]

**Handoff ID:** [HO-YYYY-NNN]
**Date:** [YYYY-MM-DD]
**From Squad:** [Sending squad name]
**From Contact:** [Name, Role]
**To Squad:** [Receiving squad name]
**To Contact:** [Name, Role]
**Status:** [Initiated / In Progress / Complete / Acknowledged]

_Example:_
**Handoff ID:** HO-2026-007
**Date:** 2026-03-06
**From Squad:** Data & Analytics
**From Contact:** Sarah Kim, Senior Analyst
**To Squad:** Customer Success
**To Contact:** Jordan Lee, CS Operations Manager
**Status:** Initiated

---

## 2. What Is Being Handed Off [REQUIRED]

**Handoff Type:** [Dataset / Analysis / Dashboard / Model Output / Metric Definition / Report]

**Description:** [2-3 sentences describing what is being shared and its purpose]

**Assets Included:**

| Asset                          | Type          | Location / Link                     | Format        |
|--------------------------------|---------------|--------------------------------------|---------------|
| [e.g., "Customer segments"]   | [Dataset]     | [e.g., "BigQuery: analytics.segments"]| [Table/CSV/Doc]|
| [e.g., "Segment profiles"]    | [Document]    | [e.g., "Link to doc"]               | [Google Doc]  |
| [e.g., "Segment dashboard"]   | [Dashboard]   | [e.g., "Looker /dashboards/85"]     | [Looker]      |

_Example:_

**Handoff Type:** Dataset + Analysis + Dashboard

**Description:** Customer behavioral segmentation results (4 segments) for use in designing differentiated CS playbooks. Includes segment assignments for all 4,180 eligible accounts, segment profiles documentation, and a monitoring dashboard.

**Assets Included:**

| Asset                        | Type      | Location                              | Format       |
|------------------------------|-----------|---------------------------------------|--------------|
| Segment assignments          | Dataset   | BigQuery: analytics.customer_segments | Table        |
| Segment assignments (static) | Export    | Google Drive: /shared/segments_mar2026.csv | CSV     |
| Segment profile document     | Analysis  | [Google Doc link]                     | Google Doc   |
| Segment monitoring dashboard | Dashboard | Looker /dashboards/85                 | Looker       |
| Segmentation methodology     | Document  | [Confluence link]                     | Confluence   |

---

## 3. Context and Background [REQUIRED]

**Why this was created:** [Business reason and original brief/request]
**Key decisions already made:** [Decisions that shaped this data]
**Who else has seen this:** [Other stakeholders who reviewed]

_Example:_
**Why this was created:** CS leadership requested customer segmentation to design differentiated engagement playbooks instead of one-size-fits-all CS model. Approved in Q4 2025 planning.

**Key decisions already made:**
- 4 segments chosen (Champions, Steady, At-Risk, Ramping) based on k-means clustering validated with CS team
- Segmentation uses last 6 months of behavioral data (Sep 2025 - Feb 2026)
- Enterprise accounts excluded (separate segmentation in progress)
- Segments will refresh monthly on the 1st

**Who else has seen this:** VP Customer Success (approved approach), CS Managers (validated segment descriptions), Product Analytics (peer-reviewed methodology)

---

## 4. Data Specification [REQUIRED]

### Schema (if dataset)

| Field Name           | Type     | Description                           | Example Value      | Nullable? |
|----------------------|----------|---------------------------------------|--------------------|-----------|
| [e.g., "account_id"]| [string] | [e.g., "Unique account identifier"]  | [e.g., "acc_123"] | [No]      |
| [e.g., "segment"]   | [string] | [e.g., "Assigned segment name"]      | [e.g., "champion"]| [No]      |
| [e.g., "score"]     | [float]  | [e.g., "Segment confidence score"]   | [e.g., "0.87"]    | [No]      |

_Example:_

| Field Name        | Type    | Description                         | Example         | Nullable |
|-------------------|---------|-------------------------------------|-----------------|----------|
| account_id        | string  | Unique account identifier           | acc_4f2a8       | No       |
| segment_name      | string  | Assigned segment                    | champion        | No       |
| segment_score     | float   | Confidence score (0-1)              | 0.87            | No       |
| primary_driver    | string  | Top feature driving assignment      | feature_breadth | No       |
| assigned_date     | date    | Date of segment assignment          | 2026-03-01      | No       |
| mrr               | decimal | Current MRR at time of segmentation | 420.00          | No       |
| usage_sub_score   | float   | Usage behavior sub-score (0-100)    | 82.4            | Yes      |
| support_sub_score | float   | Support health sub-score (0-100)    | 74.1            | Yes      |

### Key Statistics

| Stat                     | Value                          |
|--------------------------|--------------------------------|
| Total records            | [#]                            |
| Date range               | [Start - End]                  |
| Refresh cadence          | [e.g., "Monthly on the 1st"] |
| Last refreshed           | [Date]                         |

---

## 5. Known Limitations and Caveats [REQUIRED]

| # | Limitation                                      | Impact                               | Mitigation                        |
|---|--------------------------------------------------|--------------------------------------|-----------------------------------|
| 1 | [e.g., "Excludes accounts <90 days old"]        | [e.g., "New accounts unscored"]     | [e.g., "Default to 'Ramping'"]   |
| 2 | [e.g., "NPS data missing for 40% of accounts"] | [e.g., "Engagement score less reliable"]| [e.g., "Weighted fallback"]    |
| 3 | [e.g., "~12% of accounts change segment monthly"]| [e.g., "Segment not fully stable"]| [e.g., "Use 2-month consistency for playbooks"]|

_Example:_

| # | Limitation                               | Impact                            | Mitigation                           |
|---|------------------------------------------|-----------------------------------|--------------------------------------|
| 1 | Excludes accounts <90 days tenure        | ~800 accounts unscored            | Treat as "Ramping" by default        |
| 2 | NPS data available for only 60%          | Engagement sub-score less reliable | Falls back to CSM meeting + email data|
| 3 | ~12% of accounts shift segments monthly  | Some instability in assignments   | Use 2-month consistent segment for playbooks |
| 4 | Enterprise accounts excluded             | Separate model needed             | In progress, ETA Q2                  |
| 5 | Seasonal effects not fully captured      | Summer/holiday patterns may shift segments | Will reassess after 6 months  |

---

## 6. How to Use This Data [REQUIRED]

### Intended Use Cases
- [Use case 1, e.g., "Assign CS playbooks based on segment_name"]
- [Use case 2, e.g., "Prioritize outreach using segment_score for within-segment ranking"]
- [Use case 3, e.g., "Monitor segment health trends via dashboard"]

### Not Intended For
- [Anti-pattern 1, e.g., "Do not use for individual account-level predictions (use health score instead)"]
- [Anti-pattern 2, e.g., "Do not use segment_score as a health score (it measures cluster fit, not risk)"]

### Joining Instructions
```sql
-- How to join segment data to your account data
SELECT a.*, s.segment_name, s.segment_score
FROM your_table a
LEFT JOIN analytics.customer_segments s
  ON a.account_id = s.account_id
  AND s.assigned_date = (SELECT MAX(assigned_date) FROM analytics.customer_segments)
```

---

## 7. Support and Escalation

| Question Type                        | Contact           | Channel                    |
|--------------------------------------|-------------------|----------------------------|
| [e.g., "Data questions"]            | [Name]            | [e.g., "Slack #data-help"]|
| [e.g., "Methodology questions"]     | [Name]            | [e.g., "Direct message"]  |
| [e.g., "Access issues"]             | [Name]            | [e.g., "IT ticket"]       |
| [e.g., "Bug or data quality issue"] | [Name]            | [e.g., "Slack #data-bugs"]|

_Example:_

| Question Type            | Contact    | Channel           |
|--------------------------|------------|-------------------|
| Data or schema questions | Sarah Kim  | Slack #data-help  |
| Methodology questions    | Sarah Kim  | Direct message    |
| Dashboard access         | Tom Lee    | Slack #data-help  |
| Data quality issue       | Dev Patel  | Slack #data-bugs  |

---

## 8. Acceptance and Acknowledgment

### Receiving Squad Checklist

- [ ] Reviewed all assets and can access them
- [ ] Understands the data schema and field definitions
- [ ] Understands known limitations and caveats
- [ ] Understands intended and unintended use cases
- [ ] Has a contact for questions and issues
- [ ] Agrees to the refresh cadence and update process

### Sign-Off

| Role              | Name | Date | Status        |
|-------------------|------|------|---------------|
| Sending Contact   |      |      | Handed off    |
| Receiving Contact |      |      | Acknowledged  |
| Sending Lead      |      |      | Approved      |
| Receiving Lead    |      |      | Approved      |

---

## 9. Update and Maintenance Agreement

**Refresh Cadence:** [e.g., "Monthly on the 1st"]
**Who Maintains:** [e.g., "Data & Analytics squad"]
**Change Notification:** [e.g., "Slack message to receiving contact 48hrs before schema changes"]
**Sunset / Review Date:** [e.g., "Review relevance in 6 months (Sep 2026)"]
