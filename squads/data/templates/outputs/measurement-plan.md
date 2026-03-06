# Measurement Plan

> This template combines the Digital Marketing & Measurement Model (DMMM),
> See-Think-Do-Care (STDC) framework, event specifications, and ownership.
> Fill in each section to create a comprehensive measurement plan.

---

## 1. Overview

**Initiative:** [Name of the product, feature, or campaign being measured]
**Owner:** [Name, Team]
**Date Created:** [YYYY-MM-DD]
**Last Updated:** [YYYY-MM-DD]
**Status:** [Draft / In Review / Approved / Implemented]

_Example:_
**Initiative:** Self-Serve Onboarding Funnel
**Owner:** Sarah Kim, Product Analytics
**Date Created:** 2026-03-06
**Last Updated:** 2026-03-06
**Status:** Draft

---

## 2. Business Objectives (DMMM Layer 1)

Map business objectives to measurable goals and KPIs.

| # | Business Objective               | Measurable Goal                         | Primary KPI                    | Target          |
|---|----------------------------------|-----------------------------------------|--------------------------------|-----------------|
| 1 | [e.g., "Increase self-serve revenue"]| [e.g., "Improve activation rate"]  | [e.g., "Trial-to-paid %"]    | [e.g., "32% -> 42%"]|
| 2 | [e.g., "Reduce onboarding cost"]    | [e.g., "Lower support dependency"] | [e.g., "Tickets per new user"]| [e.g., "-30%"]   |

_Example:_

| # | Business Objective          | Measurable Goal                  | Primary KPI              | Target        |
|---|-----------------------------|----------------------------------|--------------------------|---------------|
| 1 | Increase self-serve revenue | Improve trial-to-paid activation | Trial-to-paid rate       | 32% -> 42%    |
| 2 | Reduce onboarding cost      | Decrease support dependency      | Support tickets per trial | 0.8 -> 0.5   |
| 3 | Accelerate time-to-value    | Users reach "aha moment" faster  | Days to first key action | 5 -> 3 days   |

---

## 3. STDC Journey Mapping (DMMM Layer 2)

Map metrics and content to each customer journey stage.

### SEE Stage (Awareness)
**User Intent:** Becoming aware of the product or solution
| Content / Touchpoint        | Metric                        | Target              | Event(s) Used            |
|-----------------------------|-------------------------------|----------------------|--------------------------|
| [e.g., "Blog posts"]      | [e.g., "Unique visitors"]   | [e.g., "+20% QoQ"] | [e.g., "page_view"]    |
| [e.g., "Social ads"]      | [e.g., "Click-through rate"]| [e.g., ">1.5%"]    | [e.g., "ad_click"]     |

### THINK Stage (Consideration)
**User Intent:** Evaluating the product, comparing alternatives
| Content / Touchpoint        | Metric                        | Target              | Event(s) Used            |
|-----------------------------|-------------------------------|----------------------|--------------------------|
| [e.g., "Pricing page"]    | [e.g., "Page engagement time"]| [e.g., ">45 sec"] | [e.g., "page_view, scroll_depth"]|
| [e.g., "Free trial signup"]| [e.g., "Signup rate"]       | [e.g., "8%"]       | [e.g., "trial_started"]|

### DO Stage (Conversion / Activation)
**User Intent:** Taking the desired action
| Content / Touchpoint              | Metric                        | Target              | Event(s) Used            |
|-----------------------------------|-------------------------------|----------------------|--------------------------|
| [e.g., "Onboarding wizard"]     | [e.g., "Completion rate"]    | [e.g., "75%"]      | [e.g., "onboarding_step_completed"]|
| [e.g., "First value action"]    | [e.g., "Activation rate"]    | [e.g., "42%"]      | [e.g., "first_value_event"]|

### CARE Stage (Loyalty / Advocacy)
**User Intent:** Deepening relationship, advocating
| Content / Touchpoint        | Metric                        | Target              | Event(s) Used            |
|-----------------------------|-------------------------------|----------------------|--------------------------|
| [e.g., "Feature adoption"]| [e.g., "Feature breadth"]    | [e.g., "3+ features"]| [e.g., "feature_used"]|
| [e.g., "Referral program"]| [e.g., "Referrals sent"]     | [e.g., "5%"]       | [e.g., "referral_sent"]|

---

## 4. Event Inventory

Complete list of events required for this measurement plan.

