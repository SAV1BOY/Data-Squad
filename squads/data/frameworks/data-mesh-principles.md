# Data Mesh Principles

> Source: Zhamak Dehghani (Data Mesh, O'Reilly 2022)

---

## Overview

Data Mesh is an organizational and architectural paradigm for managing analytical data
at scale. It decentralizes data ownership to domain teams, treats data as a product,
provides a self-serve data platform, and applies federated computational governance.
Data Mesh addresses the bottleneck problem of centralized data teams by distributing
responsibility while maintaining interoperability and quality through shared standards.

---

## When to Use

- When a centralized data team has become a bottleneck for multiple domain teams.
- When data quality suffers because producers are disconnected from consumers.
- When the organization is large enough to have distinct business domains with
  independent data needs.
- When building a data strategy for a multi-product or multi-business-unit company.
- When evaluating whether to centralize or decentralize data ownership.

---

## Core Concept

### The Four Principles

#### 1. Domain Ownership
- Analytical data is owned by the domain that produces it (or is closest to its
  business context).
- Domain teams are responsible for the quality, documentation, and availability of
  their data products.
- This replaces the model where a central data team ingests and owns all data.

**Key shift:** Data ownership moves from a central team to cross-functional domain
teams that include data engineering and analytics capabilities.

#### 2. Data as a Product
- Domain data is treated with the same rigor as a customer-facing product.
- Data products have: discoverable documentation, SLAs for quality and freshness,
  semantic versioning, access APIs, and an owner.
- The "customer" of a data product is any downstream consumer (analyst, ML model,
  another domain).

**Data Product qualities (DATSIS):**
- **D**iscoverable -- listed in a data catalog.
- **A**ddressable -- accessible via a standard interface.
- **T**rustworthy -- quality is measured and communicated.
- **S**elf-describing -- schema and documentation are embedded.
- **I**nteroperable -- uses shared standards for joining across domains.
- **S**ecure -- access controls enforced.

#### 3. Self-Serve Data Platform
- A shared platform layer provides the tools and infrastructure that domain teams
  need to build, deploy, and operate data products.
- The platform reduces cognitive load: domain teams focus on business logic, not
  infrastructure.
- Includes: storage, compute, orchestration, monitoring, cataloging, access control.

#### 4. Federated Computational Governance
- Governance is a federation: global standards are set centrally but enforced
  computationally (automated).
- Global policies include: interoperability standards (naming, identifiers), quality
  minimums, security classification, privacy compliance.
- Policies are encoded in the platform (not in documents that nobody reads).

---

## Steps / Process

### Step 1: Identify Domains
- Map the organization's business domains (e.g., Orders, Customers, Products,
  Marketing, Finance).
- Each domain should have clear boundaries and a team capable of owning data.

### Step 2: Define Data Products per Domain
- For each domain, identify the analytical data sets that other domains consume.
- Define the product: schema, SLA, documentation, owner, access interface.

### Step 3: Build (or Evolve) the Platform
- Provide self-serve infrastructure for domain teams.
- Include: data pipeline tooling, quality monitoring, catalog, access management.
- The platform team serves domain teams, not the other way around.

### Step 4: Establish Federated Governance
- Form a governance council with representatives from each domain.
- Define global standards: naming conventions, identifier formats, quality minimums.
- Encode standards as automated checks in the platform (not manual reviews).

### Step 5: Staff Domain Teams
- Each domain needs embedded data engineering and analytics capabilities.
- This may mean reorganizing from a centralized data team to embedded roles.

### Step 6: Iterate and Mature
- Start with 1-2 domains as pilots.
- Expand to other domains as the platform and governance model prove out.
- Continuously improve the platform based on domain team feedback.

---

## Inputs / Outputs

### Inputs
| Input                          | Source                          |
|--------------------------------|---------------------------------|
| Organizational domain map      | Leadership, architecture team   |
| Current data architecture      | Data / platform team            |
| Consumer needs inventory       | Business stakeholders           |
| Compliance requirements        | Legal, security                 |

### Outputs
| Output                         | Consumer                        |
|--------------------------------|---------------------------------|
| Domain-owned data products     | All data consumers              |
| Data product catalog           | Entire organization             |
| Self-serve platform            | Domain teams                    |
| Federated governance policies  | All data producers/consumers    |

---

## Pitfalls

1. **Premature decentralization.** Data Mesh requires organizational maturity. If
   domain teams lack data skills, decentralization creates chaos.

2. **Platform underinvestment.** Without a robust self-serve platform, domain teams
   reinvent infrastructure independently. The platform is the enabler.

3. **Governance as bureaucracy.** Federated governance should be automated and
   lightweight, not committee-heavy. If it slows teams down, it will be bypassed.

4. **Ignoring interoperability.** Domain independence without shared standards leads to
   data silos that cannot be joined. Global identifiers and naming conventions are
   non-negotiable.

5. **Data Mesh as a technology choice.** Data Mesh is an organizational paradigm, not
   a technology stack. Buying a "Data Mesh tool" without the organizational change
   accomplishes nothing.

6. **All-or-nothing adoption.** Data Mesh can be adopted incrementally. Start with
   domains that have clear data products and willing teams.

7. **Losing the central view.** Decentralization should not eliminate the ability to
   get a cross-domain view. The catalog and interoperability standards preserve this.

---

## Cross-References

- [Data Quality Triad](data-quality-triad.md) -- Quality standards that data products
  must meet.
- [RalphLoop Data Ops](ralphloop-data-ops.md) -- Quality gates that domain teams
  implement for their data products.
- [Governance Layer](governance-layer.md) -- Detailed governance practices.
- [Metric Lifecycle](metric-lifecycle-framework.md) -- How metrics are managed across
  domains.
- [Data Storytelling](data-storytelling-framework.md) -- Communicating cross-domain
  insights.
