# Dashboard Design Standard

## Purpose

Dashboards are decision-making tools, not decoration. This standard ensures dashboards are clear, actionable, and trustworthy. Every chart should answer a question, and every dashboard should drive a decision.

## Core Principles

1. **Dashboards serve decisions, not data.** Start with the decision the viewer needs to make, then choose the data that supports it.
2. **Less is more.** Every tile must earn its place. Remove anything that does not directly support the dashboard's purpose.
3. **Context enables interpretation.** Numbers without context are meaningless. Always provide comparisons, targets, or trends.
4. **Consistency builds trust.** Use the same colors, formats, and layouts across dashboards so users build intuition.
5. **Accessibility is not optional.** Dashboards must be usable by people with color vision deficiencies and on different screen sizes.

## Dashboard Structure

### Header

- **Title:** Clear, specific, and action-oriented. "Revenue Performance Q1 2025" not "Dashboard 3."
- **Description:** One sentence explaining the purpose and intended audience.
- **Last refreshed timestamp:** Always visible. Users must know how fresh the data is.
- **Date range selector:** Default to the most useful range. Allow override.

### Layout

- **Maximum 12 tiles** per dashboard. If you need more, create a detail dashboard and link to it.
- **F-pattern reading order:** Place the most important metrics in the top-left. Secondary insights flow right and down.
- **Group related metrics.** Use visual sections or dividers to create logical groups.
- **KPI row at the top:** 3-5 key numbers with sparklines and comparisons, providing the "executive summary."
- **Detail charts below:** Time series, breakdowns, and tables that provide context for the KPIs.

### Standard Tile Sizes

| Tile Type | Width | Purpose |
|-----------|-------|---------|
| KPI card | 1/4 to 1/3 of row | Single number with trend and comparison |
| Time series chart | 1/2 to full row | Trends over time |
| Bar chart | 1/2 row | Comparisons across categories |
| Table | 1/2 to full row | Detailed data for drill-down |
| Pie/donut chart | 1/4 row (rare) | Part-to-whole with 5 or fewer segments |

## Chart Selection Guide

### When to Use What

| Question Type | Recommended Chart | Avoid |
|--------------|-------------------|-------|
| How is this metric trending? | Line chart (time series) | Bar chart for time data |
| How do categories compare? | Horizontal bar chart | Pie chart with >5 slices |
| What is the distribution? | Histogram or box plot | Bar chart with continuous data |
| What is the composition? | Stacked bar or area chart | 3D pie chart (never) |
| What is the single current value? | KPI card with comparison | Gauge (speedometer) charts |
| How do two metrics relate? | Scatter plot | Dual-axis line chart (misleading) |
| What is the geographic pattern? | Choropleth map | Bubble map for precise values |
| What is the detailed breakdown? | Table with conditional formatting | Chart with >20 data points |

### Charts to Avoid

- **Pie charts with more than 5 slices.** Use a bar chart instead.
- **3D charts of any kind.** They distort perception of values.
- **Dual-axis charts.** They imply correlation where none may exist and are easy to manipulate. Use two separate charts.
- **Gauge/speedometer charts.** They waste space and provide less context than a KPI card.
- **Word clouds.** They are not analytical tools.
- **Doughnut charts nested inside each other.** Unreadable.

## Color Standards

### Color Palette

Use a consistent, accessible color palette across all dashboards.

| Color Role | Usage | Hex Example |
|-----------|-------|-------------|
| Primary | Main data series, primary KPI | `#2563EB` (blue) |
| Secondary | Comparison data series | `#7C3AED` (purple) |
| Success / Positive | Above target, growth | `#059669` (green) |
| Warning | Approaching threshold | `#D97706` (amber) |
| Danger / Negative | Below target, decline | `#DC2626` (red) |
| Neutral | Baselines, averages, context | `#6B7280` (gray) |

### Color Rules

