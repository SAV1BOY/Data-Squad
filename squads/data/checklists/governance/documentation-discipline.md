# Documentation Discipline Checklist

## Purpose

Enforce minimum documentation standards that maximize knowledge transfer while minimizing bureaucratic overhead. The goal is not comprehensive documentation of everything -- it is ensuring that the right things are documented well enough that someone new can understand the system without being a detective.

---

## Checklist Items

### 1. A "Must Document" List Exists

- **Pass:** The team has an explicit, short list of what must be documented: metric definitions, pipeline architecture, data source configurations, access procedures, incident response protocols, and onboarding guides. Anything not on the list is optional.
- **Fail:** Documentation expectations are vague ("document your work"), leading to either over-documentation or nothing at all.

### 2. Documentation Lives Next to the Code or System

- **Pass:** Pipeline documentation is in the repo (README, inline comments, dbt descriptions). Dashboard documentation is in the dashboard description field. Architecture docs are in the team wiki linked from the repo. Documentation is discoverable from the artifact it describes.
- **Fail:** Documentation is in a random Confluence space that requires three clicks and a search to find.

### 3. Each Document Has an Owner and a Review Date

- **Pass:** Every mandatory document has an assigned owner and a "last reviewed" date. Documents not reviewed within 6 months are flagged for refresh. Ownership transfers when people change roles.
- **Fail:** Documents were written once and never updated; they describe a system that no longer exists.

### 4. Minimum Content Standards Are Defined

- **Pass:** Each document type has a lightweight template: pipelines need purpose, source, destination, schedule, dependencies, and failure handling. Dashboards need audience, metric definitions, and data freshness. Templates exist to reduce the effort of writing.
- **Fail:** Documentation quality varies wildly; some docs are thorough, others are a single sentence.

### 5. Onboarding Documentation Is Tested With New Hires

- **Pass:** Every new team member is asked to follow the onboarding documentation and report gaps or confusing sections. Their feedback is used to improve the docs within 2 weeks of their start date.
- **Fail:** Onboarding docs exist but new hires rely entirely on pairing with a colleague because the docs are outdated.

### 6. Documentation Is Part of the Definition of Done

- **Pass:** Pull requests that create new pipelines, metrics, or data sources are not merged without the corresponding documentation update. This is enforced by code review norms, not by automated blocking (to avoid creating resentment).
- **Fail:** Documentation is a separate task that always gets deprioritized in favor of the next feature.

### 7. Over-Documentation Is Actively Discouraged

- **Pass:** The team recognizes that documenting ephemeral analyses, one-off queries, or experimental code is waste. A clear boundary exists between permanent infrastructure (must document) and exploratory work (document only if it becomes permanent).
- **Fail:** Documentation requirements apply to everything equally, causing teams to spend time documenting throwaway work or to stop documenting entirely out of fatigue.

### 8. Search and Discoverability Are Prioritized

- **Pass:** Documentation uses consistent naming, tagging, and folder structure. A new team member can find the relevant doc within 2 minutes using search. Key docs are linked from a single index page.
- **Fail:** 50 well-written documents exist but no one can find them because they are scattered across 4 tools with no index.

---

## Cross-References

- [Data Catalog Quality](data-catalog-quality.md) -- The data catalog is the most critical documentation artifact.
- [Metric Governance](metric-governance.md) -- Metric documentation is a governed subset of overall docs.
- [Data Debt Audit](data-debt-audit.md) -- Missing documentation is a form of data debt.
