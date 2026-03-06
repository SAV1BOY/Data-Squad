# Metric Definitions

This subdirectory contains the full, authoritative definition document for each official metric.

## Purpose

The metric registry provides a structured summary of each metric. This directory holds the expanded, human-readable definition that covers nuances, edge cases, calculation examples, and historical context that cannot fit in a YAML entry.

## What Goes Here

- One file per official metric with the complete specification
- Calculation walkthroughs with concrete examples
- Edge case documentation (e.g., how the metric handles timezone boundaries, null values, or bot traffic)
- Historical changelog tracking every definition change with dates and rationale
- Stakeholder context explaining who uses this metric and for what decisions
- Known caveats and common misinterpretations

## Conventions

- Name files after the metric: `monthly-active-users.md`, `weekly-retention-rate.md`
- Start each file with the canonical definition from the metric registry
- Include a worked SQL example showing how the metric is computed
- Maintain a changelog section at the bottom of each file
- Cross-reference related metrics, segments, and dashboards
- When in doubt about interpretation, this document is the source of truth
