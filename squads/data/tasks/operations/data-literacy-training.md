# Task: Data Literacy Training
> Agent(s): wes-kao, data-chief
> Frameworks: data-literacy-program-framework, kao-learning-velocity-framework, data-storytelling-framework
> Checklists: data-storytelling-quality, kao/learning-loop-integrity, kao/kao-rigorous-thinking-audit
> Templates: reports/exec-weekly-report
> Registry: decision-registry, lessons-learned-registry

## Objective
Design and deliver a data literacy program for non-data teams — building the skills needed for
stakeholders to independently interpret dashboards, ask good data questions, and make
evidence-based decisions without constant data team support.

## Prerequisites
- Stakeholder map identifying target teams and their current data maturity level.
- Access to existing dashboards and reports that participants will use.
- Training delivery platform (live sessions, recorded content, or both).
- Data-chief approval for the curriculum scope and time investment.

## Steps
1. **Assess current literacy levels** -- Survey target teams to establish baselines:
   - Can they interpret common chart types (bar, line, scatter, funnel)?
   - Do they understand statistical concepts (averages vs. medians, correlation vs. causation)?
   - Can they navigate the BI platform and apply filters?
   - Do they know how to find and interpret metrics in the metric registry?
   Score each team on a 1-5 data literacy scale.
2. **Define learning objectives** -- Based on the assessment, set clear objectives:
   - Level 1 (Consumer): Read dashboards, understand metric definitions, spot obvious errors.
   - Level 2 (Explorer): Apply filters, create ad-hoc breakdowns, interpret trends.
   - Level 3 (Analyst-lite): Formulate data questions, request analyses with clear briefs,
     interpret statistical results.
   Assign each team a target level.
3. **Design the curriculum** -- Create modular training content:
   - Module 1: Metric literacy (what our metrics mean, where to find definitions).
   - Module 2: Dashboard navigation (BI tool walkthrough with real dashboards).
   - Module 3: Data interpretation (reading charts, spotting anomalies, understanding context).
   - Module 4: Statistical foundations (averages, percentiles, significance, sample size).
   - Module 5: Asking good data questions (how to write a data request brief).
   - Module 6: Common data pitfalls (survivorship bias, Simpson's paradox, vanity metrics).
4. **Create hands-on exercises** -- For each module, design practical exercises:
   - Use real company dashboards and data (anonymized if needed).
   - Include "spot the error" exercises with intentionally misleading charts.
   - Include "write a data request" exercises with peer review.
   Hands-on exercises should comprise at least 40% of total training time.
5. **Build supporting materials** -- Create reference materials for ongoing use:
   - Metric glossary quick-reference card.
   - BI platform cheat sheet (common filters, exports, scheduled reports).
   - Data request brief template.
   - "When to ask the data team" decision tree.
6. **Schedule delivery** -- Plan the rollout:
   - Cohort size: 8-15 people per session for interactive engagement.
   - Session length: 60-90 minutes per module.
   - Cadence: 1-2 modules per week to allow practice between sessions.
   - Record all sessions for asynchronous access.
7. **Deliver training** -- Execute the program:
   - Open each session with a real business question answered by data.
   - Use the Socratic method — ask participants to interpret before explaining.
   - Collect questions and misconceptions in real-time for follow-up.
   - End each session with a practical assignment.
8. **Assess learning outcomes** -- After completing the program:
   - Re-administer the literacy assessment (compare pre vs. post scores).
   - Track self-service BI usage (are participants using dashboards more independently?).
   - Track data request quality (are briefs more specific and actionable?).
   - Collect NPS for the training program itself.
9. **Establish ongoing support** -- Create mechanisms for sustained learning:
   - Monthly "data office hours" for questions and coaching.
   - Slack channel for data literacy questions.
   - Quarterly refresher sessions on new metrics or dashboards.
   - Peer mentoring pairing between data-literate and less-experienced team members.
10. **Report results and iterate** -- Document:
    - Pre vs. post literacy scores by team.
    - Self-service usage trends.
    - Participant feedback and NPS.
    - Curriculum adjustments for the next cohort.

## Deliverable
A data literacy training package containing:
- Literacy assessment results (pre-training baseline).
- Curriculum with 6 modules and hands-on exercises.
- Supporting materials (glossary card, cheat sheet, templates).
- Delivery schedule and recorded sessions.
- Post-training assessment results with improvement metrics.
- Ongoing support plan (office hours, Slack channel, refreshers).

## Quality Gate
- [ ] Baseline literacy assessment completed for all target teams.
- [ ] Curriculum covers all 6 modules with hands-on exercises.
- [ ] Hands-on exercises use real company data and dashboards.
- [ ] Supporting materials are reviewed for accuracy.
- [ ] Training delivered to at least one cohort.
- [ ] Post-training assessment shows measurable improvement.
- [ ] Ongoing support mechanisms are established and communicated.
- [ ] Program NPS collected and above 30.

## Registry Update
- Log training outcomes in `decision-registry`.
- Log curriculum and lessons learned in `lessons-learned-registry`.
- Log task completion in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** wes-kao owns this task end-to-end.
- **Supporting agents:** data-chief contribute to their domain-specific steps.
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
- **Applicable gate:** G5 -- Decision + Registry
- **Must-pass checklists:** `checklists/data-storytelling-quality.md`, `checklists/kao/learning-loop-integrity.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.
- Update `data/registries/lessons-learned-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [data-literacy-program-framework](../../frameworks/data-literacy-program-framework.md), [kao-learning-velocity-framework](../../frameworks/kao-learning-velocity-framework.md), [data-storytelling-framework](../../frameworks/data-storytelling-framework.md)
- **Checklists:** [data-storytelling-quality](../../checklists/data-storytelling-quality.md), [kao/learning-loop-integrity](../../checklists/kao/learning-loop-integrity.md), [kao/kao-rigorous-thinking-audit](../../checklists/kao/kao-rigorous-thinking-audit.md)
- **Templates:** [reports/exec-weekly-report](../../templates/reports/exec-weekly-report.md)
- **Workflows:** [new-analyst-onboarding-workflow](../../workflows/new-analyst-onboarding-workflow.md)
