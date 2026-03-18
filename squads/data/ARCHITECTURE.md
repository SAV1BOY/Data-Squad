# Data Squad -- Architecture Document

> **Squad:** Data + Analytics + Growth Metrics + Customer Success Metrics + Community Metrics
> **Version:** 2.0.0
> **Chief Agent:** Data Chief

---

## 1. Mission

The Data Squad transforms **raw data into executable decisions** with full traceability. Every metric has an owner, every dashboard answers a question, every experiment produces a registered learning, and every insight leads to action or is explicitly discarded.

We do not build dashboards for decoration. We do not track metrics nobody acts on. We do not run experiments without hypotheses. We do not confuse correlation with causation. We do not let Goodhart's Law eat our KPIs alive.

---

## 2. Core Principles

| # | Principle | Meaning |
|---|-----------|---------|
| 1 | **Decision Over Dashboard** | A dashboard exists to answer a question and trigger an action. If it does neither, kill it. |
| 2 | **Single Source of Truth** | One metric, one definition, one owner. No "my number vs your number." |
| 3 | **Experiment Before Opinion** | Test before you opine. Data > hierarchy. Evidence > intuition. |
| 4 | **Prove or Kill** | If it can't be proven, pivot or kill. No zombie metrics, no vanity dashboards. |
| 5 | **Data Quality First** | Bad data leads to bad decisions leads to bad outcomes. Quality is non-negotiable. |
| 6 | **Pragmatic Privacy** | Privacy is not a checkbox; it is an operational constraint that affects tracking design. |
| 7 | **Teach the Org** | Data literacy scales better than dashboards. Invest in people, not just tools (Kaushik's 10/90 rule). |

---

## 3. System Flow

```
Task Request
    |
    v
[config.yaml] -- Routing Brain
    |
    +--> Which agents? (in what order)
    +--> Which frameworks? (mandatory)
    +--> Which checklists? (quality gates)
    +--> Which templates? (output format)
    +--> Which registries? (memory)
    +--> Which metrics? (proof of value)
    |
    v
Agent Execution
    |
    v
[RalphLoop Quality Gates]
    |
    G1: Definition   -- metric-definition-quality, kpi-tree-quality
    G2: Instrumentation -- tracking-plan-quality, tag-manager-qa
    G3: Quality      -- data-quality-quality, alerting-quality
    G4: Insight      -- cohort-analysis-quality, experiment-analysis-quality
    G5: Decision     -- exec-report-quality + mandatory registry updates
    |
    v
Output (registered, traceable, actionable)
    |
    v
[data/registries/] -- Memory (decisions, learnings, metrics, experiments)
[data/metrics/]    -- Proof (trends, cohorts, causality, revenue impact)
```

---

## 4. The 8 Layers (Stack)

The Data Squad operates across 8 interconnected layers. Each layer has its own framework file in `frameworks/`:

| Layer | Framework File | Purpose |
|-------|---------------|---------|
| 1. Definition | `definition-layer.md` | Define metrics, events, taxonomy, owners |
| 2. Instrumentation | `instrumentation-layer.md` | Implement tracking, QA, data quality |
| 3. Collection | `collection-layer.md` | Manage pipelines, schemas, freshness |
| 4. Analysis | `analysis-layer.md` | Run cohorts, funnels, segments, causal analysis |
| 5. Experimentation | `experimentation-layer.md` | Design, execute, read, decide on experiments |
| 6. Visualization | `visualization-layer.md` | Build dashboards, reports, narratives |
| 7. Decision | `decision-layer.md` | Convert insight to action, register decisions |
| 8. Governance | `governance-layer.md` | Manage owners, versions, quality, privacy |

**Cycle:** Define -> Instrument -> Collect -> Analyze -> Experiment -> Visualize -> Decide -> Govern -> (repeat)

---

## 5. Agent Architecture (7 Agents)

### 5.1 Roster

| Agent | Domain | Authority |
|-------|--------|-----------|
| **Data Chief** | Orchestration | Scope, priorities, governance, approvals, "win condition" |
| **Avinash Kaushik** | Digital Analytics & Measurement | DMMM, See-Think-Do-Care, metrics that matter, 10/90 rule |
| **Peter Fader** | Customer Lifetime Value | CLV modeling, value-based segmentation, customer centricity |
| **Sean Ellis** | Growth & Experimentation | PMF, North Star, experiment velocity, activation loops |
| **Wes Kao** | Growth Strategy & Prioritization | Rigorous thinking, spiky POV, constraint-led strategy |
| **Nick Mehta** | Customer Success | Health scores, NRR/GRR, expansion, digital CS |
| **David Spinks** | Community Metrics | Orbit model, contribution paths, community ROI |

### 5.2 Rules of Operation

- **Data Chief** decides what to measure first (and what NOT to measure). Protects focus. Defines "official truth."
- **Kaushik** owns **instrumentation + measurement quality**. Nothing ships without passing his measurement model audit.
- **Fader** owns **customer value**. CLV, segmentation, retention economics. Treats customers as the asset, not the transaction.
- **Ellis** owns **experiments and growth**. Velocity, reading, decision. High-tempo testing as competitive advantage.
- **Kao** guarantees **strategic clarity and prioritization**. Where to attack first, without vanity.
- **Mehta** owns **Customer Success**. Health, expansion, churn prevention. Outcome-based, not activity-based.
- **Spinks** proves **community value**. Engagement signals, loops, contribution, retention. No vanity metrics allowed.

### 5.3 Conflict Resolution

1. Data Chief has final say on scope and priority
2. Domain experts have final say within their domain
3. When domains overlap (e.g., retention involves both Fader and Mehta), Data Chief mediates
4. Evidence wins over opinion. Always.

---

## 6. Cross-Squad Integration

The Data Squad connects bidirectionally with 6 other squads:

```
                    +------------------+
                    |   Traffic Squad  |
                    | (attribution,    |
                    |  CAC, UTMs)      |
                    +--------+---------+
                             |
              +--------------+---------------+
              |                              |
     +--------+--------+          +---------+---------+
     |   Copy Squad    |          |   Brand Squad     |
     | (conversion     |          | (awareness,       |
     |  metrics, A/B)  |          |  sentiment, NPS)  |
     +--------+--------+          +---------+---------+
              |                              |
              +------+    DATA     +---------+
                     |   SQUAD     |
              +------+  (central)  +---------+
              |                              |
     +--------+--------+          +---------+---------+
     |  Design Squad   |          | Storytelling Squad|
     | (HEART, feature |          | (data narratives, |
     |  adoption, UX)  |          |  proof points)    |
     +--------+--------+          +---------+---------+
              |                              |
              +--------------+---------------+
                             |
                    +--------+---------+
                    |  Movement Squad  |
                    | (community health|
                    |  movement ROI)   |
                    +------------------+
```

### Integration Rules

- **Handoff TO Data:** Other squads send raw data, performance data, engagement data
- **Handoff FROM Data:** Data Squad sends insights, attribution reports, segments, health scores
- **Shared Assets:** UTM taxonomies, experiment results, health dashboards, brand metrics

See `config.yaml > cross_squad` for full mapping.

---

## 7. Quality System (RalphLoop)

Every deliverable passes through the RalphLoop quality system with 5 gates:

| Gate | Name | Must Pass | Purpose |
|------|------|-----------|---------|
| G1 | Definition | metric-definition-quality, kpi-tree-quality | Is the metric properly defined? |
| G2 | Instrumentation | tracking-plan-quality, tag-manager-qa | Is the tracking properly implemented? |
| G3 | Quality | data-quality-quality, alerting-quality | Is the data trustworthy? |
| G4 | Insight | cohort-analysis-quality, experiment-analysis-quality | Is the analysis rigorous? |
| G5 | Decision + Registry | exec-report-quality + registry updates | Did we decide and record? |

**Rule:** Nothing becomes "official truth" or "final dashboard" without passing the appropriate gates.

---

## 8. Directory Structure

```
squads/data/
+-- agents/           # 7 agent personas with HRM activation prompts
+-- archive/          # Historical cases, evolution, failures & lessons
+-- authority/        # Thought leadership, workshops, summaries
+-- checklists/       # ~110 quality gates (macro + agent + domain)
+-- data/             # Operational memory (registries, metrics, experiments)
+-- docs/             # Squad documentation
+-- frameworks/       # ~85 mental models and methods
+-- lib/              # Reusable components, patterns, SQL, taxonomies
+-- phrases/          # Standardized language blocks
+-- projects/         # Project templates (7 types with numbered phases)
+-- reference/        # Books, standards, tools, schemas, psychology, industries
+-- scripts/          # Automation (validation, analysis, reporting, alerting)
+-- swipe/            # Best-in-class examples by type
+-- swipe-sources/    # Curated external sources
+-- tasks/            # ~65 executable task definitions
+-- templates/        # ~50 deliverable templates (briefs, outputs, reports, plans)
+-- voice/            # Tone profiles, language guides, calibration
+-- workflows/        # ~20 end-to-end playbooks
+-- ARCHITECTURE.md   # This file
+-- config.yaml       # Routing brain (28+ tasks, cross-squad, quality gates, KPIs)
+-- README.md         # Quick start guide
+-- swipe.config      # Swipe source configuration
```

---

## 9. Key Anti-Patterns (What We Refuse to Do)

| Anti-Pattern | Why It's Dangerous | Our Defense |
|--------------|-------------------|-------------|
| Dashboard without decision | Costs time, creates false sense of control | `dashboard-quality` checklist: "What decision does this answer?" |
| Metric without owner | Nobody maintains it, it drifts, becomes unreliable | `metric-governance` checklist + `metric-registry.yaml` |
| Experiment without hypothesis | Random testing, no learning accumulation | `experiment-design-quality` checklist: hypothesis required |
| Vanity metric as KPI | Goodhart's Law: when metric becomes target, it ceases to be good metric | `metrics-that-matter-filter` + guardrails on every KPI |
| CLV without segmentation | Treating all customers the same destroys value | Fader's heterogeneity principle + value-based segmentation |
| Community metric = likes | Engagement theater, not real contribution | Spinks' contribution ladder + engagement signal quality |
| Health score without validation | False confidence, missed churn signals | Mehta's calibration protocol + drift detection |
| Attribution without incrementality | Every channel takes credit, total > 100% | Incrementality tests + attribution caveats |

---

## 10. The "So What?" Test

Every output from this squad must pass the "So What?" test:

1. **So what?** -- What does this data mean for the business?
2. **Now what?** -- What action should we take based on this?
3. **Then what?** -- How will we know if the action worked?

If an output cannot answer all three questions, it is not ready for delivery.

---

*Last updated: 2026-03-18 | Maintained by: data-chief*
