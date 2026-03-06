# Snowflake Reference

## Overview

Snowflake is a cloud data warehouse available on AWS, Azure, and GCP. Its architecture separates storage from compute, allowing independent scaling. It is known for near-zero maintenance, automatic scaling, cross-cloud data sharing, and strong support for semi-structured data (JSON, Avro, Parquet).

## Architecture

### Three Layers

| Layer | Purpose |
|-------|---------|
| **Cloud Services** | Authentication, metadata, query optimization, access control |
| **Compute (Virtual Warehouses)** | Query processing. Independent, scalable clusters |
| **Storage** | Compressed columnar storage. Managed by Snowflake, billed separately |

### Virtual Warehouses

A virtual warehouse is a compute cluster that runs queries:

- Sizes: XS, S, M, L, XL, 2XL, 3XL, 4XL (each doubling cost and compute).
- Can be started, stopped, and resized on demand.
- Multiple warehouses can query the same data simultaneously.
- Auto-suspend: warehouse pauses after inactivity (save costs).
- Auto-resume: warehouse starts when a query arrives.
- Multi-cluster warehouses: automatically add clusters for concurrency.

**Best practice:** Create separate warehouses for different workloads:

| Warehouse | Size | Use |
|-----------|------|-----|
| `LOADING_WH` | M | ELT jobs (Fivetran, Airbyte, dbt) |
| `ANALYTICS_WH` | S-M | BI tool queries (Metabase, Looker) |
| `ADHOC_WH` | XS-S | Analyst ad-hoc queries |
| `REPORTING_WH` | S | Scheduled reports |

## Database Objects

### Hierarchy

```
Account
  Database
    Schema
      Table / View / Materialized View
      Stage (for file loading)
      Pipe (for continuous loading)
      Stream (change tracking)
      Task (scheduled SQL)
      Function / Procedure
```

### Tables

```sql
CREATE TABLE analytics.core.fct_orders (
    order_id STRING NOT NULL,
    user_id STRING NOT NULL,
    created_at TIMESTAMP_NTZ NOT NULL,
    status STRING,
    total_amount NUMBER(12, 2),
    currency STRING DEFAULT 'BRL',
    payment_method STRING
)
CLUSTER BY (DATE(created_at), status);
```

### Micro-Partitioning

Snowflake automatically partitions data into micro-partitions (50-500MB compressed):

- No manual partitioning needed (unlike BigQuery).
- Clustering keys help Snowflake organize micro-partitions for faster pruning.
- Use clustering keys on columns frequently used in WHERE clauses.
- Clustering is automatic and runs in the background (costs credits).

### Semi-Structured Data

Snowflake handles JSON, Avro, Parquet, and ORC natively:

```sql
-- Query JSON data using VARIANT type
SELECT
    raw_data:event_name::STRING AS event_name,
    raw_data:user_id::STRING AS user_id,
    raw_data:properties:order_total::NUMBER(12,2) AS order_total
FROM raw.events.event_log
WHERE raw_data:event_name::STRING = 'complete_purchase';
```

Use `LATERAL FLATTEN` to unnest arrays:

```sql
SELECT
    e.raw_data:event_name::STRING AS event_name,
    item.value:product_id::STRING AS product_id,
    item.value:price::NUMBER(12,2) AS price
FROM raw.events.event_log e,
LATERAL FLATTEN(input => e.raw_data:items) item;
```

## Cost Management

### Billing Components

| Component | Unit | Notes |
|-----------|------|-------|
| **Compute** | Credits per second (min 60s) | Depends on warehouse size |
| **Storage** | $/TB/month | Compressed data + Time Travel + Fail-Safe |
| **Data transfer** | $/TB | Cross-region or egress to internet |
| **Serverless features** | Credits | Snowpipe, auto-clustering, materialized views |

### Cost Optimization

1. **Right-size warehouses.** Start with XS and scale up only when needed. Monitor query times.
2. **Set auto-suspend aggressively.** 1-5 minutes for ad-hoc warehouses, 5-10 minutes for BI warehouses.
3. **Use resource monitors.** Set credit alerts and limits per warehouse.
4. **Avoid long-running warehouses.** Prefer short, intensive jobs over always-on warehouses.
5. **Reduce Time Travel retention.** Default is 1 day (Enterprise: up to 90 days). Set to 1 day for staging tables.
6. **Compress and prune staging data.** Drop raw staging tables after transformation.
7. **Monitor with ACCOUNT_USAGE views:**

