# Amplitude Reference

## Overview

Amplitude is a behavioral analytics and experimentation platform. It combines product analytics (similar to Mixpanel) with built-in experimentation, CDP capabilities, and session replay. It is particularly strong in behavioral cohorting, user journey analysis, and self-serve analytics for product teams.

## Data Model

### Events

Every interaction is an event with event properties and user properties.

```json
{
  "event_type": "complete_purchase",
  "user_id": "user-12345",
  "device_id": "device-abc",
  "event_properties": {
    "order_id": "ORD-789",
    "order_total": 149.90,
    "currency": "BRL",
    "payment_method": "pix"
  },
  "user_properties": {
    "plan": "pro",
    "company_size": "50-200"
  },
  "time": 1710500000000
}
```

### User Properties

- Persisted across sessions and events.
- Operations: `$set`, `$setOnce`, `$add`, `$append`, `$unset`.
- `$setOnce` is useful for acquisition properties (first UTM, first referrer) that should not be overwritten.

### Groups (Accounts)

- Define group types for B2B analysis: `company`, `workspace`, `team`.
- Associate events with groups to analyze at the account level.
- Group properties are independent of user properties.

## Core Analytics Features

### Event Segmentation

The primary analysis tool:

- Count events, unique users, or aggregate properties.
- Apply filters on event properties, user properties, or group properties.
- Break down by any dimension.
- Compare time periods.
- Apply formulas across metrics: `UNIQUES(A) / UNIQUES(B)` for ratios.
- Create custom metrics using the formula language.

### Funnel Analysis

- Define multi-step funnels with ordering.
- Set conversion windows per step or overall.
- "Holding constant" feature: ensure the same entity (e.g., same product) flows through all steps.
- Frequency funnels: measure how many times users complete the funnel.
- Breakdown by any property to identify conversion differences.

### Retention Analysis

- First-time retention: track return behavior after first event.
- Return-on retention: users who did A and then did B within N days.
- Custom retention: define what "returning" means using any event.
- Compare retention across user segments, cohorts, and time periods.
- Retention is the single most important chart for product health.

### User Journeys (Pathfinder)

- Visualize event sequences from any starting or ending point.
- Identify common paths and unexpected detours.
- Filter by conversion or drop-off paths.
- More manageable than raw flow diagrams because Amplitude clusters similar paths.

### Cohort Analysis

- Define behavioral cohorts: "users who did X in the last 30 days."
- Property cohorts: "enterprise users."
- Predictive cohorts: Amplitude can predict which users are likely to churn or convert.
- Cohorts are usable across all reports and can be synced to other tools.

### User Look-Up

- Search for any individual user and see their complete event stream.
- Useful for debugging, customer support investigations, and understanding edge cases.
- Filter the event stream by event type, date, or property.

## Amplitude Experiment

Built-in experimentation platform integrated with Amplitude Analytics:

### Features

- **Feature flags:** Roll out features to specific user segments.
- **A/B testing:** Run experiments with statistical analysis built in.
- **Mutual exclusion groups:** Prevent users from being in conflicting experiments.
- **Holdout groups:** Measure long-term impact by keeping a group unexposed.

### Statistical Methods

- Amplitude uses sequential testing by default, allowing valid early decisions.
- Bayesian and frequentist methods are both available.
- Automatic sample size calculation based on your traffic and desired MDE.
- CUPED (Controlled-experiment Using Pre-Experiment Data) for variance reduction, which increases experiment sensitivity.

### Workflow

1. Define the experiment in Amplitude Experiment (hypothesis, variants, allocation).
2. Implement the feature flag in your code using the Amplitude SDK.
3. Amplitude tracks exposure events automatically.
4. Analyze results in the Experiment Results page with pre-built statistical analysis.
5. Make a ship/no-ship decision based on primary metric and guardrails.

## Amplitude CDP

- Collect events from any source.
- Enrich user profiles with data from your warehouse.
- Sync audiences to downstream tools (ad platforms, email, push).
- Governance: define a tracking plan, validate events, block non-compliant data.

## Implementation

### SDKs

| Platform | Package |
|----------|---------|
| Web (Browser) | `@amplitude/analytics-browser` |
| Node.js | `@amplitude/analytics-node` |
| iOS | `AmplitudeSwift` |
| Android | `com.amplitude:analytics-android` |
| React Native | `@amplitude/analytics-react-native` |
| Python | `amplitude-analytics` |

### Identity Resolution

- Use `user_id` for authenticated users and `device_id` for anonymous users.
- Amplitude automatically merges anonymous and authenticated identities.
- Call `identify()` after login to associate the device with the user.
- Be careful with shared devices: use `reset()` on logout to prevent identity contamination.

### Best Practices

1. **Set user properties on identify, not on every event.** Reduces payload size and simplifies tracking.
2. **Use `$setOnce` for acquisition properties** (first_utm_source, signup_date).
3. **Track server-side for critical events** (purchases, subscription changes).
4. **Use the HTTP API for high-volume server-side ingestion** rather than the SDK.
5. **Implement a tracking plan** using Amplitude's Data Management features.

## Data Management

### Taxonomy

Amplitude's data governance layer:

- Define event and property descriptions, types, and expected values.
- Block or transform unexpected events and properties.
- Mark events and properties as planned, live, or deprecated.
- Essential for maintaining data quality as the tracking plan grows.

### Data Export

- **Amplitude to Warehouse:** Use the Export API (JSON/CSV) or the Snowflake/BigQuery integrations.
- **Warehouse to Amplitude:** Use Amplitude's warehouse import or reverse ETL tools.
- **Cohort sync:** Export cohorts to ad platforms, email tools, and other destinations.

## Pricing

- Starter (free): Limited events and features.
- Plus: Core analytics with more volume.
- Growth: Experiments, CDP, advanced analytics.
- Enterprise: Unlimited, governance, SSO, dedicated support.
- Billing is based on Monthly Tracked Users (MTUs) or event volume, depending on the plan.

## Amplitude vs. Mixpanel

| Aspect | Amplitude | Mixpanel |
|--------|-----------|----------|
| Experimentation | Built-in, strong | Third-party integration needed |
| Self-serve analytics | Strong, designed for PMs | Strong, slightly more technical |
| Session replay | Built-in | Not available |
| Data governance | Taxonomy feature | Lexicon feature |
| Pricing model | MTU-based (mostly) | Event-based |
| CDP capabilities | Built-in | Limited |

Both are excellent. Choose based on whether built-in experimentation and CDP matter to your team.

## Common Pitfalls

1. **Not using Taxonomy.** Without governance, event data becomes messy fast.
2. **Tracking too many events.** Focus on events that map to user value and business outcomes.
3. **Ignoring identity resolution.** Mismanaged identities inflate user counts and distort retention.
4. **Not leveraging CUPED** in experiments. It can significantly increase sensitivity.
5. **Using Amplitude as a data warehouse.** It is an analytics tool, not a warehouse. Export to BigQuery/Snowflake for complex analysis.
6. **Confusing event properties with user properties.** Event properties describe the event; user properties describe the user. Use each appropriately.
