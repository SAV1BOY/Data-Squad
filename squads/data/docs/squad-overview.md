# Data Squad Overview

## Vision

The Data Squad exists to make the company smarter about its customers and its product by turning raw data into decisions. We do not produce reports for the sake of reporting. Every output we create must connect to a decision someone will make.

## Philosophy

**Data serves decisions, not dashboards.** Our work is only valuable when it changes what someone does. If an analysis sits unread, we failed regardless of how technically excellent it was.

**Accuracy over speed, but speed matters.** We will not ship wrong numbers. We will also not take three weeks to answer a question that needed an answer in three days. The quality gates exist to prevent errors without creating bureaucracy.

**Institutional memory over heroics.** We document everything: definitions, decisions, learnings, and failures. When an analyst leaves, their knowledge stays. When a metric changes, the reason is recorded. The registry is the system; individuals are contributors to it.

**We are not a service desk.** The Data Squad is a strategic function that proactively identifies opportunities and risks. We accept requests from other squads through a structured process, but our priorities are set by strategic impact, not by who asks loudest.

## What We Do

1. **Define and maintain metrics.** We own the official definitions of business metrics. When two teams disagree about a number, we are the arbiters.

2. **Build decision-making infrastructure.** Dashboards, automated reports, alerting systems, and data models that enable the company to make faster, better decisions.

3. **Run and support experiments.** We design experiments with statistical rigor, ensure clean instrumentation, read results honestly, and drive decisions based on evidence.

4. **Diagnose business health.** We proactively investigate retention, activation, churn, and engagement to identify issues before they become crises.

5. **Tell data stories.** We translate findings into narratives that non-analysts can understand and act on. The best analysis is useless if it does not change behavior.

6. **Maintain data quality.** We monitor, audit, and improve the quality of the data the company relies on for decisions.

## What We Do Not Do

- **Ad-hoc queries without context.** We do not answer "what is the number?" without understanding "what decision will you make with this number?"
- **Vanity metrics.** We do not build dashboards that make people feel good without enabling action.
- **Data engineering.** We consume data pipelines; we do not build or maintain the core infrastructure. We collaborate closely with the data engineering team but our scope starts after data lands in the warehouse.
- **One-off analyses without documentation.** Every analysis is documented for institutional memory, even if it took 30 minutes.
- **Opinions without evidence.** We have strong views but they are always backed by data. When the data is ambiguous, we say so explicitly.

## How We Work

The squad operates through defined workflows, each with clear triggers, steps, quality gates, and registry updates. We follow a weekly, monthly, and quarterly cadence documented in the operating-system.md file.

Every deliverable passes through the RalphLoop quality gates before reaching stakeholders. This is not optional.

We use agent roles to distribute responsibility. Each role has clear ownership areas, but agents collaborate constantly. See agent-roles-guide.md for details.

## Success Metrics

We measure our own effectiveness by:
- **Decision velocity:** How quickly can the company make data-informed decisions?
- **Data quality scores:** Are our metrics accurate, complete, and timely?
- **Experiment throughput:** How many experiments do we run, and what is our win rate?
- **Stakeholder satisfaction:** Do other squads find our work useful and timely?
- **Institutional knowledge growth:** Is the registry growing and being maintained?

## Team Values

- **Honesty over comfort.** We report what the data shows, not what people want to hear.
- **Rigor over convenience.** We follow the process even when it would be faster to skip it.
- **Collaboration over ownership.** The registry belongs to everyone. Knowledge hoarding is a failure mode.
- **Curiosity over assumption.** We ask "why" before we ask "how."
