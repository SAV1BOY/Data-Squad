# Task: Churn Investigation
> Agent(s): peter-fader, nick-mehta, data-chief
> Frameworks: retention-churn-diagnostics, fader-customer-centricity-framework
> Checklists: churn-analysis-quality, retention/churn-taxonomy
> Templates: reports/churn-postmortem
> Registry: decision-registry

## Objective
Investigate churn patterns to understand who churns, when they churn, why they churn, and
what early warning signals predict churn, enabling proactive retention interventions.

## Prerequisites
- Churn is defined (cancellation, non-renewal, inactivity threshold).
- Customer-level data with churn dates and pre-churn behavior.
- Minimum 6 months of churn data.
- Access to customer support tickets and cancellation reasons (if collected).

## Steps
1. **Define churn precisely** -- Document the churn definition:
   - Contractual: subscription cancelled, not renewed, or downgraded to free.
   - Non-contractual: inactive for X consecutive days.
   Specify the exact logic and any grace periods.
2. **Calculate churn rates** -- Compute:
   - Monthly churn rate (customers lost / customers at start of month).
   - Revenue churn rate (MRR lost / MRR at start of month).
   - Net revenue churn (include expansion revenue).
   Trend these metrics over the past 6-12 months.
3. **Build churn cohorts** -- Group churned customers by:
   - Tenure at churn (churned in month 1, 2, 3, etc.).
   - Churn timing (which calendar month they churned).
   Identify if there is a "danger zone" tenure period with elevated churn.
4. **Profile churned customers** -- Compare churned vs. retained customers on:
   - Demographics (company size, industry, geography).
   - Plan type and contract length.
   - Acquisition channel.
   - Feature usage patterns.
   - Support ticket volume and sentiment.
5. **Analyze pre-churn behavior** -- For churned customers, examine their behavior in the
   30-60 days before churn:
   - Did usage frequency decline?
   - Did they stop using specific features?
   - Did they contact support?
   - Were there billing issues or payment failures?
6. **Identify churn predictors** -- Build a statistical model (logistic regression or
   decision tree) to predict churn. Common predictors:
   - Login frequency decline.
   - Key feature usage decline.
   - Support ticket escalation.
   - Payment failure.
   Rank predictors by importance.
7. **Analyze cancellation reasons** -- If collected, categorize cancellation reasons:
   - Price/value concerns.
   - Missing features.
   - Switched to competitor.
   - No longer need the product.
   - Poor experience/support.
   Quantify each category as % of total churn.
8. **Calculate revenue impact** -- For each churn segment, calculate:
   - Revenue lost per month.
   - Average remaining contract value at churn.
   - Cost of replacement (CAC for a new equivalent customer).
9. **Identify preventable churn** -- Estimate what % of churn is preventable based on
   root causes. Price-sensitive churn may be addressable; business closure is not.
10. **Recommend interventions** -- For each churn driver, suggest:
    - Early warning trigger (when to intervene).
    - Intervention type (outreach, discount, feature promotion).
    - Expected reduction in churn.
11. **Document and present** -- Create the churn investigation report.

## Deliverable
A churn investigation report containing:
- Churn rate trends (customer and revenue churn).
- Churn cohort analysis (tenure at churn distribution).
- Churned vs. retained customer profiles.
- Pre-churn behavior analysis.
- Churn predictor model with ranked importance.
- Cancellation reason analysis.
- Revenue impact quantification.
- Intervention recommendations with expected impact.

## Quality Gate
- [ ] Churn is precisely defined with documented logic.
- [ ] Both customer churn and revenue churn are calculated.
- [ ] Churn trends cover at least 6 months.
- [ ] Churned vs. retained profiles include at least 5 dimensions.
- [ ] Pre-churn behavior is analyzed (30-60 day window).
- [ ] Churn predictors are statistically validated.
- [ ] Revenue impact is quantified.
- [ ] Interventions are specific with trigger conditions.

## Registry Update
- Update churn metrics in `metric-registry` with current values.
- Add churn predictor signals to `metric-registry` for monitoring.
- Log investigation in `analysis-registry` with findings and recommendations.
- Log task completion in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** peter-fader owns this task end-to-end.
- **Supporting agents:** nick-mehta, data-chief contribute to their domain-specific steps.
- **Review:** data-chief reviews the final deliverable before it exits the squad.
- **Cross-squad delivery:** If the output is requested by another squad, deliver via the cross-squad-data-delivery-workflow with data-chief sign-off.

### Escalation Rules
- **Data blocker:** If required data is unavailable or unreliable, escalate to data-chief within 24 hours.
- **Stakeholder disagreement:** If stakeholders reject the methodology or conclusions, escalate to data-chief for mediation.
- **Deadline risk:** If the task cannot be completed on schedule, notify data-chief at least 48 hours before the deadline.

### Rework Loop
- **Trigger:** Any checklist item marked as fail, or reviewer requests changes.
- **Maximum iterations:** 2 rework cycles. If the deliverable fails after 2 reworks, escalate to data-chief for a scope review.
- **Between iterations:** The reviewing agent provides specific, written feedback on what must change. No vague "needs improvement" — every rework request cites a checklist item or specific deficiency.

### RalphLoop Gate
- **Applicable gate:** G4 -- Insight
- **Must-pass checklists:** `checklists/churn-analysis-quality.md`, `checklists/retention/churn-taxonomy.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [retention-churn-diagnostics](../../frameworks/retention-churn-diagnostics.md), [fader-customer-centricity-framework](../../frameworks/fader-customer-centricity-framework.md)
- **Checklists:** [churn-analysis-quality](../../checklists/churn-analysis-quality.md), [retention/churn-taxonomy](../../checklists/retention/churn-taxonomy.md)
- **Templates:** [reports/churn-postmortem](../../templates/reports/churn-postmortem.md)
