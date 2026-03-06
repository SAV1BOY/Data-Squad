# Looker Reference

## Overview

Looker is Google Cloud's enterprise BI platform. Its defining feature is LookML, a modeling language that defines business logic in a version-controlled layer between the database and the end user. This approach ensures consistent metric definitions across all reports and dashboards.

## Core Architecture

### How Looker Works

1. **Database:** Your data warehouse (BigQuery, Snowflake, Redshift, PostgreSQL).
2. **LookML model:** Defines tables, joins, dimensions, and measures in code.
3. **Explore:** An interactive query builder that uses the LookML model.
4. **Looks:** Saved queries (visualizations).
5. **Dashboards:** Collections of Looks and standalone tiles.

Looker generates SQL from the LookML model and runs it against your database. It does not store data (unlike Power BI Import mode).

## LookML Fundamentals

### Project Structure

```
project/
  models/
    ecommerce.model.lkml    # Model file: defines connections and includes
  views/
    orders.view.lkml         # View file: defines a table's dimensions and measures
    users.view.lkml
    products.view.lkml
  explores/
    order_analysis.explore.lkml  # (often defined in model file)
  dashboards/
    executive_summary.dashboard.lkml  # LookML dashboards
```

### Views

A view represents a table or derived table in your database:

```lookml
view: orders {
  sql_table_name: analytics.fct_orders ;;

  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
    value_format_name: brl_currency
  }

  measure: order_count {
    type: count
    drill_fields: [order_id, created_date, status, total_amount]
  }

  measure: total_revenue {
    type: sum
    sql: ${total_amount} ;;
    value_format_name: brl_currency
  }

  measure: avg_order_value {
    type: average
    sql: ${total_amount} ;;
    value_format_name: brl_currency
  }
}
```

### Dimensions vs. Measures

| Concept | Purpose | Examples |
|---------|---------|---------|
| **Dimension** | Attribute for grouping/filtering | `user_id`, `status`, `created_date`, `country` |
| **Measure** | Aggregated calculation | `count`, `sum`, `average`, `count_distinct` |
| **Dimension Group** | Time-based dimension with multiple granularities | `created_date`, `created_week`, `created_month` |

### Explores

An Explore defines how views join together and what users can query:

```lookml
explore: orders {
  label: "Order Analysis"
  description: "Analyze orders with user and product details"

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${orders.product_id} = ${products.product_id} ;;
    relationship: many_to_one
  }
}
```

### Derived Tables

SQL-based or LookML-based virtual tables:

```lookml
view: user_order_summary {
  derived_table: {
    sql:
      SELECT
        user_id,
        COUNT(*) AS lifetime_orders,
        SUM(total_amount) AS lifetime_revenue,
        MIN(created_at) AS first_order_date
      FROM analytics.fct_orders
      GROUP BY 1 ;;

    datagroup_trigger: daily_refresh
  }

  dimension: user_id { ... }
  measure: avg_lifetime_revenue { ... }
}
```

**PDTs (Persistent Derived Tables):** Derived tables that are materialized in the database and refreshed on a schedule. Use for complex calculations that would be too slow to compute on the fly.

## Explores for End Users

### How Users Interact

1. Open an Explore.
2. Select dimensions (group by) and measures (aggregate).
3. Apply filters.
4. Choose visualization type.
5. Save as a Look or add to a dashboard.

### Query Best Practices

- Encourage users to always add a date filter to avoid full-table scans.
- Set `always_filter` on Explores to enforce mandatory filters.
- Use `suggest_explore` and `suggest_dimension` to guide users to the right starting point.

## Dashboards

### LookML Dashboards

Defined in code and version-controlled:

```lookml
- dashboard: executive_summary
  title: "Executive Summary"
  layout: newspaper

  elements:
    - title: "Monthly Revenue"
      type: looker_line
      model: ecommerce
      explore: orders
      dimensions: [orders.created_month]
      measures: [orders.total_revenue]
      filters:
        orders.created_date: "12 months"
```

### User-Defined Dashboards

Created in the UI by dragging Looks and tiles. More flexible but not version-controlled.

### Cross-Filtering

- Dashboard tiles can filter each other when users click on data points.
- Configure cross-filtering in dashboard settings.
- Use sparingly to avoid confusing interactions.

## Data Governance

### Content Management

- Organize Looks and dashboards into folders with permissions.
- Use "Shared" folders for team content and "Personal" folders for exploration.
- Archive unused content regularly.

### LookML Governance

- LookML is version-controlled in Git. Use branches, pull requests, and code reviews.
- The production branch is the source of truth for all end-user queries.
- Development mode lets LookML developers test changes before merging.
- Use labels, descriptions, and groups to make the model self-documenting.

### Access Control

| Level | Controls |
|-------|----------|
| Model access | Which Explores a user can access |
| Field-level access | Which dimensions/measures are visible (using `access_filter`) |
| Row-level access | Filter data rows based on user attributes |
| Content access | Which folders and dashboards a user can see |

## Performance

### Query Optimization

1. Use PDTs for complex derived tables.
2. Set `datagroup_trigger` caching policies.
3. Add `always_filter` on large Explores.
4. Use aggregate awareness to route queries to pre-aggregated tables.
5. Optimize the underlying database (indexes, clustering, partitioning).

### Caching

- Looker caches query results based on datagroups.
- A datagroup defines when the cache should be invalidated (e.g., when a dbt model finishes running).
- Configure caching per-Explore or per-model.

## Integration with dbt

Looker and dbt complement each other well:

- **dbt:** Handles data transformation (cleaning, joining, aggregating) in the warehouse.
- **Looker:** Handles the semantic layer (metrics, dimensions) and visualization.
- LookML views should point to dbt models (`sql_table_name: analytics.fct_orders`).
- Use dbt's documentation and tests for data quality; use Looker's LookML for presentation logic.
- Some teams generate LookML from dbt model metadata for consistency.

## API and Automation

- Looker has a comprehensive REST API for managing content, running queries, and administering the instance.
- Use the API to automate report delivery, sync content, or build custom applications.
- SDKs available in Python, TypeScript, Ruby, and more.

## Common Pitfalls

1. **Building complex logic in LookML instead of dbt.** LookML should be a thin semantic layer, not a transformation engine.
2. **Too many Explores.** Users get overwhelmed. Keep Explores focused and well-documented.
3. **Not using version control properly.** Treat LookML changes like code: branch, review, merge.
4. **Ignoring caching.** Without proper datagroup configuration, every query hits the database live.
5. **Not training end users.** Looker's Explore is powerful but not intuitive for first-time users. Invest in training.
6. **Over-permissive access.** Without field-level and row-level restrictions, users may access data they should not see.
