# Task: Expansion Analysis
> Agent(s): nick-mehta, peter-fader
> Frameworks: mehta-expansion-playbook-framework, nrr-grr-expansion, fader-heterogeneity-audit
> Checklists: nrr-grr-quality, mehta/expansion-playbook-audit
> Templates: reports/qbr-deck-outline
> Registry: cs-health-registry

## Objective
Analyze expansion revenue patterns (upsells, cross-sells, seat additions) to identify what
drives expansion, which customers are most likely to expand, and how to systematically
increase net revenue retention.

## Prerequisites
- Revenue data with expansion events (upgrades, add-ons, seat additions).
- Minimum 12 months of customer revenue history.
- Customer attribute and usage data.
- Net Revenue Retention (NRR) metric is defined.

## Steps
1. **Define expansion types** -- Categorize all expansion revenue sources:
   - Plan upgrades (free -> paid, basic -> pro).
   - Seat/license additions.
   - Add-on purchases (features, modules).
   - Usage-based overages.
   - Professional services.
2. **Calculate expansion metrics** -- Compute:
   - Gross expansion rate: expansion MRR / beginning MRR.
   - Net Revenue Retention (NRR): (beginning MRR + expansion - contraction - churn) /
     beginning MRR.
   - Expansion revenue per customer.
   - Time-to-first-expansion (median days from first purchase to first expansion).
3. **Trend analysis** -- Plot expansion metrics monthly over the past 12 months. Identify
   trends, seasonality, and anomalies.
4. **Analyze expansion by type** -- Break expansion revenue by type. Which type contributes
   most? Which is growing fastest?
5. **Profile expanding customers** -- Compare customers who expanded vs. those who did not:
   - Initial plan and contract size.
   - Tenure at time of expansion.
   - Product usage patterns before expansion.
   - Health score at time of expansion.
   - Industry, company size, geography.
6. **Identify expansion predictors** -- Build a predictive model or correlation analysis
   to find what predicts expansion:
   - Feature usage hitting limits (approaching seat cap, storage limit).
   - High engagement scores.
   - Specific feature adoption (features available only on higher tiers).
   - Champion engagement level.
7. **Analyze time-to-expand** -- Plot the distribution of time from initial purchase to
   first expansion. Identify the optimal window for expansion outreach.
8. **Calculate expansion by cohort** -- Track expansion rates by signup cohort. Are newer
   cohorts expanding faster or slower than older ones?
9. **Analyze failed expansions** -- Investigate cases where expansion was attempted but
   did not close:
   - What were the objections?
   - Were there pricing concerns?
   - Were there competitive alternatives mentioned?
10. **Estimate expansion opportunity** -- Calculate the addressable expansion revenue:
    - How many customers match the expansion profile but have not expanded?
    - What is the estimated revenue if they expanded at the average rate?
11. **Recommend expansion plays** -- Define systematic expansion strategies:
    - Trigger-based outreach (usage approaching limits).
    - Milestone-based outreach (after N months, after activation).
    - Feature promotion (showcase higher-tier features).
12. **Document and present** -- Create the expansion analysis report.

## Deliverable
An expansion analysis report containing:
- Expansion metric calculations and trends.
- Expansion by type breakdown.
- Expanding vs. non-expanding customer profiles.
- Expansion predictor analysis.
- Time-to-expand distribution.
- Addressable expansion opportunity estimate.
- Recommended expansion plays with trigger conditions.

## Quality Gate
- [ ] All expansion types are identified and categorized.
- [ ] NRR is calculated and trended.
- [ ] Expanding vs. non-expanding profiles include at least 5 dimensions.
- [ ] Expansion predictors are statistically validated.
- [ ] Time-to-expand is analyzed with optimal outreach window identified.
- [ ] Addressable opportunity is quantified.
- [ ] Expansion plays have specific trigger conditions.
- [ ] Report is reviewed by CS and sales leadership.

## Registry Update
- Add expansion metrics to `metric-registry` (NRR, expansion rate, time-to-expand).
- Add expansion-ready segment to `segment-registry`.
- Log analysis in `analysis-registry`.
- Log task completion in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** nick-mehta owns this task end-to-end.
- **Supporting agents:** peter-fader contribute to their domain-specific steps.
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
- **Must-pass checklists:** `checklists/nrr-grr-quality.md`, `checklists/mehta/expansion-playbook-audit.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/cs-health-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [mehta-expansion-playbook-framework](../../frameworks/mehta-expansion-playbook-framework.md), [nrr-grr-expansion](../../frameworks/nrr-grr-expansion.md), [fader-heterogeneity-audit](../../frameworks/fader-heterogeneity-audit.md)
- **Checklists:** [nrr-grr-quality](../../checklists/nrr-grr-quality.md), [mehta/expansion-playbook-audit](../../checklists/mehta/expansion-playbook-audit.md)
- **Templates:** [reports/qbr-deck-outline](../../templates/reports/qbr-deck-outline.md)
- **Workflows:** [cs-health-early-warning-workflow](../../workflows/cs-health-early-warning-workflow.md)
