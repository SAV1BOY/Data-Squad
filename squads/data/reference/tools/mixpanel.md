# Mixpanel Reference

## Overview

Mixpanel is a product analytics platform focused on event-based behavioral analysis. It excels at funnels, retention, cohort analysis, and user-level exploration. Unlike GA4, Mixpanel is designed for product teams rather than marketing teams.

## Data Model

### Events

Every user interaction is an event with properties. Similar to GA4 but with better querying flexibility.

```json
{
  "event": "complete_purchase",
  "properties": {
    "distinct_id": "user-12345",
    "time": 1710500000,
    "order_id": "ORD-789",
    "order_total": 149.90,
    "currency": "BRL",
    "payment_method": "pix",
    "items_count": 3,
    "$insert_id": "unique-dedup-id"
  }
}
```

### User Profiles

Persistent properties attached to a user:

- `$name`, `$email`, `$created` (reserved properties)
- Custom properties: `plan_type`, `company_size`, `lifecycle_stage`
- Profile properties can be set, incremented, appended, or removed.

### Group Analytics

Associate users with accounts/organizations for B2B analysis:

- Define group keys (e.g., `company_id`).
- Analyze metrics at the company level: "Which companies have the highest feature adoption?"
- Available on Growth and Enterprise plans.

## Core Reports

### Insights

The most flexible report. Query events with breakdowns, filters, and formulas.

- **Event count:** How many times did X happen?
- **Unique users:** How many users did X?
- **Property aggregation:** What is the average, sum, median of property Y when event X happens?
- **Formulas:** Combine metrics: `A / B` for conversion rates, `A - B` for differences.
- **Breakdowns:** Split by any property: platform, plan, geography.
- **Time series:** View trends over time at any granularity (hour, day, week, month).

### Funnels

Multi-step conversion analysis:

- Define a sequence of events users must complete.
- Measure conversion rate at each step and overall.
- Set a conversion window (e.g., must complete within 7 days).
- Break down by any property to find conversion differences across segments.
- View "time to convert" distribution.
- Identify where users drop off and what they do instead.

**Best practices:**
- Keep funnels to 3-7 steps. More steps create noise.
- Use the "holding property constant" feature for multi-item flows (e.g., same product through the funnel).
- Compare funnels across segments to find optimization opportunities.

### Retention

Measure how well you keep users engaged over time.

- **N-day retention:** Did the user return on exactly day N?
- **Unbounded retention:** Did the user return on or after day N?
- **Frequency retention:** How many times did the user return in each period?
- Compare retention curves across cohorts, acquisition channels, or segments.
- The most important chart for product-market fit.

### Flows

Visualize the paths users take through your product:

- Start from a specific event and see where users go next.
- End at a specific event and see where users came from.
- Filter by user segment.
- Useful for discovering unexpected user behavior.
- Caution: flows can be overwhelming with high-cardinality events. Filter aggressively.

### Cohorts

Define user groups based on behavior:

- **Behavioral cohorts:** "Users who completed onboarding in the last 30 days."
- **Property cohorts:** "Users on the Pro plan."
- **Compound cohorts:** "Users who did A AND B but NOT C."
- Cohorts can be used as filters in any other report.
- Sync cohorts to other tools (ad platforms, email tools) for targeting.

## Implementation

### SDK Options

| Platform | SDK | Notes |
|----------|-----|-------|
| Web | `mixpanel-browser` | npm package or CDN script |
| iOS | `Mixpanel-swift` | Swift package or CocoaPods |
| Android | `mixpanel-android` | Maven/Gradle |
| React Native | `mixpanel-react-native` | Wraps native SDKs |
| Python | `mixpanel` | Server-side tracking |
| Node.js | `mixpanel` | Server-side tracking |

### Tracking Best Practices

1. **Use `distinct_id` consistently.** It is the user identifier. Use your internal user ID.
2. **Handle identity merging.** Call `mixpanel.identify(userId)` after login to merge anonymous and authenticated profiles.
3. **Set `$insert_id`** on server-side events to prevent duplicates.
4. **Use super properties** for values that should be sent with every event (plan type, user role).
5. **Track both client-side and server-side** events. UI interactions client-side; transactions and system events server-side.

### Identity Resolution

Mixpanel's identity management has changed over time:

- **Original ID management:** `alias()` + `identify()`. Fragile, hard to debug.
- **Simplified ID management (recommended):** Just use `identify()`. Mixpanel handles anonymous-to-known merging automatically.
- Enable Simplified ID Merge in project settings for new projects.

## Data Governance

### Lexicon

Mixpanel's data dictionary:

- Document every event with a description and expected properties.
- Mark events as visible/hidden to control what appears in the UI.
- Tag events with categories.
- Define property descriptions and expected values.
- Use Lexicon as your tracking plan source of truth within Mixpanel.

### Data Views

- Create filtered views for different teams (marketing sees marketing events, product sees product events).
- Restrict access to sensitive events or properties.

### Data Retention

- Default retention varies by plan. Free plan retains data for a limited period.
- Enterprise plans offer configurable retention.
- Export data to your warehouse for long-term storage.

## Integration Patterns

### With Segment/CDP

- Send events from Segment to Mixpanel as a destination.
- Advantage: single tracking implementation, multiple destinations.
- Disadvantage: some Mixpanel features (like session tracking) may not work perfectly through a CDP.

### With Data Warehouse

- **Mixpanel to Warehouse:** Use the Export API or Mixpanel's data pipeline export to BigQuery/Snowflake.
- **Warehouse to Mixpanel:** Use reverse ETL (Census, Hightouch) to sync user properties from your warehouse to Mixpanel profiles.

### With Experimentation

- Send experiment variant as an event property or user property.
- Analyze experiment impact using Mixpanel's funnel and retention reports.
- More flexible than built-in experiment tools because you can slice data any way you want.

## Pricing and Limits

- Free plan: 20M events/month with core reports.
- Growth plan: More events, group analytics, data pipelines.
- Enterprise: Unlimited, advanced governance, SSO.
- Events are the billing unit. Be intentional about what you track to control costs.

## Common Pitfalls

1. **Tracking too many events.** More events does not mean better analytics. Focus on events that answer questions.
2. **Not merging identities.** Anonymous users and logged-in users appear as different people, inflating user counts.
3. **High-cardinality properties.** Properties with millions of unique values (like URLs with query params) slow down reports.
4. **Ignoring Lexicon.** Without documentation, new team members cannot use Mixpanel effectively.
5. **Over-reliance on client-side tracking.** Critical business events (purchases, subscriptions) should be tracked server-side for reliability.
6. **Not setting time zones.** Mixpanel uses UTC by default. Set the project timezone to match your business operations.
