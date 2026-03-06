# Google Analytics 4 (GA4) Reference

## Overview

GA4 is Google's current analytics platform, replacing Universal Analytics. It uses an event-based data model where every interaction is an event with parameters. GA4 is deeply integrated with Google Ads, BigQuery, and the broader Google marketing ecosystem.

## Key Concepts

### Event-Based Model

Everything in GA4 is an event. There are no "hits" or "pageviews" as separate constructs.

| Event Type | Description | Examples |
|-----------|-------------|---------|
| **Automatically collected** | Fired without configuration | `first_visit`, `session_start`, `page_view`, `scroll`, `click` |
| **Enhanced measurement** | Configurable in the UI | `scroll`, `outbound_click`, `file_download`, `video_start`, `video_complete` |
| **Recommended** | Follow Google's naming conventions | `login`, `sign_up`, `purchase`, `add_to_cart`, `begin_checkout` |
| **Custom** | Defined by your team | Any event following your naming standard |

### Parameters

Each event can have up to 25 custom parameters. Parameters carry the detail:

```
Event: purchase
Parameters:
  transaction_id: "TXN-12345"
  value: 99.99
  currency: "BRL"
  items: [{item_id: "SKU-001", item_name: "Pro Plan", price: 99.99}]
```

### User Properties

Attributes that describe the user, not the event:

- Up to 25 custom user properties.
- Examples: `user_plan`, `user_role`, `account_created_date`, `company_size`.
- Set via gtag.js or GTM and persist across sessions.

## Setup Best Practices

### Data Streams

- Create separate data streams for web, iOS, and Android.
- Use a single GA4 property for cross-platform analysis.
- Enable Google Signals for cross-device reporting (but note privacy implications).

### BigQuery Export

- Enable the BigQuery export immediately. The free daily export is sufficient for most teams.
- Export goes to a `analytics_<property_id>` dataset with `events_YYYYMMDD` tables.
- Streaming export (intraday tables) is available for Google Analytics 360.
- BigQuery export is the escape hatch from GA4's reporting limitations. Use it.

### Data Retention

- GA4 offers 2-month or 14-month retention for user-level and event-level data.
- This only affects the Exploration reports, not standard reports (which use aggregated data).
- If you export to BigQuery, set GA4 retention to 2 months to minimize data held in Google.

### Consent Mode

Configure consent mode for GDPR and LGPD compliance:

```javascript
gtag('consent', 'default', {
  'analytics_storage': 'denied',
  'ad_storage': 'denied',
  'ad_user_data': 'denied',
  'ad_personalization': 'denied',
  'region': ['EU', 'BR']
});
```

When consent is granted, update:

```javascript
gtag('consent', 'update', {
  'analytics_storage': 'granted'
});
```

GA4 uses behavioral modeling to fill gaps when consent is denied.

## Reports and Analysis

### Standard Reports

- **Realtime:** Last 30 minutes of activity. Useful for debugging.
- **Acquisition:** How users arrive (channels, campaigns, sources).
- **Engagement:** What users do (events, pages, screens).
- **Monetization:** Revenue, purchases, in-app purchases.
- **Retention:** Cohort-based return rates.

### Explorations

More flexible analysis tool within GA4:

- **Free-form:** Custom pivot tables.
- **Funnel exploration:** Multi-step funnels with open/closed options.
- **Path exploration:** User flow from a starting or ending point.
- **Segment overlap:** Venn diagram of user segments.
- **Cohort exploration:** Retention analysis by cohort.

### Custom Dimensions and Metrics

- Register custom parameters as dimensions or metrics in GA4 Admin to use them in reports.
- Event-scoped dimensions: tied to the event (e.g., `button_location`).
- User-scoped dimensions: tied to the user (e.g., `plan_type`).
- Limit: 50 event-scoped custom dimensions, 25 user-scoped, 50 custom metrics.

## Limitations

### Data Thresholds

- GA4 applies data thresholds to protect user privacy. Small segments may show "(threshold applied)" instead of actual data.
- This is worse when Google Signals is enabled. Workaround: export to BigQuery.

### Sampling

- Standard reports are unsampled (pre-aggregated).
- Explorations can be sampled when querying large date ranges. The UI shows a shield icon indicating sample size.
- BigQuery export is never sampled. Always validate important analyses against BigQuery data.

### Attribution

- GA4 defaults to data-driven attribution (DDA), a black-box model.
- You can change the attribution model in settings, but options are limited compared to UA.
- Last-click is available as a comparison model.
- First-click was removed. If you need it, use BigQuery.

### Session Definition

- A session ends after 30 minutes of inactivity (configurable up to 7 hours 55 minutes).
- A session does NOT restart at midnight (unlike UA).
- A session does NOT restart when campaign parameters change (unlike UA).

### Real-Time Processing Delays

- Data in standard reports can be delayed by 24-48 hours.
- Realtime report shows approximate last-30-minute data.
- BigQuery daily export is available the next day; streaming export has minimal delay.

## GA4 + BigQuery Workflow

For serious analytics, treat GA4 as a data collection layer and BigQuery as the analysis layer:

1. Configure GA4 to collect events with proper parameters.
2. Export daily to BigQuery (free).
3. Build dbt models on top of the BigQuery export tables.
4. Create dashboards in your BI tool (Metabase, Looker, Power BI) from the dbt models.
5. Use GA4 UI only for real-time debugging and quick exploration.

### Key BigQuery Queries

Unnest the events table to access parameters:

```sql
SELECT
  event_date,
  event_name,
  (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_location') AS page_location,
  (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'engagement_time_msec') AS engagement_time
FROM
  `project.analytics_XXXXXX.events_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20250101' AND '20250131'
```

## Common Pitfalls

1. **Not registering custom parameters as dimensions.** You collect the data but cannot report on it in the UI.
2. **Exceeding the 25-parameter limit per event.** Plan your schema carefully.
3. **Using GA4 UI for complex analysis.** It is limited. Export to BigQuery.
4. **Comparing GA4 numbers to Universal Analytics.** The session and attribution models are fundamentally different. Expect discrepancies.
5. **Ignoring consent mode.** Non-compliant tracking creates legal risk and increasingly inaccurate data as browsers and regulations tighten.
6. **Not setting up conversions.** Mark key events as conversions in GA4 to use them in Google Ads optimization.
