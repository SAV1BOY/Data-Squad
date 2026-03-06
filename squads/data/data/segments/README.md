# Segments

This directory contains detailed documentation for official user segments, segmentation analyses, and segment-based reporting.

## Purpose

Segments divide the user base into meaningful groups for targeted analysis, personalized experiences, and focused decision-making. The segment registry (`registries/segment-registry.yaml`) provides the canonical list; this directory holds deeper analysis, validation studies, and usage documentation.

## What Goes Here

- Detailed segment specifications with SQL definitions and sample populations
- Segment validation analyses confirming that segments behave differently on key metrics
- Segment size and composition tracking over time
- Cross-segment comparison reports
- Proposals for new segments or modifications to existing ones
- Documentation of how segments are used in experiments, campaigns, and dashboards

## Conventions

- Name files after the segment: `power-users-specification.md`, `at-risk-users-validation.md`
- Every official segment must have a corresponding entry in the segment registry
- Include the SQL or logic used to compute the segment for reproducibility
- Track segment population sizes over time to detect drift
- When a segment definition changes, document the change reason and its impact on historical comparisons
- Ad-hoc segments used for one-off analyses do not need to be stored here unless they become recurring
