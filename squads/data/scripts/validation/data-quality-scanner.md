# data-quality-scanner

## Purpose

Scans all registered data sources for quality issues across four dimensions: completeness (null/missing value rates), freshness (time since last update), accuracy (cross-source validation), and consistency (duplicate and referential integrity). Produces a daily data quality scorecard.

## When to Run

- **Scheduled**: Daily at 08:00 UTC, after ETL and metric-drift checks complete.
- **Triggered**: After any schema migration or new data source onboarding.
- **Ad-hoc**: Before quarterly reviews to confirm data health.

## Inputs

| Input | Source | Description |
|---|---|---|
| `config/data-sources.yaml` | Config repo | List of tables to scan, with expected update frequency, key columns, cross-references |
| Data warehouse tables | Snowflake / BigQuery | All registered source and derived tables |
| `analytics.dq_history` | Data warehouse | Historical quality scores for trend comparison |

## Process

### Step 1: Load data source configuration

```python
sources = load_yaml("config/data-sources.yaml")
# Example entry:
# - table: analytics.orders
#   key_columns: [order_id]
#   required_columns: [user_id, order_date, amount, currency]
#   expected_freshness_hours: 6
#   cross_validate_with: billing.charges (on order_id)
```

### Step 2: Completeness check (null rates)

For each table, measure the null rate of every required column.

```sql
SELECT
    'analytics.orders' AS table_name,
    COUNT(*) AS total_rows,
    SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) / COUNT(*)::FLOAT AS user_id_null_rate,
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) / COUNT(*)::FLOAT AS order_date_null_rate,
    SUM(CASE WHEN amount IS NULL THEN 1 ELSE 0 END) / COUNT(*)::FLOAT AS amount_null_rate,
    SUM(CASE WHEN currency IS NULL THEN 1 ELSE 0 END) / COUNT(*)::FLOAT AS currency_null_rate
FROM analytics.orders
WHERE created_at >= DATEADD('day', -1, CURRENT_DATE);
```

Score: 1.0 if null_rate = 0, linearly decreasing. Score = 0 if null_rate >= 0.05.

```python
completeness_score = max(0, 1 - (avg_null_rate / 0.05))
```

### Step 3: Freshness check (last update lag)

```sql
SELECT
    'analytics.orders' AS table_name,
    MAX(updated_at) AS last_update,
    DATEDIFF('hour', MAX(updated_at), CURRENT_TIMESTAMP) AS hours_since_update
FROM analytics.orders;
```

```python
expected_hours = source["expected_freshness_hours"]  # e.g., 6
actual_hours = result.hours_since_update

if actual_hours <= expected_hours:
    freshness_score = 1.0
elif actual_hours <= expected_hours * 2:
    freshness_score = 0.5
else:
    freshness_score = 0.0
    flag_stale_source(table_name, actual_hours, expected_hours, severity="critical")
```

### Step 4: Accuracy check (cross-source validation)

Compare records between related sources to detect discrepancies.

```sql
-- Compare order amounts between analytics and billing
SELECT
    COUNT(*) AS total_matched,
    SUM(CASE WHEN ABS(a.amount - b.amount) > 0.01 THEN 1 ELSE 0 END) AS amount_mismatches,
    SUM(CASE WHEN a.order_id IS NOT NULL AND b.order_id IS NULL THEN 1 ELSE 0 END) AS missing_in_billing,
    SUM(CASE WHEN a.order_id IS NULL AND b.order_id IS NOT NULL THEN 1 ELSE 0 END) AS missing_in_analytics
FROM analytics.orders a
FULL OUTER JOIN billing.charges b ON a.order_id = b.order_id
WHERE COALESCE(a.order_date, b.charge_date) >= DATEADD('day', -1, CURRENT_DATE);
```

```python
mismatch_rate = (amount_mismatches + missing_in_billing + missing_in_analytics) / total_matched
accuracy_score = max(0, 1 - (mismatch_rate / 0.02))  # 2% mismatch = score 0
```

### Step 5: Consistency check (duplicates and referential integrity)

```sql
-- Duplicate detection on key columns
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_id) AS unique_keys,
    1 - (COUNT(DISTINCT order_id)::FLOAT / NULLIF(COUNT(*), 0)) AS duplicate_rate
FROM analytics.orders
WHERE created_at >= DATEADD('day', -1, CURRENT_DATE);
```

```sql
-- Referential integrity: orders should reference valid users
SELECT
    COUNT(*) AS total_orders,
    SUM(CASE WHEN u.user_id IS NULL THEN 1 ELSE 0 END) AS orphaned_orders
FROM analytics.orders o
LEFT JOIN analytics.users u ON o.user_id = u.user_id
WHERE o.created_at >= DATEADD('day', -1, CURRENT_DATE);
```

```python
consistency_score = max(0, 1 - (duplicate_rate + orphan_rate) / 0.01)
```

### Step 6: Compute composite score and persist

```python
for source in sources:
    composite_score = (
        0.30 * completeness_score +
        0.25 * freshness_score +
        0.25 * accuracy_score +
        0.20 * consistency_score
    )

    insert_row("analytics.dq_scorecard", {
        "scan_date": today,
        "table_name": source["table"],
        "completeness_score": completeness_score,
        "freshness_score": freshness_score,
        "accuracy_score": accuracy_score,
        "consistency_score": consistency_score,
        "composite_score": composite_score,
        "details": violation_details_json
    })
```

### Step 7: Trend comparison and alerting

```python
yesterday_score = get_previous_score(source["table"])
if composite_score < 0.7:
    trigger_alert_dispatcher(alert_type="data_quality_low", table=source["table"],
                             score=composite_score, severity="critical")
elif composite_score < yesterday_score - 0.15:
    trigger_alert_dispatcher(alert_type="data_quality_drop", table=source["table"],
                             score=composite_score, drop=yesterday_score - composite_score,
                             severity="high")
```

## Outputs

| Output | Destination | Description |
|---|---|---|
| `analytics.dq_scorecard` | Data warehouse | Daily scores per table per dimension |
| `analytics.dq_violations` | Data warehouse | Individual violation details (column, type, value) |
| Alert payloads | `alert-dispatcher` | On critical or high severity quality drops |
| Data Quality Dashboard | Looker / Metabase | Auto-refreshes from dq_scorecard table |

## Error Handling

| Error | Action |
|---|---|
| Table does not exist or was dropped | Log as critical violation, score = 0, alert immediately |
| Cross-validation partner table missing | Skip accuracy check for that pair, log warning, score accuracy as NULL |
| Query returns zero rows | Check if table is truly empty vs. filter issue; flag as freshness problem |
| Connection failure mid-scan | Retry failed tables up to 3 times; report partial scan with list of skipped tables |
| Config YAML missing table entry | Scan proceeds for known tables; log warning about unconfigured table |

## Schedule / Trigger

- **Cron**: `0 8 * * *` (daily at 08:00 UTC)
- **Post-migration hook**: Run automatically after `ALTER TABLE` or `CREATE TABLE` in production
- **Manual**: `python run_script.py data-quality-scanner --table analytics.orders --date 2026-03-05`
