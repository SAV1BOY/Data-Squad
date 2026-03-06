# Metric Card Component

A reusable template for documenting and displaying any metric consistently across dashboards, reports, and reviews.

---

## Template

### Header

| Field            | Value                          |
|------------------|--------------------------------|
| **Metric Name**  | _e.g., Monthly Active Users_   |
| **Owner**        | _Team or individual_           |
| **Data Source**   | _e.g., `analytics.events`_     |
| **Last Updated** | _Timestamp or cadence_         |

### Definition

Write a plain-language definition that a non-technical stakeholder can understand. Include:

- **What it measures:** One sentence describing the business concept.
- **Who it applies to:** The population or scope (e.g., "all users who completed onboarding").
- **Time grain:** The period over which the metric is calculated (daily, weekly, monthly).

### Formula

```
metric = numerator / denominator
```

Spell out each component:

- **Numerator:** Count of distinct users who performed at least one qualifying event in the period.
- **Denominator:** Count of all users eligible during the period (define eligibility).
- **Exclusions:** Bot traffic, internal accounts, test accounts.

### Current Value and Trend

| Period       | Value   | Change vs Prior | Change vs Target |
|-------------|---------|-----------------|------------------|
| Current      | 142,300 | +3.2%           | -1.1%            |
| Prior        | 137,900 | —               | —                |
| Same period last year | 118,500 | — | — |

**Trend direction:** Increasing / Decreasing / Flat
**Trend duration:** Number of consecutive periods in this direction.
**Seasonality flag:** Yes / No. If yes, note the seasonal pattern.

### Thresholds and Status

| Status   | Range              | Color  |
|----------|--------------------|--------|
| On Track | >= 95% of target   | Green  |
| At Risk  | 80%-94% of target  | Yellow |
| Off Track| < 80% of target    | Red    |

### Action Triggers

Define what happens when the metric crosses a threshold:

1. **Green to Yellow:** Owner reviews during next weekly sync. Investigate top 3 contributing segments.
2. **Yellow to Red:** Owner opens an investigation ticket within 24 hours. Notify VP-level stakeholder.
3. **Sustained Red (2+ periods):** Escalate to leadership review. Propose remediation plan with timeline.

### Dependencies

- **Upstream metrics:** List metrics that feed into this one.
- **Downstream consumers:** List dashboards, reports, or other metrics that depend on this metric.
- **Data pipeline:** Name the pipeline or job that produces the underlying data.

---

## Usage Guidelines

- Every metric displayed in a dashboard or report should use this card format.
- Cards should be version-controlled alongside the dashboard definition.
- When a metric definition changes, update the card and bump the version (see naming-and-versioning pattern).
- Include a direct link to the metric card from any dashboard that displays the metric.

---

## Example: 7-Day Retention Rate

| Field            | Value                                    |
|------------------|------------------------------------------|
| **Metric Name**  | 7-Day Retention Rate                     |
| **Owner**        | Growth Analytics                         |
| **Data Source**   | `warehouse.user_activity`                |
| **Last Updated** | Daily, 06:00 UTC                         |

**Definition:** Percentage of users who return to the product at least once within 7 days of their signup date.

**Formula:**
```
7d_retention = count(users active on day 7) / count(users who signed up on day 0)
```

**Exclusions:** Users flagged as bots, internal test accounts, users who signed up and were immediately deactivated.

| Period  | Value | Change vs Prior | Change vs Target |
|---------|-------|-----------------|------------------|
| Current | 38.2% | +1.4pp          | +0.7pp           |

**Action trigger:** If retention drops below 35% for two consecutive weeks, the Growth team opens a retention investigation and pauses non-critical experiments.
