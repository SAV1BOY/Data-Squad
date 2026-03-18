# Task: PMF Survey Analysis
> Agent(s): sean-ellis, wes-kao
> Frameworks: ellis-pmf-framework, kao-rigorous-thinking
> Checklists: ellis/pmf-survey-quality, kao/messaging-to-metric-alignment
> Templates: (none)
> Registry: decision-registry

## Objective
Design, deploy, and analyze a Product-Market Fit survey to quantify how strongly users value
the product, identify the core value proposition, and guide strategic decisions on positioning
and feature investment.

## Prerequisites
- Active user base with sufficient volume (minimum 100 respondents target).
- Survey tool is available (Typeform, SurveyMonkey, in-app survey).
- Stakeholder agreement on survey timing and target audience.
- Email or in-app delivery mechanism is set up.

## Steps
1. **Define the survey audience** -- Specify who receives the survey:
   - Users who have experienced the core value (minimum 2 weeks active).
   - Exclude churned users, trial users who never activated, and internal accounts.
   - Target sample size: minimum 100 responses, ideally 200-400.
2. **Design the survey** -- Include the canonical PMF questions:
   a. "How would you feel if you could no longer use [product]?"
      (Very disappointed / Somewhat disappointed / Not disappointed)
   b. "What type of people do you think would most benefit from [product]?"
   c. "What is the main benefit you receive from [product]?"
   d. "How can we improve [product] for you?"
   Add 2-3 demographic/segmentation questions (role, company size, use case).
3. **Set up the survey** -- Build in the survey tool. Test the flow on multiple devices.
   Set up response tracking.
4. **Deploy the survey** -- Send to the target audience. Use in-app prompts for higher
   response rates. Set a collection window (typically 1-2 weeks).
5. **Monitor response rate** -- Track responses daily. If response rate is below 10%
   after 3 days, send a reminder. Target minimum 20% response rate.
6. **Calculate the PMF score** -- % of respondents who answered "Very disappointed."
   - >= 40%: Strong PMF signal.
   - 25-40%: Promising but not yet PMF.
   - < 25%: PMF not achieved.
7. **Segment the PMF score** -- Break down by:
   - User tenure, plan type, use case, company size.
   - Identify the segment with the highest PMF score -- this is your "high-expectation
     customer" (HXC).
8. **Analyze qualitative responses** -- Code the open-ended responses:
   - Main benefit: cluster into themes. The most common theme is the core value prop.
   - Improvement requests: prioritize by frequency and alignment with HXC needs.
9. **Build the HXC profile** -- Describe the ideal customer based on the highest-PMF
   segment: who they are, what they value, and how they use the product.
10. **Compare to prior surveys** -- If previous PMF surveys exist, track the trend.
    Is PMF improving, stable, or declining?
11. **Formulate strategic recommendations** -- Based on findings:
    - Double down on the core value proposition for HXC.
    - Prioritize improvements requested by "Very disappointed" respondents.
    - Consider repositioning to attract more HXC-profile users.
12. **Document and present** -- Create the PMF analysis report and share with leadership.

## Deliverable
A PMF survey analysis report containing:
- PMF score (overall and by segment).
- High-Expectation Customer profile.
- Core value proposition (from qualitative analysis).
- Top improvement themes ranked by frequency.
- Trend comparison (if prior surveys exist).
- Strategic recommendations.

## Quality Gate
- [ ] Minimum 100 survey responses collected.
- [ ] Response rate is documented.
- [ ] PMF score is calculated correctly (% "Very disappointed").
- [ ] At least 3 segment breakdowns are analyzed.
- [ ] HXC profile is defined based on highest-PMF segment.
- [ ] Qualitative responses are coded into themes (minimum 5 themes).
- [ ] Recommendations reference the data directly.
- [ ] Report is shared with leadership team.

## Registry Update
- Record PMF score in `metric-registry` as a tracked metric with date.
- Log analysis in `analysis-registry` with survey ID and response count.
- Log task completion in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** sean-ellis owns this task end-to-end.
- **Supporting agents:** wes-kao contribute to their domain-specific steps.
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
- **Must-pass checklists:** `checklists/ellis/pmf-survey-quality.md`, `checklists/kao/messaging-to-metric-alignment.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/decision-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [ellis-pmf-framework](../../frameworks/ellis-pmf-framework.md), [kao-rigorous-thinking](../../frameworks/kao-rigorous-thinking.md)
- **Checklists:** [ellis/pmf-survey-quality](../../checklists/ellis/pmf-survey-quality.md), [kao/messaging-to-metric-alignment](../../checklists/kao/messaging-to-metric-alignment.md)
- **Workflows:** [pmf-analysis-workflow](../../workflows/pmf-analysis-workflow.md)
