# How Dashboards Deceive (and How to Avoid It)

## The Problem

Dashboards can lie without anyone intending to deceive. The choices made in data selection, visualization, and framing shape how viewers interpret reality. A well-intentioned analyst can accidentally create a misleading dashboard. A motivated one can do it deliberately. Understanding these patterns protects both the creator and the viewer.

## Visual Deception Techniques

### Truncated Y-Axis

The most common deception. By not starting the Y-axis at zero, small differences look dramatic.

- A bar chart showing revenue at $98M vs. $100M with a Y-axis starting at $95M makes a 2% difference look like a 50% difference.
- **Rule:** Bar charts must always start at zero. Line charts may have a non-zero baseline if clearly labeled, but annotate the axis range.

### Dual-Axis Charts

Two Y-axes with different scales on the same chart can make any two variables appear correlated.

- Plot revenue (left axis, $0-$10M) against temperature (right axis, 0-100F). They will visually correlate regardless of any real relationship.
- **Rule:** Avoid dual-axis charts entirely. Use two separate charts or normalize the data to a common scale (like index to 100).

### Cherry-Picked Time Ranges

Choosing the start and end dates of a chart can dramatically change the narrative.

- "Revenue is growing!" (if you start the chart at the trough).
- "Revenue is declining!" (if you start the chart at the peak).
- **Rule:** Default to standard time periods (MTD, QTD, YTD, trailing 12 months). If a custom range is used, explain why.

### Cumulative Charts

Cumulative charts always go up (unless there are negative values). They hide declines.

- "We have acquired 50,000 users!" (cumulative, always increasing).
- In reality, monthly acquisition dropped from 10,000 to 2,000.
- **Rule:** Show period-over-period data alongside cumulative data. Never show only cumulative.

### Color Manipulation

- Using green for a declining metric because the decline was "less than expected."
- Using red for a metric that actually improved but missed an arbitrary target.
- **Rule:** Use color consistently. Green = objectively good performance. Red = objectively bad. If it requires explanation, use a neutral color and add text.

### 3D Charts and Visual Distortion

3D effects distort the perception of area and length. A 3D pie chart makes front slices look larger than back slices.

- **Rule:** Never use 3D charts. They add no information and reduce accuracy.

### Area Charts for Non-Stacking Data

Using filled area charts for non-stacking data exaggerates differences by making viewers perceive area rather than height.

- **Rule:** Use area charts only for stacked compositions. Use line charts for trends.

## Data Selection Deception

### Survivorship Bias in Dashboards

The dashboard shows only the current customers, not the ones who left. Metrics like "average engagement" look great because churned (low-engagement) users are no longer in the data.

- **Mitigation:** Include cohort-based views that show what happened to all users who started, not just those who survived.

### Ignoring the Denominator

"Customer satisfaction is at 95%!" But the survey had a 5% response rate. The satisfied customers responded; the dissatisfied ones did not.

- **Mitigation:** Always show the sample size and response rate alongside survey metrics.

### Picking the Right Average

Mean, median, and mode can tell very different stories:

- Mean revenue per customer: $500 (pulled up by a few enterprise accounts).
- Median revenue per customer: $49 (the actual typical customer).
- **Rule:** Default to median for skewed distributions. If using mean, show the distribution.

### Excluding Outliers Without Disclosure

Removing "outliers" changes the picture. Sometimes those outliers are the most important data points.

- **Rule:** If outliers are excluded, state how many, what criteria was used, and what the metric looks like with them included.

## Framing Deception

### Percentage vs. Absolute Numbers

- "Conversions increased by 100%!" (from 1 to 2).
- "We added 50,000 new users!" (out of 10 million total, a 0.5% increase).
- **Rule:** Present both absolute numbers and percentages. Let the viewer judge the magnitude.

### Relative vs. Absolute Change

- "Churn decreased by 20%!" Could mean from 5% to 4%, or from 50% to 40%.
- **Rule:** Always specify both relative and absolute change: "Churn decreased from 5.0% to 4.0% (a 1 percentage point decrease, or 20% relative improvement)."

### Time Period Manipulation

- Comparing a 5-week month to a 4-week month.
- Comparing a month with a holiday to a normal month.
- **Rule:** Use normalized periods (per day, per week) for fair comparisons. Annotate holidays, outages, and other anomalies.

### Vanity Metrics

Metrics that always go up and feel good but do not drive decisions:

- Total registered users (includes churned, inactive, spam).
- Total page views (includes bots, accidental clicks).
- Total revenue (without costs or context).
- **Rule:** Focus on rate metrics (conversion rate, retention rate) and per-unit metrics (revenue per user, cost per acquisition). These are harder to game.

## Structural Dashboard Deception

### Too Many Metrics

A dashboard with 30 tiles lets the viewer choose whichever number supports their preferred narrative. The more metrics you show, the easier it is to find one that tells the story you want.

- **Rule:** Maximum 12 tiles. Every tile must answer a specific question related to the dashboard's purpose.

### No Context

A number without context is meaningless. "Revenue: $1.2M" means nothing without knowing:
- Is that good or bad? (comparison to target)
- Is it going up or down? (trend)
- What was it last period? (change)

- **Rule:** Every KPI must include at least one comparison point.

### Missing Data Sources

If the dashboard does not say where the data comes from, viewers cannot assess its reliability.

- **Rule:** Include data source annotations and last-refresh timestamps on every dashboard.

## How to Build Honest Dashboards

### Design for Skepticism

1. Ask "How could this chart be misinterpreted?" before publishing.
2. Have someone unfamiliar with the data review the dashboard and describe what they think it shows.
3. Include limitations in the dashboard description.

### Provide Full Context

1. Show comparisons: vs. previous period, vs. target, vs. industry benchmark.
2. Show distributions, not just averages.
3. Show both the metric and its denominator.
4. Annotate significant events (launches, outages, campaigns).

### Use Consistent Standards

1. Follow the dashboard design standard for colors, formatting, and layout.
2. Use the same metric definitions across all dashboards (from the data catalog).
3. Keep axis scales consistent across similar charts.

### Empower Questioning

1. Make the underlying data accessible. If a viewer wants to dig deeper, they should be able to.
2. Document methodology. How is "active user" defined? What is excluded?
3. Encourage the question: "What does this dashboard NOT show?"

## Red Flags to Watch For

When reviewing a dashboard, look for these warning signs:

- [ ] Y-axis does not start at zero on a bar chart.
- [ ] Only cumulative metrics are shown.
- [ ] No comparison to previous period or target.
- [ ] Color scheme seems designed to make numbers look better (or worse) than they are.
- [ ] No data source or refresh timestamp.
- [ ] Dual-axis chart.
- [ ] Cherry-picked time range without explanation.
- [ ] Headline metric uses percentage without absolute numbers.
- [ ] Dashboard has more than 15 tiles.
- [ ] Metrics are undefined or use ambiguous names.

## The Analyst's Responsibility

As the person creating dashboards, you have an ethical responsibility:

1. **Present the truth, even when it is uncomfortable.** Dashboards that only show good news are useless.
2. **Do not let stakeholders pressure you into misleading presentations.** Push back on requests to truncate axes, cherry-pick dates, or exclude inconvenient data.
3. **Make it easy to understand, not easy to misunderstand.** Simplicity is good. Oversimplification that hides reality is deception.
4. **Document your choices.** Why did you pick this time range? Why this metric? Why this chart type? Documentation protects you and informs the viewer.
