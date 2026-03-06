# Dashboard Annotation Block

A reusable component for documenting events and context directly on dashboards so that viewers can understand what happened, why metrics moved, and what was done about it.

---

## Template

### Annotation Entry

| Field              | Value                                            |
|--------------------|--------------------------------------------------|
| **Date**           | _e.g., 2026-02-14_                              |
| **Time (if relevant)** | _e.g., 14:30 UTC_                           |
| **Event**          | _Short description of what happened_             |
| **Category**       | Deployment / Incident / Experiment / Business / External / Data |
| **Severity**       | Informational / Notable / Major                  |

### Impact

| Metric Affected          | Direction | Magnitude  | Duration          |
|--------------------------|-----------|------------|-------------------|
| _e.g., Checkout Conv Rate_ | Down   | -2.3pp     | 4 hours           |
| _e.g., Error Rate_       | Up        | +3.1pp     | 4 hours           |
| _e.g., Revenue_          | Down      | -$42K      | Same-day recovery |

### Context

Provide enough context for someone viewing the dashboard weeks later to understand the annotation without looking anything up:

**What happened:** _e.g., A deployment at 14:30 UTC introduced a regression in the payment processing module. The Stripe API integration began returning 500 errors for approximately 12% of checkout attempts._

**Root cause:** _e.g., A configuration change in the retry logic reduced the timeout from 10s to 1s, causing premature failures under normal Stripe latency._

**Who was affected:** _e.g., All users attempting checkout on web platform. Mobile app was unaffected (uses a different payment path)._

### Action Taken

| Action                          | Timestamp       | Owner            |
|---------------------------------|----------------|------------------|
| Incident detected via alert     | 14:35 UTC      | Monitoring       |
| Rollback initiated              | 14:52 UTC      | On-call engineer |
| Rollback completed, metrics recovering | 15:08 UTC | On-call engineer |
| Post-mortem scheduled           | 15:30 UTC      | Engineering lead |
| Fix deployed with corrected config | Next day 10:00 UTC | Payment team |

### Annotation Display Rules

How this annotation should render on dashboards:

```yaml
display:
  type: vertical_line        # vertical_line, shaded_region, or point_marker
  position: "2026-02-14T14:30:00Z"
  end_position: "2026-02-14T15:08:00Z"   # for shaded_region type
  color: "#e74c3c"           # red for incidents, blue for deployments, green for experiments
  label: "Payment regression - rollback at 15:08"
  tooltip: |
    Deployment caused Stripe timeout regression.
    Checkout conversion dropped 2.3pp for 4 hours.
    Rolled back at 15:08. Full recovery by 16:00.
  dashboards:
    - checkout-funnel
    - revenue-daily
    - error-rate-monitoring
```

### Category Reference

| Category    | Color   | Typical Examples                                    |
|-------------|---------|-----------------------------------------------------|
| Deployment  | Blue    | Code releases, config changes, infrastructure updates |
| Incident    | Red     | Outages, errors, data pipeline failures             |
| Experiment  | Green   | A/B test start/stop, feature flag toggles           |
| Business    | Purple  | Pricing changes, campaigns, partnerships            |
| External    | Orange  | Holidays, competitor actions, market events         |
| Data        | Gray    | Schema changes, backfills, migration events         |

---

## Best Practices

1. **Annotate proactively:** Add annotations at the time of the event, not after someone asks "what happened on Feb 14?"
2. **Be specific about magnitude:** "Revenue dropped" is not useful. "Revenue dropped $42K (-3.1%) over 4 hours" is.
3. **Link to artifacts:** Include links to incident reports, experiment documents, or deployment logs.
4. **Keep annotations visible:** Show annotations by default on dashboards. Hiding them defeats the purpose.
5. **Prune old annotations:** Archive annotations older than 12 months to avoid clutter. Keep Major annotations permanently.
6. **Automate where possible:** Integrate deployment tools and incident management to auto-create annotations.
