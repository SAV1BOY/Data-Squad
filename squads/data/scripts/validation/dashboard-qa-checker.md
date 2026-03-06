# dashboard-qa-checker

## Purpose

Automated quality assurance for production dashboards. Validates that dashboards display fresh data, all queries execute without errors, filters behave consistently, and metric values align with the canonical metric registry. Catches broken dashboards before stakeholders see them.

## When to Run

- **Scheduled**: Daily at 09:00 UTC, after ETL and data quality scans complete.
- **Triggered**: After any dashboard edit or metric registry update.
- **Ad-hoc**: Before board meetings or exec reviews where dashboards will be presented.

## Inputs

| Input | Source | Description |
|---|---|---|
| `config/dashboard-registry.yaml` | Config repo | List of dashboards with IDs, expected metrics, owners, SLA freshness |
| BI tool API | Looker / Metabase / Tableau | Dashboard metadata, query results, last refresh times |
| `config/metric-registry.yaml` | Config repo | Canonical metric definitions (SQL, expected ranges) |
| `analytics.dq_scorecard` | Data warehouse | Latest data quality scores for underlying tables |

## Process

### Step 1: Load dashboard registry

```python
dashboards = load_yaml("config/dashboard-registry.yaml")
# Example entry:
# - dashboard_id: "exec-weekly-kpis"
#   bi_tool: "looker"
#   look_ids: [142, 143, 144, 145]
#   expected_metrics: [dau, revenue, conversion_rate, churn_rate]
#   freshness_sla_hours: 4
#   owner: "analytics-lead"
#   critical: true
```

### Step 2: Check data freshness per dashboard

```python
for dashboard in dashboards:
    metadata = bi_api.get_dashboard(dashboard["dashboard_id"])
    last_run = metadata["last_data_refresh"]
    hours_stale = (now() - last_run).total_seconds() / 3600

    if hours_stale > dashboard["freshness_sla_hours"]:
        violations.append({
            "dashboard": dashboard["dashboard_id"],
            "check": "freshness",
            "severity": "critical" if hours_stale > dashboard["freshness_sla_hours"] * 3 else "high",
            "detail": f"Dashboard is {hours_stale:.1f}h stale (SLA: {dashboard['freshness_sla_hours']}h)",
            "owner": dashboard["owner"]
        })
```

### Step 3: Execute and validate all queries

Run each dashboard tile/look query and check for errors or empty results.

```python
for look_id in dashboard["look_ids"]:
    try:
        result = bi_api.run_look(look_id, limit=5)
        if result.row_count == 0:
            violations.append({
                "dashboard": dashboard["dashboard_id"],
                "check": "empty_result",
                "severity": "high",
                "detail": f"Look {look_id} returned zero rows",
                "look_id": look_id
            })
        if result.has_error:
            violations.append({
                "dashboard": dashboard["dashboard_id"],
                "check": "query_error",
                "severity": "critical",
                "detail": f"Look {look_id} error: {result.error_message}",
                "look_id": look_id
            })
    except TimeoutError:
        violations.append({
            "dashboard": dashboard["dashboard_id"],
            "check": "query_timeout",
            "severity": "high",
            "detail": f"Look {look_id} timed out after 120s",
            "look_id": look_id
        })
```

### Step 4: Filter consistency validation

Verify that global filters apply consistently across all tiles, and that filter values reference valid dimension values.

```python
for dashboard in dashboards:
    filters = bi_api.get_dashboard_filters(dashboard["dashboard_id"])
    for f in filters:
        # Check that filter values are valid
        valid_values = bi_api.get_filter_suggestions(f["field"])
        if f["default_value"] and f["default_value"] not in valid_values:
            violations.append({
                "dashboard": dashboard["dashboard_id"],
                "check": "invalid_filter_default",
                "severity": "medium",
                "detail": f"Filter '{f['name']}' default '{f['default_value']}' not in valid values"
            })

        # Check all tiles respond to the filter
        tiles_using_filter = [t for t in dashboard["look_ids"]
                              if f["field"] in bi_api.get_look_fields(t)]
        if len(tiles_using_filter) < len(dashboard["look_ids"]):
            unfiltered = set(dashboard["look_ids"]) - set(tiles_using_filter)
            violations.append({
                "dashboard": dashboard["dashboard_id"],
                "check": "filter_not_applied",
                "severity": "medium",
                "detail": f"Filter '{f['name']}' not applied to looks: {unfiltered}"
            })
```

