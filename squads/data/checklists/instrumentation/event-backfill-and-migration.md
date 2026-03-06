# Event Backfill and Migration Checklist

## Purpose

Guide safe migrations of tracking events -- renaming, restructuring, or replacing instrumentation -- while maintaining data continuity. This gate ensures backward compatibility, controlled backfills, and zero gaps in reporting during transitions.

---

## Checklist Items

### 1. Migration Scope Is Documented

- **Pass:** A migration document lists every event being changed, the before/after schemas, affected dashboards, affected downstream consumers, and the timeline with milestones.
- **Fail:** Migration is ad-hoc with no written scope, or affected consumers are unknown.

### 2. Dual-Emission Period Is Defined

- **Pass:** Both old and new event formats are emitted simultaneously for a defined overlap period (minimum 2 weeks or 2 release cycles). The end date for old format deprecation is communicated to all stakeholders.
- **Fail:** Old events are cut immediately, or no overlap period is planned.

### 3. Backfill Strategy Is Validated Before Execution

- **Pass:** The backfill query/script is tested on a sample (e.g., 1 day of data) and results are compared against the original data. Row counts, key metrics, and edge cases are verified.
- **Fail:** Backfill runs on full production data without prior validation, or no comparison is done.

### 4. Idempotency Is Guaranteed

- **Pass:** The backfill process can be re-run safely without creating duplicates. This is achieved via upsert logic, deduplication keys, or delete-and-reload patterns.
- **Fail:** Re-running the backfill doubles the data, or partial re-runs leave inconsistent state.

### 5. Historical Reporting Continuity Is Preserved

- **Pass:** Dashboards and reports that span the migration boundary show consistent trends. A unified view (via SQL UNION, view, or mapping table) bridges old and new event names.
- **Fail:** Charts show gaps, sudden drops, or spikes at the migration cutover point with no explanation.

### 6. Rollback Plan Exists

- **Pass:** If the new instrumentation is faulty, the old events can be re-enabled within one release cycle. Backfilled data can be reverted by deleting records tagged with the migration batch ID.
- **Fail:** No rollback path exists; reverting requires a full re-deploy or manual data surgery.

### 7. Stakeholder Sign-Off Before Deprecation

- **Pass:** Analytics, product, marketing, and engineering leads confirm they have migrated to the new event format before the old format is removed. Sign-off is recorded.
- **Fail:** Old events are deprecated unilaterally without verifying that all consumers have migrated.

### 8. Post-Migration Validation Runs Automatically

- **Pass:** For at least 2 weeks after cutover, automated checks compare new event volumes and key metric values against pre-migration baselines. Deviations above 5% trigger alerts.
- **Fail:** No post-migration monitoring exists; issues are discovered ad-hoc weeks later.

---

## Cross-References

- [Data Layer Contract QA](data-layer-contract-qa.md) -- Schema versioning directly supports safe migrations.
- [Metric Drift Detection](../analytics/metric-drift-detection.md) -- Post-migration metric shifts may be mistaken for real changes.
- [Data Debt Audit](../governance/data-debt-audit.md) -- Incomplete migrations become data debt.
