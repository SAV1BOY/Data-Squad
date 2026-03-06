# Dashboard Annotations Guide

## Purpose

This guide defines how to annotate dashboards so they are self-explanatory. A well-annotated dashboard does not require a Slack message to interpret. Annotations provide context for peaks, valleys, anomalies, and milestones directly where the user is looking at the data.

## Core Principles

1. **Self-contained**: Anyone viewing the dashboard should understand what they see without asking the data team
2. **Contextual**: Annotate what caused the data to change, not just that it changed
3. **Concise**: Annotations are margin notes, not paragraphs
4. **Current**: Update annotations when context changes or events resolve
5. **Layered**: Title-level annotation for the dashboard, chart-level for specifics

## Annotation Types

### Dashboard-Level Annotations
- **Purpose statement**: One sentence explaining what this dashboard answers
- **Data freshness**: When the data was last updated and the refresh cadence
- **Known issues**: Any active data quality issues affecting the dashboard
- **Key definitions**: Brief definitions of non-obvious metrics

### Chart-Level Annotations
- **Event markers**: Vertical lines or callouts marking events that caused data changes
- **Threshold lines**: Reference lines showing targets, benchmarks, or alert thresholds
- **Anomaly notes**: Brief explanation for unusual spikes or drops
- **Comparison context**: What the comparison period or benchmark represents

### Data Point Annotations
- **Outlier explanations**: Why a specific data point is unusually high or low
- **Data gaps**: Where data is missing and why
- **Methodology changes**: When a metric definition changed

## Annotation Phrases

**For peaks**:
- "Spike on [date]: caused by [event]. Not indicative of a trend."
- "Peak reflects [campaign/launch/seasonal event]. Baseline resumed by [date]."
- "Elevated values [date range]: attributed to [cause]."

**For valleys**:
- "Drop on [date]: [root cause]. Recovery expected by [date]."
- "Low point reflects [pipeline issue/holiday/known gap]. Underlying trend unchanged."
- "Decline in [date range] driven by [segment/cause]. See [link] for analysis."

**For trends**:
- "Upward trend since [date]: driven by [initiative/change]."
- "Gradual decline over [period]: under investigation. Preliminary findings in [link]."
- "Flat trajectory reflects [market condition/product stability]."

**For thresholds**:
- "Red line = target ([value]). Currently [above/below] by [amount]."
- "Yellow zone = warning range ([range]). Triggers review if sustained for [duration]."
- "Green = healthy range based on [benchmark/historical average]."

**For data quality**:
- "Data for [date range] may be incomplete due to [cause]. Use with caution."
- "Metric definition changed on [date]. Values before and after are not directly comparable."
- "Numbers refreshed [frequency]. Last update: [timestamp]."

## Formatting Standards

- Keep annotations under 15 words when possible
- Use consistent date format: YYYY-MM-DD
- Include the cause, not just the observation
- Link to detailed analysis for complex events
- Use color consistently: red for issues, yellow for caution, green for context
- Remove stale annotations older than 90 days unless they mark permanent changes

## Common Mistakes

- Leaving dashboards without any annotation, relying on tribal knowledge
- Writing annotations so long they obscure the chart
- Annotating the obvious (the line went up) instead of the context (why it went up)
- Not updating annotations when the situation changes
- Using annotations as a substitute for fixing the underlying data issue
- Inconsistent annotation style across dashboards

## Cross-References

- **Dashboard Annotation Phrases**: See `phrases/dashboard-annotation-phrases.md`
- **Data Quality Phrases**: See `phrases/data-quality-phrases.md`
- **Educator Tone**: See `voice/tone-profiles/educator.md`
- **Storyteller with Data**: See `voice/tone-profiles/storyteller-with-data.md`
