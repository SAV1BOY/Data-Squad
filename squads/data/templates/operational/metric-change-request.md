# Metric Change Request

> Use this template when proposing a change to an existing metric definition.
> Metric changes affect dashboards, reports, targets, and historical comparisons.
> All changes must be reviewed and approved before implementation.

---

## 1. Change Request Overview [REQUIRED]

**Request ID:** [MCR-YYYY-NNN]
**Metric Name:** [Name of the metric being changed]
**Metric ID:** [e.g., "metric_trial_to_paid_rate"]
**Requestor:** [Name, Team]
**Date Submitted:** [YYYY-MM-DD]
**Priority:** [Urgent / High / Normal]
**Status:** [Submitted / In Review / Approved / Rejected / Implemented]

_Example:_
**Request ID:** MCR-2026-003
**Metric Name:** Trial-to-Paid Conversion Rate
**Metric ID:** metric_trial_to_paid_rate
**Requestor:** Sarah Kim, Analytics
**Date Submitted:** 2026-03-06
**Priority:** High
**Status:** In Review

---

## 2. Current Definition [REQUIRED]

**Current Formula:**
```
[Current numerator]
-------------------
[Current denominator]
```

**Current Parameters:**
- Window: [e.g., "14-day trial period"]
- Exclusions: [e.g., "Internal users, enterprise trials"]
- Granularity: [e.g., "Weekly cohorts"]

_Example:_
**Current Formula:**
```
Trial users who activate a paid plan within 14 days of trial start
-----------------------------------------------------------------
Trial users whose 14-day window has fully elapsed
```

**Current Parameters:**
- Window: 14-day trial period from trial_start_date
- Exclusions: Internal users (@acme.com), enterprise trials, test accounts
- Granularity: Weekly cohorts (Mon-Sun)

---

## 3. Proposed Change [REQUIRED]

**What Is Changing:** [Describe the specific change]

**Proposed Formula:**
```
[New numerator]
-------------------
[New denominator]
```

**Changed Parameters:**
- [Parameter]: [Old value] -> [New value]

_Example:_
**What Is Changing:** Extending the conversion window from 14 days to 21 days and excluding users with <1 day trial.

**Proposed Formula:**
```
Trial users who activate a paid plan within 21 days of trial start
-----------------------------------------------------------------
Trial users whose 21-day window has fully elapsed AND trial lasted >1 day
```

**Changed Parameters:**
- Window: 14 days -> 21 days
- Exclusions: Added "users with trial <1 day" (bot/accidental signups)
- Granularity: No change (weekly cohorts)

---

## 4. Reason for Change [REQUIRED]

**Why is this change needed?**
[Detailed explanation with supporting data]

**Evidence:**
| Data Point                                        | Source         | Implication                        |
|---------------------------------------------------|----------------|-------------------------------------|
| [e.g., "18% of conversions happen on days 15-21"]| [e.g., "Billing data"]| [e.g., "Current metric undercounts"]|
| [e.g., "3% of trials last <1 day (bots)"]       | [e.g., "User data"]| [e.g., "Inflates denominator"]    |

_Example:_

**Why is this change needed?**
Analysis of the last 6 months shows that 18% of eventual conversions happen between days 15-21, meaning the current 14-day window systematically undercounts conversions. Additionally, 3% of trial starts are bot/accidental signups that last under 1 day and never return, artificially depressing the rate.

**Evidence:**

| Data Point                                    | Source       | Implication                          |
|-----------------------------------------------|-------------|--------------------------------------|
| 18% of conversions occur on days 15-21        | Billing data | Current metric misses real conversions|
| 3% of trials last <1 day (never return)       | User data    | Inflates denominator by ~250 users/mo|
| Trial was extended to 21 days in Jan 2026     | Product changelog | Metric doesn't match trial length |
| Benchmark data uses 21-day windows            | Industry reports | Our metric is not comparable       |

---

## 5. Impact Assessment [REQUIRED]

### Metric Value Impact

| Scenario         | Current Value | New Value | Change    |
|------------------|--------------|-----------|-----------|
| Most recent period| [value]     | [value]   | [+/- change]|
| 3-month average  | [value]      | [value]   | [+/- change]|

_Example:_

