# Activation Optimization Workflow

## Purpose
Improve new user activation by mapping the onboarding journey, identifying the "aha moment," measuring conversion through activation milestones, testing improvements, and iterating based on results.

## Trigger
- Activation rate falls below target for two consecutive cohorts
- New onboarding flow is being designed or redesigned
- PMF analysis reveals activation as the primary gap
- Growth model identifies activation as the highest-leverage bottleneck

## Agents Involved
- **sean-ellis**: Leads activation analysis and strategy
- **avinash-kaushik**: Builds activation funnels and behavioral models
- **sean-ellis**: Designs and runs activation experiments
- **avinash-kaushik**: Ensures onboarding events are properly instrumented

## Steps

### Phase 1: Map the Journey (Days 1-5)
1. **avinash-kaushik** maps the full onboarding funnel from signup to defined activation event, with conversion rates at each step.
2. **avinash-kaushik** audits instrumentation for every onboarding step: are all events firing, with correct properties?
3. **avinash-kaushik** computes time-to-activation distributions: how long does it take users to reach each milestone?
4. **sean-ellis** identifies the biggest drop-off points in the funnel and segments them by acquisition channel, device, and user type.
5. **sean-ellis** reviews qualitative data (session recordings, support tickets, onboarding survey responses) to understand why users drop off.

### Phase 2: Identify the Aha Moment (Days 6-10)
6. **avinash-kaushik** runs correlation analysis: which early actions (within first 7 days) most strongly predict 30-day retention?
7. **avinash-kaushik** tests multiple candidate aha moments: feature activation, content creation, social connection, value receipt.
8. **sean-ellis** evaluates each candidate: is it within the user's control? Can the product guide users toward it? Is the correlation causal or incidental?
9. **sean-ellis** selects the aha moment definition: the specific action (and threshold) that defines activation.
10. **avinash-kaushik** validates the aha moment by checking that users who reach it retain at a significantly higher rate across all segments.

### Phase 3: Measure Current State (Days 11-13)
11. **avinash-kaushik** computes the current activation rate: % of new users who reach the aha moment within the activation window.
12. **avinash-kaushik** builds an activation dashboard showing funnel conversion, time-to-activation, and segment breakdowns.
13. **sean-ellis** sets the activation target based on benchmarks, growth model requirements, and historical trends.
14. **avinash-kaushik** identifies the specific funnel steps with the largest absolute drop-off contributing to activation failure.

### Phase 4: Test Improvements (Days 14-28)
15. **sean-ellis** brainstorms activation improvement ideas for each major drop-off point: UX simplification, contextual guidance, default configurations, progressive disclosure.
16. **sean-ellis** prioritizes ideas using ICE scoring and designs the top experiment.
17. **sean-ellis** launches the activation experiment, targeting the highest-impact drop-off point.
18. **avinash-kaushik** monitors the experiment daily: check for instrumentation issues and sample balance.
19. **sean-ellis** reads results after the pre-registered duration and sample size.

### Phase 5: Iterate (Ongoing)
20. **sean-ellis** documents the experiment result: effect on activation rate, impact on downstream retention.
21. **sean-ellis** decides: ship the winner, iterate on the concept, or move to the next idea.
22. **sean-ellis** updates the activation roadmap based on learnings.
23. **avinash-kaushik** updates the activation dashboard and monitors for sustained improvement.
24. **sean-ellis** reviews the activation rate monthly and triggers a new cycle if it plateaus or declines.

## Inputs
- New user event data (signup through first 30 days)
- Onboarding funnel instrumentation
- Session recordings and qualitative feedback
- Historical activation and retention data
- Growth model with activation assumptions

## Outputs
- Onboarding funnel map with conversion rates and drop-off analysis
- Aha moment definition with supporting evidence
- Activation dashboard with segment breakdowns
- Experiment results and learnings
- Updated activation roadmap

## Quality Gates

| Gate | Criteria | Owner |
|------|----------|-------|
| G1: Funnel Complete | Every onboarding step instrumented and conversion measured | avinash-kaushik |
| G2: Aha Moment Validated | Selected aha moment predicts retention across all major segments | sean-ellis |
| G3: Target Set | Activation target justified by benchmarks and growth model | sean-ellis |
| G4: Experiment Rigorous | Test follows experiment-cycle-workflow with pre-registration | sean-ellis |
| G5: Impact Sustained | Activation improvement persists for at least 3 cohorts post-ship | avinash-kaushik |

## Registry Updates
- **Metric Registry**: Register activation rate with aha moment definition, calculation, and target.
- **Experiment Registry**: Log all activation experiments with results and learnings.
- **Funnel Registry**: Document the onboarding funnel stages with baseline conversion rates.
- **Knowledge Base**: Record what works and what does not for activation in this product context.
