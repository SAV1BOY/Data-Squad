# Retention Diagnostic Audit

> Use this template to diagnose retention issues and identify improvement opportunities.
> Retention is the compound growth lever - small improvements yield outsized long-term impact.

---

## 1. Audit Overview

**Product / Segment:** [What is being audited]
**Auditor:** [Name, Team]
**Date:** [YYYY-MM-DD]
**Time Period:** [e.g., "Cohorts from Jul 2025 - Dec 2025, tracked through Feb 2026"]
**Population:** [Who is included]

_Example:_
**Product / Segment:** SaaS Platform - Self-Serve Customers (Starter + Pro plans)
**Auditor:** Sarah Kim, Product Analytics
**Date:** 2026-03-06
**Time Period:** Cohorts from Jul 2025 through Dec 2025, tracked through Feb 2026
**Population:** 9,240 self-serve paid customers; excludes enterprise, free, and internal accounts

---

## 2. Retention Definition [REQUIRED]

**Retained User:** [Definition, e.g., "User performed 1+ core action in the period"]
**Core Action(s):** [e.g., "Create, edit, or share a project"]
**Measurement Cadence:** [Daily / Weekly / Monthly]
**Retention Type:** [User-level / Account-level / Revenue-based]

_Example:_
**Retained User:** Account with 1+ active user performing a core action in the calendar month
**Core Action(s):** Create project, edit project, share project, or invite team member
**Measurement Cadence:** Monthly (M0 = first paid month)
**Retention Type:** Account-level (at least one user on the account is active)

---

## 3. Overall Retention Curve [REQUIRED]

| Period | Retention Rate | MoM Change | Benchmark    | Status           |
|--------|---------------|------------|--------------|------------------|
| M0     | [%]           | --         | [%]          | [On/Below/Above] |
| M1     | [%]           | [-pp]      | [%]          | [On/Below/Above] |
| M2     | [%]           | [-pp]      | [%]          | [On/Below/Above] |
| M3     | [%]           | [-pp]      | [%]          | [On/Below/Above] |
| M6     | [%]           | [-pp]      | [%]          | [On/Below/Above] |
| M12    | [%]           | [-pp]      | [%]          | [On/Below/Above] |

_Example:_

| Period | Retention | MoM Change | SaaS Benchmark | Status |
|--------|-----------|------------|----------------|--------|
| M0     | 100%      | --         | 100%           | --     |
| M1     | 72%       | -28pp      | 75%            | Below  |
| M2     | 58%       | -14pp      | 62%            | Below  |
| M3     | 50%       | -8pp       | 55%            | Below  |
| M6     | 38%       | -12pp      | 45%            | Below  |
| M12    | 29%       | -9pp       | 35%            | Below  |

**Flattening Point:** [Where does the curve begin to flatten, e.g., "M8-M9"]
**Steady-State Retention:** [Long-term monthly retention, e.g., "~96% month-over-month after M12"]

---

## 4. Retention by Segment

### By Plan Type

| Plan     | M1    | M3    | M6    | M12   | Notes                          |
|----------|-------|-------|-------|-------|--------------------------------|
| [Plan 1] | [%]  | [%]   | [%]   | [%]   | [Notes]                        |
| [Plan 2] | [%]  | [%]   | [%]   | [%]   | [Notes]                        |

_Example:_

| Plan     | M1   | M3   | M6   | M12  | Notes                                |
|----------|------|------|------|------|--------------------------------------|
| Starter  | 64%  | 40%  | 28%  | 18%  | Significant churn; low engagement    |
| Pro      | 78%  | 62%  | 48%  | 38%  | Closer to benchmarks                 |

### By Acquisition Channel

