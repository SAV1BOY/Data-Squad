# Dashboard Storytelling Audit

## Purpose

A dashboard is not a data dump -- it is a narrative device. Following Kaushik's principles, every dashboard should answer a question, surface an insight, and prompt an action. This checklist audits whether dashboards function as decision tools or merely as decoration.

---

## Checklist Items

### 1. The Dashboard Answers a Specific Question
- **Pass:** The dashboard title or header states the question it answers (e.g., "How is our Q1 acquisition campaign performing against targets?").
- **Fail:** The dashboard is titled "Marketing Dashboard" or "Weekly Report" with no framing question.

### 2. Layout Follows the Inverted Pyramid
- **Pass:** The most important insight is at the top. Supporting detail follows. Drill-down is available but not required to get the headline.
- **Fail:** The most important metric is buried on page 3 or in the lower-right corner.

### 3. Every Chart Has a Clear Takeaway
- **Pass:** Each visualization includes a text annotation or callout explaining what the viewer should notice (e.g., "Conversion rate dropped 15% after the redesign launched on Feb 12").
- **Fail:** Charts are presented without context, leaving interpretation entirely to the viewer.

### 4. Action Recommendations Are Present
- **Pass:** The dashboard includes a section (or inline annotations) with recommended next steps based on what the data shows.
- **Fail:** The dashboard presents data but never suggests what to do about it.

### 5. Comparisons Are Built In
- **Pass:** Metrics are shown with comparisons: vs. prior period, vs. target, vs. benchmark, or vs. segment. Color coding or arrows indicate direction.
- **Fail:** Numbers are presented in isolation with no reference point.

### 6. The Audience Is Defined
- **Pass:** The dashboard is designed for a specific audience (executive, campaign manager, analyst) and the level of detail matches that audience.
- **Fail:** One dashboard tries to serve everyone, resulting in too much detail for executives and too little for analysts.

### 7. Refresh Cadence Matches Decision Cadence
- **Pass:** The dashboard updates at a frequency that matches when decisions are made (e.g., daily for campaign optimization, weekly for strategy review).
- **Fail:** Real-time dashboards for monthly decisions (wasted engineering), or monthly dashboards for daily decisions (stale data).

### 8. No More Than 8-10 Metrics on One View
- **Pass:** The primary view contains 8 or fewer KPIs. Additional metrics live in linked drill-down pages.
- **Fail:** The dashboard is a wall of numbers with 20+ metrics competing for attention.

### 9. Data Quality Indicators Are Visible
- **Pass:** The dashboard shows last-refresh timestamp, data source, and any known data quality issues (e.g., "Tracking was down Feb 3-5").
- **Fail:** There is no way to know how fresh or reliable the data is.

### 10. The Dashboard Is Actually Used
- **Pass:** Usage logs show the dashboard is viewed regularly by its intended audience. Feedback has been collected in the last quarter.
- **Fail:** The dashboard was built, shared once, and has had zero views in the last 30 days.

---

## Cross-References

- [Metrics That Matter Filter](metrics-that-matter-filter.md) -- only metrics passing the filter belong on dashboards
- [DMMM Measurement Model Audit](dmmm-measurement-model-audit.md) -- dashboard structure should mirror the DMMM
- [Kaushik Actionable Insights Audit](kaushik-actionable-insights-audit.md) -- dashboards must surface actionable insights
- [Web Analytics Quality](web-analytics-quality.md) -- data feeding the dashboard must be clean
