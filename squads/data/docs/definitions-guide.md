# Metric Definitions Guide

## Purpose

This guide explains how to create, maintain, and retire official metric definitions in the Data Squad. A well-defined metric removes ambiguity, prevents conflicting numbers, and ensures everyone in the company talks about the same thing when they use a metric name.

## What Makes a Good Metric Definition

A metric definition is complete when any analyst on the team can compute the exact same number independently, using only the definition document. If two analysts get different numbers from the same definition, the definition is incomplete.

Every metric definition must include these fields:

1. **Name:** The official name, following naming-conventions.md. This is the only name used in dashboards, reports, and conversations.
2. **Description:** One or two sentences explaining what the metric measures and why it matters, written for a non-analyst audience.
3. **Formula:** The exact calculation, including aggregation method, time window, and any weighting.
4. **Data Source:** The specific table(s) and column(s) used, including the warehouse schema.
5. **Filters:** What is included and excluded. Explicit about edge cases: test users, internal accounts, bots, free-tier users.
6. **Granularity:** The finest level at which the metric is computed (user, account, session, transaction) and the reporting level (daily, weekly, monthly).
7. **Owner:** The agent responsible for the definition's accuracy and maintenance.
8. **Created Date:** When the definition was first established.
9. **Last Reviewed:** When the definition was last validated against the source data.
10. **Related Metrics:** Other metrics that are derived from, feed into, or are commonly compared with this one.

## How to Create a New Metric

Step 1: Check the registry. Does a metric with this name or a similar purpose already exist? If yes, use the existing metric or propose a modification. Do not create a duplicate.

Step 2: Draft the definition using all 10 fields above. Be explicit about edge cases. If you are unsure about a filter, document the ambiguity and flag it for review.

Step 3: Write a reference query that computes the metric from raw data. This query serves as the executable specification of the definition.

Step 4: Validate the reference query output against known benchmarks or manual calculations. The number should match within 0.1% tolerance.

Step 5: Submit the definition for review by the avinash-kaushik. The review checks for: completeness, naming compliance, no duplicates, correct data source references, and a working reference query.

Step 6: Once approved, register the metric in the metric registry with all 10 fields and the reference query.

Step 7: Communicate the new metric to relevant stakeholders: notify dashboard owners if the metric should be added to existing dashboards.

## How to Modify an Existing Metric

Metric definitions change when business logic changes, data sources evolve, or inaccuracies are discovered. Handle changes carefully because downstream consumers depend on consistency.

Step 1: Document the proposed change: what is changing, why, and what the impact is on historical values.

Step 2: Assess the impact: which dashboards, reports, alerts, and experiments reference this metric?

Step 3: Decide on historical treatment: will historical values be recomputed, or will the change apply only going forward? If going forward only, document the break point.

Step 4: Submit the modification for review by the avinash-kaushik.

Step 5: Update the registry entry with the new definition, increment the version, and add a change log entry.

Step 6: Notify all downstream consumers of the change, including the effective date and any impact on historical comparisons.

## How to Retire a Metric

Follow the metric-deprecation-workflow.md for the full process. In summary: justify, assess impact, migrate consumers, deprecate, and document.

## Common Pitfalls

- **Ambiguous time windows:** "Monthly active users" must specify: calendar month or rolling 30 days? UTC or local time? Inclusive or exclusive of the boundary day?
- **Unstated filters:** If test accounts are excluded, say so. If free-tier users are included, say so. Never assume the reader knows the defaults.
- **Missing NULL handling:** What happens when a required field is NULL? Is the record excluded, counted as zero, or flagged?
- **Denominator confusion:** For ratio metrics, define the denominator as precisely as the numerator. "Conversion rate" means nothing without specifying who is in the denominator.
- **Changing definitions without versioning:** Never silently change a metric definition. Always version and document.

## Metric Tiers

| Tier | Description | Review Cadence | Change Process |
|------|-------------|---------------|----------------|
| Tier 1: North Star | Company-level strategic metric | Monthly review | Requires leadership approval |
| Tier 2: Input Metrics | Metrics that directly feed the North Star | Monthly review | Requires avinash-kaushik approval |
| Tier 3: Supporting Metrics | Operational and diagnostic metrics | Quarterly review | Standard review process |
| Tier 4: Exploratory | Metrics under evaluation, not yet official | As needed | Lightweight review |
