# Task: Kill or Ship Experiment
> Agent(s): sean-ellis, data-chief
> Frameworks: experiment-framework, bayesian-vs-frequentist-testing
> Checklists: experiment-analysis-quality, experimentation/decision-rubric
> Templates: outputs/experiment-analysis
> Registry: experiment-registry, decision-registry

## Objective
Make a rigorous, data-informed decision on whether to ship (roll out to 100%), iterate (modify
and re-test), or kill (abandon) a completed experiment, ensuring the decision is systematic
and well-documented.

## Prerequisites
- Experiment analysis is completed (see analyze-experiment).
- Results report is available with all statistical outputs.
- Pre-registered decision criteria are documented.
- Stakeholders are available for the decision meeting.

## Steps
1. **Review the analysis** -- Re-read the experiment results report. Ensure you understand
   the primary metric result, secondary metrics, guardrail metrics, and segment analysis.
2. **Apply the pre-registered decision criteria** -- Check the result against the criteria
   defined in the experiment design:
   - Did the primary metric reach statistical significance?
   - Is the effect size >= the minimum detectable effect?
   - Are all guardrail metrics within acceptable bounds?
3. **Evaluate practical significance** -- Beyond statistical significance:
   - Is the effect large enough to matter to the business?
   - What is the annualized impact in revenue or user terms?
   - Does the benefit outweigh the maintenance cost of the feature?
4. **Check for segment heterogeneity** -- Review segment analysis:
   - Is the effect positive across all key segments?
   - Are there segments where the effect is negative or absent?
   - Would a targeted rollout (specific segments only) be better?
5. **Assess implementation quality** -- Consider:
   - Is the treatment implementation production-ready?
   - Are there known bugs or technical debt in the treatment code?
   - What is the ongoing maintenance burden?
6. **Consider strategic alignment** -- Even with positive results, consider:
   - Does this align with the product strategy?
   - Does this create complexity or conflict with planned features?
   - Would the engineering resources be better used elsewhere?
7. **Make the decision** -- Apply the decision matrix:
   | Primary Significant + | Guardrails OK | Decision |
   | Yes | Yes | SHIP |
   | Yes | No | INVESTIGATE guardrail, likely KILL |
   | No (positive direction) | Yes | ITERATE or EXTEND |
   | No (flat or negative) | - | KILL |
8. **Document the decision** -- Record:
   - The decision (ship/iterate/kill).
   - The rationale with reference to data.
   - Dissenting opinions (if any).
   - Next steps and owners.
9. **Plan the rollout (if shipping)** -- Define:
   - Rollout strategy (gradual ramp: 10% -> 50% -> 100%).
   - Monitoring plan during rollout.
   - Rollback criteria if metrics degrade.
10. **Plan the iteration (if iterating)** -- Define:
    - What to change in the next version.
    - New hypothesis for the iteration.
    - Whether a new experiment design is needed.
11. **Clean up (if killing)** -- Ensure:
    - Treatment code is removed or feature-flagged off.
    - No dead code remains in the codebase.
    - Learnings are documented for future reference.
12. **Communicate the decision** -- Share the decision and rationale with all stakeholders.
    Update the experiment registry.

## Deliverable
An experiment decision document containing:
- Decision outcome (ship/iterate/kill).
- Decision rationale with data references.
- Dissenting opinions and responses.
- Rollout plan (if shipping) or iteration plan (if iterating).
- Cleanup plan (if killing).
- Key learnings regardless of decision.

## Quality Gate
- [ ] Pre-registered decision criteria are explicitly evaluated.
- [ ] Statistical and practical significance are both assessed.
- [ ] Guardrail metrics are reviewed with no unexplained violations.
- [ ] Segment analysis is considered in the decision.
- [ ] Decision is documented with clear rationale.
- [ ] Rollout/iteration/cleanup plan is defined with owners.
- [ ] Key learnings are captured.
- [ ] Decision is communicated to all stakeholders.

## Registry Update
- Update `experiment-registry` with final status: `shipped`, `killed`, or `iterating`.
- Record the decision date, decision-maker, and rationale.
- If shipped, record the rollout date and monitoring plan.
- Log task completion in `task-log` with experiment ID.
