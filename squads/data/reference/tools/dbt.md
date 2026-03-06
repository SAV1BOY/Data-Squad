# dbt (data build tool) Reference

## Overview

dbt is an open-source transformation tool that lets analytics engineers write SQL SELECT statements to transform raw data in the warehouse into clean, tested, documented models. It handles dependency management, testing, documentation, and deployment. dbt runs inside your data warehouse -- it does not extract or load data.

## Core Concepts

### Models

A model is a SQL SELECT statement saved as a `.sql` file. dbt compiles and runs it as a table or view in your warehouse.

```sql
-- models/marts/fct_orders.sql

WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

payments AS (
    SELECT * FROM {{ ref('stg_payments') }}
),

final AS (
    SELECT
        orders.order_id,
        orders.user_id,
        orders.created_at,
        orders.status,
        payments.total_amount,
        payments.payment_method
    FROM orders
    LEFT JOIN payments ON orders.order_id = payments.order_id
)

SELECT * FROM final
```

### ref() Function

`{{ ref('model_name') }}` creates a dependency between models. dbt uses these references to build a DAG (Directed Acyclic Graph) and execute models in the correct order.

### source() Function

`{{ source('source_name', 'table_name') }}` references raw tables loaded by your EL tool (Fivetran, Airbyte, Segment). Sources are defined in YAML files.

```yaml
# models/staging/sources.yml
sources:
  - name: stripe
    database: raw
    schema: stripe
    tables:
      - name: payments
        loaded_at_field: _fivetran_synced
        freshness:
          warn_after: { count: 12, period: hour }
          error_after: { count: 24, period: hour }
```

## Project Structure

```
dbt_project/
  dbt_project.yml           # Project configuration
  models/
    staging/                 # 1:1 with source tables, light transformations
      stg_orders.sql
      stg_users.sql
      stg_payments.sql
      sources.yml
      staging.yml            # Schema tests and documentation
    intermediate/            # Business logic, joining, enrichment
      int_order_payments.sql
    marts/                   # Final models consumed by BI tools
      core/
        fct_orders.sql       # Fact table: events/transactions
        dim_users.sql        # Dimension table: entities
      finance/
        fct_revenue.sql
      marketing/
        fct_campaigns.sql
  tests/                     # Custom test SQL files
  macros/                    # Reusable Jinja functions
  seeds/                     # CSV files loaded into the warehouse
  snapshots/                 # Slowly changing dimension snapshots
```

### Naming Conventions

| Layer | Prefix | Materialization | Purpose |
|-------|--------|----------------|---------|
| Staging | `stg_` | View | Clean raw data: rename, cast, filter nulls |
| Intermediate | `int_` | View or ephemeral | Business logic, joins between staging models |
| Facts | `fct_` | Table or incremental | Event/transaction grain tables |
| Dimensions | `dim_` | Table | Entity tables with descriptive attributes |

## Materializations

| Type | What It Creates | Use When |
|------|----------------|----------|
| **View** | Database view | Staging models, light transformations |
| **Table** | Physical table (full rebuild) | Marts, dimension tables |
| **Incremental** | Appends/merges new rows | Large fact tables, event data |
| **Ephemeral** | CTE (not materialized) | Intermediate logic used only as subquery |

### Incremental Models

```sql
-- models/marts/fct_events.sql

{{ config(
    materialized='incremental',
    unique_key='event_id',
    on_schema_change='append_new_columns'
) }}

SELECT
    event_id,
    user_id,
    event_name,
    event_timestamp,
    event_properties
FROM {{ ref('stg_events') }}

{% if is_incremental() %}
WHERE event_timestamp > (SELECT MAX(event_timestamp) FROM {{ this }})
{% endif %}
```

## Testing

### Built-in Tests

Define in YAML schema files:

```yaml
# models/marts/core/schema.yml
models:
  - name: fct_orders
    description: "One row per order with payment details"
    columns:
      - name: order_id
        description: "Primary key"
        tests:
          - unique
          - not_null
      - name: user_id
        tests:
          - not_null
          - relationships:
              to: ref('dim_users')
              field: user_id
      - name: status
        tests:
          - accepted_values:
              values: ['pending', 'completed', 'cancelled', 'refunded']
      - name: total_amount
        tests:
          - not_null
```

