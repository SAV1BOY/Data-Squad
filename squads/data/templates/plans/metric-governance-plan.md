# Metric Governance Plan

> Use this template to establish or audit governance over the company's metric ecosystem.
> Covers registry setup, ownership, review cadence, change management, and quality standards.

---

## Plan Overview [REQUIRED]

**Plan ID:** [MG-YYYY-NNN]
**Owner:** [Name, Role]
**Created:** [YYYY-MM-DD]
**Target Completion:** [YYYY-MM-DD]
**Status:** [Planning / Active / Complete]
**Scope:** [e.g., "All company KPIs" or "Product analytics metrics"]

---

## 1. Current State Assessment [REQUIRED]

### Metric Landscape

| Dimension                     | Current State                            |
|-------------------------------|------------------------------------------|
| Total metrics in use          | [e.g., "~120 across dashboards"]        |
| Metrics with formal definitions | [e.g., "~30 (25%)"]                   |
| Metrics with assigned owners  | [e.g., "~20 (17%)"]                    |
| Known definition conflicts    | [e.g., "8 metrics with competing definitions"] |
| Metric registry exists?       | [Yes / No / Partial]                    |
| Last audit date               | [e.g., "Never" or "YYYY-MM-DD"]        |

### Key Problems to Solve

- [e.g., "Multiple teams define 'churn rate' differently"]
- [e.g., "No process for introducing or retiring metrics"]
- [e.g., "Dashboard sprawl with unmaintained metrics"]

---

## 2. Metric Registry Setup [REQUIRED]

### Registry Structure

| Field                    | Description                              | Required? |
|--------------------------|------------------------------------------|-----------|
| Metric Name              | [Human-readable name]                    | Yes       |
| Metric ID                | [Unique identifier, e.g., "metric_churn_gross"] | Yes |
| Definition               | [Precise formula or calculation]         | Yes       |
| Business Context         | [What this metric measures and why it matters] | Yes  |
| Owner                    | [Person accountable for this metric]     | Yes       |
| Data Source               | [Table, view, or system of record]       | Yes       |
| Granularity              | [e.g., "Daily / Weekly / Monthly"]       | Yes       |
| Segments                 | [Available breakdowns]                   | No        |
| Tier                     | [L1 (KPI) / L2 (Operational) / L3 (Diagnostic)] | Yes |
| Status                   | [Active / Deprecated / Proposed]         | Yes       |
| Last Reviewed            | [Date of last definition review]         | Yes       |

### Registry Location
**Tool:** [e.g., "Notion / Confluence / dbt docs / Custom internal tool"]
**Link:** [URL]
**Access:** [e.g., "All employees (read) / Data team (edit)"]

---

## 3. Ownership Assignments [REQUIRED]

### Ownership Model

| Role                     | Responsibility                           |
|--------------------------|------------------------------------------|
| Metric Owner             | [e.g., "Accountable for definition accuracy and business relevance"] |
| Technical Steward        | [e.g., "Maintains data pipeline and ensures data quality"] |
| Governance Lead          | [e.g., "Oversees registry, facilitates reviews, manages change process"] |

### Tier-Based Ownership

| Tier   | Description               | Owner Level                    | Review Cadence |
|--------|---------------------------|--------------------------------|----------------|
| L1     | Company KPIs              | [e.g., "VP / C-level"]        | [e.g., "Quarterly"] |
| L2     | Operational metrics       | [e.g., "Department head / PM"]| [e.g., "Quarterly"] |
| L3     | Diagnostic / exploratory  | [e.g., "Analyst / IC"]        | [e.g., "Semi-annually"] |

---

## 4. Review Cadence [REQUIRED]

| Review Type              | Frequency        | Participants                   | Output                    |
|--------------------------|------------------|--------------------------------|---------------------------|
| Full registry audit      | [e.g., "Quarterly"]| [e.g., "Data team + metric owners"]| [Updated registry]    |
| L1 KPI review            | [e.g., "Monthly"]  | [e.g., "Exec team + data lead"]   | [KPI health report]   |
| New metric proposal review| [e.g., "Bi-weekly"]| [e.g., "Governance lead + requestor"]| [Approve/reject decision]|
| Sunset review            | [e.g., "Quarterly"]| [e.g., "Data team"]               | [Sunset candidates list]|

---

## 5. Change Management [REQUIRED]

### Process for Metric Changes

| Change Type              | Process                                  | Approver                  |
|--------------------------|------------------------------------------|---------------------------|
| New metric proposal      | [e.g., "Submit metric proposal form, reviewed bi-weekly"] | [Role] |
| Definition change        | [e.g., "RFC with impact analysis, 1-week comment period"] | [Role] |
| Metric deprecation       | [e.g., "Sunset notice template, 30-day migration window"] | [Role] |
| Owner change             | [e.g., "Update registry, notify stakeholders"]            | [Role] |

### Change Communication

| Audience                 | Notification Method            | Timing                   |
|--------------------------|--------------------------------|--------------------------|
| Metric consumers         | [e.g., "Slack #metrics-updates"]| [e.g., "At proposal"]  |
| Dashboard maintainers    | [e.g., "Email + Jira ticket"]  | [e.g., "At approval"]  |
| Exec stakeholders        | [e.g., "Weekly report note"]   | [e.g., "At deployment"]|

---

## 6. Quality Standards [REQUIRED]

| Standard                 | Requirement                              | Validation Method        |
|--------------------------|------------------------------------------|--------------------------|
| Definition clarity       | [e.g., "Formula must be unambiguous and reproducible"] | [Peer review]    |
| Source of truth          | [e.g., "Each metric has exactly one source table"]     | [Registry audit] |
| Freshness               | [e.g., "L1 metrics refreshed within 4 hours"]          | [Automated monitoring] |
| Accuracy                | [e.g., "Must reconcile to finance actuals within 1%"]  | [Monthly reconciliation]|
| Documentation            | [e.g., "All required registry fields populated"]       | [Registry completeness check]|

---

## 7. Implementation Timeline

| Phase                    | Activities                               | Target Date    | Status  |
|--------------------------|------------------------------------------|----------------|---------|
| Phase 1: Audit           | [Inventory all metrics, identify conflicts]| [YYYY-MM-DD]  | [ ]     |
| Phase 2: Registry build  | [Set up registry, populate L1 metrics]    | [YYYY-MM-DD]  | [ ]     |
| Phase 3: Ownership       | [Assign owners for all L1 and L2 metrics] | [YYYY-MM-DD]  | [ ]     |
| Phase 4: Process launch  | [Launch change management process]        | [YYYY-MM-DD]  | [ ]     |
| Phase 5: Ongoing         | [Begin review cadence, monitor compliance]| [YYYY-MM-DD]  | [ ]     |

---

## 8. Success Criteria

- [ ] 100% of L1 metrics have formal definitions and assigned owners
- [ ] Metric registry is accessible and up to date
- [ ] Change management process is documented and followed
- [ ] First quarterly audit completed with findings addressed
- [ ] Zero unresolved definition conflicts for L1 metrics
