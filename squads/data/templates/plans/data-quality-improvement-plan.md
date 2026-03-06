# Data Quality Improvement Plan

> Use this template to plan and track a systematic data quality improvement effort.
> Covers assessment, prioritized remediation, prevention, and ongoing monitoring.

---

## 1. Plan Overview

**Plan Name:** [Descriptive name]
**Owner:** [Name, Team]
**Date Created:** [YYYY-MM-DD]
**Duration:** [e.g., "Q2 2026 (3 months)"]
**Status:** [Planning / Active / Complete]

_Example:_
**Plan Name:** Q2 2026 Data Quality Improvement Plan - Tracking and Pipeline Reliability
**Owner:** Dev Patel, Data Engineering
**Date Created:** 2026-03-06
**Duration:** Q2 2026 (Apr 1 - Jun 30)
**Status:** Planning

---

## 2. Current State Assessment [REQUIRED]

**Overall Quality Score:** [e.g., "72/100"]
**Assessment Date:** [YYYY-MM-DD]
**Assessment Method:** [e.g., "Automated tests + manual audit + stakeholder survey"]

### Quality Dimensions

| Dimension      | Current Score | Target Score | Gap  | Priority |
|----------------|--------------|-------------|------|----------|
| Completeness   | [#/100]      | [#/100]     | [#]  | [H/M/L] |
| Accuracy        | [#/100]     | [#/100]     | [#]  | [H/M/L] |
| Timeliness     | [#/100]      | [#/100]     | [#]  | [H/M/L] |
| Consistency    | [#/100]      | [#/100]     | [#]  | [H/M/L] |
| Validity       | [#/100]      | [#/100]     | [#]  | [H/M/L] |

_Example:_

| Dimension    | Current | Target | Gap | Priority |
|--------------|---------|--------|-----|----------|
| Completeness | 78      | 92     | 14  | High     |
| Accuracy     | 72      | 90     | 18  | High     |
| Timeliness   | 85      | 95     | 10  | Medium   |
| Consistency  | 65      | 85     | 20  | High     |
| Validity     | 80      | 90     | 10  | Medium   |

### Known Issues Inventory

| # | Issue                                  | Dimension    | Impact (H/M/L) | Affected Data            | Discovery Date |
|---|----------------------------------------|-------------|-----------------|--------------------------|----------------|
| 1 | [e.g., "Duplicate page_view events"] | [Accuracy]  | [High]          | [e.g., "Web analytics"] | [Date]         |
| 2 | [e.g., "UTM params lost on redirect"]| [Completeness]| [High]         | [e.g., "Attribution"]   | [Date]         |

_Example:_

| # | Issue                              | Dimension    | Impact | Affected Data        | Discovered |
|---|------------------------------------|-------------|--------|----------------------|------------|
| 1 | Duplicate page_view on SPA routes  | Accuracy    | High   | Web analytics, GA4   | 2026-01-15 |
| 2 | UTM params stripped on SSO redirect| Completeness| High   | Attribution, channels | 2026-01-20 |
| 3 | Inconsistent event naming across platforms | Consistency | High | Cross-platform analytics | 2026-02-01 |
| 4 | Salesforce sync fails 2-3x/week   | Timeliness  | Medium | CRM data, CS reports | 2026-02-10 |
| 5 | NPS survey missing user_id (8%)   | Completeness| Medium | NPS-to-account linkage| 2026-02-15 |
| 6 | Timezone inconsistencies in reports| Consistency | Medium | All time-based reports| 2026-01-10 |
| 7 | Historical schema changes undocumented | Validity | Low  | Trend analysis        | 2026-02-20 |

---

## 3. Prioritized Remediation Plan [REQUIRED]

Issues ranked by impact and effort. Fix high-impact, low-effort issues first.

| Priority | Issue                              | Fix Description                       | Effort (S/M/L) | Owner      | Target Date | Status      |
|----------|------------------------------------|---------------------------------------|-----------------|------------|-------------|-------------|
| P0       | [Issue from inventory]             | [Specific fix]                        | [Effort]        | [Name]     | [Date]      | [Status]    |
| P0       | [Issue from inventory]             | [Specific fix]                        | [Effort]        | [Name]     | [Date]      | [Status]    |
| P1       | [Issue from inventory]             | [Specific fix]                        | [Effort]        | [Name]     | [Date]      | [Status]    |

_Example:_

| Priority | Issue                        | Fix                                    | Effort | Owner     | Target     | Status      |
|----------|------------------------------|----------------------------------------|--------|-----------|------------|-------------|
| P0       | Duplicate page_view events   | Deduplicate in Segment middleware + dbt| M      | Dev Patel | 2026-04-15 | Not Started |
| P0       | UTM params on SSO redirect   | Preserve UTMs through redirect chain   | S      | Mia Wong  | 2026-04-10 | Not Started |
| P0       | Inconsistent event naming    | Define naming convention + migrate     | L      | Sarah Kim | 2026-05-15 | Not Started |
| P1       | Salesforce sync reliability  | Upgrade connector + add retry logic    | M      | Dev Patel | 2026-04-30 | Not Started |
| P1       | NPS missing user_id          | Add user_id to survey integration      | S      | Jamie T.  | 2026-04-20 | Not Started |
| P1       | Timezone standardization     | Force UTC in all pipelines and models  | M      | Dev Patel | 2026-05-01 | Not Started |
| P2       | Historical schema docs       | Document all schema changes since 2024 | M      | Tom Lee   | 2026-05-30 | Not Started |

---

## 4. Prevention Measures [REQUIRED]

New processes and tools to prevent future data quality issues.

| # | Prevention Measure                           | Description                                    | Owner    | Target Date | Status |
|---|----------------------------------------------|------------------------------------------------|----------|-------------|--------|
| 1 | [e.g., "Automated schema validation"]       | [e.g., "dbt tests on all new models"]         | [Name]   | [Date]      | [ ]    |
| 2 | [e.g., "Tracking spec review process"]      | [e.g., "All new events require spec + QA"]    | [Name]   | [Date]      | [ ]    |
| 3 | [e.g., "Data quality alerts"]               | [e.g., "Anomaly detection on key tables"]     | [Name]   | [Date]      | [ ]    |

_Example:_

| # | Prevention Measure              | Description                                         | Owner     | Target     | Status |
|---|---------------------------------|-----------------------------------------------------|-----------|------------|--------|
| 1 | dbt test coverage for all models| not_null, unique, accepted_values on all prod models | Dev Patel | 2026-04-30 | [ ]    |
| 2 | Event naming convention         | Published guide + linter in Segment                 | Sarah Kim | 2026-04-15 | [ ]    |
| 3 | Tracking spec review gate       | No events shipped without spec review + QA sign-off | Sarah Kim | 2026-04-15 | [ ]    |
| 4 | Volume anomaly alerts           | Alert when any source volume deviates >30% from 7d avg | Dev Patel | 2026-05-01 | [ ] |
| 5 | Monthly data quality report     | Automated report covering all dimensions            | Tom Lee   | 2026-05-15 | [ ]    |
| 6 | Quarterly data audit            | Manual audit of top 20 tables each quarter          | Sarah Kim | 2026-06-01 | [ ]    |

---

## 5. Monitoring Plan

How will you track ongoing data quality after improvements?

| Monitor                          | What It Checks                    | Frequency | Alert Threshold          | Owner    |
|----------------------------------|-----------------------------------|-----------|--------------------------|----------|
| [e.g., "Row count monitor"]    | [e.g., "Daily row counts"]       | [Daily]   | [e.g., "+/- 30% of 7d avg"]| [Name]|
| [e.g., "Null rate monitor"]    | [e.g., "Null % on key fields"]  | [Daily]   | [e.g., ">2% null rate"] | [Name]  |
| [e.g., "Freshness monitor"]    | [e.g., "Data lag in hours"]      | [Hourly]  | [e.g., ">4 hours stale"]| [Name]  |

_Example:_

| Monitor               | Checks                          | Frequency | Alert Threshold      | Owner     |
|-----------------------|---------------------------------|-----------|----------------------|-----------|
| Volume anomaly        | Row counts on top 15 tables     | Hourly    | +/- 30% of 7d avg   | Dev Patel |
| Null rate             | Key fields on critical tables   | Daily     | >2% null rate        | Dev Patel |
| Freshness             | Last row timestamp per source   | Hourly    | >4 hours stale       | Dev Patel |
| Duplicate detection   | Duplicate IDs in key tables     | Daily     | >0.5% duplicate rate | Tom Lee   |
| Schema drift          | Column types and counts         | On deploy | Any unexpected change| Dev Patel |
| Cross-source match    | Segment vs GA4 event counts     | Daily     | >5% variance         | Sarah Kim |

---

## 6. Success Metrics

| Metric                              | Baseline  | Target (End of Plan) | Measurement Method          |
|-------------------------------------|-----------|---------------------|-----------------------------|
| Overall data quality score          | [#]       | [#]                 | [e.g., "Automated scorecard"]|
| Open data quality issues            | [#]       | [#]                 | [e.g., "Issue tracker"]     |
| dbt test coverage                   | [%]       | [%]                 | [e.g., "dbt test count / model count"]|
| Mean time to detect (MTTD)          | [time]    | [time]              | [e.g., "Alert logs"]       |
| Mean time to resolve (MTTR)         | [time]    | [time]              | [e.g., "Issue tracker"]    |
| Stakeholder confidence score        | [#/10]    | [#/10]              | [e.g., "Quarterly survey"] |

_Example:_

| Metric                        | Baseline | Target | Method                 |
|-------------------------------|----------|--------|------------------------|
| Overall quality score         | 72       | 88     | Automated scorecard    |
| Open critical/high issues     | 6        | 0      | Issue tracker          |
| dbt test coverage             | 42%      | 90%    | Tests / models ratio   |
| Mean time to detect (MTTD)    | 48 hours | 4 hours| Alert response logs    |
| Mean time to resolve (MTTR)   | 5 days   | 2 days | Issue tracker          |
| Stakeholder confidence        | 6.2/10   | 8.0/10 | Quarterly survey       |

---

## 7. Timeline [REQUIRED]

| Phase                       | Dates               | Focus                              | Milestone                      |
|-----------------------------|---------------------|------------------------------------|--------------------------------|
| Phase 1: Quick Wins         | [Date range]        | [Focus]                            | [Milestone]                    |
| Phase 2: Systematic Fixes   | [Date range]        | [Focus]                            | [Milestone]                    |
| Phase 3: Prevention          | [Date range]       | [Focus]                            | [Milestone]                    |

_Example:_

| Phase                      | Dates          | Focus                          | Milestone                      |
|----------------------------|----------------|--------------------------------|--------------------------------|
| Phase 1: Quick Wins        | Apr 1-15       | Fix P0 issues (duplicates, UTMs)| P0 issues resolved            |
| Phase 2: Systematic Fixes  | Apr 16 - May 15| P1 issues + naming convention  | All P0+P1 resolved            |
| Phase 3: Prevention        | May 16 - Jun 30| Monitoring, automation, process| Prevention measures operational|

---

## 8. Resources Needed

| Resource                    | Current | Needed | Gap                              |
|-----------------------------|---------|--------|----------------------------------|
| [e.g., "Data engineer time"]| [hrs/wk]| [hrs/wk]| [e.g., "Need 10 additional hrs"]|
| [e.g., "Tooling budget"]   | [$]     | [$]    | [e.g., "Need $X for monitoring tool"]|

---

## Review Log

| Date     | Reviewer | Status Update                                 | Score |
|----------|----------|-----------------------------------------------|-------|
| [Date]   | [Name]   | [e.g., "Plan created, Phase 1 starting"]     | [#]   |
| [Date]   | [Name]   | [e.g., "Phase 1 complete, score improved to 80"]| [#]|
