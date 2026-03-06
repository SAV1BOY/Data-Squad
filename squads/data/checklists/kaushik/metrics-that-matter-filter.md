# Metrics That Matter Filter

## Purpose

Apply Kaushik's "so what?" test rigorously to every metric in use. A metric earns its place only if it changes behavior -- if it moves and nobody does anything differently, it is vanity. This checklist ensures every reported metric passes the actionability and relevance bar.

---

## Checklist Items

### 1. Every Metric Has a Named Decision It Informs
- **Pass:** For each metric on a report or dashboard, there is a documented decision or action it triggers (e.g., "If bounce rate on landing page X exceeds 60%, we redesign the hero section").
- **Fail:** The metric is reported because "we always have" or "the tool provides it" with no linked action.

### 2. The "So What?" Test Is Applied
- **Pass:** For each metric, the analyst can answer three levels of "so what?" (Metric moved -> This means X -> Therefore we should Y).
- **Fail:** The chain breaks at the first or second level, indicating the metric is descriptive but not actionable.

### 3. Rates and Ratios Are Preferred Over Counts
- **Pass:** Metrics are expressed as rates, ratios, or per-unit values (e.g., revenue per visit, conversion rate, pages per session) rather than raw counts.
- **Fail:** Reports feature total page views, total sessions, or total clicks as headline metrics without normalization.

### 4. Trends Are Shown, Not Just Snapshots
- **Pass:** Every metric is presented with at least 8 weeks of trend data and compared against a prior period or target.
- **Fail:** Metrics are shown as single numbers with no historical context, making it impossible to judge direction.

### 5. Segmentation Is Applied
- **Pass:** Key metrics are broken down by at least one meaningful segment (traffic source, device, geography, customer type) to surface actionable differences.
- **Fail:** Only aggregate numbers are reported, hiding segment-level problems and opportunities.

### 6. Vanity Metrics Are Explicitly Flagged or Removed
- **Pass:** Metrics like total page views, total followers, or total app downloads are either removed from reports or explicitly labeled as context-only (not KPIs).
- **Fail:** Vanity metrics appear alongside actionable KPIs with equal visual weight, misleading stakeholders.

### 7. Each Metric Has a Clear Definition
- **Pass:** Every metric has a written definition including calculation method, data source, filters applied, and known limitations.
- **Fail:** Team members interpret the same metric name differently (e.g., "active users" means different things to different people).

### 8. Metric Count per Report Is Controlled
- **Pass:** No single report or dashboard contains more than 8-10 KPIs. Additional metrics are available in drill-down views.
- **Fail:** Dashboards contain 20+ metrics, diluting attention and making it impossible to focus on what matters.

### 9. Leading and Lagging Indicators Are Balanced
- **Pass:** The metric set includes both leading indicators (predictive, actionable now) and lagging indicators (outcome confirmation).
- **Fail:** Only lagging indicators are reported, meaning by the time you see the number it is too late to act.

### 10. Metric Retirement Process Exists
- **Pass:** There is a documented process to review and retire metrics that no longer inform decisions, run at least quarterly.
- **Fail:** Metrics accumulate over time with no mechanism to prune, leading to dashboard bloat.

---

## Cross-References

- [DMMM Measurement Model Audit](dmmm-measurement-model-audit.md) -- metrics must trace back to the DMMM
- [Dashboard Storytelling Audit](dashboard-storytelling-audit.md) -- dashboards should only contain metrics that pass this filter
- [Kaushik Actionable Insights Audit](kaushik-actionable-insights-audit.md) -- insights must emerge from actionable metrics
- [See-Think-Do-Care Mapping](see-think-do-care-mapping.md) -- metrics must be stage-appropriate
