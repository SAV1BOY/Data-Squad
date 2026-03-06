# NRR/GRR Quality Checklist

> Gate type: Pre-delivery
> Owner: Mehta (Customer Success Strategy Lead)
> Applies to: Any Net Revenue Retention or Gross Revenue Retention calculation, report, or dashboard

## Purpose

NRR and GRR are board-level metrics that drive valuation narratives and strategic decisions. A misaligned contract start date, an inconsistent expansion definition, or a period boundary error can swing NRR by 5-10 points -- enough to change investor sentiment or misallocate CS resources. This gate ensures the numbers are airtight before they leave the data team.

## Checklist Items

1. - [ ] **Formula explicitly stated** -- The exact NRR and GRR formulas used are written out in the deliverable, not assumed.
   - Pass criteria: NRR = (Beginning ARR + Expansion - Contraction - Churn) / Beginning ARR. GRR = (Beginning ARR - Contraction - Churn) / Beginning ARR. Both formulas present with any company-specific adjustments noted.
   - Fail signal: Report shows a percentage with no formula or says "standard NRR calculation."
   - Action if fail: Add the formula with the exact numerator and denominator definitions.

2. - [ ] **ARR source is singular and authoritative** -- ARR figures come from one canonical source (e.g., billing system or finance-approved ARR table), not from multiple conflicting sources.
   - Pass criteria: Source system named; the ARR total reconciles to within 1% of finance's latest close.
   - Fail signal: ARR pulled from CRM opportunity amounts instead of billing, or multiple sources blended.
   - Action if fail: Switch to the finance-approved ARR source and document any known discrepancies.

3. - [ ] **Cohort period boundaries defined** -- The start and end dates of the measurement period are explicit, and "beginning ARR" is snapshotted at a specific date.
   - Pass criteria: e.g., "Beginning ARR as of 2026-01-01; measurement period 2026-01-01 to 2026-03-31."
   - Fail signal: Period described vaguely ("Q1") with no exact snapshot date for beginning ARR.
   - Action if fail: Pin exact dates and regenerate from the snapshot.

4. - [ ] **Expansion definition consistent** -- What counts as expansion (upsell, cross-sell, seat addition, price increase) is defined and matches prior periods.
   - Pass criteria: Definition documented and unchanged from the last reporting period, or changes are called out.
   - Fail signal: Price increases counted as expansion this quarter but not last quarter, inflating NRR.
   - Action if fail: Align the definition with the prior period and restate if the methodology changed.

5. - [ ] **Contraction vs. churn distinguished** -- Downgrades (contraction) and full cancellations (churn) are separated, not lumped together.
   - Pass criteria: Contraction and churn are separate line items in the calculation.
   - Fail signal: All revenue losses grouped as "churn" regardless of whether the customer is still active.
   - Action if fail: Split the categories using contract or subscription status as the differentiator.

6. - [ ] **Multi-year contracts handled correctly** -- Customers on multi-year deals are included in the beginning ARR cohort and their renewals are attributed to the correct period.
   - Pass criteria: Multi-year contracts are annualized and renewal events are recognized in the period the renewal decision occurs (not contract end).
   - Fail signal: A 3-year contract is excluded from NRR until it renews, hiding potential risk.
   - Action if fail: Annualize multi-year contracts and include them in every period's cohort.

7. - [ ] **Currency normalization applied** -- If customers pay in multiple currencies, all values are converted using a consistent rate.
   - Pass criteria: FX rate source and date documented; constant-currency NRR shown alongside nominal if FX impact > 1%.
   - Fail signal: Some contracts in USD, others in EUR, mixed without conversion.
   - Action if fail: Apply a single FX rate (e.g., period-start rate) and add a constant-currency view.

8. - [ ] **Logo vs. revenue churn separated** -- Logo churn (count of lost customers) is reported alongside revenue churn; the two are not conflated.
   - Pass criteria: Both metrics present; it is clear whether NRR/GRR references revenue, not logos.
   - Fail signal: "Churn is 5%" with no indication of whether that is logo or revenue.
   - Action if fail: Add both metrics and label clearly.

9. - [ ] **Reconciliation to finance** -- The NRR/GRR output has been compared against finance's independent calculation or the prior board deck.
   - Pass criteria: Delta between data team's NRR and finance's NRR is < 0.5 points, or differences are explained.
   - Fail signal: No reconciliation performed, or delta > 1 point with no explanation.
   - Action if fail: Reconcile line by line; resolve discrepancies before delivery.

10. - [ ] **Trailing vs. point-in-time labeled** -- The report states whether NRR is trailing-12-month, quarterly annualized, or cohort-based.
    - Pass criteria: Time-window methodology is in the subtitle or footnote of every NRR figure.
    - Fail signal: A single "NRR" number with no indication of the time window.
    - Action if fail: Add the time-window label and, if multiple windows are relevant, show both.

11. - [ ] **Segment-level NRR available** -- NRR is broken out by at least one segment dimension (e.g., plan tier, geography, customer size).
    - Pass criteria: At least one segmented view accompanies the aggregate number.
    - Fail signal: Only a company-wide NRR is shown, masking a struggling segment.
    - Action if fail: Add the most relevant segmentation and note any segments with < 20 accounts (low statistical reliability).

12. - [ ] **Trend included** -- At least 4 consecutive periods of NRR/GRR are shown to reveal direction.
    - Pass criteria: A time-series chart or table with >= 4 periods is present.
    - Fail signal: Only the current period's number is shown with no historical context.
    - Action if fail: Add the trend line and annotate any methodology changes between periods.

## Cross-References

- See `churn-analysis-quality.md` for deeper investigation into the drivers behind the churn component of GRR.
- See `cs-health-score-quality.md` for the predictive layer that complements retention reporting.
- See `exec-report-quality.md` for how NRR/GRR should be presented in board-level summaries.
