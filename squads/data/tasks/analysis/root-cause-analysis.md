# Task: Root Cause Analysis
> Agent(s): avinash-kaushik, data-chief
> Frameworks: analysis-layer, data-quality-triad
> Checklists: analytics/anomaly-investigation, analytics/metric-drift-detection
> Templates: (none)
> Registry: decision-registry

## Objective
Perform a structured root cause analysis to identify the fundamental driver(s) behind a
metric movement, going beyond surface-level observations to find actionable causal factors.

## Prerequisites
- A significant metric movement has been observed and documented.
- Initial anomaly investigation (if applicable) has been completed.
- Access to granular user-level and event-level data.
- Statistical analysis tools available (Python, R, or SQL).

## Steps
1. **Frame the problem** -- Write a clear problem statement: "[Metric] changed by [X%]
   from [baseline] to [current] between [date range]. This impacts [business outcome]."
2. **Decompose the metric** -- Break the metric into its mathematical components. If the
   metric is Revenue, decompose into Users x Conversion Rate x Average Order Value.
   Identify which component(s) changed.
3. **Run contribution analysis** -- For each component, calculate how much of the total
   metric change it explains. Use additive or multiplicative decomposition as appropriate.
4. **Build the fishbone diagram** -- Organize potential causes into categories:
   - Product changes (releases, bugs, UX changes).
   - User mix shifts (acquisition channel changes, seasonality).
   - External factors (market, competition, regulation).
   - Data/measurement issues (tracking changes, definition drift).
5. **Prioritize hypotheses** -- Rank potential causes by likelihood and testability. Select
   the top 5 hypotheses for quantitative testing.
6. **Test each hypothesis** -- For each hypothesis:
   a. Define the expected data pattern if the hypothesis is true.
   b. Query the data to check for that pattern.
   c. Calculate the explanatory power (how much of the change this explains).
   d. Mark as confirmed, partially confirmed, or rejected.
7. **Quantify the root cause** -- For the confirmed cause(s), calculate the precise impact:
   how many units of the metric change are attributable to this cause.
8. **Validate with counter-factual** -- Estimate what the metric would have been without
   the root cause. Compare to actual values.
9. **Check for confounding factors** -- Verify that the identified cause is not correlated
   with another, more fundamental driver.
10. **Formulate action plan** -- Based on the root cause, recommend:
    - Immediate actions to address the cause.
    - Preventive measures to avoid recurrence.
    - Monitoring plan to track resolution.
11. **Document thoroughly** -- Write the RCA report with full methodology, evidence for
    each hypothesis tested, and final conclusions.
12. **Present and align** -- Share findings with stakeholders. Agree on action items.

## Deliverable
A root cause analysis report containing:
- Problem statement with metric quantification.
- Metric decomposition showing which components moved.
- Contribution analysis results.
- Fishbone diagram with all considered causes.
- Hypothesis testing results (confirmed, rejected, inconclusive).
- Root cause with quantified impact.
- Action plan with owners and timelines.

## Quality Gate
- [ ] Problem statement is specific and quantified.
- [ ] Metric is decomposed into at least 3 components.
- [ ] Contribution analysis accounts for > 80% of the total change.
- [ ] At least 5 hypotheses are formally tested.
- [ ] Root cause is supported by data evidence (not just intuition).
- [ ] Confounding factors are checked.
- [ ] Action plan has specific owners and timelines.
- [ ] Report is peer-reviewed by another analyst.

## Registry Update
- Log analysis in `analysis-registry` with root cause and confidence level.
- Link to related entries in `incident-registry` if applicable.
- Log task completion in `task-log` with action item references.

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
- **Applicable gate:** G4 -- Insight
- **Must-pass checklists:** `checklists/analytics/anomaly-investigation.md`, `checklists/analytics/metric-drift-detection.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [analysis-layer](../../frameworks/analysis-layer.md), [data-quality-triad](../../frameworks/data-quality-triad.md)
- **Checklists:** [analytics/anomaly-investigation](../../checklists/analytics/anomaly-investigation.md), [analytics/metric-drift-detection](../../checklists/analytics/metric-drift-detection.md)
