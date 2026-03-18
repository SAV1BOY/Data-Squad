# Segmentation Quality Checklist
> Gate type: Review
> Owner: Fader
> Applies to: Customer segmentation models, persona definitions, and segment-based strategy documents

## Purpose
Segmentation is only useful if the resulting segments are distinct enough to warrant different treatment, stable enough to be targeted operationally, and actionable enough to change decisions. This gate prevents vanity segmentations that look interesting in a slide deck but never influence a campaign, product decision, or pricing strategy.

## Checklist Items

1. - [ ] **Hypothesis stated** -- The segmentation starts with a clear business hypothesis about why different groups should be treated differently.
   - Pass criteria: A written hypothesis exists (e.g., "We believe power users and casual users have different willingness to pay and should see different upgrade prompts").
   - Fail signal: Segmentation was run exploratorily with no guiding hypothesis; segments discovered after the fact.
   - Action if fail: Write the business hypothesis first; then design the segmentation to test it.

2. - [ ] **Variable selection rationale** -- The variables used for segmentation are chosen based on business relevance, not just statistical convenience.
   - Pass criteria: Each input variable has a documented reason for inclusion tied to the hypothesis.
   - Fail signal: Variables chosen because they were available or because they maximised cluster separation without business logic.
   - Action if fail: Review variable list against the hypothesis; drop variables that do not connect to a business decision.

3. - [ ] **Segment distinctiveness** -- Segments are meaningfully different from each other on the key behavioural or value dimensions.
   - Pass criteria: Statistical tests or effect sizes show significant differences between segments on at least 3 key metrics.
   - Fail signal: Segment profiles overlap heavily; a radar chart shows similar shapes across segments.
   - Action if fail: Re-run with different variables, methods, or number of segments until distinctiveness is achieved.

4. - [ ] **Segment stability** -- Running the segmentation on a different time period or a holdout sample produces similar groups.
   - Pass criteria: Stability test documented; segment assignments match at least 80% between training and holdout sets.
   - Fail signal: No stability test performed; segments shift dramatically with new data.
   - Action if fail: Test on holdout data or a different period; if unstable, simplify the model or use rule-based segments.

5. - [ ] **Segment size viability** -- Each segment is large enough to be operationally targetable.
   - Pass criteria: No segment contains fewer than 5% of the population (or a stated minimum); segment sizes documented.
   - Fail signal: A segment contains a handful of users, making targeted action impractical.
   - Action if fail: Merge small segments or reduce the number of segments.

6. - [ ] **Actionability per segment** -- For each segment, at least one distinct action is identified that would not apply to other segments.
   - Pass criteria: An action table maps each segment to a unique strategy (pricing, messaging, feature emphasis, channel).
   - Fail signal: All segments receive the same treatment; segmentation exists only for reporting.
   - Action if fail: Workshop with marketing, product, and sales to identify differentiated actions per segment.

7. - [ ] **Naming clarity** -- Segment names are descriptive and self-explanatory to non-analysts.
   - Pass criteria: Names convey the defining characteristic (e.g., "High-frequency low-spend" vs. "Cluster 3").
   - Fail signal: Segments named with numbers, letters, or jargon that requires a lookup table.
   - Action if fail: Rename segments using plain language that describes their dominant trait.

8. - [ ] **Assignment mechanism** -- A clear rule or model exists to assign new or unseen users to a segment in real time or near-real time.
   - Pass criteria: Assignment logic documented as a decision tree, scoring model, or SQL query that can be operationalised.
   - Fail signal: Segments only exist in a one-time analysis; no way to assign future users.
   - Action if fail: Build an assignment model or rule set and deploy it to the data pipeline.

9. - [ ] **Overlap and exclusivity** -- Every user belongs to exactly one segment (for hard segmentation) or has a probabilistic assignment (for soft segmentation).
   - Pass criteria: Sum of segment memberships equals total population (hard) or probabilities sum to 1 per user (soft).
   - Fail signal: Users appear in multiple segments or are unassigned.
   - Action if fail: Fix assignment logic to ensure mutual exclusivity and exhaustive coverage.

10. - [ ] **Bias and fairness review** -- The segmentation does not inadvertently create segments that correlate with protected characteristics.
    - Pass criteria: Demographic profile of each segment reviewed; no segment is a proxy for a protected group.
    - Fail signal: A segment disproportionately contains a single demographic group, raising fairness concerns.
    - Action if fail: Investigate the proxy effect; adjust variables or add fairness constraints.

11. - [ ] **Refresh cadence** -- The segmentation has a defined refresh schedule and a trigger for re-evaluation.
    - Pass criteria: Refresh frequency documented (e.g., quarterly); trigger events listed (e.g., product pivot, major user growth).
    - Fail signal: Segmentation is a one-time snapshot with no plan for updates.
    - Action if fail: Set a calendar reminder for refresh and define triggers for ad-hoc re-runs.

12. - [ ] **Decision impact tracking** -- A plan exists to measure whether segment-differentiated actions outperform one-size-fits-all.
    - Pass criteria: A/B test or pre/post comparison designed to validate that segmentation-driven actions improve outcomes.
    - Fail signal: Segments deployed without any plan to measure their incremental value.
    - Action if fail: Design a holdout experiment comparing segmented treatment to uniform treatment.

## Cross-References
- [Cohort Analysis Quality Checklist](cohort-analysis-quality.md)
- [Retention Quality Checklist](retention-quality.md)
- [LTV/CLV Model Quality Checklist](ltv-clv-model-quality.md)
- [Activation Funnel Quality Checklist](activation-funnel-quality.md)

---

## Applied In

| Task | Gate Level | Path |
|------|-----------|------|
| run-segmentation | G4 -- Insight | `tasks/analysis/run-segmentation.md` |
| segment-refresh | G4 -- Insight | `tasks/analysis/segment-refresh.md` |

**Quality Gate Type:** per-domain (analysis)
