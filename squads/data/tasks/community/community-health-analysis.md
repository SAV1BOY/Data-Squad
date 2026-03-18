# Task: Community Health Analysis
> Agent(s): david-spinks, data-chief
> Frameworks: spinks-community-flywheel, spinks-contribution-path
> Checklists: community/community-health-score, spinks/engagement-signal-quality
> Templates: (none)
> Registry: community-registry

## Objective
Assess the overall health of the community by analyzing member engagement patterns, content
quality, growth trends, and lifecycle distribution, identifying areas that need attention
to sustain a thriving community.

## Prerequisites
- Community scorecard is built and data is flowing (see community-scorecard-build).
- Minimum 3 months of community activity data.
- Member-level activity data is accessible.
- Community platform analytics are available.

## Steps
1. **Measure community size and growth** -- Calculate:
   - Total registered members.
   - Monthly new member registrations.
   - Growth rate (month-over-month).
   - Net growth (new members - departures).
   Plot the growth trend. Is growth accelerating, stable, or decelerating?
2. **Analyze the engagement funnel** -- Segment members by engagement level:
   - Visitors: view content but not registered.
   - Lurkers: registered but never posted (typically 60-80%).
   - Participants: posted or commented at least once.
   - Contributors: post regularly (monthly+).
   - Champions: top 1-5% by contribution volume and quality.
   Calculate the size of each segment.
3. **Calculate engagement ratios** -- Compute:
   - DAU/MAU ratio (daily active / monthly active).
   - Posting ratio (members who posted / total active members).
   - Response rate (questions that received at least one answer / total questions).
   - Average time to first response.
4. **Analyze content health** -- Assess content quality and volume:
   - Posts per day/week trend.
   - Answers per question ratio.
   - Content with zero engagement (no views, no replies).
   - Top content by engagement (views, likes, shares).
5. **Analyze member lifecycle** -- Track member progression:
   - Time from registration to first post.
   - Transition rates between engagement segments.
   - Churn rate at each lifecycle stage.
   - Resurrection rate (inactive members who return).
6. **Identify engagement patterns** -- Analyze:
   - Most active days and times.
   - Content types that drive highest engagement.
   - Topics and categories with most activity.
   - Seasonal patterns.
7. **Assess community sentiment** -- If data is available:
   - Analyze post sentiment (positive, neutral, negative).
   - Track sentiment trends over time.
   - Identify topics that drive negative sentiment.
8. **Evaluate champion health** -- The champion segment is critical:
   - How many active champions exist?
   - Is the champion count growing or shrinking?
   - What is champion retention rate?
   - Are there new champions emerging from the contributor segment?
9. **Compare to benchmarks** -- Reference community health benchmarks:
   - DAU/MAU > 0.15 is healthy for professional communities.
   - Posting ratio > 5% is healthy.
   - Response rate > 80% is healthy.
10. **Identify risk areas** -- Flag areas of concern:
    - Declining engagement ratios.
    - Shrinking champion base.
    - Increasing response times.
    - Growing % of unanswered questions.
11. **Formulate recommendations** -- For each risk area, suggest interventions:
    - Engagement programs, gamification, content strategy changes.
    - Champion cultivation and recognition programs.
    - Moderation and community management adjustments.
12. **Document and present** -- Create the community health report.

## Deliverable
A community health analysis report containing:
- Growth metrics and trends.
- Engagement funnel with segment sizes.
- Engagement ratios with benchmarks.
- Content health analysis.
- Member lifecycle analysis.
- Champion health assessment.
- Risk areas with recommendations.

## Quality Gate
- [ ] Growth metrics cover at least 3 months of history.
- [ ] Engagement funnel segments are defined and sized.
- [ ] At least 3 engagement ratios are calculated.
- [ ] Content health is analyzed (volume, quality, response rates).
- [ ] Member lifecycle transitions are tracked.
- [ ] Champion health is specifically assessed.
- [ ] Benchmarks are referenced for key metrics.
- [ ] Recommendations address each identified risk area.

## Registry Update
- Update community metrics in `metric-registry` with current values.
- Log analysis in `analysis-registry` with date and health assessment.
- Log task completion in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** david-spinks owns this task end-to-end.
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
- **Must-pass checklists:** `checklists/community/community-health-score.md`, `checklists/spinks/engagement-signal-quality.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/community-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [spinks-community-flywheel](../../frameworks/spinks-community-flywheel.md), [spinks-contribution-path](../../frameworks/spinks-contribution-path.md)
- **Checklists:** [community/community-health-score](../../checklists/community/community-health-score.md), [spinks/engagement-signal-quality](../../checklists/spinks/engagement-signal-quality.md)
- **Workflows:** [community-metrics-workflow](../../workflows/community-metrics-workflow.md)
