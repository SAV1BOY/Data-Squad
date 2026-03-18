# Looker / LookML Guide

## Overview

Looker is a BI platform built on a semantic modeling layer called LookML. Unlike traditional BI tools that query databases directly with SQL, Looker generates SQL from a curated data model. This approach centralizes metric definitions, enforces consistency, and enables governed self-serve analytics.

## LookML Fundamentals

### The Semantic Layer

LookML defines how data is structured, joined, and presented. The core objects are:

- **Model:** The top-level container. Defines which database connection to use and which explores are available.
- **Explore:** A queryable entity that users interact with in the UI. Maps to one or more joined views.
- **View:** Represents a table or derived table. Contains dimensions and measures.
- **Dimension:** A column or calculated field used for grouping and filtering.
- **Measure:** An aggregate calculation (count, sum, average) applied to dimensions.

### Example LookML View

```lookml
view: orders {
  sql_table_name: analytics.orders ;;

  dimension: order_id {
    primary_key: yes
    type: number
  }

  dimension_group: created {
    type: time
    timeframes: [date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  measure: total_revenue {
    type: sum
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }

  measure: average_order_value {
    type: average
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }
}
```

## Explores and Joins

Explores define which views are joined and how. Well-designed explores balance flexibility with simplicity.

- Use `relationship: many_to_one` correctly to avoid fan-out (duplicated rows inflating aggregates).
- Limit the number of views joined to an explore. More than 8 joins usually indicates the explore needs restructuring.
- Use `fields` parameter to hide irrelevant dimensions from specific explores.
- Always define `access_filter` on explores that contain sensitive data.

## Persistent Derived Tables (PDTs)

PDTs are materialized views managed by Looker. They pre-compute expensive queries and refresh on a schedule.

**When to use PDTs:**
- Aggregation tables that are too slow to compute at query time.
- Intermediate transformations that multiple explores need.
- Window functions and complex calculations that benefit from materialization.

**When NOT to use PDTs:**
- For transformations that belong in dbt or your warehouse's transformation layer.
- When real-time data is required (PDTs have a refresh lag).
- As a substitute for proper data modeling in the warehouse.

PDTs should be the exception, not the standard pattern. If you have more than 20 PDTs, consider moving transformation logic upstream to dbt.

## Dashboard Design in Looker

### Best Practices

1. **One question per dashboard.** Each dashboard should answer a specific business question, not be a dumping ground for every metric.
2. **Use dashboard filters** connected to multiple tiles so users can slice all charts simultaneously.
3. **Limit tiles to 8-12 per dashboard.** More than that overwhelms the viewer.
4. **Use single-value tiles with comparisons** for KPIs (current value vs. previous period or target).
5. **Add text tiles** to explain what the dashboard shows and how to interpret it.

### Dashboard LookML

Define dashboards in LookML for version control and consistency:

- LookML dashboards live in code and go through PR review.
- User-defined dashboards are created in the UI and are harder to govern.
- Use LookML dashboards for canonical dashboards; allow user-defined for exploration.

## Data Governance Features

### Access Controls

| Level | Mechanism | Use Case |
|-------|-----------|----------|
| Model | Model sets + permission sets | Restrict which explores a group can access |
| Explore | `access_filter` | Row-level security (e.g., users see only their region) |
| Field | `access_grant` | Hide sensitive dimensions from unauthorized groups |
| Content | Folder permissions | Control who can view/edit dashboards and looks |

### Content Organization

- Organize dashboards into folders by team or domain, not by creator.
- Archive unused dashboards quarterly. Looker's content usage analytics identifies stale content.
- Use a "Validated" folder for production dashboards that have been reviewed by the data team.

## Embedding

Looker supports embedding analytics into external applications:

- **Public embeds:** Static, unauthenticated content (use sparingly).
- **Private embeds (SSO):** Authenticated embedding with user-level permissions.
- **API-driven:** Use the Looker API to run queries and render results in custom UIs.

Private SSO embedding inherits all Looker access controls, making it suitable for multi-tenant applications.

## Common Pitfalls

1. **Fan-out joins.** Joining a one-to-many relationship without proper aggregation duplicates rows and inflates measures. Always verify row counts after joins.
2. **Too many explores.** Users get lost when there are 30 explores. Curate a small set of well-documented explores per team.
3. **Bypassing LookML with SQL Runner.** SQL Runner is for debugging, not production analysis. Insights from SQL Runner should be modeled in LookML.
4. **Not using version control.** LookML should live in Git with PR reviews. Direct production edits break governance.
5. **Ignoring query performance.** Monitor the System Activity explore for slow queries and optimize with PDTs or warehouse indexes.

## Cross-References

- **Dashboard Design Standard** (`reference/standards/dashboard-design-standard.md`) — Design principles.
- **dbt Reference** (`reference/tools/dbt.md`) — Upstream transformation layer.
- **Analytics Governance Standard** (`reference/standards/analytics-governance-standard.md`) — Governance framework.