```sql
-- Top expensive queries in the last 7 days
SELECT
    query_text,
    user_name,
    warehouse_name,
    total_elapsed_time / 1000 AS elapsed_seconds,
    credits_used_cloud_services
FROM snowflake.account_usage.query_history
WHERE start_time > DATEADD(day, -7, CURRENT_TIMESTAMP())
ORDER BY total_elapsed_time DESC
LIMIT 20;
```

## Snowflake + dbt

dbt is the standard transformation tool for Snowflake:

```yaml
# profiles.yml
my_project:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: xy12345.us-east-1
      user: dbt_user
      password: "{{ env_var('SNOWFLAKE_PASSWORD') }}"
      role: TRANSFORMER
      warehouse: LOADING_WH
      database: ANALYTICS
      schema: DEV_MARIA
      threads: 4
```

### dbt Best Practices for Snowflake

1. Use a dedicated `TRANSFORMER` role for dbt.
2. Use a separate warehouse for dbt runs (`LOADING_WH`).
3. Configure `query_tag` in profiles to trace dbt queries in Snowflake's query history.
4. Use transient tables for staging models to avoid Time Travel costs.

## Data Loading

### Bulk Loading (COPY INTO)

```sql
COPY INTO raw.stripe.payments
FROM @raw.stripe.stripe_stage/payments/
FILE_FORMAT = (TYPE = 'JSON')
MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE;
```

### Continuous Loading (Snowpipe)

- Automatically loads files as they arrive in cloud storage.
- Near real-time ingestion.
- Serverless (billed per file, no warehouse needed).
- Use for streaming data (events, logs).

### Third-Party ELT Tools

| Tool | Notes |
|------|-------|
| Fivetran | Managed connectors, simple setup |
| Airbyte | Open-source, self-hosted option |
| Stitch | Affordable, limited connectors |
| Segment | Warehouse destination for event data |

## Security

### Roles and Access

Snowflake uses role-based access control (RBAC):

```sql
-- Create a role for analysts
CREATE ROLE ANALYST;
GRANT USAGE ON WAREHOUSE ANALYTICS_WH TO ROLE ANALYST;
GRANT USAGE ON DATABASE ANALYTICS TO ROLE ANALYST;
GRANT USAGE ON ALL SCHEMAS IN DATABASE ANALYTICS TO ROLE ANALYST;
GRANT SELECT ON ALL TABLES IN DATABASE ANALYTICS TO ROLE ANALYST;
```

### Dynamic Data Masking

```sql
CREATE MASKING POLICY email_mask AS (val STRING) RETURNS STRING ->
    CASE
        WHEN CURRENT_ROLE() IN ('ADMIN', 'ANALYST_PII') THEN val
        ELSE REGEXP_REPLACE(val, '.+@', '****@')
    END;

ALTER TABLE users MODIFY COLUMN email SET MASKING POLICY email_mask;
```

### Row Access Policies

```sql
CREATE ROW ACCESS POLICY region_policy AS (region STRING) RETURNS BOOLEAN ->
    CURRENT_ROLE() = 'ADMIN'
    OR region = CURRENT_SESSION()::VARIANT:region;
```

## Data Sharing

Snowflake's unique feature: share live data with other Snowflake accounts without copying:

- **Direct Share:** Share specific tables/views with named accounts.
- **Snowflake Marketplace:** Publish or consume shared datasets.
- **Data Exchange:** Private marketplace for your organization.
- Consumers query the data using their own compute (no cost to the provider for queries).

## Common Pitfalls

1. **Leaving warehouses running.** Set auto-suspend to 1-5 minutes. Idle warehouses cost credits.
2. **Using one warehouse for everything.** Separate workloads to prevent contention and enable right-sizing.
3. **Ignoring clustering.** For large tables, proper clustering keys dramatically improve query performance.
4. **Over-using Time Travel retention.** 90 days of Time Travel on all tables is expensive. Use 1 day for staging.
5. **Not monitoring costs.** Set resource monitors and review `ACCOUNT_USAGE` views weekly.
6. **Querying VARIANT columns without casting.** Always cast semi-structured data to typed columns for performance.
