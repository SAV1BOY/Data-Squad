# Data Storytelling Workflow

## Purpose
Transform raw data findings into compelling narratives that drive decisions. Move from numbers to insight to story to action, ensuring every presentation of data leads to a clear recommendation.

## Trigger
- Analysis is complete and needs to be communicated to stakeholders
- Quarterly or monthly business review requires data narrative
- Experiment results need to be translated into a business decision
- Cross-squad presentation of data findings

## Agents Involved
- **wes-kao**: Leads the storytelling process from data to decision
- **avinash-kaushik**: Provides data accuracy assurance and technical context
- **data-chief**: Ensures narrative aligns with strategic priorities
- **avinash-kaushik**: Validates all numbers before they enter the narrative

## Steps

### Phase 1: Data Foundation (Days 1-2)
1. **avinash-kaushik** confirms all data used in the narrative is accurate, current, and reproducible.
2. **avinash-kaushik** runs validation checks on key numbers: cross-references with source systems.
3. **wes-kao** organizes the data into categories: context data (background), evidence data (findings), and impact data (so what).
4. **wes-kao** identifies the single most important finding that the audience must remember.

### Phase 2: Insight Extraction (Days 2-3)
5. **wes-kao** distinguishes between observations (what the data shows) and insights (what the data means).
6. **wes-kao** applies the "so what" test to each finding: if the audience says "so what?", the insight is not sharp enough.
7. **data-chief** validates that the insights connect to business outcomes the audience cares about.
8. **wes-kao** ranks insights by importance: lead with the most consequential finding, not the most interesting one.

### Phase 3: Narrative Construction (Days 3-5)
9. **wes-kao** chooses the narrative structure: situation-complication-resolution, before/after, or problem-cause-solution.
10. **wes-kao** writes the narrative arc: opening hook (why this matters now), evidence (what we found), interpretation (what it means), and call to action (what to do).
11. **wes-kao** selects visualizations that support each narrative point: choose the chart that makes the insight self-evident.
12. **wes-kao** removes everything that does not serve the narrative: no background charts, no tangential findings, no hedge-filled appendices in the main flow.
13. **wes-kao** writes the executive summary: the entire story in 3 sentences.

### Phase 4: Present and Decide (Days 5-7)
14. **wes-kao** rehearses the presentation with the avinash-kaushik to catch any technical inaccuracies.
15. **data-chief** reviews the recommendation for feasibility and strategic alignment.
16. **wes-kao** presents to the stakeholder audience with a clear ask: approve the recommendation, provide resources, or make a specific decision.
17. **wes-kao** facilitates the discussion: captures objections, answers questions with data, and drives toward a decision.
18. **wes-kao** documents the decision made, including any conditions or follow-up actions.

### Phase 5: Decision Follow-Through (Post-presentation)
19. **wes-kao** distributes the narrative document with the recorded decision to all attendees and stakeholders.
20. **data-chief** ensures the decision is translated into concrete next steps with owners and deadlines.
21. **wes-kao** logs the narrative, decision, and follow-up actions in the knowledge base.
22. **wes-kao** schedules a check-in to review whether the decision was implemented and what resulted.

## Inputs
- Completed analysis with validated data
- Audience profile: who they are, what they care about, what decisions they can make
- Strategic context and current priorities
- Previous narratives on related topics (for continuity)

## Outputs
- Executive summary (3 sentences)
- Narrative document with visualizations and recommendation
- Presentation materials
- Decision record with follow-up actions
- Knowledge base entry

## Quality Gates

| Gate | Criteria | Owner |
|------|----------|-------|
| G1: Numbers Verified | Every number in the narrative independently validated | avinash-kaushik |
| G2: Insight Sharp | Every finding passes the "so what" test | wes-kao |
| G3: Narrative Focused | Presentation contains no tangential findings or unsupported claims | wes-kao |
| G4: Recommendation Clear | Specific, actionable recommendation with expected outcome stated | data-chief |
| G5: Decision Documented | Decision recorded with rationale, conditions, and follow-up actions | wes-kao |

## Registry Updates
- **Knowledge Base**: Store the narrative, insights, decision, and outcome for institutional memory.
- **Decision Log**: Record the decision, who made it, conditions, and expected review date.
- **Presentation Library**: Archive the narrative materials for reuse and reference.
- **Metric Registry**: Note any metrics that featured in the narrative for usage tracking.

## Storytelling Anti-Patterns
- Leading with methodology instead of the finding.
- Showing all the data instead of curating the evidence.
- Presenting findings without a recommendation.
- Using complex charts when a simple number would suffice.
- Burying the key insight on slide 15.
