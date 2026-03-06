# Metabase Reference

## Overview

Metabase is an open-source business intelligence tool that lets anyone ask questions of their data. It supports SQL-based querying, visual query building (no-code), and dashboard creation. It is popular for its simplicity, self-hosted option, and accessible learning curve. Particularly common in startups and mid-size companies in Brazil and LATAM.

## Setup and Deployment

### Deployment Options

| Option | Best For | Notes |
|--------|---------|-------|
| Docker | Most teams | `docker run -d -p 3000:3000 metabase/metabase` |
| JAR file | Simple setups | Requires Java 11+, single file |
| Metabase Cloud | Managed hosting | No infrastructure management, paid |
| Kubernetes | Scale and resilience | Helm chart available |

### Database Connections

Metabase connects to your database and runs queries against it. Supported databases:

- PostgreSQL, MySQL, MariaDB
- BigQuery, Snowflake, Redshift
- MongoDB, SQLite
- Presto, Spark SQL, Druid, ClickHouse (community drivers)

**Best practice:** Connect Metabase to a read replica or analytical database, not your production OLTP database. Heavy Metabase queries can impact production performance.

### Application Database

Metabase stores its own configuration (questions, dashboards, users) in an internal database:

- Default: H2 (embedded, not suitable for production).
- Production: Use PostgreSQL or MySQL for the application database.
- Migrate from H2 to PostgreSQL before going to production. H2 data loss is common.

## Querying

### Simple Questions (No-Code)

The visual query builder lets non-SQL users create queries:

1. Pick a table.
2. Apply filters (date ranges, categories, values).
3. Choose aggregation (count, sum, average, distinct values).
4. Group by dimensions (date, category, region).
5. Visualize as chart, table, map, or number.

### Custom Questions (SQL)

Write SQL directly with added features:

- **Variables:** Use `{{ variable_name }}` for filter parameters.
- **Field filters:** `{{ date_filter }}` creates a date picker in the dashboard.
- **Optional clauses:** `[[ AND status = {{ status }} ]]` only adds the clause if the filter is set.

```sql
SELECT
  date_trunc('month', created_at) AS month,
  COUNT(*) AS order_count,
  SUM(total) AS revenue
FROM orders
WHERE created_at >= {{ start_date }}
  [[ AND status = {{ status }} ]]
GROUP BY 1
ORDER BY 1
```

### Native Query Snippets

Reusable SQL fragments:

- Define common CTEs, joins, or filters as snippets.
- Reference with `{{ snippet: snippet_name }}`.
- Useful for standardizing date filtering or common table definitions.

## Dashboards

### Building Dashboards

1. Create a new dashboard.
2. Add saved questions (charts) as tiles.
3. Add text cards for context and explanations.
4. Add filters that connect to multiple questions.
5. Arrange tiles in a grid layout.

### Dashboard Filters

- Connect dashboard-level filters to individual question parameters.
- Supported filter types: date, category, ID, text, number.
- Filters can have default values.
- Linked filters: one filter constrains the options in another.

### Dashboard Best Practices

1. Follow the dashboard design standard (see `dashboard-design-standard.md`).
2. Keep dashboards focused: one audience, one decision.
3. Use text cards to provide context: "This dashboard shows X for Y audience."
4. Set auto-refresh intervals for operational dashboards.
5. Use click-through behavior to link summary dashboards to detail dashboards.

## Embedding

Metabase supports several embedding approaches:

### Public Links

- Share a dashboard or question via a public URL.
- No authentication required; anyone with the link can view.
- Limited: no filters, no interactivity beyond what is built in.
- Use for simple, non-sensitive dashboards.

### Signed Embedding (Static)

- Embed dashboards in your application using signed JWT tokens.
- Parameters are locked by the token (e.g., a customer sees only their data).
- The embedded dashboard looks like part of your application.
- No Metabase account needed for end users.

### Interactive Embedding (Full)

- Available in Pro/Enterprise plans.
- Embed the full Metabase experience in your application.
- Users can explore, filter, and drill down.
- SSO integration for user management.

### Embedding Best Practices

1. Always lock sensitive parameters in signed embeds to prevent data leakage.
2. Use the `#bordered=false&titled=false` parameters for cleaner embedded appearance.
3. Test embedding in an incognito window to verify the end-user experience.
4. Monitor embedded dashboard performance; they may be hit by many concurrent users.

## Data Model and Metadata

### Table Metadata

- Add descriptions to tables and columns in the Admin panel.
- Set column types (category, location, URL, etc.) to enable better automatic visualizations.
- Hide irrelevant columns and tables from the query builder.

### Models

Metabase Models are saved questions that act as virtual tables:

- Defined using SQL or the visual query builder.
- Appear in the query builder as if they were database tables.
- Useful for abstracting complex joins or calculations.
- Add column descriptions and types to models for self-serve use.

### Metrics (Certified Aggregations)

- Define canonical metrics (e.g., "Monthly Active Users") as certified.
- Users can apply these metrics without knowing the underlying formula.
- Reduces discrepancies from different people writing different queries.

## Permissions and Access Control

### Permission Levels

| Level | What Users Can Do |
|-------|------------------|
| Admin | Everything: manage users, databases, settings |
| Data access (unrestricted) | Query any table with native SQL |
| Data access (sandboxed) | See only filtered rows (row-level security) |
| Data access (no self-service) | View saved questions and dashboards only |
| No access | Cannot see the database or collection |

### Collections

Organize questions and dashboards into collections (folders):

- Set permissions at the collection level.
- Recommended structure: one collection per team or domain.
- Use "Official" collections for certified dashboards.

### Row-Level Security (Sandboxing)

- Available in Pro/Enterprise plans.
- Filter table rows based on user attributes.
- Example: a customer support rep sees only their assigned accounts.

## Performance Optimization

### Caching

- Enable query caching in Admin settings.
- Set cache TTL based on data freshness requirements.
- Cache is per-question, invalidated by TTL.

### Question Optimization

1. Avoid `SELECT *` in SQL questions. Select only needed columns.
2. Use date filters with reasonable defaults (last 30 days, not all time).
3. For large tables, create summary tables or materialized views in the database.
4. Use Metabase Models to pre-compute common joins.

### Database Optimization

1. Add indexes on columns frequently used in Metabase filters (date, status, user_id).
2. Use a read replica to isolate Metabase query load.
3. Set statement timeouts in the database to prevent runaway queries.

## Alerts and Subscriptions

### Dashboard Subscriptions

- Schedule dashboards to be sent via email or Slack.
- Set frequency: daily, weekly, monthly.
- Attach as PDF or inline images.

### Question Alerts

- Set alerts on individual questions: "Alert me when revenue drops below $X."
- Conditions: above/below a threshold, or when results change.
- Delivered via email or Slack.

## Common Pitfalls

1. **Using H2 in production.** Migrate to PostgreSQL immediately. H2 corrupts and you lose all your dashboards.
2. **Connecting to the production database.** Use a read replica or analytical database.
3. **No permission structure.** Set up collections and permissions before opening Metabase to the team.
4. **SQL injection risk in public embeds.** Always use parameterized queries, never string interpolation.
5. **Dashboard sprawl.** Without governance, everyone creates dashboards and nobody can find the right one. Archive regularly.
6. **Not using Models.** If multiple questions join the same tables the same way, create a Model.
