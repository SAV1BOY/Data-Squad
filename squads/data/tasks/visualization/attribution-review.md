# Task: Attribution Review
> Agent(s): avinash-kaushik, data-chief
> Frameworks: kaushik-economic-value-framework, kaushik-web-analytics-2-0-framework
> Checklists: kaushik/web-analytics-quality, analytics-audit-quality
> Templates: (none)
> Registry: decision-registry

## Objective
Review and evaluate the current attribution model to assess its accuracy, fairness, and
alignment with business reality, recommending adjustments to improve marketing spend
allocation and channel optimization.

## Prerequisites
- Attribution model is in place (last-touch, first-touch, multi-touch, or data-driven).
- Conversion and channel data for at least 3 months.
- Access to marketing spend data by channel.
- Analytics platform with attribution reporting.

## Steps
1. **Document the current model** -- Describe the attribution model in use:
   - Model type (last-touch, first-touch, linear, time-decay, data-driven).
   - Conversion events being attributed.
   - Attribution window (7-day, 30-day, etc.).
   - Channels and touchpoints included.
   - Known limitations or blind spots.
2. **Pull attribution data** -- Extract the last 3 months of attribution data:
   - Conversions by channel (under current model).
   - Spend by channel.
   - ROAS by channel (revenue / spend).
   - CPA by channel (spend / conversions).
3. **Compare attribution models** -- If possible, run the same data through multiple models:
   - Last-touch attribution.
   - First-touch attribution.
   - Linear (equal credit) attribution.
   - Time-decay attribution.
   - Data-driven (algorithmic) attribution.
   Compare how each model allocates credit differently.
4. **Identify model biases** -- Analyze which channels are over- or under-credited:
   - Last-touch over-credits bottom-of-funnel (retargeting, brand search).
   - First-touch over-credits top-of-funnel (awareness campaigns).
   - Document the specific biases of the current model.
5. **Analyze path-to-conversion** -- Examine conversion paths:
   - Average number of touchpoints before conversion.
   - Most common touchpoint sequences.
   - Time from first touch to conversion.
   - Single-touch vs. multi-touch conversion rates.
6. **Evaluate channel incrementality** -- Cross-reference with incrementality test results
   (if available). Compare attributed conversions to incremental conversions per channel.
   The gap reveals attribution model inaccuracy.
7. **Assess cross-device and cross-platform gaps** -- Evaluate:
   - Can the model track users across devices?
   - Are there attribution gaps from platform limitations (iOS privacy, ad blockers)?
   - What % of conversions have incomplete attribution paths?
8. **Assess consent impact** -- With privacy regulations:
   - What % of users decline tracking consent?
   - How does this affect attribution accuracy by channel and geography?
   - Is the model accounting for untracked conversions?
9. **Calculate attribution confidence** -- For each channel, estimate the confidence level
   in the attributed conversions: high, medium, or low, based on data completeness.
10. **Recommend model adjustments** -- Based on findings:
    - Should the model type change?
    - Should the attribution window be adjusted?
    - Should specific channels be weighted differently?
    - Should incrementality data supplement the model?
11. **Recommend spend reallocation** -- If the model is misattributing, calculate the
    optimal spend allocation based on the most accurate attribution view.
12. **Document and present** -- Create the attribution review report for marketing and
    finance leadership.

## Deliverable
An attribution review report containing:
- Current model documentation.
- Multi-model comparison showing credit allocation differences.
- Model bias analysis.
- Path-to-conversion analysis.
- Incrementality cross-reference (if available).
- Consent and privacy impact assessment.
- Recommended model adjustments.
- Spend reallocation recommendations.

## Quality Gate
- [ ] Current model is fully documented.
- [ ] At least 3 attribution models are compared.
- [ ] Model biases are identified with specific examples.
- [ ] Path-to-conversion analysis includes touchpoint counts and timing.
- [ ] Cross-device and consent gaps are assessed.
- [ ] Attribution confidence is estimated per channel.
- [ ] Recommendations are specific and actionable.
- [ ] Report is reviewed by marketing and finance.

## Registry Update
- Update attribution model documentation in `metric-registry`.
- Log review in `analysis-registry` with findings and recommendations.
- Log task completion in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** avinash-kaushik owns this task end-to-end.
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
- **Applicable gate:** G5 -- Decision + Registry
- **Must-pass checklists:** `checklists/kaushik/web-analytics-quality.md`, `checklists/analytics-audit-quality.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [kaushik-economic-value-framework](../../frameworks/kaushik-economic-value-framework.md), [kaushik-web-analytics-2-0-framework](../../frameworks/kaushik-web-analytics-2-0-framework.md)
- **Checklists:** [kaushik/web-analytics-quality](../../checklists/kaushik/web-analytics-quality.md), [analytics-audit-quality](../../checklists/analytics-audit-quality.md)