### Step 5: Metric definition alignment

Compare the SQL behind each dashboard metric tile to the canonical SQL in the metric registry.

```python
metric_registry = load_yaml("config/metric-registry.yaml")

for dashboard in dashboards:
    for metric_name in dashboard["expected_metrics"]:
        registry_def = metric_registry[metric_name]
        look_id = find_look_for_metric(dashboard, metric_name)

        if look_id is None:
            violations.append({
                "dashboard": dashboard["dashboard_id"],
                "check": "missing_metric",
                "severity": "high",
                "detail": f"Expected metric '{metric_name}' not found on dashboard"
            })
            continue

        # Compare dashboard value to direct registry SQL result
        dashboard_value = bi_api.run_look(look_id, limit=1).first_value
        registry_value = warehouse.execute(registry_def["sql"]).first_value

        if abs(dashboard_value - registry_value) / max(abs(registry_value), 1) > 0.01:
            violations.append({
                "dashboard": dashboard["dashboard_id"],
                "check": "metric_mismatch",
                "severity": "critical",
                "detail": (f"Metric '{metric_name}' dashboard={dashboard_value} "
                           f"registry={registry_value} "
                           f"diff={abs(dashboard_value - registry_value)}")
            })
```

### Step 6: Underlying table health check

Cross-reference with the latest data quality scores.

```sql
SELECT table_name, composite_score
FROM analytics.dq_scorecard
WHERE scan_date = CURRENT_DATE
  AND table_name IN ('analytics.orders', 'analytics.events', 'analytics.users')
  AND composite_score < 0.8;
```

If any underlying table scores below 0.8, flag all dashboards that depend on it.

### Step 7: Generate QA report and dispatch alerts

```python
qa_report = {
    "run_timestamp": now(),
    "dashboards_checked": len(dashboards),
    "total_violations": len(violations),
    "critical_count": sum(1 for v in violations if v["severity"] == "critical"),
    "violations": violations
}

insert_qa_report("analytics.dashboard_qa_log", qa_report)

for v in violations:
    if v["severity"] in ("critical", "high"):
        trigger_alert_dispatcher(
            alert_type="dashboard_qa_failure",
            dashboard=v["dashboard"],
            check=v["check"],
            detail=v["detail"],
            owner=v.get("owner", "analytics-team"),
            severity=v["severity"]
        )
```

## Outputs

| Output | Destination | Description |
|---|---|---|
| `analytics.dashboard_qa_log` | Data warehouse | Full QA report per run |
| Alert payloads | `alert-dispatcher` | For critical/high violations, routed to dashboard owner |
| Slack summary | #data-quality channel | Daily summary of dashboard health status |

## Error Handling

| Error | Action |
|---|---|
| BI tool API authentication failure | Retry with refreshed token; if still fails, abort and alert infra team |
| Dashboard not found (deleted or renamed) | Log as critical, notify registry owner to update dashboard-registry.yaml |
| API rate limit exceeded | Throttle to 1 request/second, extend run window; if still limited, prioritize critical dashboards |
| Metric registry missing a metric | Skip alignment check for that metric, log warning |
| Partial run (some dashboards checked, some failed) | Report results for successful checks, list failures separately |

## Schedule / Trigger

- **Cron**: `0 9 * * *` (daily at 09:00 UTC)
- **Webhook**: On dashboard save/edit event from BI tool
- **Manual**: `python run_script.py dashboard-qa-checker --dashboard exec-weekly-kpis`
