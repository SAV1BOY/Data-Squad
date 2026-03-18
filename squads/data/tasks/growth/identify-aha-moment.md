# Task: Identify Aha Moment
> Agent(s): sean-ellis, wes-kao
> Frameworks: ellis-activation-aha-moment, kao-learning-velocity-framework
> Checklists: activation-funnel-quality, ellis/activation-loop-debug
> Templates: outputs/activation-audit
> Registry: decision-registry

## Objective
Identify the specific user action(s) and threshold(s) that most strongly predict long-term
retention, revealing the product's "aha moment" -- the point at which users first experience
core value.

## Prerequisites
- Comprehensive event tracking covering core product actions.
- Retention data for at least 6 months of user cohorts.
- Sufficient sample size (minimum 5,000 users with complete lifecycle data).
- Statistical analysis environment (Python or R with correlation libraries).

## Steps
1. **Define the retention outcome** -- Specify the long-term retention metric to predict:
   - Day 30 retention (returned at least once in days 21-30).
   - Week 8 retention (active in week 8 after signup).
   - Or another retention window appropriate to the product.
2. **List candidate actions** -- Enumerate all meaningful user actions in the first 7 days:
   - Feature interactions (created X, viewed Y, shared Z).
   - Engagement thresholds (sessions, time spent, pages viewed).
   - Social actions (invited friend, joined team, commented).
   - Setup actions (connected integration, uploaded data).
   Aim for 20-50 candidate actions.
3. **Extract user-level data** -- For each user, calculate:
   - Whether they performed each candidate action in the first 7 days.
   - How many times they performed each action.
   - Whether they were retained (the outcome variable).
4. **Calculate correlation coefficients** -- For each candidate action, compute the
   correlation between performing that action (binary) and retention. Use point-biserial
   correlation for binary predictors.
5. **Rank by predictive power** -- Sort actions by correlation strength. The top actions
   are the strongest aha moment candidates.
6. **Find optimal thresholds** -- For the top 5-10 actions, test different frequency
   thresholds (did it 1x, 2x, 3x, etc.). For each threshold, calculate:
   - Retention rate for users above the threshold.
   - Retention rate for users below the threshold.
   - The lift (ratio of above to below).
   Find the threshold that maximizes the retention gap.
7. **Validate with multivariate analysis** -- Run a logistic regression with the top
   candidates as independent variables. Identify which actions remain significant when
   controlling for overall engagement level.
8. **Control for selection bias** -- Users who perform more actions may be inherently more
   engaged. Use propensity score matching or stratification by total session count to
   isolate the causal signal.
9. **Validate across cohorts** -- Test the identified aha moment across different time
   cohorts. Confirm the relationship is stable (not a one-time artifact).
10. **Formulate the aha moment statement** -- Write it as: "Users who [action] at least
    [threshold] times within [time window] are [X]x more likely to be retained at [period]."
11. **Recommend activation strategies** -- Based on the aha moment, suggest:
    - Onboarding changes to guide users to the aha moment faster.
    - Nudges and prompts for users who have not reached the threshold.
    - Metric targets for the activation team.
12. **Document and present** -- Create the analysis report and share with growth, product,
    and leadership teams.

## Deliverable
An aha moment analysis report containing:
- Candidate action list with correlation coefficients.
- Top aha moment actions with optimal thresholds.
- Retention lift analysis (above vs. below threshold).
- Multivariate validation results.
- Selection bias control results.
- Cross-cohort stability validation.
- Aha moment statement.
- Activation strategy recommendations.

## Quality Gate
- [ ] Minimum 20 candidate actions are tested.
- [ ] Correlation analysis is completed for all candidates.
- [ ] Optimal thresholds are identified for top candidates.
- [ ] Multivariate analysis controls for overall engagement.
- [ ] Selection bias is addressed (matching or stratification).
- [ ] Aha moment is validated across at least 3 cohorts.
- [ ] Aha moment statement is clear and specific.
- [ ] Recommendations are actionable for the activation team.

## Registry Update
- Add aha moment metric to `metric-registry` with threshold definition.
- Log analysis in `analysis-registry` with methodology and key findings.
- Log task completion in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** sean-ellis owns this task end-to-end.
- **Supporting agents:** wes-kao contribute to their domain-specific steps.
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
- **Must-pass checklists:** `checklists/activation-funnel-quality.md`, `checklists/ellis/activation-loop-debug.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [ellis-activation-aha-moment](../../frameworks/ellis-activation-aha-moment.md), [kao-learning-velocity-framework](../../frameworks/kao-learning-velocity-framework.md)
- **Checklists:** [activation-funnel-quality](../../checklists/activation-funnel-quality.md), [ellis/activation-loop-debug](../../checklists/ellis/activation-loop-debug.md)
- **Templates:** [outputs/activation-audit](../../templates/outputs/activation-audit.md)
