# Alerting Patterns

Standard patterns for metric alerting, including when to use each type and how to avoid alert fatigue.

---

## Pattern 1: Static Threshold

**How it works:** Alert fires when a metric crosses a fixed value.

**When to use:**
- Metric has a well-understood normal range that does not change seasonally.
- Business has a hard limit (SLA, regulatory threshold, budget cap).

**Configuration:**
```yaml
alert:
  metric: error_rate
  condition: "> 2.0%"
  window: 5 minutes
  consecutive_breaches: 3
  severity: critical
```

**Strengths:** Simple, predictable, easy to explain.
**Weaknesses:** Does not adapt to growth, seasonality, or drift. Requires manual threshold updates.

**Tuning guidance:**
- Set the threshold based on historical P95 or P99, not the mean.
- Review thresholds quarterly; a metric that has grown 2x needs updated thresholds.
- Use hysteresis: alert fires at > 2.0%, resolves at < 1.5% (prevents flapping).

---

## Pattern 2: Anomaly Detection

**How it works:** Alert fires when a metric deviates significantly from its expected range, calculated dynamically.

**When to use:**
- Metric has seasonal patterns (hour-of-day, day-of-week).
- You want to detect both unusually high and unusually low values.
- The "normal" range shifts over time due to growth.

**Configuration:**
```yaml
alert:
  metric: daily_signups
  method: z_score
  z_threshold: 3.0
  baseline_window: 28 days
  seasonality: day_of_week
  min_data_points: 21
  severity: warning
```

**Calculation:**
```
expected = mean of same day-of-week over last 28 days
stddev = standard deviation of same day-of-week over last 28 days
z_score = (observed - expected) / stddev
alert if abs(z_score) > 3.0
```

**Strengths:** Adapts to trends and seasonality. Catches subtle shifts.
**Weaknesses:** Requires sufficient historical data. Can produce false positives during regime changes (product launches, pricing changes).

**Tuning guidance:**
- Start with z_threshold = 3.0 (conservative) and tighten to 2.5 if you are missing real anomalies.
- Exclude known anomaly periods from the baseline (outages, holidays).
- Use at least 21 data points for the baseline to get stable statistics.

---

## Pattern 3: Trend Break

**How it works:** Alert fires when a metric's trend reverses or accelerates beyond expectations.

**When to use:**
- You care about directional changes, not absolute thresholds.
- The metric is expected to grow steadily (revenue, users) and a flattening or decline is concerning.

**Configuration:**
```yaml
alert:
  metric: weekly_revenue
  method: trend_break
  lookback: 8 weeks
  min_slope_change: -0.5  # alert if week-over-week growth drops by 0.5pp
  consecutive_weeks: 2
  severity: warning
```

**Detection approach:**
1. Calculate the rolling slope (linear regression) over the lookback window.
2. Compare the most recent slope to the historical slope.
3. Alert if the slope has shifted by more than `min_slope_change` for `consecutive_weeks`.

**Strengths:** Catches slow deterioration that threshold alerts miss.
**Weaknesses:** Slow to detect (by design; requires multiple periods). Not suitable for metrics that should be stable rather than trending.

---

## Pattern 4: Absence (Missing Data)

**How it works:** Alert fires when expected data does not arrive within a specified window.

**When to use:**
- Data pipeline monitoring: a table should be refreshed by 06:00 UTC daily.
- Event stream monitoring: events should flow continuously.
- Critical metric monitoring: if the metric cannot be calculated, that itself is an incident.

**Configuration:**
```yaml
alert:
  metric: events_received_count
  condition: "== 0"
  window: 15 minutes
  expected_schedule: "continuous, 24/7"
  severity: critical
---
alert:
  table: mart_daily_revenue
  condition: "last_updated > 2 hours past expected"
  expected_schedule: "daily by 06:00 UTC"
  severity: critical
```

**Strengths:** Catches silent failures that other alert types miss entirely.
**Weaknesses:** Requires accurate documentation of expected schedules. Can fire during planned maintenance.

**Tuning guidance:**
- Set up maintenance windows during which absence alerts are suppressed.
- Differentiate between "no data" (pipeline down) and "data is zero" (legitimate but unusual).

---

## Avoiding Alert Fatigue

Alert fatigue occurs when teams receive so many alerts that they stop responding to any of them. This is the single biggest risk in alerting systems.

### Symptoms of Alert Fatigue

- Alerts are routinely acknowledged without investigation.
- Alert channels have low read rates.
- Incidents are discovered by users, not by alerts.
- Team members mute or filter alert channels.

### Prevention Strategies

| Strategy                     | Implementation                                           |
|------------------------------|----------------------------------------------------------|
| **Tier alerts by severity**  | Only page on Critical/Emergency. Warning goes to channel. Info goes to digest. |
| **Require a runbook**        | No alert without a corresponding runbook. If you cannot write a runbook, the alert is not actionable. |
| **Set consecutive breach requirements** | Never alert on a single data point. Require 2-3 consecutive breaches. |
| **Use hysteresis**           | Different thresholds for firing vs. resolving prevents flapping. |
| **Weekly alert review**      | Review all alerts that fired. Tune noisy ones. Remove stale ones. |
| **Alert-to-action ratio**    | Track the percentage of alerts that result in actual action. Target > 70%. |
| **Consolidate related alerts** | If 5 alerts fire for the same root cause, group them into one composite alert. |
| **Scheduled digests for Info** | Batch informational alerts into a daily or weekly digest instead of real-time notifications. |

### Alert Health Metrics

Track these to measure the health of your alerting system:

| Metric                        | Target        | Concern Threshold     |
|-------------------------------|---------------|-----------------------|
| Alerts per week               | < 20 per team | > 50 indicates noise  |
| Alert-to-action ratio         | > 70%         | < 50% means too noisy |
| Mean time to acknowledge      | < 15 min (Critical) | > 30 min indicates fatigue |
| Alerts with no runbook        | 0             | Any indicates gap     |
| Stale alerts (no fire in 6mo) | < 10%         | > 25% needs cleanup   |
