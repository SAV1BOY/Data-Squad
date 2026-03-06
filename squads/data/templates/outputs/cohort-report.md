# Cohort Analysis Report

> Use this template to document and communicate cohort analysis findings.
> A cohort analysis tracks groups of users over time to reveal retention and behavioral patterns.
> Fill in each section; replace examples with your specifics.

---

## 1. Report Overview

**Report Title:** [Descriptive title]
**Analyst:** [Name, Team]
**Date:** [YYYY-MM-DD]
**Cohort Type:** [Signup date / First purchase / Feature adoption / Campaign exposure]
**Time Period Covered:** [e.g., "Cohorts from Jan-Dec 2025"]

_Example:_
**Report Title:** Monthly Signup Cohort Retention Analysis - 2025 Annual Review
**Analyst:** Sarah Kim, Product Analytics
**Date:** 2026-03-06
**Cohort Type:** Signup month (first subscription created)
**Time Period Covered:** Cohorts from Jan 2025 through Dec 2025

---

## 2. Methodology

**Cohort Definition:** [How users are grouped, e.g., "Month of first paid subscription"]
**Metric Tracked:** [What is measured, e.g., "Active in month N (1+ login with core action)"]
**Time Granularity:** [e.g., "Monthly cohorts, tracked monthly"]
**Population:** [Who is included/excluded]
**Sample Size:** [Total users across all cohorts]

_Example:_
**Cohort Definition:** Users grouped by the calendar month of their first paid subscription start date
**Metric Tracked:** Retained = user performed 1+ core action (create, edit, or share) in month N
**Time Granularity:** Monthly cohorts, retention measured monthly for up to 12 months
**Population:** All self-serve paid users; excludes enterprise, internal, and test accounts
**Sample Size:** 18,400 users across 12 monthly cohorts

---

## 3. Cohort Retention Table

Replace with your actual data. Values represent % of cohort still active.

