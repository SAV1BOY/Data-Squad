# Single Source of Truth Pattern

How to establish and maintain a single, authoritative definition for every metric, dimension, and business term.

---

## The Problem

Without a single source of truth (SSOT), organizations develop competing metric definitions across teams. Marketing reports "500K users," Product reports "480K users," and Finance reports "520K users" — all technically correct under their own definitions. This erodes trust in data and wastes time reconciling.

## Core Principles

1. **One definition per metric.** If two teams need different cuts of the same concept, create explicitly named variants (e.g., `active_users_product` vs `active_users_marketing`) rather than letting ambiguity persist.
2. **Definitions live in code, not in slides.** The canonical definition is the one in the transformation layer (dbt model, SQL view, metric store), not the one in a presentation.
3. **Ownership is singular.** Every metric has exactly one owner who can approve definition changes.
4. **Changes are versioned.** When a definition changes, the old version remains accessible for historical comparison.

## Architecture

### Layer 1: Raw Data (Ingestion)

- Data arrives from source systems (events, databases, APIs).
- No business logic is applied here. Raw data is immutable.
- Schema is documented but definitions are deferred to the transformation layer.

### Layer 2: Transformation (Business Logic)

- All business logic lives here: filters, aggregations, joins, calculations.
- This is the SSOT layer. Every metric is defined once in a transformation model.
- Tools: dbt models, SQL views, or a metrics/semantic layer (e.g., dbt metrics, Looker LookML, MetricFlow).

### Layer 3: Consumption (Dashboards, Reports, Ad-hoc)

- Dashboards and reports read from the transformation layer.
- No business logic in dashboards. Dashboards are visualization only.
- If a dashboard needs a custom calculation, push it back to Layer 2.

## Implementation Checklist

### Establishing SSOT

- [ ] Catalog all metrics currently in use across the organization.
- [ ] Identify conflicts: same name with different definitions, or different names for the same concept.
- [ ] For each conflict, convene the owning teams and agree on one canonical definition.
- [ ] Document the canonical definition in the transformation layer with a clear comment block.
- [ ] Register the metric in a metric catalog (spreadsheet, dbt docs, data catalog tool).
- [ ] Assign an owner to each metric.

### Maintaining SSOT

- [ ] All new metrics must go through a review process before being added to the transformation layer.
- [ ] Changes to existing metric definitions require a pull request with the owner's approval.
- [ ] Dashboards are audited quarterly to ensure they reference the SSOT layer, not raw tables.
- [ ] Ad-hoc queries that define new business logic are flagged for promotion to the transformation layer.

## Metric Registry Schema

Every metric in the registry should have:

| Field              | Description                                   |
|--------------------|-----------------------------------------------|
| metric_name        | Canonical name (snake_case)                   |
| display_name       | Human-readable name                           |
| definition         | Plain-language description                    |
| formula            | SQL or pseudocode formula                     |
| source_model       | The transformation model that produces it     |
| owner              | Person or team                                |
| tier               | L0/L1/L2/L3 (see KPI tree)                   |
| grain              | Time grain (daily, weekly, monthly)           |
| dimensions         | Supported breakdowns (region, platform, etc.) |
| version            | Current version number                        |
| created_date       | When the metric was first defined             |
| last_modified_date | When the definition last changed              |

## Common Failure Modes

| Failure Mode                          | Symptom                                   | Fix                                           |
|---------------------------------------|-------------------------------------------|-----------------------------------------------|
| Dashboard-level business logic        | Two dashboards show different numbers for the same metric | Move all logic to transformation layer |
| Spreadsheet definitions               | Definitions diverge from code over time   | Generate documentation from code, not manually |
| No ownership                          | Nobody approves or rejects definition changes | Assign owners; block merges without approval |
| Copy-paste SQL                        | Analysts copy queries and modify filters  | Provide parameterized models or saved queries  |
| Metric proliferation                  | 200+ metrics with no hierarchy            | Apply KPI tree; deprecate unused metrics       |

## Governance Cadence

| Activity                              | Frequency  | Participants                    |
|---------------------------------------|------------|----------------------------------|
| Metric definition review              | At creation| Metric owner + data team         |
| Dashboard audit (logic in SSOT?)      | Quarterly  | Data team                        |
| Metric usage review (is it used?)     | Quarterly  | Data team + stakeholders         |
| Metric conflict resolution            | As needed  | Involved teams + data team       |
| Full metric catalog refresh           | Semi-annual| Data team + all metric owners    |
