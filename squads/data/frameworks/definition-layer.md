# Definition Layer Framework

## Overview

The Definition Layer is the foundational layer of the data stack. Before anything can be instrumented, collected, analyzed, or visualized, it must be defined. This layer governs the creation and maintenance of metric definitions, event taxonomies, naming conventions, ownership assignments, and the semantic layer that gives data meaning across the organization.

Without a rigorous definition layer, every subsequent layer inherits ambiguity. Two teams using different definitions of "active user" will produce conflicting dashboards, contradictory analyses, and mutual distrust. The definition layer prevents this by establishing a single source of truth for what things mean, who owns them, and how they should be interpreted.

## Origin

The concept of a formal definition layer emerged from the painful experience of organizations scaling their data infrastructure without semantic governance. Companies like Airbnb (with their Minerva metrics layer), Spotify (with their metric definitions platform), and Facebook (with their metric ontology) invested heavily in definition layers after discovering that tool proliferation without semantic alignment created more confusion than clarity.

The academic foundations draw from information science (ontologies and taxonomies), database theory (semantic data models), and organizational design (ownership and accountability frameworks).

## Key Concepts

### Metric Definitions

Every metric in the organization must have a formal definition that includes:

- **Name** -- Clear, unambiguous, following naming conventions. Avoid abbreviations that could mean different things to different teams.
- **Description** -- Plain-language explanation of what the metric measures and why it matters.
- **Formula** -- The exact calculation, including numerator, denominator, filters, and edge case handling.
- **Data source** -- Which tables, events, or systems provide the input data.
- **Granularity** -- Time grain (daily, weekly, monthly), entity grain (per user, per account, per session).
- **Owner** -- The person or team responsible for the definition's accuracy and relevance.
- **Tier** -- Priority classification (Tier 1: company-level KPI; Tier 2: team-level metric; Tier 3: exploratory metric).
- **Known limitations** -- What the metric does not capture, known biases, caveats.
- **Related metrics** -- Counter-metrics, upstream/downstream metrics, alternatives.

### Event Taxonomy

Events are the atomic units of behavioral data. The event taxonomy defines:

- **Event naming convention** -- A consistent pattern such as `object_action` (e.g., `button_clicked`, `page_viewed`, `subscription_started`). Consistency enables discovery and reduces ambiguity.
- **Event properties** -- The attributes captured with each event (user_id, timestamp, page_url, device_type). Standardize property names across events.
- **Event hierarchy** -- How events relate to each other. A `purchase_completed` event may encompass `cart_updated`, `checkout_started`, and `payment_processed` sub-events.
- **Event lifecycle** -- Draft, active, deprecated, retired. Events that are no longer relevant should be deprecated with a clear migration path, not silently deleted.

### Naming Conventions

Naming conventions span metrics, events, dimensions, and data objects. Effective conventions are:

- **Consistent** -- Follow the same pattern everywhere. If metrics use snake_case, never use camelCase.
- **Descriptive** -- The name should convey meaning without needing to look up the definition. `monthly_active_users` is better than `mau`.
- **Scalable** -- The convention should accommodate growth. Prefixes like `product_`, `marketing_`, `finance_` help organize a growing taxonomy.
- **Versioned** -- When definitions change, version them. `conversion_rate_v2` makes it clear this is an updated definition.

### Ownership Model

Every metric, event, and dimension needs an owner. Ownership means:

- Responsibility for the definition's accuracy
- Authority to approve changes
- Accountability for data quality issues
- Obligation to review and update periodically

Ownership can follow team boundaries (the Growth team owns acquisition metrics), functional boundaries (Marketing owns attribution metrics), or data domain boundaries (the Revenue data domain owns all revenue-related metrics).

### Semantic Layer

The semantic layer translates raw data into business concepts. It sits between the data warehouse and the tools that consumers use (BI tools, notebooks, applications). The semantic layer enforces:

- Consistent metric calculations regardless of which tool is used
- Consistent dimension definitions (what counts as a "new user" is the same everywhere)
- Access controls (who can see which metrics)
- Documentation (definitions travel with the data)

Modern implementations include dbt metrics, Looker's LookML, Minerva, MetricFlow, and similar tools.

### Metric Lifecycle

Metrics have a lifecycle:
1. **Proposed** -- Someone identifies a need for a new metric. The definition is drafted.
2. **Reviewed** -- The data team and stakeholders review the definition for clarity, accuracy, and necessity.
3. **Active** -- The metric is approved, instrumented, and available for use.
4. **Monitored** -- The metric is actively tracked for data quality and relevance.
5. **Deprecated** -- The metric is no longer the recommended measure. Users are directed to a replacement.
6. **Retired** -- The metric is removed from production.

## Application to Data Squad

### Metric Registry

Build and maintain a central metric registry accessible to the entire organization. This is the single source of truth for what metrics mean. The registry should be searchable, versioned, and integrated with BI tools so that definitions appear alongside data.

### Definition Review Process

Establish a lightweight but mandatory review process for new metrics and events. A new metric should be reviewed for: clarity of definition, uniqueness (does a similar metric already exist?), naming convention compliance, ownership assignment, and tier classification.

### Taxonomy Governance Board

Form a cross-functional governance board that meets regularly (monthly or quarterly) to review proposed metrics, resolve definition conflicts, deprecate stale metrics, and ensure the taxonomy remains coherent as the organization evolves.

### Self-Service Definition Access

Make metric definitions accessible within the tools people use. Embed definitions in dashboard tooltips, BI tool descriptions, and data catalog entries. If a stakeholder has to leave their tool to find a definition, they will not look.

### Definition Debt Tracking

Track "definition debt" -- metrics that lack formal definitions, events with inconsistent naming, dimensions with ambiguous meanings. Reduce this debt systematically alongside technical debt.

### Change Management for Definition Changes

When a metric definition changes, the change must be communicated clearly to all consumers. This includes: what changed, why, the effective date, impact on historical comparisons, and the migration path.

## Pitfalls

### Definition Without Adoption

A beautifully documented metric registry that nobody uses is waste. Adoption requires integration into daily workflows, not just publication on an internal wiki. Meet people where they work.

### Over-Engineering the Taxonomy

A taxonomy with 500 events and 200 metrics before the company has product-market fit is premature. Start with the 20-30 metrics that actually drive decisions and expand incrementally.

### Governance as Bottleneck

If the review process takes weeks, teams will bypass it. Keep the process lightweight for Tier 3 metrics and thorough for Tier 1 metrics. Not every metric needs a governance board review.

### Ignoring Historical Continuity

Changing a metric definition breaks historical comparisons. Always provide a transition period where both old and new definitions are available, and document the impact on trend analysis.

### Naming Wars

Teams will fight over names. Establish conventions early and apply them consistently. When disagreements arise, the convention is the tiebreaker, not seniority or volume.

## Cross-References

- **instrumentation-layer.md** -- Definitions must be instrumented correctly; the definition layer feeds directly into instrumentation
- **governance-layer.md** -- Governance processes enforce definition standards and lifecycle management
- **cagan-inspired-metrics.md** -- Cagan's outcome metrics need rigorous definitions to be meaningful
- **goodhart-law-framework.md** -- Counter-metrics should be defined alongside primary metrics
- **campbell-law-framework.md** -- The indicator-vs-target distinction should be part of the definition
- **kahneman-noise-framework.md** -- Standardized definitions reduce noise in data interpretation