1. Do NOT use red/green as the only differentiator (color blindness). Add icons or labels.
2. Use color meaningfully: the same color should mean the same thing across dashboards.
3. Limit to 5-7 colors per chart. If you need more, simplify the chart.
4. Use sequential color scales (light-to-dark) for magnitude, not categorical colors.
5. Background should be white or very light gray. Dark backgrounds reduce readability.

## Number Formatting

### Rules

| Data Type | Format | Example |
|-----------|--------|---------|
| Currency (large) | Abbreviated with symbol | $1.2M, R$450K |
| Currency (small) | Full with 2 decimals | $45.99 |
| Percentages | 1 decimal place max | 12.3% |
| Counts (large) | Abbreviated | 1.5K, 2.3M |
| Counts (small) | Full number with separator | 1,234 |
| Rates/ratios | 2 decimal places | 3.45x |
| Duration | Human-readable | 2m 34s, not 154s |

### Context for Numbers

Every KPI card should include at least one of:

- **Comparison to previous period:** "vs. last month" with direction arrow and percentage change.
- **Comparison to target:** "85% of goal" with progress indicator.
- **Sparkline:** Miniature trend showing the last 7/30/90 days.
- **Status indicator:** Color-coded dot or background indicating good/warning/bad.

## Text and Labels

### Titles

- Chart titles should state the insight, not describe the chart: "Revenue grew 15% MoM" not "Revenue Over Time."
- If the insight changes dynamically, use a descriptive title: "Monthly Revenue Trend."
- Every chart must have a title. No exceptions.

### Axis Labels

- Always label both axes.
- Use readable units: "$K" not "Thousands of US Dollars."
- Start Y-axis at zero for bar charts. For line charts, it depends on the data range and the story.
- Do not rotate X-axis labels more than 45 degrees. If labels are too long, use a horizontal bar chart.

### Annotations

- Mark significant events on time series: product launches, incidents, campaigns.
- Add reference lines for targets and benchmarks.
- Include "as of" dates for snapshot metrics.

### Tooltips

- Every data point should have a tooltip with the exact value, date, and any relevant breakdowns.
- Tooltips should not repeat the axis labels; they should add information.

## Interactivity

### Filters

- Place global filters at the top of the dashboard.
- Default filter values should show the most common use case.
- Clearly label what each filter controls.
- Limit to 3-5 global filters. More indicates the dashboard is trying to serve too many audiences.

### Drill-Down

- Link from summary dashboards to detail dashboards rather than cramming everything into one view.
- Use click-to-filter on charts where appropriate (click a bar to filter the dashboard to that segment).
- Indicate that drill-down is available (underline, cursor change, or explicit link).

## Performance

- Dashboards must load in under 10 seconds for p95 users.
- Pre-aggregate data in the warehouse rather than running complex queries at render time.
- Limit the default date range. Showing 3 years of daily data on load is unnecessary; default to 30 or 90 days.
- Use caching and extracts where supported by the BI tool.

## Accessibility

- Test with a color blindness simulator (e.g., Coblis).
- Use patterns or labels in addition to color to differentiate data series.
- Ensure font sizes are readable: minimum 12px for body text, 14px for chart labels.
- Provide alt-text descriptions for charts shared in Slack or email.
- Ensure sufficient contrast between text and background (WCAG AA minimum).

## Review Checklist

Before publishing a dashboard:

- [ ] Dashboard has a clear title and description.
- [ ] Last refresh timestamp is visible.
- [ ] No more than 12 tiles.
- [ ] Every chart has a title, axis labels, and data source.
- [ ] KPIs include comparison or trend context.
- [ ] Colors are consistent with the palette and accessible.
- [ ] Numbers are formatted per the standard.
- [ ] Loads in under 10 seconds.
- [ ] Filters default to the most common use case.
- [ ] No dual-axis charts, 3D charts, or pie charts with more than 5 slices.
- [ ] Peer-reviewed by another analyst.
- [ ] Business stakeholder has confirmed the dashboard answers their question.
