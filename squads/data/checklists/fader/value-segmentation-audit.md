# Value Segmentation Audit

## Purpose

Audit whether customer segmentation is rooted in economic value rather than superficial demographics. Fader's core argument: the most useful segmentation separates customers by what they are worth (current and future value), not by who they are. Demographics may correlate with value, but they are not the driver.

---

## Checklist Items

### 1. Segmentation Is Value-Based at Its Core
- **Pass:** The primary segmentation variable is derived from customer economic value (CLV, revenue, margin, or a validated proxy). Demographics and firmographics are secondary overlays.
- **Fail:** Segmentation is based solely on age, geography, industry, or company size with no value dimension.

### 2. Forward-Looking Value Is Used, Not Just Historical
- **Pass:** Segments are defined by predicted future value (CLV or expected future purchases), not just past revenue, because a high-past-value customer may already be churning.
- **Fail:** Segmentation uses total historical spend, which favors long-tenured customers regardless of future potential.

### 3. At Least Three Value Tiers Exist
- **Pass:** Customers are divided into at least three tiers (e.g., high-value, mid-value, low-value) with clear boundaries and distinct strategies for each tier.
- **Fail:** There are only two segments ("good" and "everyone else") or segments exist but all receive the same treatment.

### 4. Segment Sizes and Value Shares Are Quantified
- **Pass:** Each segment has documented customer count, percentage of total customers, total revenue contribution, and average CLV.
- **Fail:** Segments are labeled but nobody can say how many customers are in each or what they contribute.

### 5. Migration Between Segments Is Tracked
- **Pass:** Customer movement between value segments is measured over time (e.g., quarterly migration matrix showing upgrades, downgrades, and churn per segment).
- **Fail:** Segments are static labels assigned once and never updated.

### 6. Treatment Strategies Differ by Segment
- **Pass:** Each segment has a distinct strategy: high-value gets retention investment, mid-value gets development programs, low-value gets efficiency-focused or self-serve treatment.
- **Fail:** All customers receive the same marketing, the same support SLA, and the same retention effort regardless of value.

### 7. Negative-Value Customers Are Identified
- **Pass:** The analysis identifies customers who cost more to serve than they generate in revenue, and there is a strategy to address them (reduce cost-to-serve, reprice, or gracefully exit).
- **Fail:** The concept of negative-value customers is not acknowledged, or it is acknowledged but nobody acts on it.

### 8. Segmentation Is Refreshed Regularly
- **Pass:** Value segments are recalculated at least quarterly, reflecting changes in customer behavior and updated CLV estimates.
- **Fail:** Segmentation was done once as a project and has not been updated in over 6 months.

### 9. Segments Are Actionable in Operational Systems
- **Pass:** Segment membership is available in CRM, marketing automation, and customer success platforms, enabling segment-specific workflows.
- **Fail:** Segments exist only in an analyst's spreadsheet and cannot be operationalized.

### 10. Demographic Overlays Add Explanatory Power
- **Pass:** Demographics are used to understand why value segments differ (e.g., "high-value segment skews toward enterprise accounts"), enabling better acquisition targeting.
- **Fail:** Demographics replace value as the segmentation basis, or they are ignored entirely.

---

## Cross-References

- [CLV Modeling Audit](clv-modeling-audit.md) -- CLV powers value segmentation
- [Fader Whale Curve Audit](fader-whale-curve-audit.md) -- whale curve visualizes value concentration
- [Fader Heterogeneity Audit](fader-heterogeneity-audit.md) -- value segmentation is an expression of heterogeneity
- [Retention vs. Acquisition Balance](retention-vs-acquisition-balance.md) -- investment should follow segment value

---

## Applied In

| Task | Gate Level | Path |
|------|-----------|------|
| run-segmentation | G4 -- Insight | `tasks/analysis/run-segmentation.md` |
| cs-health-score-design | G4 -- Insight | `tasks/customer-success/cs-health-score-design.md` |
| segment-refresh | G4 -- Insight | `tasks/analysis/segment-refresh.md` |

**Quality Gate Type:** agent-specific (peter-fader)
