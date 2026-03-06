# Task: Onboarding Metrics Audit
> Agent(s): Growth Analyst, Product Analyst
> Frameworks: Onboarding Framework, Time-to-Value Analysis
> Checklists: onboarding-audit-checklist, analysis-rigor-checklist
> Template: onboarding-audit-template
> Registry: analysis-registry, metric-registry

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
