# validate-events

## Purpose

Validates incoming event data against the canonical event schema and naming conventions defined in the event registry. Catches schema violations, naming errors, missing properties, version mismatches, and duplicate events before they propagate into downstream tables and dashboards.

## When to Run

- **Scheduled**: Every 6 hours via cron, scanning events ingested since the last run.
- **Triggered**: On every new event type registration or schema update in the event registry.
- **Ad-hoc**: Before any major release that introduces new tracking.

## Inputs

| Input | Source | Description |
|---|---|---|
| `events` table | Data warehouse (e.g., `analytics.raw_events`) | Raw event stream to validate |
| `event_registry` | `config/event-registry.yaml` | Canonical list of event names, required properties, versions |
| `last_run_timestamp` | State store / job metadata table | Timestamp of last successful validation run |

## Process

### Step 1: Load registry and establish validation window

```sql
-- Determine validation window
SET @validation_start = (SELECT COALESCE(last_success_ts, DATEADD('day', -1, CURRENT_TIMESTAMP))
                         FROM job_metadata WHERE job_name = 'validate_events');
SET @validation_end = CURRENT_TIMESTAMP;
```

Load the event registry YAML into a lookup structure (dictionary keyed by event_name).

### Step 2: Check naming pattern compliance

All event names must follow the pattern `object_action` in snake_case (e.g., `page_viewed`, `button_clicked`).

```sql
SELECT event_name, COUNT(*) AS event_count
FROM analytics.raw_events
WHERE ingested_at BETWEEN @validation_start AND @validation_end
  AND event_name NOT REGEXP '^[a-z][a-z0-9]*(_[a-z][a-z0-9]*)+$'
GROUP BY event_name
ORDER BY event_count DESC;
```

Flag any event_name not matching the pattern. Severity: **warning** if count < 100, **critical** if count >= 100.

### Step 3: Check for unregistered event names

```sql
SELECT e.event_name, COUNT(*) AS event_count
FROM analytics.raw_events e
LEFT JOIN event_registry r ON e.event_name = r.event_name
WHERE e.ingested_at BETWEEN @validation_start AND @validation_end
  AND r.event_name IS NULL
GROUP BY e.event_name;
```

Any event not present in the registry is flagged as **warning** (possible new unregistered tracking).

### Step 4: Validate required properties

For each registered event, check that all required properties are present and non-null.

```python
for event_def in registry:
    required_props = event_def["required_properties"]  # e.g., ["user_id", "session_id", "platform"]
    for prop in required_props:
        query = f"""
            SELECT COUNT(*) AS total,
                   SUM(CASE WHEN event_properties:{prop}::STRING IS NULL THEN 1 ELSE 0 END) AS null_count
            FROM analytics.raw_events
            WHERE event_name = '{event_def["name"]}'
              AND ingested_at BETWEEN @validation_start AND @validation_end
        """
        result = execute(query)
        null_rate = result.null_count / result.total if result.total > 0 else 0
        if null_rate > 0.01:
            flag_violation(event=event_def["name"], property=prop, null_rate=null_rate, severity="critical")
        elif null_rate > 0:
            flag_violation(event=event_def["name"], property=prop, null_rate=null_rate, severity="warning")
```

### Step 5: Version consistency check

```sql
SELECT event_name, schema_version, COUNT(*) AS event_count
FROM analytics.raw_events
WHERE ingested_at BETWEEN @validation_start AND @validation_end
GROUP BY event_name, schema_version
HAVING COUNT(DISTINCT schema_version) > 1;
```

Compare observed schema_version against the current version in the registry. Flag events arriving with deprecated or unknown versions.

### Step 6: Duplicate detection

```sql
SELECT event_id, COUNT(*) AS occurrences
FROM analytics.raw_events
WHERE ingested_at BETWEEN @validation_start AND @validation_end
GROUP BY event_id
HAVING COUNT(*) > 1;
```

If duplicate rate exceeds 0.1%, flag as **critical**. Between 0% and 0.1%, flag as **warning**.

### Step 7: Write results and update state

```python
insert_validation_results(violations)  # Write to analytics.event_validation_log
update_job_metadata("validate_events", validation_end)

if any(v.severity == "critical" for v in violations):
    trigger_alert_dispatcher(alert_type="event_validation_failure", violations=critical_violations)
```

## Outputs

| Output | Destination | Description |
|---|---|---|
| `analytics.event_validation_log` | Data warehouse | Row per violation with event_name, violation_type, severity, details, timestamp |
| Alert payload | `alert-dispatcher` | Triggered on critical violations |
| Job metadata update | `job_metadata` table | Updated last_success_ts |

## Error Handling

| Error | Action |
|---|---|
| Registry YAML parse failure | Abort run, send critical alert, keep last_run_timestamp unchanged |
| Warehouse connection timeout | Retry 3 times with exponential backoff (10s, 30s, 90s), then abort and alert |
| Query timeout on large scan window | Split window into 1-hour chunks and process sequentially |
| Zero events in window | Log info (may be expected off-peak), skip validation, update timestamp |

## Schedule / Trigger

- **Cron**: `0 */6 * * *` (every 6 hours)
- **Event trigger**: Registry file change detected via Git webhook
- **Manual**: `python run_script.py validate-events --start 2026-03-01 --end 2026-03-06`
