# Experiment One-Pager

> A single-page experiment design document. Keep it concise.
> This should be reviewable in under 3 minutes.

---

## Experiment: [Title]

**ID:** [EXP-YYYY-NNN]
**Owner:** [Name, Team]
**Date:** [YYYY-MM-DD]
**Status:** [Proposed / Approved / Running / Complete / Killed]

---

## Hypothesis

If we [change],
then [metric] will [improve/decrease] by [amount],
because [evidence-based reasoning].

_Example:_
If we add a progress bar to the onboarding wizard,
then the completion rate will increase by 5+ percentage points,
because UX research shows progress indicators reduce abandonment in multi-step flows (Nielson Norman Group) and our exit surveys cite "not knowing how long it takes" as the #2 reason for quitting.

---

## Design

| Element            | Detail                                                      |
|--------------------|--------------------------------------------------------------|
| Type               | [A/B / A/B/C / Multivariate]                                |
| Variants           | **Control:** [Current experience] / **Treatment:** [Changed experience] |
| Audience           | [Who is included, e.g., "New users on web, first onboarding attempt"] |
| Exclusions         | [Who is excluded, e.g., "Mobile, returning users, enterprise"] |
| Split              | [e.g., "50/50"]                                              |
| Unit               | [e.g., "User ID"]                                            |
| Assignment         | [e.g., "LaunchDarkly feature flag"]                          |

_Example:_

| Element    | Detail                                                              |
|------------|----------------------------------------------------------------------|
| Type       | A/B test                                                             |
| Variants   | **Control:** Current wizard (no progress indicator) / **Treatment:** Wizard with step progress bar (e.g., "Step 2 of 5") |
| Audience   | New users on web, first onboarding attempt, all plan types           |
| Exclusions | Mobile app users, returning users, internal accounts                 |
| Split      | 50/50                                                                |
| Unit       | User ID (sticky assignment)                                          |
| Assignment | LaunchDarkly flag: `exp_onboarding_progress_bar`                    |

---

## Metrics

| Type       | Metric                        | Baseline | MDE / Target      |
|------------|-------------------------------|----------|--------------------|
| Primary    | [e.g., "Wizard completion rate"]| [e.g., "68%"]| [e.g., "+5pp"]|
| Secondary  | [e.g., "Time to complete"]    | [e.g., "4.2 min"]| [e.g., "-30sec"]|
| Guardrail  | [e.g., "Step skip rate"]      | [e.g., "12%"]| [e.g., "No increase >5pp"]|

_Example:_

| Type       | Metric                  | Baseline  | MDE / Target        |
|------------|-------------------------|-----------|----------------------|
| Primary    | Wizard completion rate   | 68%       | +5pp (to 73%)        |
| Secondary  | Avg time to complete     | 4.2 min   | Decrease or neutral   |
| Secondary  | Activation rate (7-day)  | 42%       | Increase or neutral   |
| Guardrail  | Step skip rate           | 12%       | No increase >5pp      |
| Guardrail  | Page load time (p95)     | 1.8s      | No increase >500ms    |

---

## Duration and Power

**Sample size needed:** [per variant]
**Weekly eligible traffic:** [estimate]
**Expected duration:** [weeks]
**Power:** [e.g., "80%"] at **Alpha:** [e.g., "0.05"]
**Min run time:** [e.g., "2 full weeks for day-of-week coverage"]

_Example:_
**Sample size needed:** 3,200 per variant
**Weekly eligible traffic:** ~2,100 new users
**Expected duration:** 3 weeks (to reach 3,200 per arm)
**Power:** 80% at **Alpha:** 0.05 (two-tailed)
**Min run time:** 2 full weeks to capture weekday/weekend patterns

---

## Kill Criteria

Stop this experiment early if:
- [ ] [e.g., "Primary metric degrades >5pp for 5+ consecutive days"]
- [ ] [e.g., "Any guardrail metric breaches threshold"]
- [ ] [e.g., "Bug or UX issue detected in treatment"]

---

## Risks

| Risk                                   | Likelihood | Mitigation                        |
|----------------------------------------|-----------|-----------------------------------|
| [e.g., "Low traffic extends timeline"]| [M]       | [e.g., "Extend or reduce MDE"]  |
| [e.g., "Novelty effect inflates early results"]| [M]| [e.g., "Min 2-week run time"] |

---

## Decision Framework

| Outcome                                | Decision                                  |
|----------------------------------------|-------------------------------------------|
| Primary metric >= MDE, no guardrails breached | Ship treatment to 100%              |
| Primary metric positive but < MDE      | Iterate on treatment, re-test             |
| Primary metric flat or negative        | Keep control, archive learnings           |
| Guardrail breached                     | Kill treatment, investigate               |

---

## Pre-Launch Checklist

- [ ] Hypothesis peer-reviewed
- [ ] Sample size validated
- [ ] Events verified in staging
- [ ] Feature flag tested (both variants)
- [ ] Monitoring dashboard live
- [ ] Analysis plan agreed
- [ ] Kill criteria documented

---

## Approvals

| Role          | Name | Date | Go / No-Go |
|---------------|------|------|-------------|
| Experiment Owner |   |      |             |
| Data Analyst  |      |      |             |
| Product Owner |      |      |             |
