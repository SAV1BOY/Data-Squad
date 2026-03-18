# Experiment Cycle Workflow

## Purpose
Run experiments with rigor from hypothesis through decision. Every experiment must have a clear hypothesis, adequate sample size, pre-registered success criteria, and a documented decision at the end.

## Trigger
- Product team wants to validate a feature change
- Growth initiative requires causal evidence
- Retention analysis surfaces an actionable hypothesis
- Quarterly experiment backlog review prioritizes a new test

## Agents Involved
- **sean-ellis**: Owns the experiment lifecycle, designs tests, reads results
- **avinash-kaushik**: Ensures metrics and instrumentation support the experiment
- **wes-kao**: Communicates results and decisions to stakeholders
- **avinash-kaushik**: Validates data integrity during the experiment

## Steps

### Phase 1: Backlog and Prioritization (Days 1-3)
1. **sean-ellis** reviews the experiment backlog and scores each candidate on: expected impact, confidence in hypothesis, and effort to implement.
2. **sean-ellis** selects the top experiment(s) for the cycle using ICE scoring (Impact, Confidence, Ease).
3. **sean-ellis** drafts the experiment brief: hypothesis, primary metric, secondary metrics, guardrail metrics.
4. **avinash-kaushik** confirms all required metrics are instrumented and the data pipeline can support the experiment.

### Phase 2: Design and Setup (Days 4-7)
5. **sean-ellis** calculates the required sample size and expected duration using a power analysis.
6. **sean-ellis** defines the randomization unit (user, session, device) and allocation ratio.
7. **sean-ellis** pre-registers the experiment: hypothesis, success criteria, analysis plan, and minimum detectable effect.
8. **avinash-kaushik** configures the experiment in the experimentation platform and verifies correct assignment logic.
9. **avinash-kaushik** runs a pre-experiment data quality check on all metrics involved.

### Phase 3: Execution (Duration varies)
10. **sean-ellis** launches the experiment and monitors for the first 24 hours for assignment imbalance or errors.
11. **avinash-kaushik** checks daily: sample ratio mismatch (SRM), data freshness, and metric anomalies.
12. **sean-ellis** enforces the no-peeking rule: no decisions until the pre-registered sample size is reached.
13. **avinash-kaushik** monitors for instrumentation issues that could contaminate results.

### Phase 4: Read Results (Post-duration)
14. **sean-ellis** runs the pre-registered analysis: primary metric comparison, confidence intervals, p-values.
15. **sean-ellis** checks secondary metrics and guardrail metrics for unexpected movements.
16. **sean-ellis** performs segment analysis: does the effect vary by cohort, platform, or geography?
17. **sean-ellis** documents the full results including effect size, statistical significance, and practical significance.

### Phase 5: Decide and Learn (2-3 days post-read)
18. **wes-kao** prepares the experiment report: what we tested, what we found, what it means.
19. **sean-ellis** makes the recommendation: ship, iterate, or kill.
20. **wes-kao** presents findings to the product team and facilitates the decision meeting.
21. **sean-ellis** records the decision, rationale, and learnings in the experiment registry.
22. **sean-ellis** updates the backlog: add follow-up experiments, reprioritize based on learnings.

## Inputs
- Experiment backlog with scored hypotheses
- Metric definitions and instrumentation status
- Historical baseline data for power analysis
- Experimentation platform access

## Outputs
- Pre-registered experiment brief
- Daily monitoring reports during execution
- Full results report with statistical analysis
- Decision record with rationale and learnings
- Updated experiment backlog

## Quality Gates

| Gate | Criteria | Owner |
|------|----------|-------|
| G1: Hypothesis Valid | Hypothesis is specific, falsifiable, and linked to a business outcome | sean-ellis |
| G2: Pre-Registered | Success criteria, sample size, and analysis plan documented before launch | sean-ellis |
| G3: No SRM | Sample ratio within expected bounds throughout the experiment | avinash-kaushik |
| G4: Adequate Power | Experiment ran to planned sample size, no early stopping without correction | sean-ellis |
| G5: Decision Documented | Ship/iterate/kill decision recorded with rationale in registry | sean-ellis |

## Registry Updates
- **Experiment Registry**: Experiment ID, hypothesis, dates, results, decision, learnings.
- **Metric Registry**: Note any metric changes driven by experiment results.
- **Knowledge Base**: Add learnings to the institutional knowledge about what works and what does not.
- **Backlog**: Update priorities based on new learnings and follow-up hypotheses.
