# Growth Experiment Sprint - Experiment Design

## Phase Objective

Transform each prioritized hypothesis into a rigorously designed experiment with clearly defined variables, metrics, audience segments, sample sizes, and duration. The design must ensure that results will be statistically valid and actionable regardless of the outcome.

## Prerequisites

- Prioritized hypothesis backlog from Phase 00 with selected hypotheses
- Access to the experimentation platform (Optimizely, LaunchDarkly, internal tool)
- Baseline metric values for all primary and guardrail metrics
- Traffic volume data for sample size calculations
- Statistical consultation available for power analysis

## Steps

1. **Define the Independent Variable**: For each experiment, specify exactly what changes between control and treatment. Document the control experience (current state) and the treatment experience (proposed change) with enough detail that an engineer can implement it without ambiguity. If testing multiple variations, define each one precisely and justify why each variation is worth the additional complexity.

2. **Select the Primary Metric**: Choose one primary metric that the experiment is designed to move. This metric should be directly influenced by the change, measurable within the experiment window, and aligned with the hypothesis. Resist the temptation to have multiple primary metrics, as this inflates false positive rates. If the hypothesis spans multiple metrics, run separate experiments.

3. **Define Secondary and Guardrail Metrics**: Secondary metrics provide additional context about the treatment's effect. Guardrail metrics are metrics that must not degrade, even if the primary metric improves. For example, if testing a more aggressive upsell prompt, the primary metric might be upgrade rate, a secondary metric might be revenue per user, and a guardrail metric might be unsubscribe rate. Define acceptable thresholds for guardrail degradation.

4. **Calculate Sample Size and Duration**: Using the baseline conversion rate, minimum detectable effect (MDE), desired statistical power (typically 80%), and significance level (typically 5%), calculate the required sample size per variation. Divide by daily traffic to the experiment surface to determine duration. Add buffer for weekday/weekend cycles by rounding up to full weeks. Never run an experiment for less than one full business cycle.

5. **Define the Audience**: Specify which users are eligible for the experiment. Define inclusion criteria (new users only, paid users, users on a specific platform) and exclusion criteria (internal accounts, users in other concurrent experiments, users in specific geographies). Document the randomization unit (user-level, session-level, device-level) and the allocation ratio between control and treatment.

6. **Plan the Segmentation Analysis**: Pre-register the segments you plan to analyze after the experiment concludes. Typical segments include device type, acquisition channel, user tenure, plan type, and geography. Pre-registration prevents post-hoc fishing for significant subgroups and maintains statistical rigor. Limit pre-registered segments to 3-5 to control multiple comparison problems.

7. **Document the Decision Framework**: Before the experiment runs, write down the decision rules. What primary metric lift constitutes a "ship" decision? What guardrail degradation triggers a "kill" decision? What happens if the result is inconclusive (not statistically significant)? Documenting decisions in advance prevents motivated reasoning after seeing results.

8. **Create the Experiment Brief**: Compile all design decisions into a single experiment brief that serves as the source of truth. This document should be reviewable by anyone on the team and contain everything needed to understand, implement, and evaluate the experiment.

## Deliverables

- Experiment brief for each selected hypothesis containing all design parameters
- Control and treatment specifications with visual mockups or detailed descriptions
- Metric definitions document specifying primary, secondary, and guardrail metrics with formulas
- Sample size calculation worksheet showing baseline rates, MDE, power, and duration
- Audience definition with inclusion/exclusion criteria and randomization plan
- Pre-registered segmentation analysis plan
- Decision framework document with ship/iterate/kill criteria

## Quality Gate

Experiment design is complete when all of the following conditions are met:

- Each experiment has exactly one primary metric with a pre-defined minimum detectable effect
- Guardrail metrics are defined with explicit degradation thresholds
- Sample size calculations yield experiment durations that fit within the sprint timeline
- Audience definitions do not conflict with other running experiments
- Decision framework is documented and agreed upon by stakeholders before any data is collected
- Engineering has reviewed the experiment brief and confirmed implementation feasibility
- A peer on the growth team has reviewed the design for methodological rigor
- Pre-registered segment analysis plans are documented and limited to 3-5 segments per experiment
- All experiment briefs are stored in the shared repository and accessible to the full growth team
- Decision criteria for ship, iterate, and kill are documented before any experiment launches

## Next Phase

Proceed to **02-implementation.md** (Implementation) to build the experiment variations, configure feature flags, implement tracking, and QA the setup before launching. The experiment briefs from this phase serve as the implementation specifications.
