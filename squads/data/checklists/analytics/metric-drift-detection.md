# Metric Drift Detection Checklist

## Purpose

Distinguish between genuine changes in user behavior and artificial shifts caused by instrumentation changes, data pipeline modifications, or definition drift. This gate prevents teams from reacting to phantom trends or ignoring real ones.

---

## Checklist Items

### 1. Baseline Period Is Established

- **Pass:** A stable baseline period (at least 8 weeks of clean data) is defined for each key metric. The baseline accounts for known seasonality and is refreshed quarterly.
- **Fail:** No baseline exists, or the baseline includes periods with known data quality issues.

### 2. Drift Detection Is Automated

- **Pass:** Statistical process control (SPC charts), CUSUM, or equivalent drift detection runs automatically on key metrics. Alerts fire when a metric deviates beyond control limits for more than 3 consecutive data points.
- **Fail:** Drift is only noticed when someone happens to look at a dashboard weeks later.

### 3. Instrumentation Changes Are Cross-Referenced

- **Pass:** When drift is detected, the first check is a changelog of instrumentation modifications: new events, renamed fields, SDK updates, consent changes, tag manager publishes, and pipeline migrations in the preceding 30 days.
- **Fail:** The team assumes the drift is behavioral without checking whether the measurement changed.

### 4. Population Changes Are Assessed

- **Pass:** The team checks whether the user population shifted: new acquisition channels, geographic expansion, bot traffic changes, or platform mix shifts that could explain the metric movement without any behavioral change.
- **Fail:** A metric "improves" because a high-performing segment grew as a share of traffic, but the team credits a product change.

### 5. Metric Definition Consistency Is Verified

- **Pass:** The SQL query, API call, or dashboard filter producing the metric has not changed. If it has, the impact of the definition change is isolated and quantified separately from behavioral change.
- **Fail:** Someone edited a dashboard filter 3 weeks ago, and the resulting shift is treated as a real trend.

### 6. Upstream and Downstream Metrics Are Checked for Coherence

- **Pass:** When a metric drifts, related metrics in the same funnel or domain are examined. If conversion rate drifts but traffic, revenue, and downstream metrics are stable, the drift is likely artificial.
- **Fail:** A single metric is analyzed in isolation; contradictory signals from adjacent metrics are ignored.

### 7. Real Drift Is Attributed to a Cause

- **Pass:** When instrumentation issues are ruled out and the drift is confirmed as real, the team identifies the probable cause (product change, competitor action, market trend, seasonality) and documents it.
- **Fail:** The drift is confirmed as real but no one investigates why, leaving the team unable to act on it.

### 8. Resolution Is Tracked

- **Pass:** Each drift investigation ends with one of: (a) false alarm -- instrumentation fix applied, (b) real change -- documented and communicated, (c) inconclusive -- monitoring escalated. Status is logged in a drift investigation tracker.
- **Fail:** Drift investigations are never formally closed; the same drift gets re-investigated by different people.

---

## Cross-References

- [Anomaly Investigation](anomaly-investigation.md) -- Sudden drift may present as an anomaly.
- [Event Backfill and Migration](../instrumentation/event-backfill-and-migration.md) -- Migrations are a common source of artificial drift.
- [Metric Governance](../governance/metric-governance.md) -- Definition changes should follow the governance process to prevent accidental drift.
