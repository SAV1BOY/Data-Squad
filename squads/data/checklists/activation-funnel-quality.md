# Activation Funnel Quality Checklist

## Purpose

This checklist ensures that activation funnel analyses are rigorous, actionable,
and grounded in real user behavior. Activation is the bridge between acquisition
and retention — get it wrong, and you optimize for vanity metrics while users
silently churn. Use this checklist before presenting any activation analysis,
redesigning onboarding flows, or defining "aha moment" criteria.

## When to Use

- Before launching or modifying an onboarding flow
- When defining or redefining the product's "aha moment"
- During activation funnel audits or quarterly metric reviews
- Before presenting activation data to stakeholders

---

## Checklist Items

### 1. Aha Moment Is Empirically Identified
- **Pass:** The aha moment is derived from data (correlation between early action and retention), not from intuition or stakeholder opinion.
- **Fail:** The aha moment is assumed ("users who complete profile are activated") without statistical validation.

### 2. Activation Metric Has a Clear, Measurable Definition
- **Pass:** The activation event is a specific, trackable action with a defined time window (e.g., "user sends first message within 48 hours of signup").
- **Fail:** Activation is vaguely defined ("user engages with the product") or has no time boundary.

### 3. Funnel Steps Are Exhaustive and Sequential
- **Pass:** Every meaningful step between signup and activation is mapped, with drop-off rates calculated at each transition.
- **Fail:** Steps are skipped or aggregated, hiding critical friction points.

### 4. Friction Points Are Quantified, Not Just Identified
- **Pass:** Each friction point has a measured drop-off rate, segmented by cohort (device, source, plan).
- **Fail:** Friction points are listed qualitatively ("users struggle with onboarding") without supporting data.

### 5. Time-to-Value Is Measured and Benchmarked
- **Pass:** Median and percentile distributions of time from signup to activation are calculated and compared against targets or industry benchmarks.
- **Fail:** Time-to-value is not tracked, or only an average is reported (masking bimodal distributions).

### 6. Conversion Steps Account for Segmentation
- **Pass:** Activation rates are broken down by acquisition channel, device type, user persona, and cohort date.
- **Fail:** A single blended activation rate is reported with no segmentation.

### 7. Drop-off Analysis Distinguishes Abandonment from Delay
- **Pass:** Users who never return are separated from users who return later. Delayed activators are analyzed separately.
- **Fail:** All non-activated users within the window are treated as lost, inflating perceived drop-off.

### 8. Recommended Actions Are Prioritized by Impact
- **Pass:** Each recommended intervention is ranked by estimated impact (drop-off volume x conversion potential) and effort.
- **Fail:** A flat list of "improvements" is provided with no prioritization framework.

### 9. Activation Rate Trend Is Tracked Over Time
- **Pass:** Activation rates are monitored as a time series with cohort-level granularity to detect regressions.
- **Fail:** Activation is measured as a one-time snapshot with no trend tracking.

### 10. External Factors Are Considered
- **Pass:** Seasonal effects, marketing campaign changes, and product launches are noted when interpreting activation shifts.
- **Fail:** Changes in activation rate are attributed solely to product changes without considering external context.

---

## Cross-References

- **Retention Quality Checklist** (`retention-quality.md`) — Activation feeds directly into retention; validate both together.
- **Experiment Design Quality Checklist** (`experiment-design-quality.md`) — Use when A/B testing onboarding changes.
- **Metric Change Request Template** (`templates/operational/metric-change-request.md`) — Use when proposing changes to the activation definition.
- **Cognitive Load in Dashboards** (`reference/psychology/cognitive-load-in-dashboards.md`) — Relevant when designing activation monitoring dashboards.
- **Narrative Fallacy in Data** (`reference/psychology/narrative-fallacy-in-data.md`) — Guard against crafting stories around funnel data without evidence.

---

---

## Applied In

| Task | Gate Level | Path |
|------|-----------|------|
| run-funnel-analysis | G4 -- Insight | `tasks/analysis/run-funnel-analysis.md` |
| activation-audit | G4 -- Insight | `tasks/growth/activation-audit.md` |

**Quality Gate Type:** per-domain (growth)

*Version: 1.0 | Last updated: 2026-03-06*
