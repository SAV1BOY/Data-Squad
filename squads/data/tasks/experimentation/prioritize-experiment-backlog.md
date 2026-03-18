# Task: Prioritize Experiment Backlog
> Agent(s): sean-ellis, wes-kao, data-chief
> Frameworks: ice-pie-rice-prioritization, ellis-high-tempo-testing
> Checklists: experiment-design-quality
> Templates: outputs/experiment-onepager
> Registry: experiment-registry

## Objective
Evaluate and rank the experiment backlog to ensure the team runs the highest-impact, most
feasible experiments first, maximizing learning velocity and business impact per sprint.

## Prerequisites
- An experiment backlog exists with at least 5 proposed experiments.
- Each experiment has a rough hypothesis and target metric.
- Historical experiment results are available for calibration.
- Team capacity (number of experiments that can run concurrently) is known.

## Steps
1. **Collect all candidates** -- Gather every proposed experiment from product, marketing,
   growth, and engineering teams. Standardize into a single backlog list with: name,
   hypothesis, target metric, proposer, and requested priority.
2. **Filter for readiness** -- Remove experiments that are not ready to run:
   - Missing tracking implementation.
   - Dependent on unreleased features.
   - Insufficient traffic for statistical power.
   - Conflicting with currently running experiments.
   Move unready experiments to a "needs preparation" queue.
3. **Score Impact** -- For each ready experiment, estimate the potential impact:
   - What metric will move? By how much (best estimate)?
   - How many users are affected?
   - What is the annualized revenue or engagement impact if successful?
   Score 1-10.
4. **Score Confidence** -- Estimate the probability of success:
   - Is there data or prior experiments supporting the hypothesis?
   - Is the causal mechanism well understood?
   - Have similar experiments succeeded elsewhere?
   Score 1-10.
5. **Score Ease** -- Estimate the implementation and execution effort:
   - Engineering effort to build variants.
   - Duration required to reach statistical significance.
   - Operational complexity.
   Score 1-10 (10 = easiest).
6. **Calculate ICE score** -- ICE = Impact x Confidence x Ease / 1000. Rank experiments
   by ICE score descending.
7. **Apply strategic overrides** -- Review the ranked list with leadership. Apply overrides
   for strategic priorities that may not score highest on ICE but are essential to the
   company direction. Document the rationale for every override.
8. **Check for mutual exclusivity** -- Identify experiments that cannot run concurrently
   (same user population, same page, interacting features). Sequence them.
9. **Build the experiment roadmap** -- Assign experiments to time slots based on:
   - ICE rank (highest first).
   - Mutual exclusivity constraints.
   - Team capacity (max concurrent experiments).
   - Expected duration.
10. **Set review cadence** -- Schedule the next backlog review (recommended: bi-weekly).
11. **Communicate the plan** -- Share the prioritized roadmap with all stakeholders.
    Explain why their proposed experiments are ranked where they are.

## Deliverable
A prioritized experiment roadmap containing:
- Ranked experiment backlog with ICE scores.
- Experiment roadmap with time slots and assignments.
- "Needs preparation" queue with required actions.
- Strategic override documentation.
- Capacity plan showing concurrent experiment slots.

## Quality Gate
- [ ] All proposed experiments are captured in the backlog.
- [ ] Each experiment has Impact, Confidence, and Ease scores.
- [ ] ICE scores are calculated and experiments are ranked.
- [ ] Strategic overrides are documented with rationale.
- [ ] Mutual exclusivity constraints are identified and resolved.
- [ ] Roadmap fits within team capacity.
- [ ] Next review date is scheduled.
- [ ] Roadmap is communicated to all stakeholders.

## Registry Update
- Update `experiment-registry` with priority rank and planned start dates.
- Move unready experiments to `status: backlog-blocked` with blockers noted.
- Log task completion in `task-log` with roadmap version.

---

## Operational Details

### Handoff Rules
- **Lead agent:** sean-ellis owns this task end-to-end.
- **Supporting agents:** wes-kao, data-chief contribute to their domain-specific steps.
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
- **Must-pass checklists:** `checklists/experiment-design-quality.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/experiment-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [ice-pie-rice-prioritization](../../frameworks/ice-pie-rice-prioritization.md), [ellis-high-tempo-testing](../../frameworks/ellis-high-tempo-testing.md)
- **Checklists:** [experiment-design-quality](../../checklists/experiment-design-quality.md)
- **Templates:** [outputs/experiment-onepager](../../templates/outputs/experiment-onepager.md)