| Event Name                    | STDC Stage | Trigger                           | Key Properties                       | Status         |
|-------------------------------|------------|-----------------------------------|--------------------------------------|----------------|
| [e.g., "page_view"]         | SEE        | [e.g., "Page load"]             | [e.g., "page_path, referrer"]       | [Live/Planned] |
| [e.g., "trial_started"]     | THINK      | [e.g., "Signup form submitted"] | [e.g., "plan_type, source"]         | [Live/Planned] |
| [e.g., "onboarding_completed"]| DO       | [e.g., "All steps finished"]    | [e.g., "duration_sec, steps_skipped"]| [Live/Planned]|

_Example:_

| Event Name              | STDC Stage | Trigger                        | Key Properties                        | Status  |
|-------------------------|------------|--------------------------------|---------------------------------------|---------|
| page_view               | SEE        | Any page load                  | page_path, referrer, utm_*            | Live    |
| trial_started           | THINK      | Signup form submitted          | plan_type, source, referral_code      | Live    |
| onboarding_started      | DO         | Clicks "Get Started"           | plan_type, user_id                    | Planned |
| onboarding_step_completed| DO        | Completes wizard step          | step_number, step_name, duration_sec  | Planned |
| onboarding_completed    | DO         | All wizard steps done          | total_duration_sec, steps_skipped     | Planned |
| first_value_event       | DO         | First core action performed    | action_type, days_since_signup        | Planned |
| feature_used            | CARE       | User uses a tracked feature    | feature_name, usage_count             | Live    |
| referral_sent           | CARE       | User sends referral invite     | channel, referral_code                | Planned |

---

## 5. Ownership Matrix

| Responsibility                     | Owner              | Backup           | SLA                     |
|------------------------------------|--------------------|--------------------|-------------------------|
| Measurement plan maintenance       | [Name, Team]       | [Name, Team]       | Updated quarterly       |
| Event implementation               | [Name, Team]       | [Name, Team]       | Within sprint of spec   |
| Event QA and validation            | [Name, Team]       | [Name, Team]       | Within 3 days of deploy |
| Dashboard and reporting            | [Name, Team]       | [Name, Team]       | Updated by T+1          |
| Metric definitions                 | [Name, Team]       | [Name, Team]       | Reviewed quarterly      |
| Anomaly monitoring                 | [Name, Team]       | [Name, Team]       | Alerted within 24 hours |

_Example:_

| Responsibility                     | Owner                 | Backup              | SLA                     |
|------------------------------------|-----------------------|---------------------|-------------------------|
| Measurement plan maintenance       | Sarah Kim, Analytics  | Tom Lee, Analytics  | Updated quarterly       |
| Event implementation               | Dev Patel, Eng        | Mia Wong, Eng       | Within sprint of spec   |
| Event QA and validation            | Sarah Kim, Analytics  | Dev Patel, Eng      | Within 3 days of deploy |
| Dashboard and reporting            | Tom Lee, Analytics    | Sarah Kim, Analytics| Updated by T+1          |
| Metric definitions                 | Sarah Kim, Analytics  | Jordan Yu, Product  | Reviewed quarterly      |
| Anomaly monitoring                 | Data Eng on-call      | Sarah Kim, Analytics| Alerted within 24 hours |

---

## 6. Data Flow Architecture

Describe how data moves from collection to consumption.

```
[Collection Point] -> [Pipeline/Tool] -> [Storage] -> [Consumption]

Example:
Website (Segment SDK) -> Segment -> BigQuery (raw) -> dbt (modeled) -> Looker (dashboards)
Mobile (Segment SDK) -> Segment -> BigQuery (raw) -> dbt (modeled) -> Amplitude (product analytics)
```

---

## 7. Review Schedule

| Review Type              | Frequency  | Participants                  | Purpose                          |
|--------------------------|------------|-------------------------------|----------------------------------|
| Data quality check       | Weekly     | [e.g., "Analytics + Eng"]   | Validate event volumes and accuracy|
| Metric review            | Monthly    | [e.g., "Analytics + Product"]| Review KPI performance           |
| Measurement plan refresh | Quarterly  | [e.g., "All stakeholders"]  | Update plan for new priorities   |

---

## Changelog

| Date       | Author   | Change Description                        |
|------------|----------|-------------------------------------------|
| [Date]     | [Name]   | [e.g., "Initial version created"]        |
| [Date]     | [Name]   | [e.g., "Added referral events"]          |
