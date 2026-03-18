# Task: Data Storytelling Session
> Agent(s): wes-kao, data-chief
> Frameworks: data-storytelling-framework, decision-layer
> Checklists: data-storytelling-quality, exec-report-quality
> Templates: reports/exec-weekly-report
> Registry: decision-registry

## Objective
Facilitate a live data storytelling session where an analyst presents data findings in a
narrative format to a cross-functional audience, driving alignment, understanding, and
action on a specific topic.

## Prerequisites
- Analysis or investigation is completed with findings ready to share.
- Audience is identified and session is scheduled.
- Presentation materials are prepared (see build-data-narrative if needed).
- Room or virtual meeting is booked with screen sharing capability.

## Steps
1. **Select the topic** -- Choose a topic that is:
   - Timely and relevant to current business priorities.
   - Supported by completed analysis with clear findings.
   - Actionable (the audience can do something with the information).
2. **Know the audience** -- Map the attendees:
   - Decision-makers who can act on insights.
   - Subject-matter experts who can add context.
   - Skeptics who will challenge assumptions.
   Tailor the depth and technical level accordingly.
3. **Craft the narrative arc** -- Structure the session:
   - Hook (2 min): start with a surprising finding or provocative question.
   - Context (3 min): set the scene -- what happened, why we investigated.
   - Findings (10 min): present 3-5 key findings in logical sequence.
   - So-what (5 min): translate findings into business implications.
   - Recommendations (5 min): propose specific actions.
   - Discussion (15 min): open for questions and debate.
4. **Prepare assertion-evidence slides** -- For each slide:
   - Title = the assertion (insight statement, not metric name).
   - Body = the evidence (chart, data table, quote).
   - No bullet-point-heavy slides. One idea per slide.
5. **Rehearse** -- Practice the full session:
   - Time yourself (target 25 min presentation + 15 min discussion).
   - Practice transitions between findings.
   - Prepare for the 5 most likely questions.
6. **Prepare backup slides** -- Create appendix slides for:
   - Methodology details.
   - Segment-level deep dives.
   - Alternative interpretations.
   - Raw data tables.
7. **Set up the room** -- Whether physical or virtual:
   - Test screen sharing and projector.
   - Ensure the audience has the context they need (pre-read if appropriate).
   - Have a note-taker assigned for action items.
8. **Deliver the session** -- During the presentation:
   - Start with the hook to grab attention.
   - Pause after each key finding to let it land.
   - Use transitions that connect findings logically.
   - When challenged, use backup slides rather than getting defensive.
   - End with clear, specific calls to action.
9. **Facilitate the discussion** -- After the presentation:
   - Ask the audience for reactions and concerns.
   - Capture disagreements and alternative hypotheses.
   - Drive toward concrete next steps and owners.
10. **Capture action items** -- Document all decisions and action items with:
    - What needs to happen.
    - Who is responsible.
    - When it should be completed.
11. **Distribute follow-up** -- Within 24 hours, send:
    - Summary of key findings and decisions.
    - Action items with owners and deadlines.
    - Link to the full presentation materials.
12. **Reflect and improve** -- After the session, note:
    - What resonated most with the audience.
    - What questions surprised you (prepare for next time).
    - What to do differently in the next session.

## Deliverable
A completed data storytelling session with:
- Presentation deck with assertion-evidence slides.
- Session recording (if virtual and consented).
- Follow-up summary with key findings and decisions.
- Action item list with owners and deadlines.

## Quality Gate
- [ ] Topic is timely, supported by data, and actionable.
- [ ] Narrative has a clear arc (hook, context, findings, so-what, recommendations).
- [ ] Every slide has an assertion title and evidence body.
- [ ] Session is rehearsed and timed.
- [ ] Backup slides are prepared for anticipated questions.
- [ ] Action items are captured with owners and deadlines.
- [ ] Follow-up is distributed within 24 hours.
- [ ] At least one concrete decision or action results from the session.

## Registry Update
- Log session in `analysis-registry` with topic, date, audience, and outcomes.
- Link to underlying analysis artifacts.
- Log task completion in `task-log` with action item references.

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
- **Must-pass checklists:** `checklists/data-storytelling-quality.md`, `checklists/exec-report-quality.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [data-storytelling-framework](../../frameworks/data-storytelling-framework.md), [decision-layer](../../frameworks/decision-layer.md)
- **Checklists:** [data-storytelling-quality](../../checklists/data-storytelling-quality.md), [exec-report-quality](../../checklists/exec-report-quality.md)
- **Templates:** [reports/exec-weekly-report](../../templates/reports/exec-weekly-report.md)