| Channel    | M1   | M3   | M6   | Volume | Notes                        |
|------------|------|------|------|--------|------------------------------|
| [Channel]  | [%]  | [%]  | [%]  | [#]    | [Notes]                      |

_Example:_

| Channel      | M1   | M3   | M6   | Volume | Notes                          |
|--------------|------|------|------|--------|--------------------------------|
| Organic      | 76%  | 56%  | 42%  | 3,800  | Baseline quality               |
| Referral     | 82%  | 65%  | 52%  | 1,200  | Highest retention              |
| Paid search  | 68%  | 44%  | 32%  | 2,600  | Below average                  |
| Paid social  | 58%  | 34%  | 22%  | 1,640  | Worst performing               |

---

## 5. Churn Analysis [REQUIRED]

### 5a. When Do Users Churn?

| Churn Window    | % of Total Churn | Cumulative | Notes                     |
|-----------------|------------------|------------|---------------------------|
| [e.g., "M0-M1"]| [%]             | [%]        | [Notes]                   |
| [e.g., "M1-M3"]| [%]             | [%]        | [Notes]                   |

_Example:_

| Churn Window | % of Total Churn | Cumulative | Notes                            |
|--------------|------------------|------------|----------------------------------|
| M0-M1        | 42%              | 42%        | Early churn - activation failure |
| M1-M3        | 28%              | 70%        | Value realization gap            |
| M3-M6        | 16%              | 86%        | Habit formation failure          |
| M6-M12       | 10%              | 96%        | Budget / org changes             |
| M12+         | 4%               | 100%       | Rare - usually external factors  |

### 5b. Why Do Users Churn?

| Churn Reason                        | % of Churned Users | Data Source              |
|-------------------------------------|--------------------|-----------------------------|
| [e.g., "Didn't find value"]       | [%]                | [e.g., "Cancel survey"]   |
| [e.g., "Too expensive"]           | [%]                | [e.g., "Cancel survey"]   |
| [e.g., "Switched to competitor"]  | [%]                | [e.g., "Cancel survey"]   |

_Example:_

| Churn Reason               | % of Churned | Source          | Window        |
|----------------------------|-------------|-----------------|---------------|
| Didn't understand value    | 34%         | Cancel survey   | Mostly M0-M1  |
| Too expensive for usage    | 22%         | Cancel survey   | Mostly M1-M3  |
| Missing key feature        | 18%         | Cancel survey   | M3-M6         |
| Switched to competitor     | 12%         | Cancel survey   | M3+           |
| Project/need ended         | 8%          | Cancel survey   | M6+           |
| No response / unknown      | 6%          | No survey       | All windows   |

---

## 6. Retention Drivers (Predictive Signals)

Which behaviors predict higher retention?

| Behavior                          | Users With | M3 Retention With | M3 Retention Without | Lift   |
|-----------------------------------|-----------|--------------------|-----------------------|--------|
| [e.g., "Used 3+ features in M0"]| [%]       | [%]               | [%]                   | [+pp]  |
| [e.g., "Invited team in M0"]    | [%]       | [%]               | [%]                   | [+pp]  |

_Example:_

| Behavior                        | % of Users | M3 With | M3 Without | Lift   |
|---------------------------------|-----------|---------|------------|--------|
| Used 3+ features in M0         | 38%       | 72%     | 37%        | +35pp  |
| Invited 1+ team member in M0   | 44%       | 68%     | 36%        | +32pp  |
| Logged in 5+ days in M0        | 32%       | 74%     | 39%        | +35pp  |
| Created 2+ projects in M0      | 28%       | 70%     | 41%        | +29pp  |
| Used API integration            | 15%       | 82%     | 46%        | +36pp  |

---

## 7. Findings [REQUIRED]

**[Critical] Finding 1:** [Title and description with data]
**[High] Finding 2:** [Title and description with data]
**[Medium] Finding 3:** [Title and description with data]

_Example:_
**[Critical] Finding 1: 42% of all churn happens in the first month**
Early churn driven by activation failure accounts for the largest share. Users who do not complete onboarding have only 18% M3 retention vs 62% for those who do.

**[High] Finding 2: Feature breadth is the strongest retention predictor**
Users who adopt 3+ features in M0 retain at 72% at M3 vs 37% for those who do not. Current onboarding does not drive multi-feature discovery.

**[High] Finding 3: Paid social acquisition drives the worst retention**
Paid social M6 retention (22%) is less than half of referral (52%). The cost per retained user from paid social is 4.2x organic.

---

## 8. Recommendations

| # | Recommendation                                 | Finding | Est. Impact        | Effort | Priority |
|---|-----------------------------------------------|---------|---------------------|--------|----------|
| 1 | [Action]                                       | [F#]    | [Impact]            | [S/M/L]| [P0/P1] |
| 2 | [Action]                                       | [F#]    | [Impact]            | [S/M/L]| [P0/P1] |

_Example:_

| # | Recommendation                              | Finding | Est. Impact       | Effort | Priority |
|---|---------------------------------------------|---------|-------------------|--------|----------|
| 1 | Redesign onboarding for multi-feature discovery | F1, F2 | +5pp M3 retention | M   | P0       |
| 2 | Build M0 team invitation nudge campaign      | F2      | +3pp M3 retention | S      | P0       |
| 3 | Reallocate 30% of paid social to referral program | F3  | +2pp blended M6   | S      | P1       |
| 4 | Create "day 3" re-engagement automation      | F1      | +2pp M1 retention | S      | P1       |

---

## 9. Next Steps

- [ ] [e.g., "Present findings to Product + Growth leadership"]
- [ ] [e.g., "Design retention improvement experiments"]
- [ ] [e.g., "Set up automated retention monitoring"]
- [ ] [e.g., "Re-audit in Q3"]

---

## Appendix

**Data Sources:** [Tables used]
**Methodology Notes:** [Statistical details, assumptions]
**Query / Notebook:** [Link]
