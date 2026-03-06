# KPI Tree

> A KPI Tree connects your North Star metric to its drivers, inputs, and owners.
> It makes the cause-and-effect relationships between metrics explicit.
> Fill in each level; replace examples with your specifics.

---

## 1. Overview

**Product / Team:** [Name of product or team this KPI tree covers]
**Owner:** [Name, Team]
**Date Created:** [YYYY-MM-DD]
**Last Updated:** [YYYY-MM-DD]
**Review Cadence:** [e.g., "Quarterly"]

_Example:_
**Product / Team:** SaaS Platform - Growth Team
**Owner:** Marcus Chen, Product Analytics
**Date Created:** 2026-03-06
**Last Updated:** 2026-03-06
**Review Cadence:** Quarterly (next review: 2026-06-01)

---

## 2. North Star Metric [REQUIRED]

The single metric that best captures the value your product delivers to customers.

**Metric:** [Name of your North Star metric]
**Definition:** [Precise formula or description]
**Current Value:** [Value with date]
**Target:** [Target with timeframe]
**Why This Metric:** [1-2 sentences on why this is the North Star]

_Example:_
**Metric:** Weekly Active Teams (WAT)
**Definition:** Count of teams with 2+ members performing 1+ core action in a 7-day window
**Current Value:** 4,820 (week of 2026-02-24)
**Target:** 6,500 by end of Q4 2026
**Why This Metric:** WAT captures both acquisition and engagement quality - a team using the product together indicates real value delivery.

---

## 3. Level 1 - Primary Drivers [REQUIRED]

These are the direct components or levers that move the North Star.

```
                    [North Star Metric]
                    /        |         \
          [Driver 1]   [Driver 2]   [Driver 3]
```

| Driver               | Relationship to North Star                 | Current Value | Target       | Owner           |
|----------------------|--------------------------------------------|---------------|--------------|-----------------|
| [e.g., "New teams activated"]| [e.g., "Inflow to WAT"]           | [Value]       | [Target]     | [Name, Team]    |
| [e.g., "Team retention rate"]| [e.g., "Retention of WAT"]        | [Value]       | [Target]     | [Name, Team]    |
| [e.g., "Reactivated teams"]  | [e.g., "Recovery of churned WAT"] | [Value]       | [Target]     | [Name, Team]    |

_Example:_

| Driver                 | Relationship to North Star        | Current Value    | Target         | Owner               |
|------------------------|------------------------------------|------------------|----------------|----------------------|
| New teams activated    | Inflow: new teams reaching WAT bar | 380/month        | 520/month      | Growth team          |
| Weekly team retention  | Retention: % of WAT retained WoW   | 91.2%            | 93%            | Product team         |
| Reactivated teams      | Recovery: dormant teams returning   | 85/month         | 120/month      | Lifecycle team       |

---

## 4. Level 2 - Input Metrics

Each driver is itself driven by input metrics you can directly influence.

### Driver 1: [Name]

| Input Metric              | How It Drives Parent              | Current Value | Target      | Owner          |
|---------------------------|-----------------------------------|---------------|-------------|----------------|
| [e.g., "Signups"]       | [e.g., "Top of activation funnel"]| [Value]       | [Target]    | [Name, Team]   |
| [e.g., "Activation rate"]| [e.g., "Conversion to active"]   | [Value]       | [Target]    | [Name, Team]   |

### Driver 2: [Name]

| Input Metric              | How It Drives Parent              | Current Value | Target      | Owner          |
|---------------------------|-----------------------------------|---------------|-------------|----------------|
| [e.g., "Core action frequency"]| [e.g., "Engagement depth"]  | [Value]       | [Target]    | [Name, Team]   |
| [e.g., "Team member count"]    | [e.g., "Team stickiness"]  | [Value]       | [Target]    | [Name, Team]   |

### Driver 3: [Name]

