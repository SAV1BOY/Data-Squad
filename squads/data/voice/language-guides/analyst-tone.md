# Analyst Tone Language Guide

## Purpose

This guide defines how analysts write technical reports, peer documentation, and internal analyses. The audience is other analysts, data engineers, and technically proficient stakeholders. Precision, reproducibility, and clarity are paramount.

## Core Principles

1. **Reproducibility first**: Any analyst should be able to replicate your work from your documentation
2. **Methodology is visible**: State your approach, assumptions, and data sources explicitly
3. **Separate observation from inference**: Label what the data shows versus what you conclude
4. **Version your work**: Note data freshness, query dates, and any known pipeline issues
5. **Peer-review ready**: Write as though another analyst will review this in 24 hours

## Report Structure

### Standard Analysis Report
1. **Objective**: What question are we answering and why
2. **Methodology**: Data sources, time range, filters, statistical methods
3. **Key Findings**: Numbered findings, each with supporting data
4. **Limitations**: Sample size issues, data gaps, known biases
5. **Recommendations**: What actions the findings support
6. **Appendix**: SQL queries, raw tables, supplementary charts

### Ad-Hoc Analysis
1. **Question**: The exact question asked
2. **Answer**: The direct answer with supporting metric
3. **Context**: Relevant comparison or trend
4. **Caveat**: Any limitation the requester should know
5. **Source**: Where the data came from

## Language Patterns

| Instead of | Use |
|---|---|
| "Users are doing well" | "7-day retention is 42%, up from 38% in the prior period" |
| "We looked at the data" | "We queried the events table for the period 2026-01-01 to 2026-02-28, filtered to active users (definition: at least 1 session in 7 days)" |
| "The feature works" | "Users exposed to the feature show a 15% higher activation rate (p=0.02, n=4,200)" |
| "There might be an issue" | "The pipeline for event tracking has a known 4-hour delay since Feb 12. Numbers for today are incomplete." |
| "It is significant" | "The result is statistically significant at p<0.05 with a 95% CI of [3.2%, 7.8%]" |

## Technical Writing Standards

- Define every metric on first use, even in internal documents
- Include units: percentages, absolute numbers, currency, time periods
- Use ISO date format: YYYY-MM-DD
- Reference table and column names when discussing data sources
- State the SQL dialect or tool used for the analysis
- When referencing a dashboard, include the direct URL
- Use consistent decimal precision: two decimal places for percentages, whole numbers for counts

## Notation Conventions

- **n=**: Sample size
- **p=**: P-value
- **CI**: Confidence interval, always with bounds
- **r=**: Correlation coefficient
- **delta**: Change from baseline, expressed as absolute and percentage
- **YoY / MoM / WoW**: Year-over-year, month-over-month, week-over-week

## Common Mistakes

- Writing for an executive audience when the reader is technical
- Omitting the query or methodology, making the work unreproducible
- Using ambiguous time references: "recently," "last month" (which last month?)
- Not noting pipeline delays or data quality issues present during the analysis
- Rounding numbers inconsistently across the same report
- Failing to define segments or cohorts used in the analysis

## Cross-References

- **Evidence-Driven Tone**: See `voice/tone-profiles/evidence-driven.md`
- **Skeptical Scientist Tone**: See `voice/tone-profiles/skeptical-scientist.md`
- **Technical Depth Scale**: See `voice/calibration/technical-depth-scale.md`
- **Data Quality Phrases**: See `phrases/data-quality-phrases.md`
- **Metric Definitions Phrases**: See `phrases/metric-definitions-phrases.md`
