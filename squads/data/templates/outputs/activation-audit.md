# Activation Funnel Audit

> Use this template to audit the activation funnel - the journey from signup to first value.
> The goal is to identify where users fail to activate and prioritize improvements.

---

## 1. Audit Overview

**Product / Feature:** [What is being audited]
**Auditor:** [Name, Team]
**Date:** [YYYY-MM-DD]
**Time Period Analyzed:** [e.g., "Last 90 days (Dec 2025 - Feb 2026)"]
**Population:** [Who is included, e.g., "All self-serve signups"]

_Example:_
**Product / Feature:** SaaS Platform Self-Serve Activation Funnel
**Auditor:** Sarah Kim, Product Analytics
**Date:** 2026-03-06
**Time Period Analyzed:** Dec 1, 2025 - Feb 28, 2026 (90 days)
**Population:** All self-serve signups (n=8,420); excludes enterprise, internal, bots

---

## 2. Activation Definition [REQUIRED]

**Activation Event:** [What action defines an "activated" user]
**Activation Window:** [Time limit from signup, e.g., "Within 7 days of signup"]
**Current Activation Rate:** [% with date range]
**Target Activation Rate:** [%]

_Example:_
**Activation Event:** User completes their first project AND invites at least 1 team member
**Activation Window:** Within 7 days of signup
**Current Activation Rate:** 28.4% (Dec-Feb 2026, n=8,420)
**Target Activation Rate:** 38% by end of Q3 2026

---

## 3. Funnel Steps and Drop-Off [REQUIRED]