| Cohort    | Size  | M0   | M1   | M2   | M3   | M4   | M5   | M6   |
|-----------|-------|------|------|------|------|------|------|------|
| [Month 1] | [#]  | 100% | [%]  | [%]  | [%]  | [%]  | [%]  | [%]  |
| [Month 2] | [#]  | 100% | [%]  | [%]  | [%]  | [%]  | [%]  |      |
| [Month 3] | [#]  | 100% | [%]  | [%]  | [%]  | [%]  |      |      |

_Example:_

| Cohort   | Size  | M0   | M1   | M2   | M3   | M4   | M5   | M6   |
|----------|-------|------|------|------|------|------|------|------|
| Jan 2025 | 1,420 | 100% | 68%  | 54%  | 47%  | 43%  | 40%  | 38%  |
| Feb 2025 | 1,380 | 100% | 70%  | 56%  | 49%  | 44%  | 41%  | 39%  |
| Mar 2025 | 1,550 | 100% | 71%  | 58%  | 51%  | 46%  | 43%  | 41%  |
| Apr 2025 | 1,490 | 100% | 69%  | 55%  | 48%  | 44%  | 41%  |      |
| May 2025 | 1,600 | 100% | 73%  | 60%  | 53%  | 48%  |      |      |
| Jun 2025 | 1,580 | 100% | 75%  | 62%  | 55%  |      |      |      |

---

## 4. Key Findings [REQUIRED]

Summarize the most important patterns. Number each finding and include supporting evidence.

**Finding 1:** [Title]
[Description with specific numbers]

**Finding 2:** [Title]
[Description with specific numbers]

**Finding 3:** [Title]
[Description with specific numbers]

_Example:_

**Finding 1: M1 retention improved steadily through 2025**
M1 retention improved from 68% (Jan cohort) to 78% (Dec cohort), a 10pp improvement. This correlates with the onboarding redesign shipped in April and the welcome email sequence launched in July.

**Finding 2: The M2-M3 drop remains the biggest retention gap**
Across all cohorts, the largest single-month drop occurs between M2 and M3 (average -7pp). This "month 3 wall" is consistent regardless of cohort and represents the primary retention opportunity.

**Finding 3: May-Jun cohorts outperform, suggesting seasonality or campaign effect**
May and June cohorts show 3-5pp higher retention at every time point. This coincides with the product conference in May and associated campaign traffic, suggesting higher-intent signups.

---

## 5. Segment Comparisons

Break down cohort performance by key segments.

### By [Segment Dimension]

| Segment              | Avg M1 Retention | Avg M3 Retention | Avg M6 Retention | Notes               |
|----------------------|------------------|------------------|-------------------|----------------------|
| [e.g., "Pro plan"] | [%]              | [%]              | [%]               | [Notes]              |
| [e.g., "Starter"]  | [%]              | [%]              | [%]               | [Notes]              |

_Example (By Plan Type):_

| Segment       | Avg M1 | Avg M3 | Avg M6 | Notes                           |
|---------------|--------|--------|--------|---------------------------------|
| Pro plan      | 78%    | 62%    | 51%    | Best retention across all periods|
| Business plan | 82%    | 65%    | 54%    | Highest, but small sample       |
| Starter plan  | 62%    | 38%    | 28%    | Significant drop-off by M3      |

_Example (By Signup Source):_

| Segment       | Avg M1 | Avg M3 | Avg M6 | Notes                           |
|---------------|--------|--------|--------|---------------------------------|
| Organic       | 74%    | 56%    | 44%    | Baseline performance            |
| Referral      | 81%    | 64%    | 53%    | Best retention - invest here    |
| Paid search   | 65%    | 42%    | 31%    | Lower quality - review targeting|

---

## 6. Recommendations

| # | Recommendation                                          | Expected Impact         | Owner          | Priority |
|---|---------------------------------------------------------|-------------------------|----------------|----------|
| 1 | [e.g., "Investigate M2-M3 drop with user research"]   | [e.g., "+3pp M3 retention"]| [e.g., "Product"]| [P0/P1/P2]|
| 2 | [e.g., "Shift paid spend toward referral-like channels"]| [e.g., "+5pp M6 retention"]| [e.g., "Marketing"]| [P0/P1/P2]|
| 3 | [e.g., "Build M2 engagement trigger campaign"]         | [e.g., "+2pp M3 retention"]| [e.g., "Lifecycle"]| [P0/P1/P2]|

_Example:_

| # | Recommendation                                       | Expected Impact       | Owner      | Priority |
|---|------------------------------------------------------|-----------------------|------------|----------|
| 1 | Investigate M2-M3 "wall" with qualitative research   | +3-5pp M3 retention   | Product    | P0       |
| 2 | Shift 20% of paid budget toward referral incentives  | +5pp avg M6 retention | Marketing  | P1       |
| 3 | Build automated engagement campaign triggered at M2  | +2pp M3 retention     | Lifecycle  | P1       |
| 4 | Review Starter plan value prop - retention is 24pp below Pro | Inform pricing review | Product | P1  |

---

## 7. Methodology Notes and Caveats

- [e.g., "Cohorts with fewer than 100 users are excluded for statistical reliability"]
- [e.g., "Reactivated users are counted as retained in the month they return"]
- [e.g., "M0 is defined as the signup month, not a full 30-day period for partial months"]
- [e.g., "Enterprise accounts were excluded; their retention patterns differ significantly"]

---

## 8. Next Steps

- [ ] [e.g., "Share findings with Product and Growth in weekly sync (Mar 10)"]
- [ ] [e.g., "Set up automated cohort dashboard for ongoing monitoring"]
- [ ] [e.g., "Conduct follow-up analysis on M2-M3 churn reasons"]
- [ ] [e.g., "Re-run analysis in Q3 to measure improvement"]

---

## 9. Appendix

**Data Source:** [e.g., "BigQuery: analytics.fct_user_retention"]
**Query / Notebook:** [Link to SQL or notebook]
**Dashboard:** [Link to live cohort dashboard if available]
