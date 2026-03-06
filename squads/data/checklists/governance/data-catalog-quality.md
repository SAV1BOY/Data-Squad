# Data Catalog Quality Checklist

## Purpose

Ensure the data catalog (or data dictionary) is accurate, complete, and actually used by the team. A data catalog that exists but is outdated or ignored is worse than no catalog -- it creates false confidence. This gate enforces catalog quality as an ongoing practice, not a one-time project.

---

## Checklist Items

### 1. Coverage Meets a Minimum Threshold

- **Pass:** At least 90% of tables in the production data warehouse that are queried more than once per week have a catalog entry. Coverage is measured automatically and reported monthly.
- **Fail:** The catalog covers a handful of well-known tables; the rest are undocumented.

### 2. Each Entry Contains Essential Metadata

- **Pass:** Every catalog entry includes: table/dataset name, description (what it represents and when to use it), owner, source system, update frequency, column descriptions for all columns, and data freshness SLA.
- **Fail:** Entries have only a name and a one-line description; column-level documentation is absent.

### 3. Lineage Is Documented for Critical Datasets

- **Pass:** For Tier-1 and Tier-2 datasets, upstream lineage (which source systems and transformations produce the data) and downstream lineage (which dashboards, models, and reports consume it) are documented and ideally auto-generated from the pipeline.
- **Fail:** No one knows where a table's data comes from or what breaks if the table is modified.

### 4. Freshness and Staleness Are Visible

- **Pass:** The catalog displays when each dataset was last updated and whether it met its freshness SLA. Stale datasets (not updated within the expected window) are flagged visually.
- **Fail:** Users query a table without knowing it has not been updated in 3 days due to a broken pipeline.

### 5. Data Quality Indicators Are Surfaced

- **Pass:** The catalog integrates with data quality checks (dbt tests, Great Expectations, or equivalent). Each table's latest quality status (pass/fail/warn) is visible in the catalog entry.
- **Fail:** Quality tests exist but their results are in a separate system; catalog users have no idea whether the data is trustworthy.

### 6. Catalog Accuracy Is Verified Periodically

- **Pass:** A quarterly audit samples 20+ catalog entries and verifies that descriptions, owners, and lineage are still accurate. Inaccurate entries are corrected, and the accuracy rate is tracked over time.
- **Fail:** The catalog was accurate when created but has drifted; column descriptions no longer match the actual data.

### 7. The Catalog Is Integrated Into Workflows

- **Pass:** Analysts and engineers reference the catalog during query development (e.g., catalog is searchable from the SQL editor or IDE). New team members are onboarded to the catalog in their first week.
- **Fail:** The catalog exists in a separate tool that nobody opens; people ask in Slack instead.

### 8. Ownership and Contribution Are Distributed

- **Pass:** Table owners are responsible for keeping their entries current. Catalog contribution is part of the definition of done for new data pipelines: no table goes to production without a catalog entry.
- **Fail:** One person maintains the entire catalog and it falls behind when they are busy.

---

## Cross-References

- [Metric Governance](metric-governance.md) -- Metric definitions in the catalog are governed by the metric governance process.
- [Documentation Discipline](documentation-discipline.md) -- Catalog quality is one aspect of overall documentation standards.
- [Data Debt Audit](data-debt-audit.md) -- Undocumented tables and missing lineage are forms of data debt.
