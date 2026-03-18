# Task: CLV Modeling
> Agent(s): peter-fader, data-chief
> Frameworks: clv-modeling, fader-probability-models, fader-clv-as-north-star
> Checklists: ltv-clv-model-quality, fader/clv-modeling-audit, fader/discount-rate-and-horizon-check
> Templates: outputs/clv-model-sheet
> Registry: clv-registry, segment-registry

## Objective
Build a Customer Lifetime Value model to estimate the total revenue a customer will generate
over their relationship with the company, enabling data-driven decisions on acquisition spend,
segmentation, and resource allocation.

## Prerequisites
- Transaction or subscription data with customer ID, date, and revenue.
- Minimum 12 months of historical data.
- Customer churn data (for contractual models) or purchase history (for non-contractual).
- Statistical modeling environment (Python with lifetimes library, or R).

## Steps
1. **Determine the business model type** -- Choose the appropriate CLV model:
   - Contractual (subscriptions): use survival analysis or simple LTV formula.
   - Non-contractual (transactions): use BG/NBD + Gamma-Gamma probabilistic models.
   - Hybrid: combine subscription revenue with expansion/upsell modeling.
2. **Prepare the data** -- Extract customer-level data:
   - Customer ID, first purchase date, last purchase date.
   - Number of transactions and total revenue.
   - Subscription: plan type, MRR, churn date (if churned).
   - Handle refunds, credits, and anomalies.
3. **Calculate historical CLV** -- For each customer, compute the actual lifetime value
   to date: total revenue from first purchase to now (or churn date).
4. **Build the predictive model** -- Depending on model type:
   - Contractual: CLV = ARPU x Gross Margin x (1 / Churn Rate).
     Refine with cohort-specific retention curves.
   - Non-contractual: Fit BG/NBD model for purchase frequency prediction and
     Gamma-Gamma model for monetary value prediction. Combine for CLV.
5. **Validate the model** -- Split data into train (first 6-9 months) and test (remaining).
   Predict CLV for the test period and compare to actual. Calculate:
   - Mean Absolute Error (MAE).
   - Mean Absolute Percentage Error (MAPE).
   - Correlation between predicted and actual CLV.
6. **Calculate CLV at multiple horizons** -- Generate CLV estimates for:
   - 12-month CLV.
   - 24-month CLV.
   - Lifetime CLV (using discount rate for present value).
7. **Segment by CLV** -- Create CLV tiers:
   - High value (top 20%): invest in retention and expansion.
   - Medium value (middle 60%): invest in growth.
   - Low value (bottom 20%): optimize acquisition cost or improve value.
8. **Analyze CLV drivers** -- Identify what predicts high CLV:
   - Acquisition channel, plan type, company size.
   - Early behavior patterns (aha moment, onboarding completion).
   - Feature usage patterns.
9. **Calculate CLV:CAC ratio** -- By acquisition channel, compute CLV:CAC. Target > 3:1.
   Identify channels with unsustainable economics.
10. **Build CLV dashboard** -- Create a dashboard showing:
    - CLV distribution, CLV by segment, CLV:CAC by channel, CLV trend over time.
11. **Document the model** -- Write model documentation: methodology, assumptions,
    limitations, validation results, and refresh cadence.
12. **Present and operationalize** -- Share findings with finance, marketing, and product.
    Define how CLV will be used in decision-making.

## Deliverable
A CLV model package containing:
- CLV model with methodology documentation.
- Validation results (train/test split metrics).
- CLV estimates at 12-month, 24-month, and lifetime horizons.
- CLV segmentation with tier definitions.
- CLV driver analysis.
- CLV:CAC analysis by channel.
- CLV dashboard.

## Quality Gate
- [ ] Model type is appropriate for the business model.
- [ ] Train/test validation is completed with documented accuracy.
- [ ] MAPE is below 30% on test data.
- [ ] CLV is calculated at multiple time horizons.
- [ ] CLV segments are defined with clear thresholds.
- [ ] CLV:CAC is calculated for major acquisition channels.
- [ ] Model assumptions and limitations are documented.
- [ ] Refresh cadence is defined (monthly or quarterly).

## Registry Update
- Add CLV metric to `metric-registry` with model version and refresh schedule.
- Add CLV segments to `segment-registry`.
- Log analysis in `analysis-registry` with model accuracy metrics.
- Log task completion in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** peter-fader owns this task end-to-end.
- **Supporting agents:** data-chief contribute to their domain-specific steps.
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
- **Must-pass checklists:** `checklists/ltv-clv-model-quality.md`, `checklists/fader/clv-modeling-audit.md`, `checklists/fader/discount-rate-and-horizon-check.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/clv-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/segment-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [clv-modeling](../../frameworks/clv-modeling.md), [fader-probability-models](../../frameworks/fader-probability-models.md), [fader-clv-as-north-star](../../frameworks/fader-clv-as-north-star.md)
- **Checklists:** [ltv-clv-model-quality](../../checklists/ltv-clv-model-quality.md), [fader/clv-modeling-audit](../../checklists/fader/clv-modeling-audit.md), [fader/discount-rate-and-horizon-check](../../checklists/fader/discount-rate-and-horizon-check.md)
- **Templates:** [outputs/clv-model-sheet](../../templates/outputs/clv-model-sheet.md)
- **Workflows:** [clv-to-strategy-workflow](../../workflows/clv-to-strategy-workflow.md)