| Input Metric              | How It Drives Parent              | Current Value | Target      | Owner          |
|---------------------------|-----------------------------------|---------------|-------------|----------------|
| [e.g., "Win-back emails sent"]| [e.g., "Reactivation attempts"]| [Value]      | [Target]    | [Name, Team]   |
| [e.g., "Win-back conversion %"]| [e.g., "Reactivation success"]| [Value]      | [Target]    | [Name, Team]   |

_Example (Driver 1: New Teams Activated):_

| Input Metric           | How It Drives Parent           | Current      | Target      | Owner            |
|------------------------|--------------------------------|--------------|-------------|------------------|
| Website signups        | Top of activation funnel       | 2,400/month  | 3,000/month | Marketing        |
| Signup-to-team rate    | % creating a team              | 48%          | 55%         | Growth           |
| Team activation rate   | % of teams reaching WAT bar    | 33%          | 42%         | Product/Growth   |
| Time to activation     | Speed affects completion rate  | 5.2 days     | 3 days      | Product          |

---

## 5. Level 3 - Actionable Levers (Optional)

For critical input metrics, break down further into specific actions.

| Input Metric           | Actionable Lever                  | Current   | Target    | Owner        | Initiative        |
|------------------------|-----------------------------------|-----------|-----------|--------------|-------------------|
| [e.g., "Signup rate"] | [e.g., "Landing page CRO"]      | [Value]   | [Target]  | [Name]       | [Project name]    |
| [e.g., "Signup rate"] | [e.g., "Paid channel CAC"]      | [Value]   | [Target]  | [Name]       | [Project name]    |

_Example:_

| Input Metric          | Actionable Lever             | Current    | Target     | Owner       | Initiative            |
|-----------------------|------------------------------|------------|------------|-------------|-----------------------|
| Website signups       | Landing page conversion rate | 4.2%       | 5.5%       | Marketing   | LP redesign Q2        |
| Website signups       | Paid search volume           | 1,200/mo   | 1,500/mo   | Marketing   | Budget increase        |
| Team activation rate  | Onboarding wizard completion | 68%        | 80%        | Product     | Wizard simplification  |
| Team activation rate  | Invite acceptance rate       | 42%        | 55%        | Growth      | Invite flow experiment |

---

## 6. Metric Relationships Summary

Visual representation of the full tree (use text diagram or link to visual tool).

```
North Star: Weekly Active Teams (WAT) = 4,820 -> 6,500
|
+-- New Teams Activated (380/mo -> 520/mo) [Growth]
|   +-- Signups (2,400/mo -> 3,000/mo) [Marketing]
|   +-- Signup-to-team rate (48% -> 55%) [Growth]
|   +-- Team activation rate (33% -> 42%) [Product]
|
+-- Weekly Team Retention (91.2% -> 93%) [Product]
|   +-- Core action frequency (3.1x/wk -> 4x/wk) [Product]
|   +-- Team member count (avg 3.2 -> 4.0) [Growth]
|   +-- Feature breadth (2.1 features -> 3.0) [Product]
|
+-- Reactivated Teams (85/mo -> 120/mo) [Lifecycle]
    +-- Win-back emails sent (600/mo -> 800/mo) [Lifecycle]
    +-- Win-back conversion (14% -> 15%) [Lifecycle]
```

---

## 7. Review Log

| Date       | Reviewer   | Changes Made                              | Rationale                        |
|------------|------------|-------------------------------------------|----------------------------------|
| [Date]     | [Name]     | [e.g., "Updated targets for Q2"]        | [e.g., "Revised based on Q1 actuals"]|
| [Date]     | [Name]     | [e.g., "Added reactivation driver"]     | [e.g., "New lifecycle initiative"]|

---

## 8. Appendix: Metric Definitions

For each metric in the tree, link to or include the full metric definition (see metric-definition.md template).

| Metric                    | Definition Doc Link / Location               |
|---------------------------|-----------------------------------------------|
| [e.g., "WAT"]           | [e.g., "/docs/metrics/wat.md"]               |
| [e.g., "Activation rate"]| [e.g., "/docs/metrics/activation-rate.md"]   |
