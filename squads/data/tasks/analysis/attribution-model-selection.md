# Task: Attribution Model Selection
> Agent(s): avinash-kaushik, sean-ellis
> Frameworks: attribution-and-incrementality, kaushik-economic-value-framework, ellis-growth-levers
> Checklists: attribution/multi-touch-attribution-sanity, attribution/incrementality-test-qa, analytics/funnel-dropoff-diagnosis
> Templates: outputs/attribution-report
> Registry: decision-registry

## Objective
Evaluate candidate attribution models for marketing and growth channels, select the model that
most accurately reflects true channel contribution, and deploy it as the standard for budget
allocation and performance reporting.

## Prerequisites
- Access to multi-channel marketing data (ad platforms, CRM, analytics tools).
- Event-level conversion data with touchpoint history.
- At least 90 days of multi-touch journey data.
- Current attribution model documented (even if it is last-click by default).

## Steps
1. **Audit current attribution** -- Document the existing attribution approach:
   - Which model is in use (last-click, first-click, linear, platform-reported)?
   - Where does attribution data live (GA4, ad platform dashboards, internal model)?
   - Known limitations and complaints from marketing and growth teams.
   - Decisions currently being made using attribution data (budget allocation, channel scaling).
2. **Map the customer journey** -- Analyze touchpoint data to understand journey patterns:
   - Average number of touchpoints before conversion.
   - Median journey length (days from first touch to conversion).
   - Most common channel sequences (e.g., paid search -> organic -> direct).
   - Percentage of single-touch vs. multi-touch conversions.
3. **Evaluate candidate models** -- Assess each model against the organization's journey data:
   - **Last-click:** Simple but biases toward bottom-of-funnel channels.
   - **First-click:** Credits awareness but ignores nurturing.
   - **Linear:** Equal credit; fair but undiscriminating.
   - **Time-decay:** Weights recent touches; good for short sales cycles.
   - **Position-based (U-shaped):** Credits first and last touch; balances awareness and conversion.
   - **Data-driven (algorithmic):** Uses ML to assign credit; requires volume.
   For each model, calculate channel-level credit allocation using the same conversion data.
4. **Run incrementality validation** -- For the top 2-3 candidate models:
   - Compare model-attributed conversions against incrementality test results (if available).
   - Calculate the correlation between model credit and measured incremental lift.
   - Flag channels where the model significantly over- or under-credits vs. incrementality.
5. **Assess practical feasibility** -- For each candidate model, evaluate:
   - Data requirements (does the organization have sufficient touchpoint data?).
   - Technical complexity to implement and maintain.
   - Interpretability for non-technical stakeholders.
   - Refresh frequency needed (real-time, daily, weekly).
6. **Model sensitivity analysis** -- Test how robust each model is:
   - Remove one channel at a time and observe credit redistribution.
   - Vary the lookback window (7, 14, 30, 60 days) and observe stability.
   - Test with different conversion events (signup, purchase, activation).
7. **Select the model** -- Based on accuracy, feasibility, and interpretability, recommend
   a primary attribution model. Document:
   - The selected model and rationale.
   - Known limitations and where it may mislead.
   - Complementary analyses to run alongside (e.g., media mix modeling, incrementality tests).
8. **Define reporting standards** -- Specify how attribution data will be reported:
   - Standard metrics: attributed conversions, cost per attributed conversion, ROAS by channel.
   - Standard dimensions: channel, campaign, audience, time period.
   - Refresh cadence and data latency expectations.
9. **Build the attribution dashboard** -- Create or update the attribution dashboard:
   - Channel performance comparison using the selected model.
   - Model comparison view (selected model vs. last-click for calibration).
   - Budget allocation recommendations based on attributed performance.
10. **Communicate and train** -- Present the selected model to marketing and growth teams:
    - Explain what changes from the previous model and why.
    - Walk through example budget reallocation scenarios.
    - Document known caveats and when to complement with other methods.

## Deliverable
An attribution model selection report containing:
- Customer journey analysis (touchpoint patterns, journey length).
- Model comparison matrix (credit allocation by channel for each model).
- Incrementality validation results.
- Feasibility and interpretability assessment.
- Sensitivity analysis results.
- Selected model with rationale and limitations.
- Reporting standards and dashboard specification.

## Quality Gate
- [ ] Current attribution approach audited and limitations documented.
- [ ] Customer journey mapped with touchpoint and duration statistics.
- [ ] At least 4 attribution models evaluated with the same conversion data.
- [ ] Incrementality validation performed for top candidates.
- [ ] Sensitivity analysis completed (channel removal, lookback window variation).
- [ ] Selected model has documented rationale and known limitations.
- [ ] Reporting standards defined with refresh cadence.
- [ ] Marketing and growth teams briefed on the selected model.

## Registry Update
- Log the selected attribution model in `decision-registry`.
- Log task completion in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** avinash-kaushik owns this task end-to-end.
- **Supporting agents:** sean-ellis contribute to their domain-specific steps.
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
- **Must-pass checklists:** `checklists/attribution/multi-touch-attribution-sanity.md`, `checklists/attribution/incrementality-test-qa.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [attribution-and-incrementality](../../frameworks/attribution-and-incrementality.md), [kaushik-economic-value-framework](../../frameworks/kaushik-economic-value-framework.md), [ellis-growth-levers](../../frameworks/ellis-growth-levers.md)
- **Checklists:** [attribution/multi-touch-attribution-sanity](../../checklists/attribution/multi-touch-attribution-sanity.md), [attribution/incrementality-test-qa](../../checklists/attribution/incrementality-test-qa.md), [analytics/funnel-dropoff-diagnosis](../../checklists/analytics/funnel-dropoff-diagnosis.md)
- **Templates:** [outputs/attribution-report](../../templates/outputs/attribution-report.md)
- **Workflows:** [analytics-audit-workflow](../../workflows/analytics-audit-workflow.md)
