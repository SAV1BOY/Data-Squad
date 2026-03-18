# Task: Onboarding Metrics Audit
> Agent(s): sean-ellis, wes-kao, avinash-kaushik
> Frameworks: ellis-activation-aha-moment, kao-onboarding-metrics-framework, aarrr-pirate-metrics
> Checklists: activation-funnel-quality, kao/onboarding-activation-qa
> Templates: outputs/activation-audit
> Registry: decision-registry, metric-registry

## Objective
Audit the complete onboarding experience through the lens of data, measuring time-to-value,
completion rates, and drop-off points to identify the highest-leverage improvements for
converting signups into activated users.

## Prerequisites
- Onboarding flow is instrumented with event tracking at each step.
- Activation metric is defined (see activation-audit).
- Minimum 2 months of new user cohort data.
- Access to product analytics and session recordings (if available).

## Steps
1. **Map the onboarding flow** -- Document every step in the current onboarding experience:
   - Required steps (cannot be skipped).
   - Optional steps (can be skipped).
   - Branching paths (different flows for different user types).
   Note which steps are tracked and which are not.
2. **Define onboarding metrics** -- Establish the key metrics:
   - Onboarding start rate: % of signups who begin onboarding.
   - Step completion rates: % completing each step.
   - Onboarding completion rate: % who finish all required steps.
   - Time-to-complete: median time from signup to onboarding completion.
   - Time-to-value: median time from signup to activation.
   - Skip rates: % who skip optional steps.
3. **Pull the data** -- Extract user-level onboarding data for the past 2 months.
   Calculate all metrics defined above.
4. **Build the onboarding funnel** -- Visualize the step-by-step funnel with conversion
   rates. Identify the biggest absolute drop-off point.
5. **Analyze time-to-complete per step** -- For each step, calculate the median and 90th
   percentile time. Steps that take disproportionately long indicate friction.
6. **Segment the funnel** -- Compare onboarding metrics across:
   - Acquisition channel.
   - Platform (web vs. mobile).
   - User type (individual vs. team, if applicable).
   - Geography.
7. **Analyze skip behavior** -- For optional steps:
   - What % skip each step?
   - Do users who skip have different activation and retention rates?
   - Should skippable steps be mandatory or removed?
8. **Correlate onboarding with retention** -- For each onboarding step, calculate the
   correlation between completing that step and Day 30 retention. Identify which steps
   are most predictive of long-term success.
9. **Analyze dropouts** -- For users who abandon onboarding:
   - At which step do they leave?
   - Do they return later to complete?
   - What is the re-engagement rate for abandoned onboardings?
10. **Review session recordings** -- If available, watch 10-20 session recordings of
    users who drop off at the biggest friction points. Note UX issues.
11. **Formulate recommendations** -- Prioritize improvements:
    - Reduce friction at the biggest drop-off points.
    - Make high-correlation steps more prominent.
    - Remove or simplify steps with high skip rates and low correlation.
    - Implement re-engagement for abandoned onboardings.
12. **Document and present** -- Create the onboarding audit report and share with growth
    and product teams.

## Deliverable
An onboarding metrics audit report containing:
- Onboarding flow map with tracking coverage.
- Step-by-step funnel with conversion and timing metrics.
- Segment analysis.
- Skip behavior analysis.
- Step-to-retention correlation analysis.
- Dropout analysis.
- Prioritized recommendations (5-10).

## Quality Gate
- [ ] Complete onboarding flow is mapped with all steps documented.
- [ ] All key onboarding metrics are calculated.
- [ ] Funnel covers every step with conversion rates.
- [ ] Time-to-complete is measured per step.
- [ ] At least 3 segment breakdowns are analyzed.
- [ ] Step-to-retention correlations are calculated.
- [ ] Recommendations are prioritized by impact and effort.
- [ ] Report is reviewed by growth and product leads.

## Registry Update
- Add onboarding metrics to `metric-registry` with formal definitions.
- Log audit in `analysis-registry` with date and key findings.
- Log task completion in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** sean-ellis owns this task end-to-end.
- **Supporting agents:** wes-kao, avinash-kaushik contribute to their domain-specific steps.
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
- **Must-pass checklists:** `checklists/activation-funnel-quality.md`, `checklists/kao/onboarding-activation-qa.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/metric-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [ellis-activation-aha-moment](../../frameworks/ellis-activation-aha-moment.md), [kao-onboarding-metrics-framework](../../frameworks/kao-onboarding-metrics-framework.md), [aarrr-pirate-metrics](../../frameworks/aarrr-pirate-metrics.md)
- **Checklists:** [activation-funnel-quality](../../checklists/activation-funnel-quality.md), [kao/onboarding-activation-qa](../../checklists/kao/onboarding-activation-qa.md)
- **Templates:** [outputs/activation-audit](../../templates/outputs/activation-audit.md)