| Scenario          | Current (14d) | Proposed (21d, excl bots) | Change  |
|-------------------|---------------|---------------------------|---------|
| Feb 2026          | 31.2%         | 38.8%                     | +7.6pp  |
| Dec-Feb 2026 avg  | 30.1%         | 37.5%                     | +7.4pp  |

### Downstream Impact

| Affected Item                   | Type              | Impact Description                       | Action Needed        |
|---------------------------------|-------------------|------------------------------------------|----------------------|
| [e.g., "Growth dashboard"]    | [Dashboard]       | [e.g., "Formula update needed"]         | [e.g., "Update SQL"]|
| [e.g., "Quarterly target"]    | [Target/OKR]      | [e.g., "Target needs recalibration"]    | [e.g., "Recalculate"]|
| [e.g., "Weekly exec report"]  | [Report]          | [e.g., "Chart will show discontinuity"] | [e.g., "Add annotation"]|

_Example:_

| Affected Item              | Type       | Impact                              | Action Needed           |
|----------------------------|------------|-------------------------------------|-------------------------|
| Growth funnel dashboard    | Dashboard  | Conversion rate chart changes       | Update Looker SQL       |
| Q1 2026 OKR target (32%)  | Target     | No longer comparable; was set at 14d| Recalibrate to ~40%     |
| Weekly exec report         | Report     | Historical trend shows discontinuity| Add annotation at change|
| Metric definition doc      | Doc        | Must be updated                     | Update formula + params |
| Board deck (Q4 results)    | Report     | Historical numbers differ from new  | Footnote in deck        |

---

## 6. Historical Data Treatment

**Backfill historical data?** [Yes / No]
**Backfill feasible?** [Yes / No - explain]
**Backfill period:** [e.g., "Last 12 months" or "Not applicable"]
**Transition plan:** [How to handle the switch]

_Example:_
**Backfill historical data?** Yes
**Backfill feasible?** Yes - all required data exists in the warehouse
**Backfill period:** Last 18 months (Jul 2024 - present)
**Transition plan:**
1. Compute both old and new metric in parallel for 1 month
2. Backfill historical new metric values
3. Update all dashboards and reports to new definition
4. Add annotation markers at the change date on all charts
5. Archive old metric definition (keep queryable but not displayed)

---

## 7. Implementation Plan

| Step                                    | Owner      | Target Date | Status      |
|-----------------------------------------|------------|-------------|-------------|
| [e.g., "Submit change request"]        | [Name]     | [Date]      | [Status]    |
| [e.g., "Review by metric council"]     | [Name]     | [Date]      | [Status]    |
| [e.g., "Update SQL/dbt models"]        | [Name]     | [Date]      | [Status]    |
| [e.g., "Backfill historical data"]     | [Name]     | [Date]      | [Status]    |
| [e.g., "Update dashboards"]            | [Name]     | [Date]      | [Status]    |
| [e.g., "Notify stakeholders"]          | [Name]     | [Date]      | [Status]    |

_Example:_

| Step                            | Owner       | Target     | Status      |
|---------------------------------|-------------|------------|-------------|
| Submit change request           | Sarah Kim   | 2026-03-06 | Done        |
| Review by data team             | Tom Lee     | 2026-03-10 | In Review   |
| Stakeholder notification        | Sarah Kim   | 2026-03-12 | Not Started |
| Update dbt model                | Dev Patel   | 2026-03-15 | Not Started |
| Backfill 18 months              | Dev Patel   | 2026-03-17 | Not Started |
| Update Looker dashboards        | Tom Lee     | 2026-03-18 | Not Started |
| Recalibrate Q1 target           | Sarah Kim   | 2026-03-18 | Not Started |
| Update metric definition doc    | Sarah Kim   | 2026-03-18 | Not Started |
| Parallel run validation         | Sarah Kim   | 2026-03-20 | Not Started |

---

## 8. Approval

| Role                | Name   | Date   | Decision              | Notes                      |
|---------------------|--------|--------|-----------------------|----------------------------|
| Requestor           |        |        | Submitted             |                            |
| Metric Owner        |        |        | Pending / Approved    |                            |
| Data Lead           |        |        | Pending / Approved    |                            |
| Key Stakeholder     |        |        | Pending / Approved    | [Who this metric most affects]|

**Final Decision:** [Approved / Approved with Modifications / Rejected]
**Decision Date:** [YYYY-MM-DD]
**Decision Notes:** [Any conditions or modifications]
