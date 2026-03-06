# alert-dispatcher

## Purpose

Central alert routing system that receives alert payloads from validation scripts, anomaly detectors, and quality scanners, then dispatches notifications to the correct owner based on severity, alert type, and the routing rules defined in `alert-registry.yaml`. Handles severity-based escalation, deduplication, and links to runbooks for resolution.

## When to Run

- **Triggered**: Invoked by other scripts (anomaly-detector, validate-events, data-quality-scanner, dashboard-qa-checker) whenever a threshold violation is confirmed.
- **Scheduled**: Every 5 minutes to process any queued alerts (for async/batch mode).
- **Never runs standalone** for detection -- it only routes and delivers.

## Inputs

| Input | Source | Description |
|---|---|---|
| Alert payload | Calling script or `analytics.alert_queue` table | Structured alert with type, metric, severity, details |
| `config/alert-registry.yaml` | Config repo | Routing rules: owner per alert type, channels, escalation paths |
| `analytics.alert_history` | Data warehouse | Recent alerts for deduplication and escalation tracking |

### Alert Payload Schema

```python
alert_payload = {
    "alert_id": "auto-generated-uuid",
    "alert_type": "metric_drift",          # matches a key in alert-registry.yaml
    "source_script": "check-metric-drift",
    "timestamp": "2026-03-06T07:15:00Z",
    "severity": "critical",                # critical | high | medium | low
    "metric_name": "revenue",
    "current_value": 42500,
    "expected_value": 51000,
    "details": "Revenue z-score: -4.2. 17% below 90-day baseline.",
    "context": {"z_score": -4.2, "baseline_mean": 51000, "baseline_stddev": 2024}
}
```

### Alert Registry Example

```yaml
routing_rules:
  metric_drift:
    owner: "analytics-lead"
    slack_channel: "#data-alerts"
    escalation_after_minutes: 30
    escalation_to: "head-of-data"
    runbook: "https://wiki.internal/runbooks/metric-drift"
  event_validation_failure:
    owner: "tracking-eng"
    slack_channel: "#tracking-alerts"
    escalation_after_minutes: 60
    escalation_to: "eng-manager"
    runbook: "https://wiki.internal/runbooks/event-validation"
  data_quality_low:
    owner: "data-eng"
    slack_channel: "#data-quality"
    escalation_after_minutes: 120
    escalation_to: "head-of-data"
    runbook: "https://wiki.internal/runbooks/data-quality"
  dashboard_qa_failure:
    owner: "analytics-team"
    slack_channel: "#dashboard-alerts"
    escalation_after_minutes: 60
    escalation_to: "analytics-lead"
    runbook: "https://wiki.internal/runbooks/dashboard-qa"
  anomaly_detected:
    owner: "analytics-on-call"
    slack_channel: "#data-alerts"
    escalation_after_minutes: 15
    escalation_to: "head-of-data"
    runbook: "https://wiki.internal/runbooks/anomaly-response"

severity_config:
  critical:
    notify_channels: ["slack", "pagerduty", "email"]
    color: "#FF0000"
    mention: "@here"
  high:
    notify_channels: ["slack", "email"]
    color: "#FF8C00"
    mention: "@owner"
  medium:
    notify_channels: ["slack"]
    color: "#FFD700"
    mention: ""
  low:
    notify_channels: ["slack"]
    color: "#808080"
    mention: ""
```

## Process

### Step 1: Receive and validate alert payload

```python
def dispatch_alert(payload: dict):
    required_fields = ["alert_type", "severity", "timestamp", "details"]
    for field in required_fields:
        if field not in payload:
            log_error(f"Alert payload missing required field: {field}")
            return

    payload["alert_id"] = payload.get("alert_id", str(uuid4()))
    registry = load_yaml("config/alert-registry.yaml")
```

### Step 2: Deduplication check

Prevent alert fatigue by suppressing duplicate alerts within a cooldown window.

```sql
SELECT alert_id, timestamp, severity
FROM analytics.alert_history
WHERE alert_type = :alert_type
  AND metric_name = :metric_name
  AND severity = :severity
  AND timestamp > DATEADD('hour', -4, CURRENT_TIMESTAMP)
  AND status != 'resolved'
ORDER BY timestamp DESC
LIMIT 1;
```

```python
if existing_alert:
    hours_since = (now() - existing_alert.timestamp).total_seconds() / 3600
    if hours_since < 4:
        log_info(f"Suppressing duplicate alert for {payload['alert_type']}:{payload['metric_name']}. "
                 f"Last fired {hours_since:.1f}h ago.")
        update_alert_history(existing_alert.alert_id, repeat_count_increment=1)
        return
```

### Step 3: Resolve routing

```python
route = registry["routing_rules"].get(payload["alert_type"])
if route is None:
    route = {"owner": "data-eng", "slack_channel": "#data-alerts",
             "escalation_after_minutes": 60, "escalation_to": "head-of-data",
             "runbook": "https://wiki.internal/runbooks/generic"}
    log_warning(f"No routing rule for alert_type={payload['alert_type']}. Using default.")

severity_config = registry["severity_config"][payload["severity"]]
```

