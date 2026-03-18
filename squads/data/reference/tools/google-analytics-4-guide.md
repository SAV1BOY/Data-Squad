# Google Analytics 4 (GA4) Guide

## Overview

Google Analytics 4 is Google's event-based analytics platform, replacing Universal Analytics (UA). GA4 uses a fundamentally different data model: every interaction is an event with parameters, eliminating the session-and-pageview hierarchy of UA. This guide covers practical GA4 usage for data squad workflows.

## Event-Based Data Model

### How Events Work

In GA4, everything is an event. Page views, clicks, form submissions, purchases, and custom interactions are all events with parameters.

**Automatically collected events:** `page_view`, `session_start`, `first_visit`, `user_engagement`.
**Enhanced measurement events:** `scroll`, `outbound_click`, `file_download`, `video_start`, `video_complete` (toggle on/off in admin).
**Recommended events:** Google-defined schemas for common actions (`purchase`, `sign_up`, `add_to_cart`). Use these names when applicable for compatibility with Google's built-in reports.
**Custom events:** Any event specific to your product. Follow the object_action naming convention.

### Event Parameters

Each event can carry up to 25 custom parameters. Parameters describe the context of the event.

```javascript
gtag('event', 'feature_activated', {
  feature_name: 'advanced_search',
  plan_tier: 'pro',
  activation_method: 'onboarding_prompt',
  days_since_signup: 3
});
```

**Important limitations:**
- Parameter names: 40 characters max, 50 custom event-scoped parameters per property.
- Parameter values: 100 characters max for strings.
- Register custom dimensions/metrics in GA4 admin before they appear in reports (up to 50 event-scoped, 25 user-scoped).

## Audiences

Audiences are user segments defined by conditions, sequences, or membership duration. They are more powerful than simple report filters because they can trigger events and sync to Google Ads.

**Useful audience patterns:**
- Users who completed signup but did not activate within 7 days.
- Users who performed a key action 3+ times in the last 30 days.
- Users from a specific acquisition campaign who made a purchase.
- Sequential audiences: users who viewed pricing, then started trial, but did not convert.

Audiences evaluate membership continuously. When a user meets the criteria, they enter; when they no longer qualify, they exit (if an exclusion condition is set).

## Explorations

Explorations are GA4's advanced analysis workspace, offering more flexibility than standard reports.

### Exploration Types

| Type | Use Case |
|------|----------|
| Free-form | Custom tables with flexible dimensions, metrics, and filters |
| Funnel | Multi-step conversion analysis with open or closed funnels |
| Path | Event sequence visualization from a starting or ending point |
| Segment overlap | Venn diagram comparing up to 3 segments |
| Cohort | Retention and behavior by acquisition cohort |
| User lifetime | Revenue and engagement over user lifetime |

### Funnel Explorations

GA4 funnels support open (users can enter at any step) and closed (users must start at step 1) configurations. Use closed funnels for structured flows like checkout; use open funnels for discovery flows.

Add breakdown dimensions to identify where specific segments drop off. Apply elapsed time between steps to find where friction occurs.

## BigQuery Export

The BigQuery export is the most important GA4 feature for data teams. It exports raw event data to BigQuery daily (or streaming for 360 properties).

### Why Export to BigQuery

- **Unsampled data:** GA4 UI applies sampling on large datasets. BigQuery has the full dataset.
- **Custom analysis:** Join GA4 data with backend data (CRM, billing, support).
- **Flexible attribution:** Build custom attribution models beyond GA4's defaults.
- **Data retention:** GA4 retains detailed data for 2 or 14 months. BigQuery retains indefinitely.

### BigQuery Schema

Each day creates a table (`events_YYYYMMDD`) with a nested schema. Key fields:

- `event_name`: The event type.
- `event_params`: Nested RECORD containing parameter key-value pairs.
- `user_properties`: Nested RECORD of user-scoped properties.
- `user_pseudo_id`: Cookie-based client ID.
- `user_id`: Your authenticated user ID (if set).
- `traffic_source`: First-touch acquisition source, medium, campaign.

Querying nested parameters requires UNNEST:

```sql
SELECT
  event_name,
  (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_title') AS page_title,
  COUNT(*) AS event_count
FROM `project.analytics_123456789.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20260301' AND '20260318'
GROUP BY 1, 2
ORDER BY 3 DESC
```

## Migration from Universal Analytics

### Key Differences from UA

| Concept | UA | GA4 |
|---------|-----|-----|
| Data model | Sessions and pageviews | Events and parameters |
| Bounce rate | % single-page sessions | % sessions without engagement |
| Goals | Configured in admin | Marked events as conversions |
| Views | Multiple views per property | No views; use comparisons or subproperties |
| Custom dimensions | Hit, session, user, product scope | Event-scoped or user-scoped only |
| Attribution | Last-click default | Data-driven default |

### What Breaks in Migration

- Historical UA data does not transfer to GA4. Maintain UA access for historical comparisons.
- Session counting methodology differs, so session counts will not match.
- Conversion counts may differ due to different counting methods (UA: once per session; GA4: once per event by default).
- Custom reports and dashboards must be rebuilt.

## Common Pitfalls

1. **Not registering custom dimensions.** Custom parameters are collected but invisible in reports until registered in admin.
2. **Relying on GA4 UI for data team analysis.** Export to BigQuery for unsampled, joinable data.
3. **Expecting UA metric parity.** Sessions, bounce rate, and conversions are defined differently. Communicate this to stakeholders.
4. **Exceeding parameter limits.** 50 custom event-scoped dimensions is a hard limit. Plan your schema carefully.
5. **Ignoring consent mode.** GA4 without consent mode configured is non-compliant in the EU. See GDPR reference.

## Cross-References

- **GA4 Reference** (`reference/tools/ga4.md`) — Full platform reference.
- **GDPR Analytics Notes** (`reference/standards/gdpr-analytics-notes.md`) — Consent mode configuration.
- **BigQuery Reference** (`reference/tools/bigquery.md`) — Warehouse query patterns.
- **Event Naming Standard** (`reference/standards/event-naming-standard.md`) — Naming conventions.
