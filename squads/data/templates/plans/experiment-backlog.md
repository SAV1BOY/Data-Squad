# Experiment Backlog

> Use this template to maintain a prioritized backlog of experiments.
> Review and re-prioritize at least monthly. Each experiment should have
> a clear hypothesis before entering the backlog.

---

## Backlog Overview

**Owner:** [Name, Team]
**Last Updated:** [YYYY-MM-DD]
**Review Cadence:** [e.g., "Monthly, first Monday"]
**Active Experiment Limit:** [e.g., "3 concurrent experiments max"]
**Current Active Experiments:** [#]

_Example:_
**Owner:** Marcus Chen, Growth
**Last Updated:** 2026-03-06
**Review Cadence:** Monthly (first Monday)
**Active Experiment Limit:** 3 concurrent
**Current Active Experiments:** 2

---

## Prioritization Framework

Experiments are scored on four dimensions (each 1-5):

| Dimension    | Description                                    | Weight |
|--------------|------------------------------------------------|--------|
| Impact       | Expected magnitude of metric improvement       | 40%    |
| Confidence   | Strength of evidence supporting the hypothesis | 25%    |
| Ease         | Implementation effort (5 = easiest)            | 20%    |
| Reach        | Percentage of users affected                   | 15%    |

**Priority Score = (Impact x 0.4) + (Confidence x 0.25) + (Ease x 0.2) + (Reach x 0.15)**

---

## Currently Running [REQUIRED]

| ID          | Experiment                      | Start Date | Est. End   | Primary Metric        | Status      |
|-------------|--------------------------------|------------|------------|-----------------------|-------------|
| [EXP-###]   | [Title]                        | [Date]     | [Date]     | [Metric]              | [Status]    |

_Example:_

| ID          | Experiment                  | Start     | Est. End   | Primary Metric       | Status        |
|-------------|-----------------------------|-----------|------------|----------------------|---------------|
| EXP-2026-014| Pricing page 3-tier layout  | 2026-02-17| 2026-03-10 | Plan selection rate   | Day 17/21     |
| EXP-2026-015| Welcome email sequence v2   | 2026-02-24| 2026-03-10 | 7-day activation rate | Day 10/14     |

---

## Up Next (Prioritized) [REQUIRED]

| Rank | ID          | Experiment Title                    | Hypothesis (abbreviated)                           | Primary Metric         | Impact | Conf | Ease | Reach | Score | Target Start |
|------|-------------|-------------------------------------|-----------------------------------------------------|------------------------|--------|------|------|-------|-------|-------------|
| 1    | [EXP-###]   | [Title]                             | [If X, then Y, because Z]                          | [Metric]               | [1-5]  | [1-5]| [1-5]| [1-5] | [#.#] | [Date]      |
| 2    | [EXP-###]   | [Title]                             | [If X, then Y, because Z]                          | [Metric]               | [1-5]  | [1-5]| [1-5]| [1-5] | [#.#] | [Date]      |

_Example:_

| Rank | ID          | Experiment                          | Hypothesis                                          | Metric              | I | C | E | R | Score | Start       |
|------|-------------|-------------------------------------|------------------------------------------------------|---------------------|---|---|---|---|-------|-------------|
| 1    | EXP-2026-016| Simplified onboarding (3 steps)     | Fewer steps will increase completion by 8pp because current 6-step wizard has 32% abandonment | Completion rate | 5 | 4 | 3 | 5 | 4.35 | 2026-03-10 |
| 2    | EXP-2026-017| Day-1 value preview before signup   | Showing product value pre-signup will increase signup rate by 15% because visitors lack clarity on what they get | Signup rate | 4 | 3 | 3 | 5 | 3.70 | 2026-03-17 |
| 3    | EXP-2026-018| In-app referral prompt at milestone | Prompting referral after first success will increase referrals 2x because users are most enthusiastic at achievement moments | Referral send rate | 4 | 3 | 4 | 3 | 3.55 | 2026-03-24 |
| 4    | EXP-2026-019| Annual plan discount at M3          | Offering 20% annual discount at month 3 will increase annual conversion by 10pp because M3 is the habit formation point | Annual plan conversion | 4 | 3 | 4 | 2 | 3.40 | 2026-04-01 |
| 5    | EXP-2026-020| Personalized dashboard defaults     | Role-based defaults will increase W1 engagement by 20% because users currently see empty/generic dashboards | W1 DAU | 3 | 2 | 2 | 4 | 2.70 | 2026-04-07 |

---

## Icebox (Not Yet Prioritized)

Experiments that need more research, data, or refinement before prioritization.

| ID          | Experiment Title                    | Hypothesis (draft)                              | Blocker / Needs              | Added Date |
|-------------|-------------------------------------|-------------------------------------------------|------------------------------|------------|
| [EXP-###]   | [Title]                             | [Draft hypothesis]                              | [What's needed to prioritize]| [Date]     |

_Example:_

| ID          | Experiment                       | Hypothesis (draft)                                | Blocker / Needs                | Added     |
|-------------|----------------------------------|---------------------------------------------------|--------------------------------|-----------|
| EXP-2026-021| AI-powered onboarding            | AI recommendations during setup will improve activation | Needs eng feasibility review | 2026-02-10|
| EXP-2026-022| Freemium tier introduction       | Free tier will increase top-of-funnel 3x          | Needs business case from Finance| 2026-01-20|
| EXP-2026-023| Gamified feature discovery       | Achievement badges will increase feature breadth  | Needs user research validation | 2026-02-25|

---

## Completed Experiments (Recent) [REQUIRED]

| ID          | Experiment                      | Result      | Primary Metric Impact | Shipped? | Completed  |
|-------------|--------------------------------|-------------|----------------------|----------|------------|
| [EXP-###]   | [Title]                        | [Winner/No Winner/Killed]| [Impact]     | [Yes/No] | [Date]     |

_Example:_

| ID          | Experiment                  | Result    | Impact            | Shipped? | Completed  |
|-------------|----------------------------|-----------|-------------------|----------|------------|
| EXP-2026-014| Onboarding progress bar    | Winner    | +6.3pp completion | Yes      | 2026-03-03 |
| EXP-2026-013| Landing page testimonials  | No Winner | +0.2pp (NS)      | No       | 2026-02-20 |
| EXP-2026-012| Checkout urgency timer     | Killed    | -2.1pp (negative) | No       | 2026-02-10 |
| EXP-2026-011| One-click Google signup    | Winner    | +12% signups      | Yes      | 2026-01-28 |

---

## Experiment Program Metrics

| Metric                        | This Quarter | Prior Quarter | Target   |
|-------------------------------|-------------|---------------|----------|
| Experiments launched          | [#]         | [#]           | [#]      |
| Experiments completed         | [#]         | [#]           | [#]      |
| Win rate                      | [%]         | [%]           | [%]      |
| Avg experiment duration       | [days]      | [days]        | [days]   |
| Estimated revenue from winners| [$]         | [$]           | [$]      |

_Example:_

| Metric                        | Q1 2026 (to date) | Q4 2025 | Target  |
|-------------------------------|-------------------|---------|---------|
| Experiments launched          | 4                 | 8       | 10/Q    |
| Experiments completed         | 3                 | 7       | 8/Q     |
| Win rate                      | 33%               | 43%     | 35%     |
| Avg experiment duration       | 18 days           | 16 days | <21 days|
| Estimated revenue from winners| $53K ARR          | $120K ARR| $100K/Q|

---

## Backlog Review Log

| Date       | Reviewer    | Changes Made                                     |
|------------|-------------|--------------------------------------------------|
| [Date]     | [Name]      | [e.g., "Re-prioritized: moved EXP-016 to #1"]  |
| [Date]     | [Name]      | [e.g., "Added EXP-020, archived EXP-009"]      |

---

## How to Submit an Experiment Idea

1. Write a hypothesis: "If we [change], then [metric] will [improve] by [amount], because [evidence]"
2. Identify the primary metric and current baseline
3. Add to the Icebox section above or submit via [intake form / Slack channel / etc.]
4. Ideas are reviewed and prioritized during the monthly backlog review
