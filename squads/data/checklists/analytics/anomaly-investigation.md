# Anomaly Investigation Checklist

## Purpose

Provide a structured protocol for investigating metric anomalies -- unexpected spikes, drops, or pattern changes. This gate ensures anomalies are verified before triggering panic, root causes are identified before fixes are attempted, and findings are documented for future reference.

---

## Checklist Items

### 1. The Anomaly Is Confirmed as Real

- **Pass:** The anomaly is reproduced in at least two independent data sources or views. Data pipeline freshness, ETL failures, and known delays are ruled out. The metric definition has not changed recently.
- **Fail:** A dashboard shows a drop, but no one checks whether the data pipeline ran successfully or whether the metric was recently redefined.

### 2. Scope and Magnitude Are Quantified

- **Pass:** The investigation answers: How large is the deviation from the expected value (in absolute and percentage terms)? Which segments are affected (all users, specific platform, specific region)? When exactly did it start?
- **Fail:** The anomaly is described as "metrics are down" without quantifying the deviation or narrowing the scope.

### 3. Temporal Pattern Is Characterized

- **Pass:** The team determines whether the anomaly is a sudden step change, a gradual trend, a spike-and-recovery, or a periodic pattern. The temporal shape informs the hypothesis (deploy vs. external event vs. seasonal).
- **Fail:** The anomaly is treated as a single data point without examining the time series around it.

### 4. Hypotheses Are Generated Systematically

- **Pass:** At least three hypotheses are listed, covering: (a) instrumentation/data pipeline issue, (b) product or code change, (c) external event or seasonality. Each hypothesis has a testable prediction.
- **Fail:** The team jumps to the first plausible explanation without considering alternatives.

### 5. Each Hypothesis Is Tested With Evidence

- **Pass:** For each hypothesis, the team identifies a specific data check that would confirm or refute it. For example: "If the deploy caused it, the timing should match the deploy log and only affect the changed feature."
- **Fail:** Hypotheses are debated in meetings without anyone pulling data to test them.

### 6. Deploy and Change Logs Are Cross-Referenced

- **Pass:** The investigation checks the deploy log, feature flag changes, configuration changes, third-party SDK updates, and marketing campaign launches within a 48-hour window around the anomaly start.
- **Fail:** Engineering changes are not correlated with the anomaly timeline.

### 7. Resolution or Ongoing Monitoring Plan Is Defined

- **Pass:** If the root cause is found, a fix is implemented or a decision is made to accept the change. If the root cause is not found, an ongoing monitoring alert is set up with a follow-up review date.
- **Fail:** The anomaly is discussed once and then forgotten, with no resolution or follow-up.

### 8. Investigation Is Documented in a Standard Format

- **Pass:** A brief post-mortem or investigation log captures: anomaly description, timeline, hypotheses tested, root cause (or "unknown"), resolution, and preventive measures. It is stored in a searchable location.
- **Fail:** Investigation happens in Slack threads that are lost within days.

---

## Cross-References

- [Metric Drift Detection](metric-drift-detection.md) -- Gradual anomalies may be metric drift rather than sudden incidents.
- [Root Cause Analysis QA](root-cause-analysis-qa.md) -- Complex anomalies benefit from structured RCA.
- [Tag Manager QA](../instrumentation/tag-manager-qa.md) -- Many anomalies trace back to instrumentation changes.
