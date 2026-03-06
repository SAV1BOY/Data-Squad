# BigQuery Reference

## Overview

BigQuery is Google Cloud's fully managed, serverless data warehouse. It supports standard SQL, scales to petabytes, and charges based on data scanned (on-demand) or reserved capacity (slots). It is the natural warehouse for teams using Google Analytics 4, as GA4 exports directly to BigQuery.

## Key Concepts

### Datasets and Tables

- **Project:** Top-level GCP container (billing, permissions).
- **Dataset:** A collection of tables within a project. Similar to a schema in other databases.
- **Table:** Structured data. Types: native tables, external tables, views, materialized views.
- Fully qualified reference: `project.dataset.table`.

### Table Types

| Type | Description | Use Case |
|------|-------------|----------|
| Native table | Data stored in BigQuery's Capacitor format | Primary analytical tables |
| External table | Data stays in GCS, BigQuery queries it | Querying CSV/Parquet files without loading |
| View | Saved SQL query, runs on read | Abstraction layer, access control |
| Materialized view | Pre-computed view, auto-refreshed | Frequently queried aggregations |
| Table snapshot | Point-in-time copy of a table | Backup, data recovery |

### Partitioning

Partition large tables to reduce query costs and improve performance:

```sql
CREATE TABLE analytics.fct_events
PARTITION BY DATE(event_timestamp)
CLUSTER BY event_name, user_id
AS SELECT * FROM staging.events;
```

| Partition Type | Best For |
|---------------|----------|
| Date/timestamp | Time-series data (events, logs, transactions) |
| Integer range | ID-based partitioning |
| Ingestion time | When you do not have a natural partition column |

**Always partition event tables by date.** Without partitioning, every query scans the entire table.

### Clustering

Clustering sorts data within partitions for faster filtering:

- Up to 4 clustering columns per table.
- Choose columns frequently used in WHERE and JOIN clauses.
- Clustering is free; it only affects storage layout.
- Common clustering: `event_name`, `user_id`, `country`.

## SQL Features

### Standard SQL

BigQuery uses GoogleSQL (standard SQL compliant with some extensions):

```sql
-- Common table expressions
WITH daily_revenue AS (
    SELECT
        DATE(created_at) AS order_date,
        SUM(total_amount) AS revenue,
        COUNT(DISTINCT user_id) AS unique_buyers
    FROM `project.analytics.fct_orders`
    WHERE DATE(created_at) >= DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
    GROUP BY 1
)
SELECT
    order_date,
    revenue,
    unique_buyers,
    AVG(revenue) OVER (ORDER BY order_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS revenue_7d_avg
FROM daily_revenue
ORDER BY order_date;
```

### Arrays and Structs

BigQuery supports nested and repeated fields:

```sql
-- Unnesting arrays (common with GA4 data)
SELECT
    event_date,
    event_name,
    (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_location') AS page
FROM `project.analytics_XXXXX.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20250101' AND '20250131';
```

### Window Functions

```sql
SELECT
    user_id,
    event_timestamp,
    event_name,
    LAG(event_name) OVER (PARTITION BY user_id ORDER BY event_timestamp) AS prev_event,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY event_timestamp) AS event_sequence
