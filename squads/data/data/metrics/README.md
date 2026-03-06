# Metrics

This directory contains detailed documentation, analysis, and historical context for all tracked metrics organized by category.

## Purpose

While the metric registry (`registries/metric-registry.yaml`) provides the canonical list of metrics with their definitions and formulas, this directory holds the deeper analysis, trend reports, and contextual documentation that gives each metric meaning over time.

## What Goes Here

- Detailed metric documentation beyond what fits in the registry (methodology, edge cases, interpretation guidance)
- Periodic metric reviews and trend analyses
- Metric decomposition and driver analysis
- Historical context explaining metric movements
- Proposals for new metrics or changes to existing definitions

## Subdirectories

- `north-star/` - The primary north-star metric (currently MAU) with deep-dive analyses
- `acquisition/` - Metrics related to new user acquisition and channel performance
- `activation/` - Metrics tracking the new user activation funnel
- `retention/` - Cohort retention, churn rates, and engagement depth metrics
- `revenue/` - Revenue metrics including ARPU, MRR, expansion, and contraction
- `referral/` - Referral program metrics and viral coefficient tracking
- `cs/` - Customer success metrics including health scores and satisfaction
- `community/` - Community engagement and growth metrics

## Conventions

- Each metric category subdirectory should contain analyses specific to that metric area
- Name files with the metric name and date: `weekly-retention-rate-q1-2026-review.md`
- Always reference the canonical definition from the metric registry
- When a metric definition changes, document the reason and impact in the relevant subdirectory
