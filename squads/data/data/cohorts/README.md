# Cohorts

This directory contains cohort definitions, retention analyses, and longitudinal studies tracking groups of users over time.

## Purpose

Cohort analysis is the backbone of understanding user behavior over time. By grouping users by shared characteristics (typically signup date), the team can measure how behavior evolves, compare cohort quality, and identify trends that cross-sectional metrics obscure.

## What Goes Here

- Cohort definition documents specifying how each cohort is constructed
- Retention curve analyses for specific cohorts or cohort comparisons
- Cohort quality assessments comparing acquisition channels or time periods
- Longitudinal behavior studies tracking how user actions evolve post-signup
- Cohort-level revenue and expansion analyses

## Conventions

- Name files with the cohort identifier and analysis type: `q1-2026-cohort-retention-analysis.md`
- Always specify the cohort definition (signup week, signup month, custom criteria) at the top
- Use cohort week as the standard time grain for retention (see DEC-005)
- Include visualizations or table exports alongside the written analysis
- Reference the retention metrics from the metric registry for standard calculations
- When comparing cohorts, control for segment composition (plan tier, acquisition channel) to avoid Simpson's paradox
- Store reusable SQL queries or notebook references that generated the analysis
