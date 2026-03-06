# Metric Governance Checklist

## Purpose

Establish ownership, change control, versioning, and single source of truth for every business metric. Metric governance prevents the "which number is right?" problem where three dashboards show three different values for the same metric because nobody owns the definition.

---

## Checklist Items

### 1. Every Key Metric Has a Designated Owner

- **Pass:** A named individual (not a team, not "analytics") owns each metric definition. The owner is responsible for: maintaining the definition, approving changes, investigating discrepancies, and communicating updates. Ownership is recorded in the metric catalog.
- **Fail:** No one owns the metric, or ownership is assigned to a team with no individual accountability.

### 2. Metric Definitions Are Documented in a Central Catalog

- **Pass:** Each metric entry includes: name, business definition (plain language), technical definition (SQL or calculation logic), data source, granularity, known limitations, and owner. The catalog is searchable and accessible to all stakeholders.
- **Fail:** Metric definitions live in scattered wiki pages, Slack messages, or individual notebooks.

### 3. A Single Source of Truth Exists for Each Metric

- **Pass:** There is one canonical location (table, view, or API endpoint) where each metric is computed. All dashboards and reports consume from this source. Duplicate calculations in other locations are flagged and removed.
- **Fail:** The same metric is calculated independently in 4 different dashboards with slightly different logic, producing different numbers.

### 4. Changes to Metric Definitions Follow a Review Process

- **Pass:** Any change to a metric definition (filter adjustment, denominator change, source swap) requires: a written proposal, impact assessment (which reports are affected), approval from the metric owner, and a communication to stakeholders before implementation.
- **Fail:** An analyst changes a WHERE clause in a dashboard query, and the metric silently shifts without anyone knowing.

### 5. Metric Versions Are Tracked

- **Pass:** When a metric definition changes, the previous version is preserved (in code, documentation, or the catalog). Historical data can be viewed under both the old and new definition for a transition period.
- **Fail:** Definitions are overwritten in place; there is no way to know what the metric meant 6 months ago.

### 6. Metric Discrepancies Are Escalated and Resolved

- **Pass:** When two sources show different values for the same metric, a documented triage process identifies the root cause (different definitions, different data sources, different time zones, caching lag). Resolution is recorded.
- **Fail:** Discrepancies are noticed in meetings, debated, and then forgotten without resolution.

### 7. Deprecated Metrics Are Formally Retired

- **Pass:** Metrics that are no longer relevant or have been superseded are marked as deprecated in the catalog. Dashboards using deprecated metrics display a warning. After a grace period, deprecated metrics are removed.
- **Fail:** The catalog grows indefinitely; nobody knows which metrics are current and which are zombies.

### 8. Governance Overhead Is Proportional to Metric Importance

- **Pass:** Tier-1 metrics (board-level KPIs) have full governance rigor. Tier-2 (team-level) have lighter governance. Exploratory or ad-hoc metrics are not burdened with governance until they are promoted. The tiering criteria are documented.
- **Fail:** Every metric requires the same heavyweight process, causing teams to avoid governance entirely, or no tiering exists and governance is inconsistently applied.

---

## Cross-References

- [Data Catalog Quality](data-catalog-quality.md) -- The metric catalog is a subset of the broader data catalog.
- [Documentation Discipline](documentation-discipline.md) -- Metric documentation standards align with overall doc standards.
- [Data Layer Contract QA](../instrumentation/data-layer-contract-qa.md) -- Instrumentation changes can break metric definitions.
