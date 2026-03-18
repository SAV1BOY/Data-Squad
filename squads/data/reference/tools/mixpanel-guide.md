# Mixpanel Guide

## Overview

Mixpanel is an event-based product analytics platform focused on user behavior analysis. It provides strong segmentation capabilities, flexible reporting, and a developer-friendly data model. Mixpanel is well-suited for teams that want deep behavioral analytics without built-in experimentation or CDP features.

## Event Tracking Model

### Events and Properties

Every tracked interaction is an event with associated properties. Mixpanel distinguishes between event properties (describe the action) and user profile properties (describe the person).

```json
{
  "event": "item_purchased",
  "properties": {
    "distinct_id": "user-456",
    "item_id": "SKU-789",
    "price": 29.99,
    "category": "electronics",
    "payment_method": "credit_card",
    "time": 1710500000
  }
}
```

### User Profiles

Profile properties persist across sessions. Set them via `mixpanel.people.set()` for mutable properties and `mixpanel.people.set_once()` for immutable ones.

- Store acquisition channel, signup date, and first-touch UTM via `set_once`.
- Store current plan, last login, and lifecycle stage via `set`.
- Avoid storing high-cardinality properties on profiles (individual transaction IDs, session tokens).

## Core Analysis Features

### Segmentation (Insights)

The Insights report is Mixpanel's primary analysis tool:

- Count events, unique users, or aggregate numeric properties (sum, average, median).
- Filter by any event or user property.
- Break down by dimensions to compare segments.
- Apply formulas: `A / B` for ratios, `A - B` for deltas.
- Time comparisons: previous period, same period last year.

### Funnels

- Define ordered or unordered multi-step funnels.
- Set per-step or overall conversion windows.
- "Any order" funnels are useful for onboarding flows where steps can happen in any sequence.
- Trend view shows conversion rate over time to detect regressions.

### Retention

- First-time retention: return after first occurrence of a start event.
- Frequency retention: how often users perform an action over time.
- Compare retention across segments to identify high-value behaviors.

### Flows

- Visualize common event sequences from a starting or ending event.
- Identify where users diverge from expected paths.
- Filter by user segment or time range.

## Experiment Integration

Mixpanel does not include a built-in experimentation platform. Integrate with external tools:

| Tool | Integration Method |
|------|-------------------|
| LaunchDarkly | Send feature flag variant as event/user property |
| Optimizely | Import experiment assignment via CDP or API |
| Statsig | Forward assignments as Mixpanel events |
| Custom (in-house) | Track `experiment_assigned` event with variant property |

Track an `experiment_exposed` event at the point of actual exposure, not just assignment. This prevents intent-to-treat dilution.

## Data Export and Warehouse Integration

### Export Options

- **Raw export API:** Pull event data as JSON/CSV. Good for ad hoc analysis under 5M events.
- **Warehouse connectors:** Native integrations with BigQuery, Snowflake, and Databricks for continuous export.
- **Schematized export:** Maintains Mixpanel's data model in your warehouse for consistent analysis.

### Import Options

- **Warehouse import:** Bring backend data into Mixpanel for enrichment.
- **CSV upload:** One-time imports for user profile enrichment.
- **Server-side SDKs:** Python, Node, Ruby, Java for backend event tracking.

## Mixpanel vs. Amplitude

| Aspect | Mixpanel | Amplitude |
|--------|----------|-----------|
| Pricing | Event-based | MTU-based (mostly) |
| Experimentation | External integration | Built-in |
| CDP | Limited | Built-in |
| Query flexibility | Strong, more technical | Strong, more self-serve |
| Data governance | Lexicon | Taxonomy |
| Session replay | Not available | Built-in |
| EU data residency | Available | Available |

**Choose Mixpanel when:** your team is technically proficient, you already have an experimentation platform, and you prefer event-based pricing. **Choose Amplitude when:** you want an all-in-one platform with built-in experimentation and CDP.

## Common Pitfalls

1. **Not using Lexicon for data governance.** Without property descriptions and expected values, data quality degrades quickly.
2. **Sending too many distinct event types.** Consolidate events with properties rather than creating hundreds of unique event names.
3. **Ignoring identity management.** Mixpanel's ID merge system requires careful implementation to avoid duplicate profiles.
4. **Using client-side tracking for revenue events.** Server-side tracking is essential for financial data accuracy.
5. **Overlooking the JQL/custom query interface** for analysis that cannot be expressed in the standard UI.

## Cross-References

- **Event Naming Standard** (`reference/standards/event-naming-standard.md`) — Naming conventions.
- **Amplitude Reference** (`reference/tools/amplitude.md`) — Comparison platform.
- **GDPR Analytics Notes** (`reference/standards/gdpr-analytics-notes.md`) — EU data residency configuration.
