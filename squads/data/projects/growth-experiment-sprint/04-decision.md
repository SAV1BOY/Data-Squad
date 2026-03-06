# Growth Experiment Sprint - Decision

## Phase Objective

Make and document the final decision for each experiment: ship the treatment to all users, iterate with a modified follow-up experiment, or kill the treatment and move on. The decision must be based on the pre-defined decision framework, supported by the analysis results, and documented for organizational learning.

## Prerequisites

- Completed analysis report from Phase 03 with clear recommendation
- Pre-defined decision framework from the experiment design phase
- Stakeholders available for decision review meeting
- Engineering capacity assessment for potential full rollout
- Understanding of the product roadmap and competing priorities

## Steps

1. **Apply the Decision Framework**: Compare the analysis results against the decision criteria defined during experiment design. If the primary metric lift exceeds the minimum detectable effect and all guardrail metrics are within acceptable bounds, the default decision is to ship. If the primary metric did not reach significance, the default is to kill unless strong directional evidence and a clear path to iteration exist. Apply the rules as written to minimize post-hoc rationalization.

2. **Evaluate the Ship Decision**: If the recommendation is to ship, assess the full implications. Determine the engineering effort to convert the experiment code into permanent production code. Identify any technical debt created by the treatment implementation that should be cleaned up. Estimate the ongoing maintenance cost. Confirm that the treatment works across all user segments or define segment-specific rollout rules if the effect is heterogeneous.

3. **Evaluate the Iterate Decision**: If the result is inconclusive or shows promise but falls short of the threshold, determine whether iteration is warranted. Define what specifically would change in the next iteration: a larger sample size to detect a smaller effect, a modified treatment based on segment analysis insights, or a different metric that better captures the treatment's impact. Only iterate if you have a specific, evidence-based reason to believe the next version will produce a clearer result.

4. **Evaluate the Kill Decision**: If the treatment showed no effect or a negative effect, accept the result and move on. Document what was learned from the failure. A well-designed experiment that produces a null result is not a waste. It eliminates a hypothesis, builds organizational knowledge about what does not work, and often generates new hypotheses based on unexpected patterns in the data.

5. **Conduct the Decision Meeting**: Present the analysis results and recommendation to the decision-making group. Walk through the primary metric result, guardrail impacts, segment analysis, and practical significance. Allow time for questions and discussion, but anchor the conversation on the pre-defined decision framework. Record the final decision and the reasoning behind any deviation from the framework.

6. **Plan the Rollout or Rollback**: For ship decisions, create a rollout plan. Define the ramp schedule (e.g., 25% on day one, 50% on day three, 100% on day five). Specify the monitoring plan during rollout, including which metrics to watch and what thresholds trigger a pause. For kill decisions, schedule the removal of experiment code and tracking from the codebase.

7. **Update the Experiment Registry**: Record the experiment outcome in the central experiment registry. Include the hypothesis, treatment description, primary metric result (lift and confidence interval), guardrail impacts, decision made, and key learnings. Tag the experiment with relevant categories (onboarding, pricing, engagement, etc.) so it can be found by future teams exploring similar areas.

8. **Communicate Results Broadly**: Share the experiment results with the broader organization through the established communication channel (email digest, Slack, all-hands presentation). Include a brief summary accessible to non-technical audiences: what was tested, what happened, what was decided, and what was learned. Transparency about both wins and losses builds an experimentation culture.

## Deliverables

- Decision document for each experiment with ship/iterate/kill determination and rationale
- Rollout plan for shipped experiments with ramp schedule and monitoring criteria
- Iteration brief for iterate decisions with specific changes and rationale
- Kill report for killed experiments with learnings documented
- Updated experiment registry entries for all experiments
- Organization-wide communication summarizing sprint results

## Quality Gate

The decision phase is complete when all of the following conditions are met:

- Every experiment in the sprint has a documented decision with supporting rationale
- Decisions are consistent with the pre-defined decision framework or deviations are explicitly justified
- Shipped experiments have a rollout plan with monitoring and rollback procedures
- Iterated experiments have a clear next-version brief with specific changes
- The experiment registry is updated with complete entries for all experiments
- Results have been communicated to the broader organization
- Experiment code for killed treatments is scheduled for removal from the codebase
- Rollout monitoring for shipped experiments is active with defined metric thresholds and rollback triggers
- All decision documents are archived alongside the experiment briefs and analysis reports for future reference
- Financial impact of shipped experiments is estimated and tracked against projections
- Decision meeting notes are documented with attendees, discussion points, and any framework deviations justified

## Next Phase

Proceed to **05-documentation.md** (Documentation) to capture all learnings, update the organizational knowledge base, and plan the next experiment sprint. The decisions and rationale documented here feed directly into the learnings registry and inform future hypothesis generation.
