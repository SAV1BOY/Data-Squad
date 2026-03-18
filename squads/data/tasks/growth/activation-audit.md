# Task: Activation Audit
> Agent(s): sean-ellis, wes-kao, avinash-kaushik
> Frameworks: ellis-activation-aha-moment, kao-learning-velocity-framework, aarrr-pirate-metrics
> Checklists: activation-funnel-quality, ellis/activation-loop-debug, kao/onboarding-activation-qa
> Templates: outputs/activation-audit
> Registry: decision-registry

## Objective
Audit the user activation flow to measure how effectively new users reach their first moment
of value, identify friction points and drop-offs, and recommend improvements to increase
activation rates.

## Prerequisites
- Activation metric is defined (or will be defined in this task).
- Signup and onboarding events are tracked.
- Minimum 3 months of new user cohort data.
- Access to product analytics and the data warehouse.

## Steps
1. **Define activation** -- If not already defined, specify what constitutes an "activated"
   user. This should be the action that correlates most strongly with long-term retention.
   Example: "User who completes [key action] within [time window] of signup."
2. **Map the activation path** -- Document every step from signup to activation:
   - Signup completion.
   - Onboarding steps (profile setup, tutorial, etc.).
   - First meaningful action.
   - Activation event.
3. **Measure the activation funnel** -- Calculate conversion rates at each step:
   - Signup -> Onboarding step 1 -> ... -> Activation.
   - Include time-to-complete for each step.
4. **Calculate overall activation rate** -- What % of new signups reach activation within
   the defined time window? Track this weekly for the past 3 months.
5. **Benchmark** -- Compare the activation rate to:
   - Industry benchmarks (if available).
   - Historical trends (is it improving or declining?).
   - Targets set by the team.
6. **Segment activation** -- Analyze activation rate by:
   - Acquisition channel.
   - Platform (web, mobile).
   - Plan type (free, trial, paid).
   - Geography.
   - Time of signup (day of week, time of day).
7. **Identify drop-off points** -- For each funnel step, identify:
   - What % of users drop off here?
   - What do users who drop off do instead? (Next-event analysis.)
   - How long do users spend on this step before abandoning?
8. **Analyze activated vs. non-activated users** -- Compare the two groups on:
   - Long-term retention (Day 7, Day 30, Day 90).
   - Revenue/conversion metrics.
   - Feature usage patterns.
   Quantify the value gap to build the case for activation improvements.
9. **Investigate time-to-activate** -- Plot the distribution of time from signup to
   activation. Identify the critical window (after which activation probability drops
   below 10%).
10. **Identify quick wins** -- Find the highest-leverage improvements:
    - Steps with the biggest drop-off and simplest fix.
    - Segments with the lowest activation that could be targeted.
    - Missing guidance or unclear UI at key moments.
11. **Formulate recommendations** -- Write 5-10 specific recommendations with estimated
    impact, effort, and priority.
12. **Document and present** -- Create the activation audit report and share with the
    growth and product teams.

## Deliverable
An activation audit report containing:
- Activation definition and rationale.
- Activation funnel with conversion rates at each step.
- Activation rate trend (weekly, 3-month view).
- Segment analysis.
- Drop-off analysis with next-event data.
- Activated vs. non-activated user comparison.
- Time-to-activate distribution.
- Prioritized recommendations.

## Quality Gate
- [ ] Activation is clearly defined with a specific action and time window.
- [ ] Funnel covers every step from signup to activation.
- [ ] Activation rate is calculated and trended over time.
- [ ] At least 4 segment breakdowns are analyzed.
- [ ] Drop-off analysis includes next-event data.
- [ ] Activated vs. non-activated comparison shows retention impact.
- [ ] Time-to-activate critical window is identified.
- [ ] Recommendations are prioritized with estimated impact.

## Registry Update
- Add or update activation metric in `metric-registry` with formal definition.
- Log audit in `analysis-registry` with date and findings summary.
- Log task completion in `task-log`.
