# Governance Layer Framework

## Overview

The Governance Layer provides the control mechanisms that ensure the entire data stack operates with integrity, consistency, and accountability. It encompasses metric ownership, version control for definitions, data quality standards, access controls, privacy compliance, and the organizational processes that maintain trust in data over time.

Governance is not bureaucracy. Bureaucracy creates process for its own sake; governance creates process to prevent the specific failure modes that erode data trust. For data squads, the governance layer is what makes the difference between a data practice that scales and one that collapses under its own weight as the organization grows.

## Origin

Data governance as a discipline predates the modern data stack, originating in regulatory compliance (financial reporting, healthcare records) and enterprise data management (master data management, data stewardship). The modern incarnation integrates these traditions with the agility requirements of product analytics, the scale challenges of cloud data platforms, and the privacy demands of GDPR, CCPA, and emerging regulations.

The evolution from heavyweight governance (multi-year MDM implementations) to lightweight governance (code-based policies, automated quality checks, self-service with guardrails) reflects the data industry's learning that governance must be embedded in workflows, not bolted on as an afterthought.

## Key Concepts

### Metric Ownership

Every metric needs a named owner -- a person or team responsible for:

- The accuracy of the metric definition
- The quality of the underlying data
- Reviewing and approving changes to the definition
- Responding to questions and issues
- Periodically assessing whether the metric is still relevant

Ownership without accountability is theater. Owners must have the authority and incentive to maintain their metrics, not just the title.

### Version Control and Change Management

Metric definitions, data models, and pipeline configurations should be version-controlled:

- **Definitions in code** -- Store metric definitions as code (dbt models, LookML, SQL files) in version control. Changes go through code review.
- **Change logs** -- Every change to a metric definition, data model, or pipeline is logged with the date, author, rationale, and impact assessment.
- **Backward compatibility** -- When a metric definition changes, provide the previous version alongside the new one for a transition period. Breaking changes require explicit communication.
- **Migration paths** -- When retiring a metric, document the replacement and provide a migration guide for consumers.

### Data Quality Standards

Codify data quality expectations:

- **Tier 1 metrics (company KPIs)** -- Highest quality bar. Automated quality tests, manual review, SLA guarantees for freshness and accuracy. Issues are treated as P1 incidents.
- **Tier 2 metrics (team metrics)** -- Automated quality tests, SLA for freshness. Issues are treated as P2 incidents.
- **Tier 3 metrics (exploratory)** -- Basic quality checks. Best-effort freshness. Issues are logged but not escalated.

This tiered approach focuses governance effort where it matters most while avoiding the trap of applying the same standard to every metric.

### Access Control

Control who can access what data:

- **Role-based access** -- Define roles (analyst, manager, executive, engineer) with appropriate data access levels.
- **Sensitive data classification** -- Classify data by sensitivity (public, internal, confidential, restricted). Apply controls based on classification.
- **PII handling** -- Personally identifiable information requires specific controls: encryption, access logging, anonymization for analytical use, and deletion capability.
- **Audit logging** -- Log who accessed what data and when. Not for surveillance, but for compliance and incident investigation.

### Privacy Compliance

Privacy governance is non-negotiable:

- **Consent management** -- Track and enforce user consent for data collection and use. Different jurisdictions have different requirements.
- **Data minimization** -- Collect only what is needed. Store only what is justified. Delete when retention periods expire.
- **Right to deletion** -- Implement processes to delete user data upon request, across all systems.
- **Data processing agreements** -- Ensure third-party tools and vendors comply with the same privacy standards.
- **Privacy impact assessments** -- Conduct assessments for new data collection, new third-party integrations, and new use cases for existing data.

### Incident Management

Data quality incidents need a structured response:

1. **Detection** -- Automated monitoring, user reports, or scheduled audits identify an issue.
2. **Classification** -- Determine severity based on the tier of affected metrics and the breadth of impact.
3. **Communication** -- Notify affected stakeholders. For Tier 1 issues, communicate immediately and broadly.
4. **Resolution** -- Fix the root cause, not just the symptom. Reprocess affected data if necessary.
5. **Post-mortem** -- Document what happened, why, how it was detected, how it was fixed, and what will prevent recurrence.

### Governance Cadence

Governance requires regular rhythms:

- **Weekly** -- Data quality review (automated test results, open incidents)
- **Monthly** -- Metric health review (are definitions current? Are owners responsive? Are there new metrics needing governance?)
- **Quarterly** -- Governance retrospective (what is working, what is not, what needs to change)
- **Annually** -- Privacy audit, access control review, metric taxonomy cleanup

