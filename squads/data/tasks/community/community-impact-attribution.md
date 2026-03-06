# Task: Community Impact Attribution
> Agent(s): Community Analyst, Data Scientist
> Frameworks: Attribution Modeling, Causal Inference, Propensity Score Matching
> Checklists: attribution-checklist, statistical-validity-checklist
> Template: community-impact-template
> Registry: analysis-registry, metric-registry

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
