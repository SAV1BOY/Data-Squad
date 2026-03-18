# Task: Build Data Narrative
> Agent(s): wes-kao, data-chief
> Frameworks: data-storytelling-framework, decision-layer
> Checklists: data-storytelling-quality, exec-report-quality
> Templates: reports/exec-weekly-report
> Registry: decision-registry

## Objective
Transform raw analysis findings into a compelling, structured data narrative that drives
stakeholder understanding and action, going beyond charts and tables to tell a coherent story.

## Prerequisites
- Underlying analysis is completed (cohort, funnel, segmentation, etc.).
- Key findings and insights are documented.
- Audience is identified (executives, product team, engineering, board).
- Presentation format is determined (slide deck, written report, live session).

## Steps
1. **Identify the audience** -- Document who will consume this narrative. Determine their
   data literacy level, what decisions they need to make, and what they care most about.
2. **Define the core message** -- Distill the entire analysis into one sentence: "The single
   most important thing the audience needs to know is [X]." This is the narrative spine.
3. **Structure with the Pyramid Principle** -- Organize the narrative:
   - Lead with the conclusion (the "so what").
   - Support with 2-4 key arguments.
   - Back each argument with evidence (data, charts, examples).
4. **Select the right visualizations** -- For each data point, choose the visualization
   that most clearly communicates the insight:
   - Comparison: bar chart.
   - Trend: line chart.
   - Composition: stacked bar or pie (sparingly).
   - Distribution: histogram or box plot.
   - Relationship: scatter plot.
5. **Apply annotation** -- Add context to every chart:
   - Title that states the insight (not just the metric name).
   - Annotations highlighting the key data point.
   - Reference lines for benchmarks or targets.
   - Source and date range labels.
6. **Build the narrative arc** -- Structure the story:
   a. Context: Why does this matter? What is the business situation?
   b. Conflict: What is the problem, challenge, or unexpected finding?
   c. Resolution: What did the data reveal? What should be done?
7. **Add the "so what" for every chart** -- Below every visualization, write 1-2 sentences
   explaining what the chart shows and why it matters. No orphan charts.
8. **Include the recommendation** -- End with clear, specific recommendations. For each,
   state: what to do, expected impact, effort level, and suggested owner.
9. **Anticipate questions** -- Prepare answers for the 5 most likely stakeholder questions.
   Include appendix slides or sections with supporting detail.
10. **Review for clarity** -- Read the narrative from the audience's perspective. Remove
    jargon, simplify complex concepts, and ensure logical flow.
11. **Peer review** -- Have another analyst review for accuracy and a non-analyst review
    for clarity.
12. **Present and iterate** -- Deliver the narrative. Capture feedback and questions for
    future improvements.

## Deliverable
A data narrative package containing:
- Core narrative document or slide deck (10-20 slides or 3-5 pages).
- Annotated visualizations with insight titles.
- Executive summary (3-5 bullet points).
- Detailed recommendations with expected impact.
- Appendix with supporting data and methodology.

## Quality Gate
- [ ] Core message is stated in one clear sentence.
- [ ] Narrative follows Pyramid Principle (conclusion first).
- [ ] Every chart has an insight title (not just metric name).
- [ ] Every chart has a "so what" annotation or caption.
- [ ] Recommendations are specific with expected impact.
- [ ] Narrative is appropriate for the target audience.
- [ ] Peer-reviewed for accuracy and clarity.
- [ ] Appendix includes methodology and supporting detail.

## Registry Update
- Log narrative in `analysis-registry` with audience, date, and topic.
- Link to underlying analysis artifacts.
- Log task completion in `task-log` with presentation date and feedback summary.

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
- **Applicable gate:** G4 -- Insight
- **Must-pass checklists:** `checklists/data-storytelling-quality.md`, `checklists/exec-report-quality.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [data-storytelling-framework](../../frameworks/data-storytelling-framework.md), [decision-layer](../../frameworks/decision-layer.md)
- **Checklists:** [data-storytelling-quality](../../checklists/data-storytelling-quality.md), [exec-report-quality](../../checklists/exec-report-quality.md)
- **Templates:** [reports/exec-weekly-report](../../templates/reports/exec-weekly-report.md)
