# Metric Lifecycle Framework

> Every metric is born, adopted, governed, and eventually deprecated. Managing this lifecycle prevents metric debt.

## Overview

Metrics are not permanent. Without lifecycle management, organizations accumulate "metric debt" -- orphaned metrics nobody maintains, conflicting definitions, dashboards measuring what used to matter.

## When to Use

- Creating a new metric
- Quarterly metric governance review
- Deprecating outdated metrics
- Resolving conflicting definitions

## The 5 Stages

### Stage 1: Birth (Define)

**Trigger:** A question needs answering or a new OKR needs measurement.

**Process:**
1. State the business question the metric answers
2. Define using metric-definition-quality checklist (name, formula, source, window, exclusions, owner)
3. Check metric-registry.yaml -- does this already exist?
4. Register with version 1.0

**Gate:** metric-definition-quality checklist must pass.

### Stage 2: Adoption (Instrument & Dashboard)

**Trigger:** Metric is defined and approved.

**Process:**
1. Instrument data collection
2. Add to relevant dashboards
3. Establish baseline and expected range
4. Configure alerts if critical
5. Communicate to stakeholders

**Gate:** tracking-plan-quality + dashboard-quality checklists.

### Stage 3: Maturity (Govern & Review)

**Trigger:** Metric is in active use.

**Process:**
1. **Monthly:** Check data quality (completeness, accuracy, freshness)
2. **Quarterly:** Review with owner -- is anyone using this for decisions? Has context changed?
3. **On change:** Version bump, document reason, communicate, update dashboards

**Gate:** governance/metric-governance checklist.

### Stage 4: Deprecation (Sunset)

**Signals:**
- Nobody makes decisions based on this metric
- The business question is no longer relevant
- A better metric replaced it
- Data quality degraded and nobody will fix it

**Process:**
1. Impact assessment: who uses it?
2. Migration plan if replacement exists
3. Communicate with 30+ days notice
4. Remove from dashboards, stop alerts
5. Mark deprecated in registry with date and reason

**Gate:** Data Chief approval required.

### Stage 5: Archive (Record)

1. Move to archive/deprecated-metrics/ with full history
2. Record in lessons-learned-registry.yaml
3. Keep historical data accessible
4. Remove from active systems

## Versioning Rules

| Change Type | Version Bump | Example |
|-------------|-------------|---------|
| Cosmetic | Patch (1.0.1) | Rename "Monthly Active Users" to "MAU" |
| Filter change | Minor (1.1.0) | Exclude bots from MAU |
| Formula change | Major (2.0.0) | MAU from "any visit" to "core action" |
| Source change | Major (2.0.0) | MAU from GA4 to Mixpanel |

**Rule:** Major changes require new baseline and stakeholder communication.

## Health Indicators

| Indicator | Healthy | Warning | Critical |
|-----------|---------|---------|----------|
| Freshness | Within SLA | 1-2x SLA | >2x SLA |
| Consumers | 2+ dashboards | 1 dashboard | 0 consumers |
| Clarity | No ambiguity | Occasional questions | Frequent conflicts |
| Owner engagement | Reviews quarterly | Skips 1 quarter | No review 6+ months |
| Decision utility | Drives decisions | "Nice to know" | Nobody looks |

## Pitfalls

1. **Never deprecating** -- metrics accumulate forever, creating confusion
2. **No communication** -- someone's workflow breaks silently
3. **No versioning** -- definition changes break historical comparison
4. **Zombie metrics** -- on dashboards nobody looks at
5. **Definition drift** -- informal changes through tribal knowledge

## Cross-References

- `checklists/metric-definition-quality.md` -- Stage 1 gate
- `checklists/governance/metric-governance.md` -- governance review
- `lib/patterns/metric-deprecation-pattern.md` -- deprecation details
- `data/registries/metric-registry.yaml` -- central registry
- `workflows/metric-deprecation-workflow.md` -- deprecation playbook
