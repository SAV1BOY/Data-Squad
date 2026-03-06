# Task: Growth Lever Analysis
> Agent(s): Growth Analyst, Data Strategist
> Frameworks: Growth Accounting Framework, Lever Decomposition
> Checklists: analysis-rigor-checklist, growth-lever-checklist
> Template: growth-lever-template
> Registry: analysis-registry, metric-registry

## Objective
Decompose growth into its component levers (acquisition, activation, retention, referral,
revenue) to identify which lever has the most potential for improvement and should receive
the greatest investment of effort.

## Prerequisites
- Core growth metrics are defined and tracked (signups, activation, retention, revenue).
- Minimum 6 months of historical data.
- Access to acquisition channel data.
- KPI tree or growth model exists.

## Steps
1. **Build the growth equation** -- Write the mathematical model that connects inputs to
   the growth outcome. Example: Monthly Active Users = New Users + Retained Users +
   Resurrected Users - Churned Users.
2. **Collect baseline data** -- Pull current values for each component:
   - New users per month (by channel).
   - Activation rate.
   - Retention rate (monthly or weekly).
   - Resurrection rate.
   - Churn rate.
   - Revenue per user.
   - Referral rate (viral coefficient).
3. **Run growth accounting** -- For the past 6 months, decompose MAU changes into:
   new, retained, resurrected, and churned. Plot the growth accounting waterfall.
4. **Identify the binding constraint** -- Determine which lever is currently the weakest:
   - Low acquisition: not enough new users entering.
   - Low activation: users sign up but do not reach value.
   - Low retention: users activate but do not return.
   - Low monetization: users return but do not pay enough.
   - Low referral: growth is linear, not compounding.
5. **Sensitivity analysis** -- For each lever, model: "If we improve this lever by 10%,
   what is the impact on the North Star Metric?" Use the growth equation to calculate.
   Rank levers by sensitivity (impact per % improvement).
6. **Benchmark against industry** -- Compare each lever to industry benchmarks. Identify
   which levers are below benchmark (opportunity) and which are at or above (less room).
7. **Assess improvement feasibility** -- For each lever, estimate:
   - How easy is it to improve? (1-10 score).
   - What initiatives could drive improvement?
   - What is the estimated cost/effort?
8. **Calculate lever priority score** -- Priority = Sensitivity x Gap-to-Benchmark x
   Feasibility. Rank levers by this composite score.
9. **Deep-dive the top lever** -- For the highest-priority lever, conduct a more detailed
   analysis: what sub-components drive it, what experiments could move it, and what is
   the realistic improvement target.
10. **Build the growth roadmap** -- Recommend a sequenced plan:
    - Quarter 1: focus on lever #1 with specific initiatives.
    - Quarter 2: shift to lever #2 after lever #1 is improved.
11. **Document and present** -- Create the growth lever report and present to leadership.

## Deliverable
A growth lever analysis report containing:
- Growth equation with current values.
- Growth accounting waterfall (6-month view).
- Sensitivity analysis results for each lever.
- Benchmark comparison.
- Lever priority scores.
- Deep-dive on the top lever.
- Recommended growth roadmap.

## Quality Gate
- [ ] Growth equation is mathematically defined and validated.
- [ ] All lever values are pulled from real data (not estimates).
- [ ] Sensitivity analysis covers all major levers.
- [ ] Industry benchmarks are referenced with sources.
- [ ] Lever priority scoring is documented and transparent.
- [ ] Top lever has a detailed sub-analysis.
- [ ] Growth roadmap has specific initiatives per quarter.
- [ ] Report is presented to and reviewed by leadership.

## Registry Update
- Record lever values as metrics in `metric-registry` with baseline dates.
- Log analysis in `analysis-registry` with priority rankings.
- Log task completion in `task-log` with roadmap reference.
