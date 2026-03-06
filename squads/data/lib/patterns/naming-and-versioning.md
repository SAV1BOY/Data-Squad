# Naming and Versioning Pattern

Standards for naming and versioning metrics, events, dashboards, and data artifacts. Covers when to version, how to communicate changes, and how to migrate consumers.

---

## Naming Conventions

### Metrics

Format: `{object}_{measure}_{qualifier}`

| Component  | Rules                            | Examples                          |
|------------|----------------------------------|-----------------------------------|
| object     | The entity being measured        | `user`, `order`, `session`        |
| measure    | The aggregation or calculation   | `count`, `rate`, `avg`, `sum`     |
| qualifier  | Scope or filter (optional)       | `daily`, `active`, `paid`, `7d`   |

**Examples:**
- `user_count_active_daily` — Count of active users per day.
- `order_revenue_sum_monthly` — Sum of order revenue per month.
- `session_duration_avg_7d` — Average session duration over a 7-day window.

**Rules:**
- Always snake_case.
- Never abbreviate ambiguously (`conv` could mean conversion or conversation).
- Prefix with domain if cross-domain: `marketing_lead_count`, `product_user_count`.

### Events

Format: `{verb}_{noun}` in past tense.

**Examples:**
- `viewed_page`
- `completed_purchase`
- `submitted_form`
- `started_onboarding`

See the event taxonomy for full details.

### Dashboards

Format: `{domain} - {purpose} ({audience})`

**Examples:**
- `Growth - Weekly Acquisition Review (Growth Team)`
- `Revenue - Executive Monthly Summary (Leadership)`
- `Product - Feature Adoption Tracker (PM Team)`

### Tables and Models

Format: `{layer}_{domain}_{entity}_{qualifier}`

| Layer   | Prefix  | Description                  |
|---------|---------|------------------------------|
| Staging | `stg_`  | Cleaned raw data             |
| Intermediate | `int_` | Joined/transformed      |
| Mart    | `mart_` | Business-ready               |
| Metric  | `mtr_`  | Aggregated metric tables     |

**Examples:**
- `stg_stripe_payments`
- `int_user_sessions_enriched`
- `mart_order_summary`
- `mtr_daily_active_users`

---

## Versioning

### When to Version

| Change Type                          | Version Bump | Example                                  |
|--------------------------------------|-------------|-------------------------------------------|
| Filter change (broadening/narrowing) | Minor       | Adding "exclude bots" filter              |
| Grain change                         | Major       | Daily to weekly aggregation               |
| Formula change                       | Major       | Changing from count to count distinct     |
| Source table change (same logic)     | Minor       | Migrating from legacy to new event table  |
| Adding a new dimension              | Minor       | Adding platform breakdown                 |
| Renaming without logic change        | Patch       | Fixing a typo in the metric name          |
| Complete redefinition                | Major       | Changing what "active" means              |

### Version Format

Use semantic versioning: `MAJOR.MINOR.PATCH`

- **MAJOR:** Breaking change. Downstream consumers must update.
- **MINOR:** Additive or non-breaking change. Consumers can adopt at their convenience.
- **PATCH:** Cosmetic or documentation-only change.

### Version Lifecycle

```
DRAFT --> v1.0.0 (Active) --> v1.1.0 (Active, minor update)
                                  |
                                  v
                          v2.0.0 (Active, breaking change)
                                  |
                          v1.1.0 moves to DEPRECATED
                                  |
                          (migration window: 30 days)
                                  |
                          v1.1.0 moves to RETIRED
```

### Migration Process

When a major version bump occurs:

1. **Announce:** Notify all downstream consumers via the data changelog (Slack channel, email digest, or data catalog notification).
2. **Dual-publish:** Run both old and new versions in parallel for the migration window (minimum 30 days for L0/L1 metrics, 14 days for L2/L3).
3. **Document differences:** Publish a comparison showing how the old and new versions differ, with example outputs.
4. **Track adoption:** Monitor which dashboards and reports still reference the old version.
5. **Deprecate:** After the migration window, mark the old version as deprecated. It still works but logs a warning.
6. **Retire:** After an additional 30 days with no consumers, remove the old version.

### Changelog

Maintain a changelog for every versioned artifact:

```markdown
## user_count_active_daily

### v2.0.0 (2026-02-01)
- BREAKING: Changed "active" definition from "any event" to "meaningful action" (excludes passive page views).
- Migration guide: [link]
- Old version available as user_count_active_daily_v1 until 2026-04-01.

### v1.1.0 (2025-11-15)
- Added platform dimension (web, ios, android).
- No breaking changes.

### v1.0.0 (2025-08-01)
- Initial definition.
```

---

## Dashboard Versioning

Dashboards are versioned more loosely:

- **Save a snapshot** before any major restructuring.
- **Name archived versions** with dates: `Growth - Weekly Review (archived 2026-01-15)`.
- **Never delete a dashboard** that has been shared in a report or decision document. Archive it instead.
- **Link to the latest version** from the archived version so viewers can find the current one.
