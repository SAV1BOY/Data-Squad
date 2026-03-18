# Task: Community Impact Attribution
> Agent(s): david-spinks, peter-fader
> Frameworks: spinks-community-roi-framework, community-led-growth-metrics
> Checklists: spinks/community-impact-attribution, community-metrics-quality
> Templates: (none)
> Registry: community-registry, decision-registry

## Objective
Measure and attribute the business impact of the community by comparing community members
to non-members on key business metrics, controlling for selection bias to isolate the true
causal effect of community participation.

## Prerequisites
- Community member data can be joined to product/business data.
- Business metrics (retention, revenue, support tickets) are available at the user level.
- Minimum 6 months of community and business data.
- Statistical analysis environment (Python or R).

## Steps
1. **Define business outcomes to measure** -- Select the outcomes:
   - Retention: Day 30, Day 90, annual renewal rate.
   - Revenue: ARPU, expansion rate, CLV.
   - Support: ticket volume, cost to serve.
   - Product: feature adoption, engagement depth.
   - Advocacy: referrals, reviews, case study participation.
2. **Create the comparison groups** -- Define:
   - Community members: users who have registered and participated in the community.
   - Non-members: users who have not engaged with the community.
   Sub-segment community members by engagement level if sample size allows.
3. **Calculate naive comparison** -- Compare community members vs. non-members on each
   outcome. This is the "naive" effect which includes selection bias.
4. **Identify confounders** -- List factors that might explain why community members differ
   from non-members beyond the community effect:
   - Product engagement level (more engaged users join communities AND retain better).
   - Tenure (longer-tenured users are more likely to join AND to retain).
   - Plan type (paid users are more likely to join AND have higher CLV).
   - Company size, industry, acquisition channel.
5. **Apply propensity score matching** -- Build a propensity model to predict community
   membership from confounders. Match each community member to a similar non-member.
   Validate that the matched groups are balanced on confounders.
6. **Calculate matched comparison** -- Compare community members to their matched
   non-members on each outcome. This is the "controlled" effect estimate.
7. **Calculate the community premium** -- For each outcome:
   Community Premium = (Member outcome - Matched non-member outcome) / Matched non-member
   outcome. Express as both absolute and percentage lift.
8. **Estimate dollar value** -- Translate the community premium into financial terms:
   - Retention premium x average revenue x number of community members = retention value.
   - Support deflection x cost per ticket x deflected tickets = support value.
   - Sum all components for total community business value.
9. **Analyze by engagement level** -- If sample size allows, compare outcomes by community
   engagement intensity:
   - Lurkers vs. participants vs. contributors vs. champions.
   - Is there a dose-response relationship (more engagement = more impact)?
10. **Sensitivity analysis** -- Test the robustness of results:
    - Vary the matching parameters.
    - Use alternative methods (inverse propensity weighting, stratification).
    - Check if results hold across different time periods.
11. **Document limitations** -- Even with matching, causal claims are limited. Document:
    - Unobserved confounders that could not be controlled for.
    - The difference between correlation and causation.
    - Appropriate caveats for presenting the results.
12. **Present and report** -- Create the impact attribution report for leadership.

## Deliverable
A community impact attribution report containing:
- Naive comparison results (before controlling for bias).
- Propensity matching methodology and balance checks.
- Controlled comparison results (community premium).
- Dollar value estimate of community impact.
- Engagement level dose-response analysis.
- Sensitivity analysis results.
- Limitations and caveats.

## Quality Gate
- [ ] At least 3 business outcomes are analyzed.
- [ ] Confounders are identified and documented.
- [ ] Propensity matching achieves balance (standardized mean diff < 0.1).
- [ ] Both naive and controlled comparisons are presented.
- [ ] Dollar value is estimated with documented assumptions.
- [ ] Sensitivity analysis is performed with at least one alternative method.
- [ ] Limitations are clearly documented.
- [ ] Report is peer-reviewed.

## Registry Update
- Add community impact metrics to `metric-registry` (community premium, dollar value).
- Log analysis in `analysis-registry` with methodology and key findings.
- Log task completion in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** david-spinks owns this task end-to-end.
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
- **Must-pass checklists:** `checklists/spinks/community-impact-attribution.md`, `checklists/community-metrics-quality.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/community-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [spinks-community-roi-framework](../../frameworks/spinks-community-roi-framework.md), [community-led-growth-metrics](../../frameworks/community-led-growth-metrics.md)
- **Checklists:** [spinks/community-impact-attribution](../../checklists/spinks/community-impact-attribution.md), [community-metrics-quality](../../checklists/community-metrics-quality.md)
