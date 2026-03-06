# Experiment Brief

> Use this template to propose and scope an experiment before design begins.
> All fields marked [REQUIRED] must be completed before the experiment enters the backlog.

---

## 1. Experiment Title [REQUIRED]

**Title:** [Clear, descriptive name]
**ID:** [EXP-YYYY-NNN, e.g., EXP-2026-014]
**Requestor:** [Name, Team]
**Date Submitted:** [YYYY-MM-DD]

_Example:_
**Title:** Simplified Pricing Page - 3-Tier vs 4-Tier Layout
**ID:** EXP-2026-014
**Requestor:** Alex Rivera, Growth
**Date Submitted:** 2026-03-06

---

## 2. Hypothesis [REQUIRED]

State your hypothesis in the format: "If we [change], then [outcome], because [rationale]."

**Hypothesis:**
If we [describe the change you want to make],
then [describe the expected measurable outcome],
because [explain the reasoning or evidence behind this belief].

_Example:_
**Hypothesis:**
If we simplify the pricing page from 4 tiers to 3 tiers,
then the plan selection rate will increase by 8% or more,
then because user research shows 62% of visitors find the current layout confusing and exit without selecting.

---

## 3. Primary Metric [REQUIRED]

The single metric that determines success or failure of this experiment.

**Metric Name:** [e.g., "Plan selection rate"]
**Definition:** [Exact formula, e.g., "Users who click 'Choose Plan' / Users who view pricing page"]
**Current Baseline:** [Current value with date range, e.g., "23.4% (Jan-Feb 2026)"]
**Minimum Detectable Effect (MDE):** [Smallest meaningful change, e.g., "+2 percentage points"]

_Example:_
**Metric Name:** Plan selection rate
**Definition:** Unique users clicking any "Choose Plan" CTA / Unique pricing page visitors (per session)
**Current Baseline:** 23.4% (Jan 1 - Feb 28, 2026; n=14,200 sessions)
**Minimum Detectable Effect (MDE):** +2 percentage points (to 25.4%)

---

## 4. Secondary and Guardrail Metrics

| Type       | Metric                    | Definition                                  | Acceptable Range         |
|------------|---------------------------|---------------------------------------------|--------------------------|
| Secondary  | [e.g., "Checkout start rate"]| [e.g., "Users starting checkout / visitors"]| [e.g., "No decrease"]  |
| Secondary  | [e.g., "Revenue per visitor"]| [e.g., "Total revenue / pricing visitors"]  | [e.g., "+5% or neutral"]|
| Guardrail  | [e.g., "Support tickets"]   | [e.g., "Pricing-related tickets / day"]     | [e.g., "No increase >10%"]|
| Guardrail  | [e.g., "Page load time"]    | [e.g., "p95 load time in ms"]               | [e.g., "<3000ms"]       |

_Example:_

| Type       | Metric                    | Definition                                  | Acceptable Range         |
|------------|---------------------------|---------------------------------------------|--------------------------|
| Secondary  | Checkout start rate        | Users entering checkout / pricing visitors   | No decrease              |
| Secondary  | Revenue per visitor        | Total revenue / pricing page unique visitors | Neutral or positive      |
| Guardrail  | Pricing support tickets    | Pricing-tagged tickets per day               | No increase >10%         |
| Guardrail  | Page load time             | p95 load time for pricing page               | Must stay under 2500ms   |

---

## 5. Target Audience [REQUIRED]

**Who is included:**
- [Segment definition, e.g., "All website visitors on /pricing page"]
- [Additional filters, e.g., "New visitors only (no existing customers)"]

**Who is excluded:**
- [e.g., "Internal employees (filtered by IP or email domain)"]
- [e.g., "Enterprise leads routed to sales (identified by company size)"]

**Estimated weekly traffic:** [e.g., "~3,500 unique visitors per week"]

---

## 6. Experiment Design

**Type:** [A/B / A/B/C / Multivariate / Holdout / Switchback]
**Allocation:** [e.g., "50/50 split" or "33/33/33"]
**Randomization Unit:** [e.g., "User ID" or "Session" or "Company"]
**Assignment Method:** [e.g., "Feature flag via LaunchDarkly" or "Server-side split"]

**Variants:**
| Variant   | Description                                    |
|-----------|------------------------------------------------|
| Control   | [Current experience, e.g., "4-tier pricing page"]|
| Treatment | [Changed experience, e.g., "3-tier pricing page with merged Starter+Basic"]|

---

## 7. Duration and Sample Size [REQUIRED]

**Required sample size per variant:** [Calculate using your MDE, baseline, and power]
**Statistical power:** [e.g., "80%"]
**Significance level:** [e.g., "95% (alpha = 0.05)"]
**Estimated duration:** [e.g., "3 weeks based on ~3,500 visitors/week"]
**Minimum run time:** [e.g., "2 full business weeks to capture weekly cycles"]

_Example:_
**Required sample size per variant:** 4,800 visitors
**Statistical power:** 80%
**Significance level:** 95% (alpha = 0.05)
**Estimated duration:** 3 weeks (based on ~3,500 visitors/week, 50/50 split)
**Minimum run time:** 2 full weeks to capture day-of-week effects

---

## 8. Success Criteria [REQUIRED]

This experiment will be declared a **winner** if:
- [ ] [e.g., "Primary metric improves by >= MDE with 95% confidence"]
- [ ] [e.g., "No guardrail metric is violated"]
- [ ] [e.g., "Effect is consistent across key segments (mobile/desktop)"]

This experiment will be **killed early** if:
- [ ] [e.g., "Guardrail metric degrades by >15% for 3+ consecutive days"]
- [ ] [e.g., "Critical bug is detected in treatment variant"]

---

## 9. Risks and Dependencies

| Risk / Dependency                          | Likelihood | Impact | Mitigation                        |
|--------------------------------------------|-----------|--------|-----------------------------------|
| [e.g., "Low traffic delays results"]      | [H/M/L]   | [H/M/L]| [e.g., "Extend duration"]        |
| [e.g., "Feature flag latency affects UX"] | [H/M/L]   | [H/M/L]| [e.g., "Test p95 in staging"]    |

---

## 10. Pre-Launch Checklist

- [ ] Hypothesis reviewed by team
- [ ] Sample size calculation validated
- [ ] Tracking events confirmed in staging
- [ ] QA completed on all variants
- [ ] Monitoring dashboard set up
- [ ] Kill criteria agreed upon
- [ ] Analysis plan documented

---

## Approval

| Role            | Name | Date | Status             |
|-----------------|------|------|--------------------|
| Experiment Lead |      |      | Pending / Approved |
| Data Analyst    |      |      | Pending / Approved |
| Product Owner   |      |      | Pending / Approved |
