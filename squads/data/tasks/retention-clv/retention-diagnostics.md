# Task: Retention Diagnostics
> Agent(s): peter-fader, nick-mehta, data-chief
> Frameworks: retention-churn-diagnostics, fader-customer-centricity-framework, cohort-analysis
> Checklists: retention-quality, churn-analysis-quality, retention/churn-taxonomy
> Templates: outputs/retention-audit, reports/churn-postmortem
> Registry: decision-registry

## Objective
Conduct a comprehensive retention diagnostic to understand the current retention landscape,
identify where and why users churn, and surface the highest-leverage opportunities to improve
user retention.

## Prerequisites
- User activity data spanning at least 6 months.
- Retention metrics are defined (Day 1, Day 7, Day 30, Day 90).
- Cohort data is available at the user level.
- Access to the data warehouse and analytics tools.

## Steps
1. **Define retention windows** -- Confirm the retention metric definitions:
   - Day 1: returned within 24-48 hours of first visit.
   - Day 7: active in days 5-9 after first visit.
   - Day 30: active in days 25-35 after first visit.
   - Day 90: active in days 80-100 after first visit.
   Document the exact logic for "active."
2. **Calculate aggregate retention** -- Pull overall retention rates for each window.
   Plot the retention curve from Day 0 to Day 90 (or longer).
3. **Trend retention over time** -- Plot weekly/monthly cohort retention at each window
   over the past 6 months. Is retention improving, stable, or degrading?
4. **Identify the critical drop-off** -- Find the period with the steepest retention
   decline. Typically this is Day 0 to Day 1, but it varies by product.
5. **Segment retention** -- Analyze retention by:
   - Acquisition channel.
   - Platform (web, iOS, Android).
   - Plan type (free, trial, paid).
   - Geography.
   - User persona or segment.
   Identify the highest and lowest retaining segments.
6. **Analyze usage patterns of retained users** -- For users retained at Day 30:
   - What features do they use?
   - How frequently do they return?
   - What is their session depth?
   Compare to users who churned.
7. **Build a churn profile** -- Characterize users who churn at each stage:
   - Day 1 churners: likely never found value. Check onboarding.
   - Day 7 churners: found initial value but not habit. Check engagement loops.
   - Day 30 churners: established usage but dropped off. Check for competition or
     decreasing value.
8. **Identify retention drivers** -- Using correlation or regression, find the user
   actions most predictive of retention. Cross-reference with aha moment analysis.
9. **Estimate revenue impact** -- Calculate the revenue impact of retention improvements:
   "A 5% improvement in Day 30 retention would generate $X in annual revenue."
10. **Benchmark** -- Compare retention metrics to industry benchmarks.
11. **Formulate recommendations** -- Prioritize interventions by stage:
    - Early retention (Day 0-1): onboarding improvements.
    - Medium retention (Day 1-7): engagement loops, habit formation.
    - Long-term retention (Day 7-30+): value deepening, feature expansion.
12. **Document and present** -- Create the retention diagnostics report.

## Deliverable
A retention diagnostics report containing:
- Retention curve (Day 0 to Day 90).
- Cohort retention trend (6-month view).
- Segment retention analysis.
- Churn profiles by stage.
- Retention drivers (behavioral predictors).
- Revenue impact modeling.
- Prioritized recommendations by retention stage.

## Quality Gate
- [ ] Retention is calculated for all standard windows (D1, D7, D30, D90).
- [ ] Cohort trends cover at least 6 months.
- [ ] At least 4 segment breakdowns are analyzed.
- [ ] Churn profiles are developed for 2+ retention stages.
- [ ] Retention drivers are identified with statistical support.
- [ ] Revenue impact of improvement is estimated.
- [ ] Benchmarks are referenced.
- [ ] Recommendations are staged (early, medium, long-term).

## Registry Update
- Update retention metrics in `metric-registry` with current baselines.
- Log diagnostics in `analysis-registry` with date and key findings.
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
- **Must-pass checklists:** `checklists/retention-quality.md`, `checklists/churn-analysis-quality.md`, `checklists/retention/churn-taxonomy.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [retention-churn-diagnostics](../../frameworks/retention-churn-diagnostics.md), [fader-customer-centricity-framework](../../frameworks/fader-customer-centricity-framework.md), [cohort-analysis](../../frameworks/cohort-analysis.md)
- **Checklists:** [retention-quality](../../checklists/retention-quality.md), [churn-analysis-quality](../../checklists/churn-analysis-quality.md), [retention/churn-taxonomy](../../checklists/retention/churn-taxonomy.md)
- **Templates:** [outputs/retention-audit](../../templates/outputs/retention-audit.md), [reports/churn-postmortem](../../templates/reports/churn-postmortem.md)
- **Workflows:** [retention-diagnostics-workflow](../../workflows/retention-diagnostics-workflow.md)
