# Analytics Governance Standard

## Purpose

This document defines the governance framework for analytics assets across the organization. It ensures that data products (dashboards, metrics, experiments, pipelines) have clear ownership, quality standards, and lifecycle processes.

## Ownership Model

### Roles

| Role | Responsibility |
|------|---------------|
| **Data Owner** | Business stakeholder accountable for the data domain. Approves metric definitions and access policies. |
| **Data Steward** | Ensures data quality, resolves discrepancies, maintains documentation. Typically an analyst or analytics engineer. |
| **Dashboard Maintainer** | Keeps dashboards accurate, removes stale charts, responds to breakage alerts. |
| **Metric Owner** | Defines, documents, and defends the canonical definition of a metric. Resolves conflicting interpretations. |
| **Pipeline Owner** | Responsible for data freshness, schema changes, and incident response for a given pipeline. |

### Ownership Assignment Rules

1. Every metric, dashboard, and pipeline must have exactly one owner (person, not team).
2. Ownership transfers require a documented handoff with the receiving party confirming understanding.
3. Orphaned assets (owner left the company, changed roles) must be reassigned within 10 business days.
4. Ownership is recorded in the data catalog and reviewed quarterly.

## Quality Standards

### Metric Quality

- Every metric must have a written definition that includes: name, formula, data source, grain, and known limitations.
- Metrics must be validated against at least one independent source before promotion to "certified" status.
- Certified metrics are the only ones allowed on executive dashboards and external reports.
- Any metric discrepancy greater than 2% from the source of truth triggers a quality investigation.

### Dashboard Quality

- Dashboards must load in under 10 seconds for 95th percentile users.
- Every chart must have a clear title, axis labels, and a source annotation.
- Dashboards must not contain more than 12 tiles. If more context is needed, link to a detail dashboard.
- Stale dashboards (no views in 90 days) are flagged for archival. Owner has 14 days to justify retention.

### Pipeline Quality

- All production pipelines must have at least one freshness test and one row-count anomaly test.
- Schema changes must be communicated to downstream consumers at least 48 hours before deployment.
- Pipeline SLAs are defined per tier:
  - **Tier 1 (executive, billing, compliance):** Data fresh within 1 hour. Incident response within 30 minutes.
  - **Tier 2 (operational dashboards):** Data fresh within 4 hours. Incident response within 2 hours.
  - **Tier 3 (exploratory, ad-hoc):** Best effort. No SLA.

## Processes

### Metric Approval Process

1. Proposer submits a metric definition using the standard template (see `metric-definition-schema.json`).
2. Data Steward reviews for consistency with existing metrics.
3. Metric Owner (domain) reviews for business accuracy.
4. If approved, the metric is added to the catalog with "draft" status.
5. After 2 weeks of validation, status is promoted to "certified."

### Dashboard Publication Process

1. Author creates dashboard in the designated BI tool following the dashboard design standard.
2. Peer review by another analyst (check calculations, visual clarity, data freshness).
3. Business stakeholder sign-off on the metrics displayed.
4. Dashboard is published to the appropriate workspace with proper access controls.

### Incident Response

1. Data quality issues are reported via the dedicated Slack channel or ticketing system.
2. Pipeline Owner triages within the SLA for the asset tier.
3. Root cause analysis is documented for all Tier 1 incidents.
4. Post-mortem is shared with the analytics team within 5 business days.

### Quarterly Review

- All certified metrics are reviewed for continued relevance and accuracy.
- Dashboard usage is analyzed; low-usage dashboards are candidates for deprecation.
- Ownership records are audited and updated.
- Quality SLA adherence is reported to leadership.

## Access Control

- Data access follows the principle of least privilege.
- PII and sensitive data require explicit approval from the Data Owner and compliance team.
- Dashboard workspaces are organized by department with row-level security where applicable.
- Service accounts used by pipelines must be audited semi-annually.

## Data Catalog Requirements

- All production tables, metrics, and dashboards must be registered in the data catalog.
- Catalog entries must include: description, owner, freshness SLA, lineage, and tags.
- Lineage must be traceable from source system to final dashboard.

## Change Management

- Breaking changes to shared metrics require a 2-week deprecation notice.
- Deprecated metrics remain available (marked as deprecated) for 30 days before removal.
- All changes to certified metrics must be logged with a reason and approved by the Metric Owner.

## Compliance

- Analytics implementations must comply with LGPD and GDPR as applicable (see separate privacy notes).
- Consent status must be checked before firing tracking events for users in regulated jurisdictions.
- Data retention policies must be enforced at the pipeline level, not just the storage level.

## Escalation Path

1. Individual contributor resolves within their domain.
2. Data Steward mediates cross-team metric conflicts.
3. Head of Analytics makes final decisions on governance disputes.
4. VP of Data escalation only for compliance or executive-level conflicts.
