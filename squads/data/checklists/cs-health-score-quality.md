# CS Health Score Quality Checklist

> Gate type: Review
> Owner: Mehta (Customer Success Strategy Lead)
> Applies to: Any customer health score model, composite score definition, or health-score refresh

## Purpose

A customer health score is the single most-used artifact by CS teams for prioritization. If the inputs are stale, the weights are arbitrary, or the score triggers false positives, CSMs waste hours chasing healthy accounts while at-risk ones slip through. This gate ensures every health score iteration is grounded in validated signals before it goes live.

## Checklist Items

1. - [ ] **Input signals documented** -- Every raw input feeding the score is listed with its source system, update frequency, and expected range.
   - Pass criteria: A table exists mapping each input to source, refresh cadence, and min/max values.
   - Fail signal: Inputs described vaguely (e.g., "usage data") without specifics on which tables or events.
   - Action if fail: Build the input inventory table before proceeding with weight calibration.

2. - [ ] **No single input dominates** -- No individual input contributes more than 40% of the composite score unless explicitly justified.
   - Pass criteria: Weight distribution documented; max single-input weight <= 40% or a written justification exists.
   - Fail signal: One input (e.g., login frequency) effectively determines the entire score.
   - Action if fail: Rebalance weights or document why a dominant input is acceptable for this customer segment.

3. - [ ] **Weights are empirically calibrated** -- Weights are derived from historical churn correlation, not gut feel alone.
   - Pass criteria: A logistic regression, SHAP analysis, or at minimum a correlation matrix against churn outcomes is referenced.
   - Fail signal: Weights are round numbers (25/25/25/25) with no supporting analysis.
   - Action if fail: Run a retrospective analysis against known churn events from the last 12 months and adjust weights.

4. - [ ] **Scoring bands defined and labeled** -- The score range is segmented into bands (e.g., Healthy / At-risk / Critical) with explicit thresholds.
   - Pass criteria: Bands documented with numeric boundaries and each band has a recommended CSM action.
   - Fail signal: Score is a raw number with no interpretation guide.
   - Action if fail: Define bands using historical distribution and churn-rate breakpoints.

5. - [ ] **False positive rate estimated** -- The percentage of accounts flagged "at-risk" that did not churn in the prior period is measured.
   - Pass criteria: False positive rate is < 30% on the last 6 months of data, or a plan to reduce it is documented.
   - Fail signal: No false positive analysis exists, or the rate exceeds 50%.
   - Action if fail: Run a confusion matrix on historical data and tune thresholds or inputs accordingly.

6. - [ ] **False negative rate estimated** -- The percentage of churned accounts that were scored "healthy" in their last assessment is measured.
   - Pass criteria: False negative rate < 20% on the last 12 months of churns.
   - Fail signal: No analysis, or multiple surprise churns came from accounts scored healthy.
   - Action if fail: Investigate missed churns for common patterns and add missing input signals.

7. - [ ] **Onboarding-phase accounts handled** -- New accounts (< 90 days) are either scored with a separate model or excluded with a "pending" label.
   - Pass criteria: Onboarding accounts have a distinct scoring rule or are flagged as insufficient-data.
   - Fail signal: New accounts default to "healthy" due to lack of negative signals, masking early warning signs.
   - Action if fail: Create an onboarding-specific scoring path using milestone completion and time-to-value signals.

8. - [ ] **Data freshness validated** -- Each input is checked for staleness; an alert fires if any input is older than its expected cadence.
   - Pass criteria: A freshness monitor exists and the most recent score run used data within SLA.
   - Fail signal: Score was computed with usage data that is 2+ weeks old.
   - Action if fail: Add freshness checks to the scoring pipeline and hold score publication if inputs are stale.

9. - [ ] **Score change alerts configured** -- Large score swings (e.g., drop of 20+ points in one period) trigger a notification to the account CSM.
   - Pass criteria: Alert threshold defined and routed to the correct CSM or CS lead.
   - Fail signal: Scores update silently; CSMs only discover changes during weekly reviews.
   - Action if fail: Implement a score-delta alert in the CS platform or via a scheduled query.

10. - [ ] **Segment-level validation** -- The score performs reasonably across customer segments (SMB, Mid-Market, Enterprise) and is not biased toward one.
    - Pass criteria: Precision and recall reviewed per segment; no segment has > 2x the false positive rate of another.
    - Fail signal: Enterprise accounts are always scored "healthy" because they have higher login counts by default.
    - Action if fail: Normalize inputs by segment or build segment-specific scoring models.

11. - [ ] **Score is actionable** -- Each score band maps to a specific playbook or escalation path.
    - Pass criteria: CS playbook document links each band to concrete next steps (e.g., "Critical -> EBR within 5 days").
    - Fail signal: Scores exist but CSMs do not change their behavior based on them.
    - Action if fail: Co-design band-specific playbooks with CS leadership before launching the score.

12. - [ ] **Quarterly recalibration scheduled** -- A review cadence is set to re-validate weights and thresholds against recent churn data.
    - Pass criteria: Calendar invite or recurring task exists for quarterly health score review.
    - Fail signal: The score was last tuned 18 months ago and the product has changed significantly since.
    - Action if fail: Schedule the next recalibration and add it to the data team's quarterly roadmap.

## Cross-References

- See `churn-analysis-quality.md` for the churn definitions and cohort logic that feed false-positive/negative analysis.
- See `nrr-grr-quality.md` for revenue-side validation that complements usage-based health scoring.
- See `alerting-quality.md` for alert configuration standards applied to score-change notifications.