### Custom Tests

SQL queries that return rows that fail the test:

```sql
-- tests/assert_positive_revenue.sql
SELECT order_id, total_amount
FROM {{ ref('fct_orders') }}
WHERE total_amount < 0
```

If this query returns any rows, the test fails.

### dbt Packages for Testing

- **dbt_utils:** `expression_is_true`, `recency`, `equality`, and more.
- **dbt_expectations:** Great Expectations-style tests (distribution checks, statistical tests).
- **elementary:** Data observability, anomaly detection, automated freshness tests.

## Documentation

### Inline Documentation

Add descriptions in schema YAML files:

```yaml
models:
  - name: fct_orders
    description: >
      One row per order. Includes payment information joined from
      the payments model. Used as the source of truth for revenue
      reporting across all dashboards.
    columns:
      - name: total_amount
        description: "Net order amount in BRL after discounts and before taxes"
```

### doc Blocks

For longer descriptions:

```markdown
{% docs order_status %}
Order status values:
- **pending**: Order created but not yet paid
- **completed**: Payment received and order fulfilled
- **cancelled**: Order cancelled by user before payment
- **refunded**: Payment refunded after completion
{% enddocs %}
```

Reference with `description: '{{ doc("order_status") }}'`.

### dbt Docs Site

Run `dbt docs generate` and `dbt docs serve` to create an interactive documentation site with:

- Model descriptions and column documentation.
- Full DAG visualization.
- SQL compiled from Jinja.
- Test results.

## Macros

Reusable Jinja functions:

```sql
-- macros/cents_to_dollars.sql
{% macro cents_to_dollars(column_name) %}
    ROUND({{ column_name }} / 100.0, 2)
{% endmacro %}

-- Usage in a model:
SELECT
    order_id,
    {{ cents_to_dollars('amount_cents') }} AS amount_brl
FROM {{ ref('stg_orders') }}
```

### Useful dbt Packages

| Package | Purpose |
|---------|---------|
| `dbt_utils` | Generic tests, SQL helpers, surrogate keys |
| `dbt_date` | Date spine generation, fiscal calendars |
| `dbt_expectations` | Statistical and distribution tests |
| `codegen` | Generate YAML and SQL from database metadata |
| `elementary` | Data observability and anomaly detection |
| `re_data` | Data quality monitoring |

## Environments and Deployment

### Development

- Each developer works against a personal schema (e.g., `dev_maria`).
- Run `dbt run` and `dbt test` locally during development.
- Use `dbt run --select model_name+` to run a model and its downstream dependencies.

### CI/CD

- On pull request: run `dbt build --select state:modified+` to test only changed models.
- Use slim CI with deferred state to compare against production.
- Block merge if tests fail.

### Production

- Schedule production runs with dbt Cloud, Airflow, Dagster, or Prefect.
- Run full `dbt build` (run + test) on a schedule.
- Monitor run duration and test results.
- Alert on failures immediately.

## Snapshots

Track slowly changing dimensions:

```sql
-- snapshots/snap_users.sql
{% snapshot snap_users %}
{{ config(
    target_schema='snapshots',
    unique_key='user_id',
    strategy='timestamp',
    updated_at='updated_at'
) }}

SELECT * FROM {{ source('app', 'users') }}

{% endsnapshot %}
```

Creates `dbt_valid_from` and `dbt_valid_to` columns for historical analysis.

## Common Pitfalls

1. **Skipping staging models.** Always create a staging layer. It isolates you from source schema changes.
2. **Fat models.** If a model has 200+ lines of SQL, break it into intermediate models.
3. **No tests.** At minimum: `unique` and `not_null` on every primary key, `relationships` on foreign keys.
4. **Not using incremental models for large tables.** Full rebuilds of billion-row tables are slow and expensive.
5. **Business logic in BI tools.** If the same calculation exists in Power BI and Metabase, it belongs in dbt.
6. **Ignoring documentation.** If models are not documented, nobody but the author can use them.
7. **Not using packages.** dbt_utils and codegen save significant time. Install them.
