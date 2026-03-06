# Dashboard Design Patterns

Standard patterns for organizing dashboards by analytical intent. Each pattern serves a different question type.

---

## Pattern 1: Comparison

**Question answered:** "How does X compare to Y?"

**When to use:** Comparing performance across segments, time periods, cohorts, or treatments.

### Layout

```
+--------------------------------------------------+
| Title: [Metric] by [Dimension]                   |
| Filters: Time range, Segment, Platform            |
+--------------------------------------------------+
| [Bar chart or grouped bar chart]                  |
| X-axis: dimension (segments, regions, variants)   |
| Y-axis: metric value                              |
| Color: comparison groups                          |
+--------------------------------------------------+
| [Summary table with deltas and % change]          |
+--------------------------------------------------+
```

**Design rules:**
- Sort bars by value (descending), not alphabetically, unless the dimension has natural order.
- Limit to 7 or fewer comparison groups. Aggregate the rest into "Other."
- Always show the delta (absolute and percentage) alongside the values.
- Use consistent color encoding: same segment = same color across all charts.

---

## Pattern 2: Trend

**Question answered:** "How is X changing over time?"

**When to use:** Monitoring metrics over time, detecting inflection points, evaluating seasonal patterns.

### Layout

```
+--------------------------------------------------+
| Title: [Metric] Over Time                         |
| Filters: Time range, Grain (daily/weekly/monthly) |
+--------------------------------------------------+
| [Line chart]                                      |
| X-axis: time                                      |
| Y-axis: metric value                              |
| Annotations: events, deployments, experiments     |
+--------------------------------------------------+
| [Sparkline KPIs: current, prior period, YoY]     |
+--------------------------------------------------+
```

**Design rules:**
- Default to the most recent 90 days at daily grain, or 12 months at monthly grain.
- Include at least one comparison line: prior period, prior year, or target.
- Add dashboard annotations for known events (see annotation block component).
- Avoid dual Y-axes. If two metrics must share a chart, normalize them or use separate panels.
- Show confidence bands or min/max ranges when the metric has high variance.

---

## Pattern 3: Distribution

**Question answered:** "How is X distributed across the population?"

**When to use:** Understanding the shape of a metric: concentration, skew, outliers, central tendency.

### Layout

```
+--------------------------------------------------+
| Title: Distribution of [Metric]                   |
| Filters: Time range, Segment                      |
+--------------------------------------------------+
| [Histogram or box plot]                           |
| X-axis: metric value buckets                      |
| Y-axis: count or percentage of population         |
| Reference lines: mean, median, P90               |
+--------------------------------------------------+
| [Summary stats table]                             |
| Mean | Median | P25 | P75 | P90 | P99 | Std Dev |
+--------------------------------------------------+
```

**Design rules:**
- Choose bin sizes that reveal the shape, not hide it. Start with Sturges' rule (k = 1 + 3.322 * log10(n)).
- Always show median alongside mean; for skewed distributions, median is more informative.
- Highlight outliers explicitly (P99+) rather than letting them compress the visual scale.
- Use log scale for distributions spanning multiple orders of magnitude.

---

## Pattern 4: Composition

**Question answered:** "What makes up the whole?"

**When to use:** Showing how parts contribute to a total: revenue by product, traffic by source, users by segment.

### Layout

```
+--------------------------------------------------+
| Title: [Total Metric] by [Component]              |
| Filters: Time range                               |
+--------------------------------------------------+
| [Stacked bar chart or stacked area chart]         |
| X-axis: time or category                          |
| Y-axis: metric value (absolute or %)              |
| Color: component categories                       |
+--------------------------------------------------+
| [Table: component, value, % of total, change]    |
+--------------------------------------------------+
```

**Design rules:**
- Use stacked bar (not pie chart) for composition. Pie charts are hard to read with more than 3 slices.
- Offer a toggle between absolute values and percentage of total.
- Limit to 5-7 components. Group the rest into "Other."
- Use stacked area over time to show how composition shifts.
- Order components consistently: largest at bottom, smallest at top.

---

## Pattern 5: Relationship

**Question answered:** "How does X relate to Y?"

**When to use:** Exploring correlation, causation hypotheses, or multi-dimensional relationships.

### Layout

```
+--------------------------------------------------+
| Title: [Metric X] vs [Metric Y]                  |
| Filters: Time range, Segment                      |
+--------------------------------------------------+
| [Scatter plot]                                    |
| X-axis: independent variable                      |
| Y-axis: dependent variable                        |
| Size: optional third dimension                    |
| Color: segment or category                        |
| Trend line: linear regression with R-squared      |
+--------------------------------------------------+
| [Correlation stats: r, R-squared, p-value]        |
+--------------------------------------------------+
```

**Design rules:**
- Always label axes with units.
- Add a trend line only if the relationship is approximately linear; otherwise, use LOESS/LOWESS.
- Show the correlation coefficient and note that correlation does not imply causation.
- Use color to encode a categorical dimension (e.g., region, segment) to reveal sub-group patterns.
- Include outlier callouts for points that deviate significantly from the trend.

---

## General Dashboard Rules

1. **One dashboard, one audience.** Do not combine executive summaries and operational details on the same dashboard.
2. **Top-to-bottom = high-level to detailed.** Start with KPIs at the top, drill-down charts below.
3. **Left-to-right = time flow or priority.** Put the most important metrics on the left.
4. **Maximum 8 charts per view.** If you need more, create tabs or linked dashboards.
5. **Every chart must have a title that states the insight**, not just the metric name. "Conversion Rate is Declining Since Feb" is better than "Conversion Rate."
6. **Filters at the top.** Global filters affect all charts. Local filters are adjacent to their chart.
7. **Mobile-friendliness.** If stakeholders view dashboards on phones, design single-column layouts.
