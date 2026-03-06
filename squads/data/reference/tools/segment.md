# Segment Reference

## Overview

Segment is a Customer Data Platform (CDP) that acts as a single collection point for customer data, routing it to hundreds of downstream tools. Instead of integrating each analytics, marketing, and data tool directly, you integrate once with Segment and configure destinations in the UI.

## Core Architecture

### Sources

Where data comes from. Each source represents a data collection point.

| Source Type | Examples | Implementation |
|------------|---------|----------------|
| Web (JavaScript) | Your website | `analytics.js` snippet or npm package |
| Mobile (iOS/Android) | Native apps | Segment SDK |
| Server (Node, Python, etc.) | Backend systems | Server-side SDK or HTTP API |
| Cloud sources | Stripe, Salesforce, Zendesk | Pre-built connectors that pull data |
| Warehouse sources | BigQuery, Snowflake | Reverse ETL (import from warehouse) |

### Destinations

Where data goes. Segment sends events and user data to downstream tools.

| Category | Examples |
|----------|---------|
| Analytics | GA4, Mixpanel, Amplitude, Heap |
| Advertising | Google Ads, Facebook Ads, LinkedIn Ads |
| Email/Marketing | HubSpot, Braze, Customer.io, Mailchimp |
| Data Warehouse | BigQuery, Snowflake, Redshift |
| CRM | Salesforce, HubSpot CRM |
| Customer Success | Gainsight, Vitally |
| Experimentation | Optimizely, LaunchDarkly |

### Functions

Custom code that runs in Segment's infrastructure:

- **Source Functions:** Ingest data from custom sources (webhooks, APIs).
- **Destination Functions:** Send data to destinations without a pre-built connector.
- **Insert Functions:** Transform data in-flight between source and destination.

## Tracking Methods

### identify()

Associate a user with their traits (properties):

```javascript
analytics.identify('user-12345', {
  email: 'user@example.com',
  name: 'Maria Silva',
  plan: 'pro',
  company: 'Acme Corp',
  created_at: '2024-01-15T10:00:00Z'
});
```

- Call on login, signup, and when user properties change.
- Traits persist and are sent with subsequent events.

### track()

Record a user action:

```javascript
analytics.track('complete_purchase', {
  order_id: 'ORD-789',
  revenue: 149.90,
  currency: 'BRL',
  payment_method: 'pix',
  products: [
    { product_id: 'SKU-001', name: 'Pro Plan', price: 149.90 }
  ]
});
```

### page()

Record a page view (web):

```javascript
analytics.page('Pricing', {
  title: 'Pricing - Acme Product',
  url: 'https://acme.com/pricing',
  referrer: 'https://google.com'
});
```

### group()

Associate a user with a company/organization (B2B):

```javascript
analytics.group('company-456', {
  name: 'Acme Corp',
  industry: 'SaaS',
  plan: 'enterprise',
  employees: 150
});
```

### alias()

Link two user identities. Rarely needed with modern identity resolution:

```javascript
analytics.alias('new-user-id', 'old-anonymous-id');
```

## Tracking Plan

The tracking plan is Segment's data governance layer. It defines what events and properties are expected.

### Components

- **Events:** Approved event names with descriptions.
- **Properties:** Expected properties for each event, with types and required/optional flags.
- **Traits:** Expected user traits with types.
- **Validation rules:** What happens when non-conforming data arrives (allow, block, or forward to a dead-letter queue).

### Enforcement

| Mode | Behavior |
|------|----------|
| **Allow** | All events pass through, violations are logged |
| **Block** | Non-conforming events are blocked and logged |
| **Omit Properties** | Events pass through but unexpected properties are stripped |

### Best Practices

1. Define the tracking plan before writing any tracking code.
2. Start with blocking mode to enforce discipline from day one.
3. Include property types, required flags, and example values.
4. Review and update the tracking plan quarterly.
5. Use the tracking plan as the contract between product, engineering, and analytics.

## Protocols (Data Governance)

Segment Protocols provides:

- **Schema enforcement:** Validate events against the tracking plan.
- **Violations dashboard:** See what is being sent that does not match the plan.
- **Transformations:** Rename events or properties in-flight.
- **Filtering:** Block specific events from reaching specific destinations.

## Identity Resolution

### Segment Personas / Profiles

Segment merges events from different sources into unified user profiles:

- Anonymous events (before login) are stitched to known users after identification.
- Cross-platform identity: web, mobile, and server events are merged.
- Identity graph connects `anonymous_id`, `user_id`, email, and other identifiers.

### Common Issues

1. **Identity leakage on shared devices:** If User A logs out and User B uses the same browser without clearing state, events get attributed to User A. Always call `analytics.reset()` on logout.
2. **Multiple anonymous IDs:** If a user visits on different browsers, they will have separate anonymous IDs until they log in on each.
3. **Server-side events without `anonymous_id`:** Server events should always include `user_id`. They do not need `anonymous_id`.

## Warehouse Destination

Segment can load raw event data into your data warehouse:

### Schema

Segment creates tables in your warehouse:

| Table | Contents |
|-------|----------|
| `identifies` | All `identify()` calls |
| `pages` | All `page()` calls |
| `tracks` | All `track()` calls |
| `<event_name>` | One table per unique event name |
| `users` | Deduplicated user traits |

### Best Practices

1. Build dbt models on top of Segment's raw tables.
2. Do not query raw Segment tables directly in dashboards; they are append-only and messy.
3. Use the `received_at` vs. `timestamp` distinction: `timestamp` is when the event happened; `received_at` is when Segment processed it.

## Privacy and Compliance

### User Deletion

Segment supports GDPR/LGPD deletion requests:

1. Submit a deletion request via the API or UI.
2. Segment deletes the user's data from its systems.
3. Segment forwards the deletion request to supported destinations.
4. You must verify that all destinations completed the deletion.

### Consent Management

- Integrate your CMP with Segment to pass consent categories.
- Use Segment's consent management to conditionally route data to destinations based on consent.
- Block destinations that require consent the user has not granted.

### Data Minimization

- Use the tracking plan to prevent collection of unnecessary data.
- Use destination filters to prevent PII from reaching tools that do not need it.
- Strip PII in transit using Functions.

## Pricing

- Free: 1,000 MTUs, 2 sources, limited destinations.
- Team: More volume, more sources, Protocols.
- Business: Unlimited, Personas, advanced governance.
- Segment is not cheap. Evaluate cost vs. the engineering time saved by not maintaining individual integrations.

## Common Pitfalls

1. **Not using a tracking plan.** Without governance, Segment becomes a pipe for bad data.
2. **Calling `identify()` on every event.** Call it on login, signup, and property changes only.
3. **Not calling `reset()` on logout.** Causes identity contamination on shared devices.
4. **Ignoring warehouse sync latency.** Segment warehouse syncs are not real-time (typically hourly). Do not use warehouse tables for real-time dashboards.
5. **Over-sending to destinations.** Every event sent to every destination increases cost and data noise. Use destination filters.
6. **Treating Segment as analytics.** Segment is infrastructure, not an analytics tool. You still need Mixpanel, Amplitude, or a warehouse for analysis.
