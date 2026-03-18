# Metabase Guide

## Overview

Metabase is an open-source business intelligence tool designed for self-serve analytics. It enables non-technical users to explore data through a visual query builder while providing SQL access for analysts. Metabase is lightweight, fast to deploy, and well-suited for teams that need accessible analytics without the overhead of a full enterprise BI platform.

## Question Types

Metabase supports three ways to query data:

### Simple Questions

Point-and-click exploration using the visual query builder. Users select a table, apply filters, choose groupings, and pick a visualization. No SQL knowledge required.

Best for: business users exploring well-modeled tables, ad hoc questions, quick lookups.

### Custom Questions

The notebook editor provides a visual interface for multi-step queries: joins, custom columns, multi-level aggregation, and complex filters. More powerful than simple questions but still no SQL required.

Best for: analysts building reusable questions, multi-table analysis, calculated metrics.

### Native Queries (SQL)

Write raw SQL against the connected database. Supports variables and field filters for parameterized queries that non-technical users can interact with.

```sql
SELECT
  date_trunc('month', created_at) AS month,
  COUNT(DISTINCT user_id) AS active_users,
  SUM(revenue) AS total_revenue
FROM events
WHERE created_at >= {{start_date}}
  AND plan = {{plan_filter}}
GROUP BY 1
ORDER BY 1
```

Variables (`{{start_date}}`) become filter widgets on the saved question, enabling reuse without SQL modification.

## Dashboard Design

### Layout Principles

- Use a grid layout with consistent tile sizes. Metabase uses a 18-column grid.
- Place KPI cards (single-number with trend) across the top row.
- Group related charts vertically. Use text cards as section headers.
- Add filter widgets connected to multiple cards for interactive exploration.
- Keep dashboards to 6-10 cards. Split larger dashboards by theme.

### Filter Widgets

Dashboard filters can be linked to multiple cards, enabling cross-card interactivity:

| Filter Type | Use Case |
|-------------|----------|
| Date range | Time-based exploration across all cards |
| ID | Drill into specific entity (customer, order, campaign) |
| Category | Segment by plan, region, channel |
| Location | Geographic filtering |

Link filters to the appropriate column in each card. Unlinked cards remain static.

### Subscriptions and Alerts

- **Subscriptions:** Schedule dashboard emails or Slack messages at defined intervals.
- **Alerts:** Trigger notifications when a metric crosses a threshold (e.g., daily revenue drops below $10K).
- Use alerts sparingly. More than 5 active alerts per team creates noise.

## Embedding

### Types of Embedding

- **Static embedding:** Embed a signed, read-only question or dashboard in an external application. Parameters are locked at embed time.
- **Interactive embedding (Pro/Enterprise):** Full Metabase experience embedded in your app with SSO, filters, and drill-through.
- **Public links:** Shareable URLs that do not require authentication. Use only for non-sensitive data.

Interactive embedding is the appropriate choice for customer-facing analytics in SaaS products.

## Collection Organization

Collections are Metabase's folder system for organizing questions and dashboards.

### Recommended Structure

```
/
├── Team Collections/
│   ├── Product/
│   ├── Marketing/
│   ├── Finance/
│   └── Engineering/
├── Certified/
│   └── (reviewed, trusted dashboards)
├── Data Team/
│   ├── Models/
│   └── Templates/
└── Archive/
```

- **Certified collection:** Only the data team can add items here. These are reviewed, trusted, and maintained.
- **Team collections:** Teams own their exploratory dashboards. The data team assists but does not gatekeep.
- **Archive:** Move unused dashboards here instead of deleting. Review quarterly.

## Permission Model

### Granularity Levels

| Permission | Scope | Options |
|------------|-------|---------|
| Data access | Database/schema/table | Unrestricted, Granular, No self-service, Block |
| Collection | Collection/sub-collection | View, Curate (edit), No access |
| Native query | Database | Yes/No (controls who can write SQL) |
| Download | Database | Full (100K rows), Limited (10K), No |

### Common Configuration

- **Business users:** View access to certified collections, data access to curated schemas, no native query.
- **Analysts:** Curate access to team collections, full data access, native query enabled.
- **Data team:** Curate all collections, all database access, admin privileges.
- **External (embedded):** Sandboxed access via row-level permissions tied to SSO attributes.

## Models

Metabase Models are saved questions promoted to act as curated data sources:

- Models appear in the query builder as if they were tables.
- Add metadata (descriptions, column types, formatting) to make models self-documenting.
- Models provide a governed layer between raw tables and end-user exploration.
- Use models for key business entities: customers, orders, subscriptions, events.

## Common Pitfalls

1. **Not using models.** Letting users query raw tables leads to inconsistent metric definitions.
2. **Over-permissioning native queries.** SQL access without guardrails lets users write expensive queries that impact database performance.
3. **Flat collection structure.** Without organization, dashboards become impossible to find.
4. **Ignoring caching settings.** Default cache duration may serve stale data or cause excessive database load.
5. **Building critical workflows on Metabase alerts.** Alerts are for awareness, not operational triggers. Use proper monitoring tools for critical thresholds.

## Cross-References

- **Dashboard Design Standard** (`reference/standards/dashboard-design-standard.md`) — Design principles.
- **Analytics Governance Standard** (`reference/standards/analytics-governance-standard.md`) — Governance framework.
- **Cognitive Load in Dashboards** (`reference/psychology/cognitive-load-in-dashboards.md`) — Dashboard complexity.