### Step 4: Format alert message

```python
def format_slack_message(payload, route, severity_config):
    blocks = [
        {
            "type": "header",
            "text": f"{'CRITICAL' if payload['severity'] == 'critical' else payload['severity'].upper()} ALERT: {payload['alert_type']}"
        },
        {
            "type": "section",
            "fields": [
                {"type": "mrkdwn", "text": f"*Metric:* {payload.get('metric_name', 'N/A')}"},
                {"type": "mrkdwn", "text": f"*Severity:* {payload['severity']}"},
                {"type": "mrkdwn", "text": f"*Current:* {payload.get('current_value', 'N/A')}"},
                {"type": "mrkdwn", "text": f"*Expected:* {payload.get('expected_value', 'N/A')}"},
                {"type": "mrkdwn", "text": f"*Owner:* @{route['owner']}"},
                {"type": "mrkdwn", "text": f"*Source:* {payload.get('source_script', 'unknown')}"}
            ]
        },
        {
            "type": "section",
            "text": f"*Details:* {payload['details']}"
        },
        {
            "type": "actions",
            "elements": [
                {"type": "button", "text": "View Runbook", "url": route["runbook"]},
                {"type": "button", "text": "Acknowledge", "action_id": f"ack_{payload['alert_id']}"}
            ]
        }
    ]
    return blocks
```

### Step 5: Dispatch to channels

```python
channels = severity_config["notify_channels"]

if "slack" in channels:
    message = format_slack_message(payload, route, severity_config)
    post_to_slack(channel=route["slack_channel"], blocks=message,
                  mention=severity_config.get("mention", ""))

if "email" in channels:
    send_email(to=resolve_email(route["owner"]),
               subject=f"[{payload['severity'].upper()}] {payload['alert_type']}: {payload.get('metric_name', '')}",
               body=format_email_body(payload, route))

if "pagerduty" in channels:
    trigger_pagerduty(service=route["owner"],
                      summary=payload["details"],
                      severity=payload["severity"],
                      source=payload.get("source_script", "alert-dispatcher"))
```

### Step 6: Record alert and schedule escalation

```python
insert_alert_history("analytics.alert_history", {
    "alert_id": payload["alert_id"],
    "alert_type": payload["alert_type"],
    "metric_name": payload.get("metric_name"),
    "severity": payload["severity"],
    "timestamp": payload["timestamp"],
    "owner": route["owner"],
    "status": "fired",
    "details": payload["details"],
    "escalation_due_at": now() + timedelta(minutes=route["escalation_after_minutes"])
})
```

### Step 7: Escalation check (runs on schedule)

```python
def check_escalations():
    overdue = query("""
        SELECT * FROM analytics.alert_history
        WHERE status = 'fired'
          AND acknowledged_at IS NULL
          AND escalation_due_at < CURRENT_TIMESTAMP
          AND escalated = FALSE
    """)

    for alert in overdue:
        route = registry["routing_rules"][alert.alert_type]
        escalation_target = route["escalation_to"]

        post_to_slack(channel=route["slack_channel"],
                      text=f"ESCALATION: Alert {alert.alert_id} unacknowledged for "
                           f"{route['escalation_after_minutes']}+ minutes. "
                           f"Escalating to @{escalation_target}.")
        send_email(to=resolve_email(escalation_target),
                   subject=f"[ESCALATED] {alert.alert_type}: {alert.metric_name}",
                   body=format_escalation_email(alert))

        update_alert_history(alert.alert_id, escalated=True, escalated_to=escalation_target)
```

## Outputs

| Output | Destination | Description |
|---|---|---|
| `analytics.alert_history` | Data warehouse | Full log of all fired alerts, acknowledgments, escalations |
| Slack notifications | Configured channels | Formatted alert messages with runbook links |
| Email notifications | Alert owners / escalation targets | For high/critical severity |
| PagerDuty incidents | On-call rotation | For critical severity only |

## Error Handling

| Error | Action |
|---|---|
| Alert registry YAML missing or unparseable | Use hardcoded defaults, route all to #data-alerts and data-eng |
| Slack API failure | Fall back to email; if email also fails, log to warehouse and retry in 5 minutes |
| PagerDuty API failure | Fall back to email + Slack with explicit "PagerDuty failed" note |
| Unknown alert_type | Route to default owner (data-eng), log warning to fix registry |
| Alert storm (>20 alerts in 10 minutes) | Batch into single summary message, suppress individual notifications |

## Schedule / Trigger

- **Event-driven**: Called directly by detection scripts via `trigger_alert_dispatcher(payload)`
- **Cron**: `*/5 * * * *` (every 5 minutes for queue processing and escalation checks)
- **Manual**: `python run_script.py alert-dispatcher --replay-alert <alert_id>`
