# RalphLoop: 5 Gates for Data Quality and Learning

> A data operations framework for continuous quality and organizational learning

---

## Overview

RalphLoop is a five-gate data operations framework that ensures data flows through
explicit quality checkpoints before it reaches decision-makers. Each gate represents
a validation and enrichment step. The framework also emphasizes *learning loops*: the
output of decisions feeds back into earlier gates, creating an organization that gets
smarter about its data over time.

The five gates are: **Collect -> Validate -> Transform -> Serve -> Learn.**

---

## When to Use

- When building or restructuring a data pipeline and want built-in quality gates.
- When data quality issues recur because there is no systematic prevention process.
- When the data team operates reactively (fixing issues after consumers complain)
  and wants to shift to proactive quality management.
- When organizational learning from data is not captured systematically.
- When onboarding new data sources and need a repeatable integration process.

---

## Core Concept

### The Five Gates

```
Gate 1: COLLECT -> Gate 2: VALIDATE -> Gate 3: TRANSFORM -> Gate 4: SERVE -> Gate 5: LEARN
    ^                                                                            |
    +----------------------------------------------------------------------------+
                              (Learning feeds back)
```

### Gate 1: Collect
**Purpose:** Ingest data from source systems reliably and completely.

**Quality Checks:**
- Source connectivity verified.
- Schema matches expected definition.
- Row counts within expected range.
- Timestamps are current (freshness check).

**Gate Criteria:** Data lands in the raw/staging layer with metadata logged (source,
timestamp, row count, schema hash).

### Gate 2: Validate
**Purpose:** Verify data quality before any transformation.

**Quality Checks:**
- Null rates for critical fields below threshold.
- Value distributions within historical norms.
- Referential integrity with existing data.
- Duplicate detection and flagging.
- Business rule validation (domain constraints).

**Gate Criteria:** Validation report generated. Data that passes moves to Transform.
Data that fails is quarantined with an alert to the data owner.

### Gate 3: Transform
**Purpose:** Clean, normalize, join, and enrich data for analytical use.

**Quality Checks:**
- Row count reconciliation (input vs. output, accounting for expected filtering).
- Metric-level reconciliation (sums, averages match expected values).
- Join completeness (no unexpected null foreign keys after joins).
- Transformation logic version-controlled and tested.

**Gate Criteria:** Transformed tables pass reconciliation checks. Logic is documented
and reviewed.

### Gate 4: Serve
**Purpose:** Deliver data to consumers (dashboards, APIs, models) with known quality.

**Quality Checks:**
- Freshness SLA met (data available by the committed time).
- Dashboard/report renders correctly with no broken metrics.
- Access controls enforced (right people see right data).
- Data catalog entry is current (description, owner, SLA, quality status).

**Gate Criteria:** Consumers can access data. Quality status is visible (green/yellow/
red indicator).

### Gate 5: Learn
**Purpose:** Capture feedback from data consumers and decisions to improve upstream
gates.

**Activities:**
- Log data quality incidents and root causes.
- Track which decisions used which data and what the outcomes were.
- Conduct post-mortems on significant data quality failures.
- Update validation rules based on new failure patterns.
- Feed consumer feedback into collection and transformation logic.

**Gate Criteria:** Learning log updated. At least one upstream improvement per quarter
driven by downstream feedback.

---

## Steps / Process

### Step 1: Map Current Data Flows
- Inventory all data sources, pipelines, and consumers.
- Identify where each gate's activities are (or are not) happening today.

### Step 2: Implement Gate-by-Gate
- Start with Gate 2 (Validate) -- this is usually the highest-leverage gap.
- Then Gate 1 (Collect) monitoring.
- Then Gate 4 (Serve) SLAs.
- Then Gate 3 (Transform) reconciliation.
- Finally Gate 5 (Learn) feedback loops.

### Step 3: Define Gate Criteria and Owners
- For each gate, document the specific checks, thresholds, and responsible team.
- Automate checks wherever possible.

### Step 4: Build the Learning Loop
- Create a lightweight incident log (spreadsheet, Jira, or dedicated tool).
- Schedule monthly reviews of incidents and patterns.
- Assign improvement actions from the review.

### Step 5: Measure the Framework Itself
- Track: number of incidents per gate, time to detection, time to resolution.
- Goal: incidents detected earlier (upstream gates) and resolved faster over time.

---

## Inputs / Outputs

### Inputs
| Input                          | Source                          |
|--------------------------------|---------------------------------|
| Source system data feeds       | Engineering / source owners     |
| Quality thresholds             | Data team + consumers           |
| Consumer requirements          | Business stakeholders           |
| Incident history               | Incident log / post-mortems     |

### Outputs
| Output                         | Consumer                        |
|--------------------------------|---------------------------------|
| Gate status dashboard          | Data team, leadership           |
| Quarantined data alerts        | Data engineers, source owners   |
| Quality incident log           | Data governance                 |
| Learning improvements backlog  | Data team                       |
| SLA compliance reports         | Data consumers, leadership      |

---

## Pitfalls

1. **Implementing all gates at once.** This is overwhelming. Start with the gate
   that will prevent the most pain (usually Validate).

2. **Gates without teeth.** If a gate fires an alert but data flows through anyway,
   the gate is theater. Define what happens when a gate fails (quarantine, halt, warn).

3. **No learning loop.** Gates 1-4 prevent known problems. Gate 5 prevents *future*
   problems. Without it, the same issues recur with new data sources.

4. **Over-automating validation.** Automated checks catch known patterns. Periodic
   human review catches novel issues. Balance both.

5. **Gate ownership ambiguity.** Each gate needs a clear owner. Without ownership,
   gates degrade.

6. **Treating gates as one-time setup.** Thresholds, rules, and checks need ongoing
   tuning as data and business evolve.

---

## Cross-References

- [Data Quality Triad](data-quality-triad.md) -- The three quality dimensions that
  gate checks measure.
- [Data Mesh Principles](data-mesh-principles.md) -- Domain teams own their gates in
  a mesh architecture.
- [Governance Layer](governance-layer.md) -- Organizational governance around data ops.
- [Instrumentation Layer](instrumentation-layer.md) -- Gate 1 concerns for event data.
- [Metric Lifecycle](metric-lifecycle-framework.md) -- How metric quality evolves
  through the RalphLoop.

---

## Used By

| Task | Agents | Path |
|------|--------|------|
| quarterly-data-review | data-chief | `tasks/operations/quarterly-data-review.md` |
| data-pipeline-health-check | avinash-kaushik, data-chief | `tasks/operations/data-pipeline-health-check.md` |
| alert-threshold-calibration | avinash-kaushik | `tasks/operations/alert-threshold-calibration.md` |

**Workflows:** quarterly-data-review, data-pipeline-health-check