| Step # | Step Name                 | Users Entering | Users Completing | Step Conv. Rate | Cumulative Rate | Drop-Off |
|--------|---------------------------|---------------|------------------|-----------------|-----------------|----------|
| 0      | [e.g., "Signup"]         | [#]           | [#]              | [%]             | 100%            | [%]      |
| 1      | [e.g., "Email verified"] | [#]           | [#]              | [%]             | [%]             | [%]      |
| 2      | [e.g., "Profile complete"]| [#]          | [#]              | [%]             | [%]             | [%]      |
| 3      | [e.g., "First action"]   | [#]           | [#]              | [%]             | [%]             | [%]      |
| 4      | [e.g., "Activated"]      | [#]           | [#]              | [%]             | [%]             | [%]      |

_Example:_

| Step # | Step Name              | Entering | Completing | Step Conv | Cumulative | Drop-Off |
|--------|------------------------|----------|------------|-----------|------------|----------|
| 0      | Signup completed       | 8,420    | 8,420      | 100%      | 100%       | --       |
| 1      | Email verified         | 8,420    | 7,156      | 85.0%     | 85.0%      | 15.0%    |
| 2      | Onboarding started     | 7,156    | 5,725      | 80.0%     | 68.0%      | 17.0%    |
| 3      | Onboarding completed   | 5,725    | 3,892      | 68.0%     | 46.2%      | 21.8%    |
| 4      | First project created  | 3,892    | 3,114      | 80.0%     | 37.0%      | 9.2%     |
| 5      | Team member invited    | 3,114    | 2,391      | 76.8%     | 28.4%      | 8.6%     |

**Biggest Drop-Off:** [Step name and magnitude]
_Example:_ Step 2->3 (Onboarding started to completed): 32% drop-off, losing 1,833 users

---

## 4. Time-to-Activation Analysis

| Percentile | Time to Activate       | Notes                                    |
|------------|------------------------|------------------------------------------|
| p25        | [e.g., "0.5 days"]   | [e.g., "Fastest quartile, same-day"]   |
| p50        | [e.g., "1.8 days"]   | [e.g., "Median"]                       |
| p75        | [e.g., "4.2 days"]   | [e.g., "Risk of never activating"]     |
| p90        | [e.g., "6.8 days"]   | [e.g., "Close to window limit"]        |

**Insight:** [What does the time distribution tell you?]

_Example:_
**Insight:** 62% of users who activate do so within 2 days. Users who have not activated by day 3 have only a 12% chance of ever activating. This suggests interventions must happen within 48 hours to be effective.

---

## 5. Segment Analysis

| Segment              | Signup Volume | Activation Rate | vs Overall | Notes                    |
|----------------------|--------------|-----------------|------------|--------------------------|
| [e.g., "Organic"]  | [#]          | [%]             | [+/- pp]   | [Notes]                  |
| [e.g., "Paid"]     | [#]          | [%]             | [+/- pp]   | [Notes]                  |
| [e.g., "Referral"] | [#]          | [%]             | [+/- pp]   | [Notes]                  |

_Example:_

| Segment          | Volume | Activation Rate | vs Overall | Notes                       |
|------------------|--------|-----------------|------------|-----------------------------|
| Organic search   | 3,200  | 32.1%           | +3.7pp     | Highest intent              |
| Referral         | 1,100  | 38.4%           | +10.0pp    | Best performing channel     |
| Paid social      | 2,400  | 21.2%           | -7.2pp     | Low intent traffic          |
| Direct           | 1,720  | 28.8%           | +0.4pp     | Close to average            |

---

## 6. Findings [REQUIRED]

Number each finding with severity (Critical / High / Medium / Low).

**[Critical] Finding 1:** [Title]
[Description with supporting data]

**[High] Finding 2:** [Title]
[Description with supporting data]

**[Medium] Finding 3:** [Title]
[Description with supporting data]

_Example:_

**[Critical] Finding 1: Onboarding completion is the primary bottleneck**
Only 68% of users who start onboarding complete it, accounting for the largest absolute drop (1,833 users lost). Exit survey data shows "too many steps" (38%) and "unclear value" (29%) as top reasons.

**[High] Finding 2: Email verification creates unnecessary friction**
15% of signups never verify their email. Of those, 60% never return. Delayed verification or magic-link login could recover ~760 users/quarter.

**[High] Finding 3: Paid social signups underperform significantly**
Paid social activation (21.2%) is 7.2pp below average and 17.2pp below referral. At current spend, the cost-per-activated-user from paid social is 2.8x higher than organic.

---

## 7. Recommendations

| # | Recommendation                                  | Finding | Est. Impact          | Effort | Priority |
|---|------------------------------------------------|---------|----------------------|--------|----------|
| 1 | [e.g., "Simplify onboarding to 3 steps"]      | F1      | [e.g., "+5pp activation"]| [S/M/L]| [P0]   |
| 2 | [e.g., "Implement magic-link auth"]            | F2      | [e.g., "+2pp activation"]| [S/M/L]| [P1]   |

_Example:_

| # | Recommendation                              | Finding | Est. Impact       | Effort | Priority |
|---|---------------------------------------------|---------|-------------------|--------|----------|
| 1 | Simplify onboarding from 6 to 3 steps      | F1      | +5-8pp activation | M      | P0       |
| 2 | Add magic-link email verification           | F2      | +2-3pp activation | S      | P0       |
| 3 | Build day-1 engagement nudge (email + in-app)| F1     | +2pp activation   | S      | P1       |
| 4 | Review paid social targeting and messaging  | F3      | -30% wasted spend | S      | P1       |
| 5 | A/B test showing immediate value before onboarding | F1 | +3pp activation | M     | P1       |

---

## 8. Next Steps

- [ ] [e.g., "Share findings with Product and Growth (Mar 10)"]
- [ ] [e.g., "Design onboarding simplification experiment (Mar 15)"]
- [ ] [e.g., "Set up weekly activation monitoring dashboard"]
- [ ] [e.g., "Re-audit in Q3 to measure improvement"]

---

## Appendix

**Data Sources:** [Tables/tools used]
**Query / Notebook:** [Link]
**Related Documents:** [Links to experiment briefs, prior audits, etc.]