FROM `project.analytics.events`;
```

### Approximate Functions

Faster and cheaper for large datasets:

- `APPROX_COUNT_DISTINCT()` instead of `COUNT(DISTINCT)` (error < 1%).
- `APPROX_QUANTILES()` for percentile calculations.
- `HLL_COUNT.INIT()` and `HLL_COUNT.MERGE()` for pre-aggregated distinct counts.

## Cost Management

### Pricing Models

| Model | How It Works | Best For |
|-------|-------------|----------|
| **On-demand** | $6.25 per TB scanned | Variable workloads, exploration |
| **Capacity (editions)** | Pay for compute slots | Predictable workloads, cost control |

### Cost Optimization Strategies

1. **Partition and cluster tables.** Reduces data scanned per query.
2. **Use `SELECT` specific columns.** Never use `SELECT *` in production queries.
3. **Preview queries before running.** Check the estimated bytes scanned in the query editor.
4. **Set project-level and user-level byte limits.** Prevent accidental expensive queries.
5. **Use materialized views** for frequently run aggregations.
6. **Expire old partitions.** Set `partition_expiration_days` on tables.
7. **Avoid cross-region queries.** Keep data in one region.
8. **Use BI Engine** for dashboard acceleration (caches data in memory).

### Cost Monitoring

```sql
-- Query to check expensive queries in the last 7 days
SELECT
    user_email,
    query,
    total_bytes_processed / POW(1024, 4) AS tb_processed,
    total_bytes_processed / POW(1024, 4) * 6.25 AS estimated_cost_usd,
    creation_time
FROM `region-us`.INFORMATION_SCHEMA.JOBS
WHERE creation_time > TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 7 DAY)
    AND total_bytes_processed > 0
ORDER BY total_bytes_processed DESC
LIMIT 20;
```

## BigQuery + dbt

dbt is the standard transformation tool for BigQuery:

- dbt models compile to BigQuery SQL.
- Use `materialized='incremental'` with `merge` strategy for large tables.
- Use `partition_by` and `cluster_by` in dbt model configs.
- Schedule dbt runs with dbt Cloud, Airflow, or Cloud Composer.

```sql
-- dbt model config for BigQuery
{{ config(
    materialized='incremental',
    partition_by={
        "field": "event_date",
        "data_type": "date",
        "granularity": "day"
    },
    cluster_by=["event_name", "user_id"],
    unique_key="event_id"
) }}
```

## BigQuery + GA4

GA4 exports to BigQuery daily (free) and streaming (GA4 360):

- Dataset: `analytics_<property_id>`
- Tables: `events_YYYYMMDD` (daily), `events_intraday_YYYYMMDD` (streaming)
- Schema: nested arrays for event_params, user_properties, items

### Common GA4 Queries

```sql
-- Session count by source
SELECT
    traffic_source.source,
    traffic_source.medium,
    COUNT(DISTINCT CONCAT(user_pseudo_id,
        (SELECT value.int_value FROM UNNEST(event_params) WHERE key = 'ga_session_id'))) AS sessions
FROM `project.analytics_XXXXX.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20250201' AND '20250228'
    AND event_name = 'session_start'
GROUP BY 1, 2
ORDER BY 3 DESC;
```

## Security and Access Control

### IAM Roles

| Role | Access Level |
|------|-------------|
| `BigQuery Data Viewer` | Read tables and views |
| `BigQuery Data Editor` | Read, write, delete tables |
| `BigQuery Job User` | Run queries |
| `BigQuery Admin` | Full control |

### Column-Level Security

Use policy tags to restrict access to sensitive columns:

1. Create a taxonomy in Data Catalog.
2. Apply policy tags to sensitive columns (PII, financial data).
3. Grant access to tagged columns through IAM.

### Row-Level Security

```sql
CREATE ROW ACCESS POLICY region_filter
ON `project.analytics.fct_orders`
GRANT TO ('user:analyst@company.com')
FILTER USING (region = 'brazil');
```

## Common Pitfalls

1. **`SELECT *` on large tables.** Scans and bills for every column. Always select specific columns.
2. **Not partitioning event tables.** Every query scans the entire table. Partition by date.
3. **Querying `events_*` without `_TABLE_SUFFIX` filter.** Scans all historical data.
4. **Not setting byte limits.** One bad query can cost hundreds of dollars.
5. **Using BigQuery as an OLTP database.** It is designed for analytical queries, not transactional workloads. Do not use it for application reads/writes.
6. **Ignoring slot contention.** On-demand queries compete for shared slots. During peak times, queries may be slow.
