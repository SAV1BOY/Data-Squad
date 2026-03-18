# Amplitude Analytics Guide

## Overview

Amplitude is a product analytics platform built around behavioral event data. It excels at funnel analysis, retention tracking, and behavioral cohorting. This guide covers core workflows relevant to the data squad, complementing the full Amplitude reference.

## Core Concepts

### Event Taxonomy

A well-structured event taxonomy is the foundation of useful Amplitude data. Events should follow the object-action pattern: `page_viewed`, `purchase_completed`, `feature_activated`.

- **Object:** The thing being acted on (page, purchase, feature).
- **Action:** What happened (viewed, completed, activated).
- **Properties:** Context about the event (page_name, order_value, feature_id).

Keep event names to under 50 unique types for most products. If you have more than 200 distinct event types, your taxonomy likely needs consolidation.

### User and Event Properties

User properties persist across sessions; event properties describe a single interaction. Common mistakes include storing session-level data as user properties and duplicating user context on every event.

Use `$setOnce` for immutable acquisition properties (first_utm_source, signup_platform). Use `$set` for properties that change (plan_tier, company_size).

## Behavioral Cohorts

Cohorts are dynamic user segments defined by behavior rather than attributes.

**High-value cohort examples:**
- Power users: performed core action 10+ times in last 7 days
- At-risk users: were active 30 days ago but inactive in last 14 days
- Expansion candidates: used advanced feature 3+ times in last 30 days

Cohorts update in real time and can be used in any Amplitude chart or synced to downstream tools (email platforms, ad networks, CRMs) via Amplitude CDP.

## Funnel Analysis

### Building Effective Funnels

1. Define funnels based on user intent, not page views. `signup_started` to `signup_completed` is better than `page_viewed(/signup)` to `page_viewed(/dashboard)`.
2. Set conversion windows that match user behavior. A B2B trial funnel may need a 14-day window; a checkout funnel should use 30 minutes.
3. Use the "holding constant" feature to ensure the same entity flows through all steps (same product, same session).

### Conversion Analysis Workflow

- Identify the step with the largest drop-off.
- Break down that step by device, user segment, or acquisition source.
- Compare conversion rates across cohorts to find patterns.
- Use Pathfinder to see what users do instead of converting.

## Retention Reports

### Retention Types

| Type | Question Answered | When to Use |
|------|------------------|-------------|
| N-day | Did users return on exactly day N? | Daily-use products (social, messaging) |
| Unbounded | Did users return on or after day N? | Products with variable frequency |
| Custom | Did users do A, then do B within N days? | Activation and feature adoption |

### Interpreting Retention Curves

- A flattening curve indicates product-market fit for the retained segment.
- If the curve never flattens, you have a leaky bucket regardless of acquisition volume.
- Compare retention across acquisition cohorts monthly to detect quality shifts.

## Integration with Data Squad Workflows

### Data Export to Warehouse

Export Amplitude event data to BigQuery or Snowflake for joining with backend data. Use the Snowflake/BigQuery native integration rather than the Export API for production workflows. The Export API is suitable for ad hoc pulls under 1M events.

### Reverse ETL

Use Census, Hightouch, or Amplitude's warehouse import to enrich Amplitude user profiles with backend data (subscription status, support tickets, revenue tier). This enables richer segmentation without duplicating warehouse logic in the SDK.

### Governance

Use Amplitude Taxonomy to define approved events and properties. Block unexpected events in production. Review the tracking plan quarterly with engineering and product teams.

## Common Pitfalls

1. **Tracking page views as the primary event set.** Behavioral events tied to user value are far more useful.
2. **Not setting conversion windows on funnels.** The default is 30 days, which is too long for most funnels.
3. **Ignoring identity resolution.** Failing to call `identify()` after login inflates unique user counts.
4. **Building dashboards before defining the taxonomy.** Garbage taxonomy produces garbage dashboards.
5. **Using Amplitude as the source of truth for revenue.** Revenue data should come from the billing system via the warehouse.

## Cross-References

- **Amplitude Reference** (`reference/tools/amplitude.md`) — Full platform reference.
- **Event Naming Standard** (`reference/standards/event-naming-standard.md`) — Taxonomy conventions.
- **Experimentation Standards** (`reference/standards/experimentation-standards.md`) — Amplitude Experiment integration.
