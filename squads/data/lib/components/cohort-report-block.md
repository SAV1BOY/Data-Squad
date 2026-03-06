# Cohort Report Block Component

A reusable block for presenting cohort analysis results, including retention curves, period-over-period comparisons, and key findings.

---

## Template

### Cohort Definition

| Field                  | Value                                       |
|------------------------|---------------------------------------------|
| **Cohort Type**        | Acquisition / Behavioral / Feature Adoption |
| **Cohort Criterion**   | _e.g., Users who signed up in week of Jan 6_ |
| **Cohort Grain**       | Daily / Weekly / Monthly                    |
| **Activity Definition**| _e.g., Any session lasting > 30 seconds_    |
| **Exclusions**         | _e.g., Bot accounts, churned before day 1_  |
| **Cohort Size**        | _e.g., 4,230 users_                         |

### Retention Table

Rows represent cohort periods; columns represent time since cohort entry.

| Cohort     | Size  | Period 0 | Period 1 | Period 2 | Period 3 | Period 4 | Period 5 | Period 6 |
|------------|-------|----------|----------|----------|----------|----------|----------|----------|
| Jan Week 1 | 4,230 | 100%     | 42.1%    | 31.5%    | 26.8%    | 24.2%    | 22.7%    | 21.9%    |
| Jan Week 2 | 3,890 | 100%     | 39.8%    | 29.2%    | 25.1%    | 23.0%    | 21.4%    | —        |
| Jan Week 3 | 4,510 | 100%     | 44.3%    | 33.0%    | 28.4%    | 25.9%    | —        | —        |
| Jan Week 4 | 4,120 | 100%     | 41.6%    | 30.8%    | 26.3%    | —        | —        | —        |

### Curve Visualization Specification

For rendering retention curves in a charting tool:

```yaml
chart_type: line
x_axis:
  label: "Periods Since Entry"
  values: [0, 1, 2, 3, 4, 5, 6]
y_axis:
  label: "Retention Rate (%)"
  min: 0
  max: 100
series:
  - name: "Jan Week 1"
    color: "#1f77b4"
    data: [100, 42.1, 31.5, 26.8, 24.2, 22.7, 21.9]
  - name: "Jan Week 2"
    color: "#ff7f0e"
    data: [100, 39.8, 29.2, 25.1, 23.0, 21.4]
  - name: "Jan Week 3"
    color: "#2ca02c"
    data: [100, 44.3, 33.0, 28.4, 25.9]
annotations:
  - type: "horizontal_line"
    value: 25
    label: "Target: 25% at Period 4"
    style: "dashed"
reference_curve:
  label: "Industry Benchmark"
  data: [100, 40, 28, 22, 18, 16, 15]
```

### Period-over-Period Comparison

Compare equivalent maturity points across cohorts:

| Maturity Point | Oldest Cohort | Newest Cohort | Delta   | Trend     |
|----------------|---------------|---------------|---------|-----------|
| Period 1       | 42.1%         | 41.6%         | -0.5pp  | Stable    |
| Period 2       | 31.5%         | 30.8%         | -0.7pp  | Stable    |
| Period 3       | 26.8%         | 26.3%         | -0.5pp  | Stable    |

### Key Findings

Structure findings as observation, so-what, and now-what:

1. **Observation:** Jan Week 3 cohort shows the highest Period 1 retention at 44.3%.
   **So what:** This cohort coincided with the onboarding flow redesign launch.
   **Now what:** Validate with a controlled experiment isolating the onboarding change.

2. **Observation:** All cohorts show a steep drop between Period 0 and Period 1 (losing ~58% of users).
   **So what:** The activation gap is the single largest leverage point for improving long-term retention.
   **Now what:** Prioritize activation experiments targeting the first 24 hours.

3. **Observation:** Retention curves flatten around Period 4-5 near 22-25%.
   **So what:** Users who survive to Period 4 are likely retained long-term.
   **Now what:** Focus acquisition quality and activation; post-Period-4 churn is low-priority.

### Context and Caveats

- **Seasonality:** Note if any cohort period overlaps with holidays, promotions, or outages.
- **Sample size warning:** Flag cohorts with fewer than 500 users as potentially unreliable.
- **Incomplete cohorts:** Mark periods that have not fully matured with "—" rather than partial data.
- **Definition changes:** If the activity definition changed mid-analysis, call it out explicitly.
