# Data Quality Report

> Use this template to document and communicate data quality findings.
> Publish on a regular cadence (weekly or monthly) to maintain accountability.

---

## Data Quality Report: [Period]

**Prepared by:** [Name, Team]
**Date:** [YYYY-MM-DD]
**Period Covered:** [e.g., "February 2026"]
**Overall Data Quality Score:** [e.g., "87/100" or "Good"]

---

## 1. Quality Score Summary [REQUIRED]

| Dimension          | Score (0-100) | Prior Period | Change  | Status |
|--------------------|---------------|-------------|---------|--------|
| Completeness       | [#]           | [#]         | [+/- #] | [G/Y/R]|
| Accuracy           | [#]           | [#]         | [+/- #] | [G/Y/R]|
| Timeliness         | [#]           | [#]         | [+/- #] | [G/Y/R]|
| Consistency        | [#]           | [#]         | [+/- #] | [G/Y/R]|
| Validity           | [#]           | [#]         | [+/- #] | [G/Y/R]|
| **Overall**        | **[#]**       | **[#]**     |**[+/-]**|**[Status]**|

_Example:_

| Dimension      | Score | Prior | Change | Status |
|----------------|-------|-------|--------|--------|
| Completeness   | 92    | 90    | +2     | Green  |
| Accuracy       | 88    | 86    | +2     | Green  |
| Timeliness     | 85    | 88    | -3     | Yellow |
| Consistency    | 82    | 80    | +2     | Yellow |
| Validity       | 90    | 91    | -1     | Green  |
| **Overall**    | **87**| **87**| **0**  |**Green**|

---

## 2. Critical Issues [REQUIRED]

Issues that affect business decisions or reporting accuracy.

| # | Issue                                    | Severity   | Affected Data         | Impact                          | Status          |
|---|------------------------------------------|------------|-----------------------|---------------------------------|-----------------|
| 1 | [e.g., "Duplicate events on SPA routes"]| [Critical/High/Medium/Low]| [e.g., "page_view events"]| [e.g., "Inflates pageviews by ~12%"]| [Open/Investigating/Resolved]|
| 2 | [e.g., "Missing UTM params on redirects"]| [Severity]| [e.g., "Attribution data"]| [e.g., "30% of traffic unattributed"]| [Status]|

_Example:_

| # | Issue                                 | Severity | Affected Data       | Impact                         | Status        |
|---|---------------------------------------|----------|---------------------|--------------------------------|---------------|
| 1 | Duplicate page_view on SPA navigation | High     | GA4 + Segment       | Pageviews inflated ~12%        | Investigating |
| 2 | UTM params stripped on SSO redirect   | High     | Attribution data    | 30% of paid traffic unattributed| Fix scheduled |
| 3 | Stripe webhook delays (>4hr on Feb 12)| Medium   | Revenue data        | T+0 dashboards showed $0 for 4hr| Resolved     |
| 4 | NPS survey missing user_id for 8% of responses| Medium | NPS data    | Cannot link to account metrics | Open          |

---

## 3. Data Source Health

| Source              | Records/Period | Expected Range  | Null Rate | Duplicate Rate | Freshness (lag) | Status |
|---------------------|---------------|-----------------|-----------|----------------|-----------------|--------|
| [e.g., "Segment"] | [#]           | [range]         | [%]       | [%]            | [time]          | [G/Y/R]|
| [e.g., "Stripe"]  | [#]           | [range]         | [%]       | [%]            | [time]          | [G/Y/R]|

_Example:_

| Source         | Records    | Expected     | Null Rate | Dup Rate | Freshness | Status |
|----------------|------------|-------------|-----------|----------|-----------|--------|
| Segment events | 2.4M       | 2.0-2.8M   | 0.3%      | 1.2%     | <5 min    | Green  |
| Stripe         | 48K        | 40-55K      | 0.1%      | 0.0%     | <1 hr     | Green  |
| Salesforce     | 12K        | 10-15K      | 4.2%      | 0.8%     | <6 hr     | Yellow |
| Zendesk        | 3.2K       | 2.5-4K     | 1.1%      | 0.2%     | <2 hr     | Green  |
| GA4            | 1.8M       | 1.5-2.2M   | 0.5%      | 12.1%    | <24 hr    | Red    |

---

## 4. Pipeline Health

| Pipeline / DAG              | Runs This Period | Success Rate | Avg Duration | SLA Met? | Status |
|-----------------------------|-----------------|--------------|--------------|----------|--------|
| [e.g., "dbt daily run"]   | [#]             | [%]          | [time]       | [Y/N]    | [G/Y/R]|
| [e.g., "Segment sync"]    | [#]             | [%]          | [time]       | [Y/N]    | [G/Y/R]|

_Example:_

| Pipeline              | Runs | Success Rate | Avg Duration | SLA Met | Status |
|-----------------------|------|-------------|--------------|---------|--------|
| dbt daily (6am ET)    | 28   | 96.4%       | 22 min       | 93%     | Green  |
| Segment -> BigQuery   | 672  | 99.8%       | 3 min        | 100%    | Green  |
| Stripe sync           | 28   | 100%        | 8 min        | 100%    | Green  |
| Salesforce sync       | 28   | 89.3%       | 45 min       | 82%     | Yellow |

---

## 5. Test Results

Automated data quality tests and their results.

| Test Category           | Tests Run | Passed | Failed | New Failures | Status |
|-------------------------|-----------|--------|--------|--------------|--------|
| [e.g., "Schema tests"] | [#]       | [#]    | [#]    | [#]          | [G/Y/R]|
| [e.g., "Volume tests"] | [#]       | [#]    | [#]    | [#]          | [G/Y/R]|
| [e.g., "Freshness tests"]| [#]     | [#]    | [#]    | [#]          | [G/Y/R]|

_Example:_

| Test Category    | Tests | Passed | Failed | New Failures | Status |
|------------------|-------|--------|--------|--------------|--------|
| Schema (not_null, unique) | 142 | 138 | 4   | 1            | Yellow |
| Volume (row counts)       | 28  | 26  | 2   | 0            | Yellow |
| Freshness (staleness)     | 18  | 16  | 2   | 1            | Yellow |
| Referential integrity     | 34  | 34  | 0   | 0            | Green  |
| Business logic            | 22  | 21  | 1   | 0            | Green  |
| **Total**                 |**244**|**235**|**9**| **2**      | **Yellow**|

---

## 6. Resolved Issues This Period

| Issue                                  | Resolution                        | Date Resolved | Days Open |
|----------------------------------------|-----------------------------------|---------------|-----------|
| [e.g., "Missing mobile events"]       | [e.g., "SDK updated to v3.2"]    | [Date]        | [#]       |
| [e.g., "Timezone mismatch in reports"]| [e.g., "Standardized to UTC"]    | [Date]        | [#]       |

_Example:_

| Issue                            | Resolution                    | Resolved   | Days Open |
|----------------------------------|-------------------------------|------------|-----------|
| Missing mobile app events (iOS)  | SDK updated to v3.2           | 2026-02-08 | 12        |
| Timezone mismatch in MRR report  | Standardized all to UTC       | 2026-02-15 | 5         |
| Stripe webhook retry failures    | Increased retry window to 6hr | 2026-02-12 | 1         |

---

## 7. Recommendations and Action Items

| # | Recommendation                               | Priority | Owner    | Target Date |
|---|----------------------------------------------|----------|----------|-------------|
| 1 | [e.g., "Fix GA4 duplicate page_view events"]| [P0]     | [Name]   | [Date]      |
| 2 | [e.g., "Add UTM preservation through SSO"]  | [P0]     | [Name]   | [Date]      |
| 3 | [e.g., "Add dbt tests for new events"]      | [P1]     | [Name]   | [Date]      |

_Example:_

| # | Recommendation                          | Priority | Owner      | Target     |
|---|-----------------------------------------|----------|------------|------------|
| 1 | Fix GA4 SPA duplicate page_views        | P0       | Eng (Dev)  | 2026-03-15 |
| 2 | Preserve UTMs through SSO redirect      | P0       | Eng (Mia)  | 2026-03-20 |
| 3 | Add user_id to NPS survey integration   | P1       | Ops (Jamie)| 2026-03-25 |
| 4 | Improve Salesforce sync reliability     | P1       | Data Eng   | 2026-03-30 |

---

## 8. Trends (3-Month)

| Metric                | Month -2 | Month -1 | This Month | Trend       |
|-----------------------|----------|----------|------------|-------------|
| Overall quality score | [#]      | [#]      | [#]        | [Direction] |
| Open issues           | [#]      | [#]      | [#]        | [Direction] |
| Test pass rate        | [%]      | [%]      | [%]        | [Direction] |
| Avg pipeline SLA met  | [%]      | [%]      | [%]        | [Direction] |

---

## Distribution

| Audience       | Format            | Cadence  |
|----------------|-------------------|----------|
| Data team      | Full report       | Monthly  |
| Engineering    | Issues + actions  | Monthly  |
| Stakeholders   | Summary + impact  | Monthly  |
