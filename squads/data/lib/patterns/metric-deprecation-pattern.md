# Metric Deprecation Pattern

How to safely retire a metric without breaking downstream dashboards, reports, alerts, and decision-making processes.

---

## When to Deprecate

A metric should be deprecated when:

- Its definition has been superseded by a better version (see naming-and-versioning pattern).
- The business concept it measures is no longer relevant.
- It is redundant with another metric and causes confusion.
- The underlying data source is being retired.
- It has had zero consumers (no dashboard, report, or query references) for 90+ days.

## Deprecation Lifecycle

```
ACTIVE --> DEPRECATED --> RETIRED --> ARCHIVED
```

| Stage        | Duration       | Behavior                                              |
|-------------|----------------|-------------------------------------------------------|
| ACTIVE      | Indefinite     | Metric is produced, served, and trusted.              |
| DEPRECATED  | 30-90 days     | Metric is still produced but flagged. Consumers are notified to migrate. |
| RETIRED     | 30 days        | Metric is no longer produced. Queries return an error or fallback message. |
| ARCHIVED    | Permanent      | Historical data is preserved in cold storage. Metric definition is kept in the catalog as "archived." |

## Step-by-Step Process

### Step 1: Impact Assessment

Before deprecating, understand who and what depends on the metric.

**Consumer audit:**

| Consumer Type    | How to Find                                          |
|------------------|------------------------------------------------------|
| Dashboards       | Search BI tool for metric name in chart definitions  |
| Reports          | Search scheduled report definitions                  |
| Alerts           | Search alerting system for metric references         |
| Other metrics    | Search transformation layer for upstream references  |
| Ad-hoc queries   | Search query logs for the metric's source table      |
| External systems | Check API consumers and data exports                 |

**Impact classification:**

| Impact Level | Criteria                                | Migration Window |
|-------------|------------------------------------------|------------------|
| High        | L0/L1 metric or 10+ consumers           | 90 days          |
| Medium      | L2 metric or 3-9 consumers              | 60 days          |
| Low         | L3 metric or 1-2 consumers              | 30 days          |
| None        | No consumers found                       | 14 days          |

### Step 2: Announce Deprecation

Notify all consumers through multiple channels:

1. **Data catalog:** Mark the metric as "DEPRECATED" with a deprecation date and migration guide link.
2. **Changelog:** Add an entry to the data changelog.
3. **Direct notification:** Contact owners of dashboards and reports that reference the metric.
4. **Slack/email:** Post to the data announcements channel.
5. **In-product warning:** If the metric is served via an API, return a deprecation warning header.

**Announcement template:**

```
METRIC DEPRECATION NOTICE

Metric: [metric_name]
Deprecation date: [date]
Retirement date: [date, 30-90 days later]
Reason: [why it is being deprecated]
Replacement: [new metric name, or "none" if the concept is being retired]
Migration guide: [link]
Owner: [who to contact with questions]
```

### Step 3: Provide Migration Path

If a replacement metric exists:

- Publish a side-by-side comparison of old vs. new metric values over a historical period.
- Document any differences in definition, granularity, or available dimensions.
- Provide example queries showing how to switch from old to new.
- Offer a transition period where both metrics are available.

If no replacement exists:

- Explain why the metric is no longer needed.
- Suggest alternative metrics or approaches for the use cases the old metric served.

### Step 4: Monitor Migration

Track consumer migration during the deprecation window:

| Week | Dashboards Migrated | Reports Migrated | Alerts Migrated | Queries Using Old |
|------|--------------------|--------------------|-----------------|-------------------|
| 1    | 2 of 8             | 0 of 3             | 1 of 2          | 142               |
| 2    | 5 of 8             | 1 of 3             | 2 of 2          | 87                |
| 4    | 7 of 8             | 3 of 3             | 2 of 2          | 23                |
| 8    | 8 of 8             | 3 of 3             | 2 of 2          | 4                 |

Follow up directly with consumers who have not migrated by the halfway point.

### Step 5: Retire

On the retirement date:

- Stop producing the metric in the transformation layer.
- Replace the model/view with a stub that returns a clear error message: "This metric was retired on [date]. Use [replacement] instead."
- Remove the metric from dashboards that were not migrated (with owner notification).
- Keep the metric definition in the catalog, marked as "RETIRED."

### Step 6: Archive

After 30 days in RETIRED status:

- Move historical metric data to cold storage (if it is not already in a general-purpose historical table).
- Update the catalog entry to "ARCHIVED."
- Retain the definition and migration documentation permanently for institutional knowledge.

---

## Special Cases

**Metric with external consumers (partners, customers):**
- Extend the deprecation window to 6 months minimum.
- Include deprecation notices in API release notes.
- Provide a versioned API endpoint that continues serving the old metric during transition.

**Metric embedded in contracts or SLAs:**
- Do not deprecate until the contract is renegotiated.
- Work with legal/business to update contract language to reference the replacement metric.

**Emergency deprecation (data source is gone):**
- Skip the deprecation window if the data source is permanently unavailable.
- Notify all consumers immediately with an explanation.
- Provide the best available alternative, even if imperfect.
