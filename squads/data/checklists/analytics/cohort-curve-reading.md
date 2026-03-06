# Cohort Curve Reading Checklist

## Purpose

Ensure that survival curves, retention curves, and cohort-based analyses are interpreted correctly. Misreading cohort curves is one of the most common analytical mistakes -- this gate prevents premature conclusions, incomplete cohort comparisons, and misattribution of trends.

---

## Checklist Items

### 1. Cohort Definition Is Precise and Consistent

- **Pass:** The cohort is defined by a specific event (e.g., sign-up date, first purchase date) with a clear calendar boundary (week, month). The same definition is applied uniformly across all cohorts being compared.
- **Fail:** Cohort boundaries shift between analyses, or different cohorts use different qualifying events.

### 2. Cohorts Have Sufficient Maturity Before Comparison

- **Pass:** Only cohorts that have had enough time to reach the metric milestone are compared. A 2-week-old cohort is not compared to a 12-week-old cohort on Month-3 retention without clearly labeling the immature cohort as incomplete.
- **Fail:** Immature cohorts are plotted alongside mature ones, creating the illusion of declining retention when data simply has not accumulated yet.

### 3. Cohort Size Differences Are Acknowledged

- **Pass:** Cohort sizes are displayed alongside retention percentages. When a cohort is significantly smaller (e.g., holiday week), the wider confidence interval is noted and the data point is not over-interpreted.
- **Fail:** A 95% Day-7 retention on a cohort of 50 users is treated with the same weight as 70% retention on a cohort of 50,000.

### 4. The Curve Shape Is Interpreted, Not Just the Endpoint

- **Pass:** The team examines the curve shape: steep early drop-off (activation problem), gradual decline (engagement decay), flattening (stable core), or late drop (triggered churn). Shape informs the intervention type.
- **Fail:** Only the final retention percentage is discussed; the trajectory is ignored.

### 5. Seasonality and External Events Are Controlled

- **Pass:** Cohort comparisons account for seasonal patterns (e.g., holiday sign-ups behave differently). Year-over-year comparisons or seasonal indices are used when comparing cohorts from different periods.
- **Fail:** A December cohort is compared to a June cohort without adjusting for seasonal behavior differences.

### 6. Mix Shifts Are Identified

- **Pass:** When comparing cohorts over time, the team checks whether the user mix has changed (e.g., a new acquisition channel bringing lower-intent users). Retention is also viewed within fixed segments, not just in aggregate.
- **Fail:** Aggregate retention appears to decline, but the real cause is a shift in acquisition mix -- Simpson's paradox goes undetected.

### 7. Confidence Intervals or Significance Tests Are Applied

- **Pass:** Differences between cohort curves are tested for statistical significance, or confidence bands are plotted. "Cohort B retained 2pp better than Cohort A" includes whether this difference is meaningful given sample sizes.
- **Fail:** Small visual differences between curves are declared wins or losses without any statistical reasoning.

### 8. Actionable Takeaways Are Tied to Specific Curve Features

- **Pass:** The analysis concludes with recommendations linked to specific curve features: "Day-1 drop-off suggests onboarding friction; Day-30 flattening suggests a stable core above 20%. Focus on the first-week experience."
- **Fail:** The analysis ends with "retention looks okay" or "retention is declining" without specifying where or why.

---

## Cross-References

- [Churn Taxonomy](../retention/churn-taxonomy.md) -- Curve features map to churn types and corresponding interventions.
- [Metric Drift Detection](metric-drift-detection.md) -- Cohort shifts can cause apparent metric drift.
- [Cohort definitions inform lifecycle messaging strategy](../retention/lifecycle-messaging-impact.md).
