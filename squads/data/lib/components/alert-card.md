# Alert Card Component

A reusable template for defining, displaying, and managing metric alerts consistently across monitoring systems.

---

## Template

### Alert Identity

| Field              | Value                                      |
|--------------------|--------------------------------------------|
| **Alert Name**     | _e.g., Checkout Error Rate Spike_          |
| **Alert ID**       | _e.g., ALERT-CHK-001_                     |
| **Metric**         | _e.g., Checkout Error Rate_               |
| **Owner**          | _Person or team responsible for response_  |
| **Created**        | _Date_                                     |
| **Last Modified**  | _Date_                                     |

### Threshold Configuration

| Field                  | Value                                    |
|------------------------|------------------------------------------|
| **Threshold Type**     | Static / Dynamic / Anomaly               |
| **Condition**          | _e.g., > 2.5%_                           |
| **Evaluation Window**  | _e.g., 5-minute rolling average_         |
| **Consecutive Breaches**| _e.g., 3 consecutive windows_           |
| **Baseline**           | _e.g., trailing 7-day average = 1.1%_    |

For dynamic thresholds:
```
upper_bound = trailing_mean + (z_threshold * trailing_stddev)
lower_bound = trailing_mean - (z_threshold * trailing_stddev)
z_threshold = 3.0
trailing_window = 7 days, same hour-of-day
```

### Current State

| Field              | Value                    |
|--------------------|--------------------------|
| **Current Value**  | _e.g., 3.8%_            |
| **Threshold**      | _e.g., 2.5%_            |
| **Breach Amount**  | _e.g., +1.3pp above_    |
| **Severity**       | Info / Warning / Critical / Emergency |
| **Status**         | Firing / Acknowledged / Resolved / Silenced |
| **Triggered At**   | _Timestamp_              |
| **Duration**       | _e.g., 23 minutes_      |

### Severity Definitions

| Severity     | Criteria                                    | Response Time | Notification Channel     |
|-------------|---------------------------------------------|---------------|--------------------------|
| Info        | Metric is notable but not actionable        | Next business day | Dashboard annotation  |
| Warning     | Metric approaching threshold; early signal  | 4 hours       | Slack channel            |
| Critical    | Metric has breached threshold; user impact  | 30 minutes    | Slack + PagerDuty        |
| Emergency   | Severe breach; revenue or safety impact     | Immediate     | PagerDuty + phone call   |

### Runbook

Link to the operational runbook for this alert: `_e.g., /runbooks/checkout-error-rate.md_`

**Quick triage steps (embed key steps inline):**

1. **Verify the alert is real:** Check the raw data source for data pipeline delays or calculation errors.
2. **Assess scope:** Is the issue isolated to a segment (region, device, browser) or global?
3. **Check recent changes:** Review deployments, config changes, or third-party service status in the last 2 hours.
4. **Mitigate:** If a deployment caused it, roll back. If third-party, activate fallback.
5. **Communicate:** Post status update in the incident channel within 15 minutes of acknowledgment.
6. **Resolve and document:** When the metric returns below threshold, close the alert and file a post-mortem if severity was Critical or Emergency.

### Notification Rules

| Audience              | Channel      | Condition                          |
|-----------------------|--------------|------------------------------------|
| Metric Owner          | Slack DM     | All severities                     |
| Team Channel          | #alerts-data | Warning and above                  |
| On-Call Engineer      | PagerDuty    | Critical and above                 |
| VP / Director         | Email        | Emergency only                     |
| Stakeholders          | Slack thread | Status updates during active alert |

### Alert Hygiene

| Check                            | Cadence    | Action                                   |
|----------------------------------|-----------|-------------------------------------------|
| Is this alert still relevant?    | Quarterly | Retire if metric is deprecated            |
| Has the threshold been breached without action? | Monthly | Tighten or loosen threshold     |
| Is the owner still correct?      | Quarterly | Update owner after reorgs                 |
| Are there too many Info alerts?  | Monthly   | Consolidate or promote to digest format   |
| Has this alert fired > 10x/month?| Monthly  | Investigate root cause or adjust threshold|

---

## Anti-Patterns

- **Alert on every metric:** Only alert on metrics where action is possible and defined.
- **No runbook:** An alert without a runbook trains the team to ignore alerts.
- **Stale thresholds:** Thresholds set at launch but never updated as the business grows.
- **Owner = "team":** Every alert needs a single named individual as primary responder.
