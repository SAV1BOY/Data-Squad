# Agent Roles Guide

## Overview

The Data Squad operates through 7 specialized agent roles. Each role has distinct responsibilities, but agents collaborate constantly across workflows. A single person may fill multiple roles depending on team size, and roles can shift between individuals as priorities change.

## The 7 Agent Roles

### 1. Analytics Architect

**Purpose:** Designs the data infrastructure, models, and metric definitions that the entire squad relies on.

**Responsibilities:**
- Own the metric registry and tracking plan
- Build and maintain data models (views, materialized tables, semantic layers)
- Define metric calculation logic and ensure consistency across tools
- Review all data sources for reliability and lineage
- Provision tool access and manage technical onboarding

**When to involve:** Any time a new metric is defined, a data source is questioned, a pipeline is built, or a technical decision about data infrastructure is needed.

**Escalation path:** If a data source is unreliable or a metric definition is disputed, the Analytics Architect has final authority on the technical resolution. Strategic disputes escalate to the Retention Strategist.

### 2. Data Quality Sentinel

**Purpose:** Ensures every number that leaves the squad is accurate, validated, and trustworthy.

**Responsibilities:**
- Run validation checks on all deliverables (Gate 2 of the RalphLoop)
- Monitor data freshness, completeness, and accuracy SLAs
- Investigate and resolve data quality incidents
- Maintain automated data quality tests
- Produce the weekly data quality scorecard

**When to involve:** Before any deliverable reaches a stakeholder, when data anomalies are detected, when a new data source needs quality baselining, or when an incident affects data accuracy.

**Escalation path:** If a quality issue blocks a deliverable, the Sentinel can halt publication. If the issue affects multiple squads, escalate to the Analytics Architect for root cause resolution.

### 3. Tracking Implementer

**Purpose:** Instruments analytics events across all platforms, ensuring clean, accurate data collection at the source.

**Responsibilities:**
- Implement tracking specifications in client and server code
- Write and maintain unit tests for event payloads
- Debug instrumentation issues across platforms (web, iOS, Android, backend)
- Ensure SDK configuration follows standards
- Fix source-level data quality issues

**When to involve:** When new events need to be tracked, when existing tracking is broken, when an audit reveals instrumentation gaps, or when a new platform needs to be instrumented.

**Escalation path:** If an instrumentation fix requires product code changes beyond analytics, escalate to the engineering team. If the tracking spec is ambiguous, escalate to the Analytics Architect.

### 4. Experiment Strategist

**Purpose:** Designs, runs, and reads experiments with statistical rigor, ensuring the company learns from every test.

**Responsibilities:**
- Manage the experiment backlog and prioritization
- Design experiment protocols: hypothesis, sample size, success criteria
- Enforce experimentation standards: no peeking, pre-registration, SRM checks
- Read and interpret results with appropriate statistical methods
- Maintain the experiment registry with results and learnings

**When to involve:** When a hypothesis needs causal validation, when an experiment is being designed or analyzed, when experiment results need interpretation, or during portfolio reviews.

**Escalation path:** If an experiment has methodological concerns (e.g., SRM detected), the Strategist halts the experiment and investigates. If business pressure conflicts with statistical requirements, escalate to the Retention Strategist for a priority call.

### 5. Insight Narrator

**Purpose:** Translates data findings into compelling narratives that drive decisions, and ensures all squad communications are clear and actionable.

**Responsibilities:**
- Build data stories from analysis results (Gate 4 of the RalphLoop)
- Create interpretation guides for dashboards and reports
- Facilitate stakeholder presentations and decision meetings
- Maintain the knowledge base and presentation library
- Collect and incorporate stakeholder feedback

**When to involve:** When analysis results need to be communicated, when a dashboard needs an interpretation guide, when a stakeholder presentation is required, or when the squad needs feedback from other teams.

**Escalation path:** If a stakeholder disputes findings, the Narrator facilitates resolution by bringing the Analytics Architect and Retention Strategist into the discussion.

### 6. Retention Strategist

**Purpose:** Provides strategic direction for the squad, ensures work aligns with business priorities, and leads retention-focused analysis.

**Responsibilities:**
- Set squad priorities and make trade-off decisions
- Lead retention, activation, churn, and CLV analyses
- Own Gate 5 of the RalphLoop (Strategic Alignment)
- Manage cross-squad relationships and request prioritization
- Define the quarterly plan and OKRs

**When to involve:** When priorities need to be set or changed, when retention metrics move, when cross-squad requests compete for capacity, or when strategic alignment is questioned.

**Escalation path:** The Retention Strategist is the final escalation point within the squad for priority disputes. External escalation goes to the VP of Product or Data.

### 7. Community Analyst

**Purpose:** Specializes in community engagement metrics, loop analysis, and the intersection of community health with product metrics.

**Responsibilities:**
- Map and instrument community engagement loops
- Track community health metrics and member progression
- Analyze the impact of community activity on retention and activation
- Produce the community health scorecard
- Identify community-driven growth opportunities

**When to involve:** When community metrics are being reviewed, when community features are changing, when community health is a factor in retention analysis, or when community programs need measurement.

**Escalation path:** For community-specific questions, the Community Analyst has authority. For broader strategic decisions involving community metrics, escalate to the Retention Strategist.

## Role Collaboration Matrix

| Workflow Type | Primary | Supporting | Reviewing |
|--------------|---------|------------|-----------|
| Metric definition | Analytics Architect | Data Quality Sentinel | Retention Strategist |
| Dashboard build | Insight Narrator | Analytics Architect | Data Quality Sentinel |
| Experiment | Experiment Strategist | Analytics Architect | Retention Strategist |
| Quality issue | Data Quality Sentinel | Tracking Implementer | Analytics Architect |
| Stakeholder communication | Insight Narrator | Retention Strategist | Analytics Architect |
| Retention analysis | Retention Strategist | Analytics Architect | Experiment Strategist |

## General Escalation Rules

1. Technical disputes (how to measure): Analytics Architect decides.
2. Quality disputes (is the data good enough): Data Quality Sentinel decides.
3. Strategic disputes (should we do this): Retention Strategist decides.
4. Communication disputes (how to present): Insight Narrator decides.
5. If two agents with decision authority disagree: 30-minute sync to resolve, Retention Strategist breaks ties.
