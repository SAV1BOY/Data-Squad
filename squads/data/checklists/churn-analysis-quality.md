# Churn Analysis Quality Checklist

> Gate type: Post-delivery
> Owner: Mehta / Fader (Customer Success Strategy Lead / Predictive Analytics Lead)
> Applies to: Any churn deep-dive, churn cohort report, or churn intervention ROI analysis

## Purpose

Churn analysis is only useful if the definitions are consistent, the cohorts are comparable, and the interventions are measurable. Sloppy churn work leads to contradictory dashboards ("marketing says churn is 3%, CS says 8%") and intervention budgets allocated to the wrong causes. This gate ensures every churn deliverable is precise enough to drive action.

## Checklist Items

1. - [ ] **Churn definition explicit** -- The deliverable states whether churn means logo churn, revenue churn, subscription cancellation, or non-renewal, and the exact triggering event.
   - Pass criteria: A one-sentence definition with the trigger event (e.g., "Logo churn = no active subscription 30 days after renewal date").
   - Fail signal: "Churn" used without definition, or different sections use different definitions.
   - Action if fail: Add the definition at the top of the document and audit all references for consistency.

2. - [ ] **Voluntary vs. involuntary churn separated** -- Customers who chose to leave are distinguished from those lost due to payment failure, bankruptcy, or M&A.
   - Pass criteria: Two categories reported separately; involuntary churn causes listed.
   - Fail signal: All churn lumped together, inflating the addressable churn number.
   - Action if fail: Tag churn events by cause category and re-segment the analysis.

3. - [ ] **Cohort construction is time-bound and comparable** -- Cohorts are defined by a consistent dimension (signup month, contract start quarter) and each cohort has enough accounts to be meaningful.
   - Pass criteria: Cohort dimension stated; minimum cohort size >= 30 accounts or noted as low-confidence.
   - Fail signal: Cohorts of 5 accounts compared to cohorts of 500 without caveat.
   - Action if fail: Merge small cohorts or flag them with a confidence warning.

4. - [ ] **Observation window consistent** -- Each cohort is observed for the same duration (e.g., 12-month retention curve) before being compared.
   - Pass criteria: All cohorts in a comparison have completed the same observation period.
   - Fail signal: A 6-month-old cohort compared to a 24-month-old cohort on lifetime churn rate.
   - Action if fail: Truncate comparison to the shortest common window or use survival analysis.

5. - [ ] **Churn causes categorized** -- Root causes are grouped into a taxonomy (product-fit, price, support experience, competitor, business closure, etc.) with data backing.
   - Pass criteria: At least top-5 causes listed with volume or percentage; source (exit survey, CSM notes, support tickets) cited.
   - Fail signal: Causes are anecdotal ("we think it's pricing") with no data.
   - Action if fail: Pull available cause data from exit surveys, CSM logs, and cancellation flows. Acknowledge gaps.

6. - [ ] **Survival or retention curve included** -- A Kaplan-Meier or simple retention curve is shown for the key cohorts, not just a point-in-time churn rate.
   - Pass criteria: A time-series retention chart with labeled axes and cohort legend.
   - Fail signal: Only a single churn percentage with no temporal shape.
   - Action if fail: Generate the retention curve from event data; if data is insufficient, state the limitation.

7. - [ ] **Seasonality and external factors noted** -- The analysis flags any seasonal patterns or external events (e.g., COVID, pricing change, competitor launch) that affect the period.
   - Pass criteria: A sentence or annotation on the chart noting known external factors.
   - Fail signal: A spike in churn is presented without investigating whether an external cause exists.
   - Action if fail: Cross-reference churn spikes with the company event log and macro calendar.

8. - [ ] **Intervention impact measured with a baseline** -- If the analysis evaluates an intervention (e.g., save offer, CSM outreach), the comparison uses a valid baseline or control group.
   - Pass criteria: Intervention group compared to a matched control or a pre-intervention baseline of the same cohort type.
   - Fail signal: "Save offers reduced churn by 20%" without stating what the comparison group was.
   - Action if fail: Define the baseline explicitly. If no control exists, use a pre/post comparison with caveats.

9. - [ ] **ROI of interventions calculated** -- The cost of the intervention is compared to the retained revenue to assess ROI.
   - Pass criteria: Cost per save attempt and average retained ARR per saved account are both stated; net ROI is positive.
   - Fail signal: Intervention celebrated as successful without any cost analysis.
   - Action if fail: Add cost data from the CS or finance team and compute simple ROI.

10. - [ ] **Leading indicators identified** -- The analysis surfaces behavioral signals that precede churn (e.g., usage drop 60 days before cancellation).
    - Pass criteria: At least 2-3 leading indicators listed with the lead time and correlation strength.
    - Fail signal: Analysis is purely backward-looking with no predictive signals for future prevention.
    - Action if fail: Run a simple feature importance analysis on pre-churn behavior and add findings.

11. - [ ] **Reactivation excluded or handled** -- Customers who churned and returned are either excluded from the churn count or tracked separately.
    - Pass criteria: Reactivation policy stated (e.g., "Reactivations within 90 days are not counted as churn").
    - Fail signal: A customer counted as churned and then as a new acquisition, inflating both numbers.
    - Action if fail: Define the reactivation window and adjust churn and acquisition counts accordingly.

12. - [ ] **Actionable recommendations present** -- The analysis ends with specific, prioritized recommendations tied to the data.
    - Pass criteria: 2-5 recommendations, each linked to a finding in the analysis, with an owner and rough effort estimate.
    - Fail signal: Analysis ends with "we should reduce churn" and no specifics.
    - Action if fail: Convert findings into concrete next steps with owners.

## Cross-References

- See `nrr-grr-quality.md` for how churn feeds into revenue retention metrics.
- See `cs-health-score-quality.md` for the predictive scoring model that uses churn leading indicators.
- See `predictive-model-quality.md` for quality standards on any churn prediction model.