### Documentation Standards

All governance artifacts should be documented:
- Metric registry (definitions, owners, tiers, change history)
- Data catalog (tables, columns, descriptions, lineage)
- Policy documents (access control, privacy, quality standards)
- Runbooks (incident response procedures, common troubleshooting)
- Decision records (governance board decisions and rationale)

Documentation that is not maintained is worse than no documentation because it creates false confidence. Build maintenance into the governance cadence.

## Application to Data Squad

### Lightweight Governance Starter Kit

For organizations just beginning governance, start with:
1. A metric registry with definitions and owners for the top 10 metrics
2. Automated quality tests for Tier 1 metrics
3. A monthly governance review meeting
4. Basic access controls aligned with data sensitivity

Expand from there based on need, not aspiration.

### Governance as Code

Where possible, encode governance policies as automated checks:
- dbt tests for data quality
- Schema validation for pipeline inputs
- Automated access control via infrastructure as code
- CI/CD checks that enforce naming conventions and documentation requirements

Governance-as-code scales better than governance-as-meetings.

### Data Stewardship Network

Identify data stewards across the organization -- people in business teams who care about data quality and can serve as first-line support for data questions in their domain. The data squad cannot govern everything alone; stewards extend governance reach.

### Metric Deprecation Process

Establish a clear process for deprecating metrics:
1. Identify the metric for deprecation (unused, replaced, or misleading)
2. Notify all known consumers
3. Provide a migration path to the replacement metric
4. Run both metrics in parallel for a transition period
5. Remove the deprecated metric and update all documentation

### Trust Score

Develop a "trust score" for data assets that combines quality test results, freshness compliance, documentation completeness, and ownership status. Display the trust score alongside data in BI tools so consumers can assess reliability at a glance.

### Regulatory Readiness

Maintain readiness for regulatory inquiries by documenting data lineage, retention policies, consent records, and processing purposes. Scrambling to compile this information during an audit is stressful and error-prone.

## Pitfalls

### Governance as Gatekeeping

If governance slows teams to a crawl, they will bypass it. Design governance to enable, not obstruct. Fast-track processes for low-risk changes, and reserve heavy review for high-impact changes.

### All Governance, No Value

Investing heavily in governance before the data team is delivering value. Governance should grow alongside analytical capability, not precede it. Build the minimum governance needed to support current operations and expand as the practice matures.

### Documentation Graveyard

Governance documentation that is written once and never updated. If the governance cadence does not include documentation review and update, documentation will decay.

### Ignoring Cultural Governance

Formal processes are necessary but insufficient. Cultural governance -- the shared understanding of how data should be treated, the norm of questioning data before acting on it, the habit of checking definitions before building dashboards -- is equally important and cannot be automated.

### Over-Centralization

Concentrating all governance in the data team creates a bottleneck and reduces organizational ownership. Distribute governance responsibilities through stewardship networks and self-service guardrails.

## Cross-References

- **definition-layer.md** -- Governance enforces the standards defined in the definition layer
- **collection-layer.md** -- Data quality and freshness SLAs are governance concerns for the collection layer
- **instrumentation-layer.md** -- Instrumentation quality governance prevents data capture errors
- **decision-layer.md** -- Decision governance ensures insights are acted upon and outcomes are tracked
- **campbell-law-framework.md** -- Governance processes should account for the corruption dynamics Campbell describes
- **davenport-competing-on-analytics.md** -- Governance maturity is a prerequisite for advancing on Davenport's DELTA model
- **kahneman-noise-framework.md** -- Governance structures operationalize decision hygiene practices

---

## Used By

| Task | Agents | Path |
|------|--------|------|
| metric-governance-review | data-chief, avinash-kaushik | `tasks/review/metric-governance-review.md` |
| quarterly-data-review | data-chief | `tasks/operations/quarterly-data-review.md` |
| data-pipeline-health-check | avinash-kaushik, data-chief | `tasks/operations/data-pipeline-health-check.md` |
| dashboard-deprecation | avinash-kaushik, data-chief | `tasks/operations/dashboard-deprecation.md` |
| metric-sunset | data-chief | `tasks/definition/metric-sunset.md` |
| privacy-impact-assessment | data-chief, avinash-kaushik | `tasks/operations/privacy-impact-assessment.md` |

**Workflows:** metric-deprecation-workflow, quarterly-data-review
