# Data Debt Audit Checklist

## Purpose

Systematically identify and prioritize data debt -- the accumulated cost of shortcuts, abandoned instrumentation, orphaned metrics, undocumented pipelines, and deferred quality fixes. Data debt, like technical debt, compounds silently until it causes a crisis. This gate makes it visible and manageable.

---

## Checklist Items

### 1. Broken Instrumentation Is Inventoried

- **Pass:** A scan identifies events that are defined in the tracking plan but no longer firing, events firing with incorrect schemas, and events that fire but are consumed by no dashboard or pipeline. Each item is classified as fix, deprecate, or investigate.
- **Fail:** Nobody knows which events are broken; issues are discovered only when someone queries the data and gets unexpected results.

### 2. Orphan Metrics Are Identified

- **Pass:** Metrics that appear in no active dashboard, report, or decision process are listed. The metric owner confirms whether each orphan should be retired or re-activated. Orphans without owners are default candidates for retirement.
- **Fail:** The metric catalog contains 200 metrics; 80 of them are not used by anyone but remain in the system.

### 3. Undocumented Pipelines Are Flagged

- **Pass:** Pipelines with no README, no inline comments, no catalog entry, and no owner are flagged. A priority score is assigned based on: downstream consumer count, data criticality, and bus factor (how many people understand it).
- **Fail:** A critical pipeline built by a former employee breaks, and no one understands its logic.

### 4. Data Quality Test Coverage Is Assessed

- **Pass:** The percentage of production tables covered by automated data quality tests (not-null, uniqueness, referential integrity, freshness) is measured. The target is 100% for Tier-1 tables and 80% for Tier-2. Gaps are prioritized.
- **Fail:** Quality tests exist for some tables but coverage is unknown; new tables ship without tests.

### 5. Deprecated But Still-Running Pipelines Are Identified

- **Pass:** Pipelines that produce data consumed by zero active users (verified via query logs and dashboard usage) are listed. Each is scheduled for decommission with a notification period for any hidden consumers.
- **Fail:** Deprecated pipelines consume compute resources and on-call attention indefinitely.

### 6. Schema Drift Is Detected

- **Pass:** Tables where the schema has drifted from its documented structure (new columns added without catalog update, column types changed, columns dropped) are identified by comparing the live schema against the catalog.
- **Fail:** The catalog says a table has 15 columns; it actually has 23, with no documentation for the extras.

### 7. Data Debt Is Prioritized by Impact

- **Pass:** Each debt item is scored on: frequency of downstream impact, severity of errors it causes, cost to fix, and risk of leaving it unfixed. A prioritized backlog is maintained alongside feature work.
- **Fail:** Data debt is tracked in a list that grows but is never prioritized or worked on.

### 8. Debt Reduction Is Scheduled and Tracked

- **Pass:** The team allocates a regular percentage of capacity (e.g., 15-20% of sprint time) to data debt reduction. Progress is tracked quarterly: number of items resolved, test coverage improvement, documentation gaps closed.
- **Fail:** Data debt work only happens during "tech debt sprints" that occur once a year, if at all.

---

## Cross-References

- [Metric Governance](metric-governance.md) -- Orphan metrics are a governance failure that becomes data debt.
- [Data Catalog Quality](data-catalog-quality.md) -- Undocumented pipelines and schema drift are catalog quality issues.
- [Event Backfill and Migration](../instrumentation/event-backfill-and-migration.md) -- Incomplete migrations are a major source of data debt.
