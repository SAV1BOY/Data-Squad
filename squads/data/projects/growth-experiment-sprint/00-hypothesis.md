# Growth Experiment Sprint - Hypothesis Generation

## Phase Objective

Systematically generate high-quality experiment hypotheses by reviewing quantitative data, qualitative insights, and competitive intelligence. The goal is to produce a prioritized backlog of testable hypotheses that target the highest-leverage growth opportunities.

## Prerequisites

- Access to product analytics data (funnels, retention curves, feature usage)
- Access to user research findings (surveys, interviews, support tickets)
- Historical experiment results and learnings registry
- Understanding of the current growth model and key metrics
- Defined growth objective for this sprint (e.g., improve activation rate, reduce churn)

## Steps

1. **Review the Growth Model**: Map the current growth loop or funnel. Identify each stage (acquisition, activation, engagement, monetization, referral) and its conversion rate. Calculate the relative impact of improving each stage by 10%. This reveals where a percentage point improvement generates the most absolute value.

2. **Analyze Quantitative Data**: Pull funnel analysis, cohort retention curves, and feature adoption metrics. Look for drop-off points where large numbers of users fail to proceed. Examine segments that perform significantly better or worse than average. Identify time-based patterns such as day-of-week effects or seasonal trends that suggest timing-based interventions.

3. **Mine Qualitative Insights**: Review user interview transcripts, NPS verbatims, support ticket themes, and app store reviews. Categorize feedback into themes and map each theme to a funnel stage. Qualitative data reveals the "why" behind quantitative drop-offs and often surfaces opportunity areas that numbers alone cannot detect.

4. **Conduct Competitive Analysis**: Examine how competitors and adjacent products handle the same user journey stages. Document specific UX patterns, messaging approaches, pricing structures, and onboarding flows that differ from your product. Note which patterns appear across multiple successful products, as convergent evolution suggests effectiveness.

5. **Review Past Experiments**: Pull the full history of past experiments from the learnings registry. Identify patterns in what has worked and what has not. Look for experiments that showed directional but not statistically significant results, as these may warrant larger or refined follow-ups. Flag any winning experiments whose effects have decayed over time.

6. **Generate Hypotheses**: Using insights from the previous steps, write hypotheses in the structured format: "We believe that [change] for [audience] will result in [outcome] because [evidence/rationale]." Each hypothesis must specify what will change, who it affects, what metric will move, and why you believe the causal mechanism works. Generate at least 15-20 hypotheses per sprint.

7. **Prioritize Using ICE or RICE**: Score each hypothesis on Impact (how much the metric will move), Confidence (how strong the supporting evidence is), and Ease (how quickly it can be implemented). Rank hypotheses by composite score. Select the top 3-5 for this sprint, ensuring a mix of high-confidence incremental bets and lower-confidence high-upside bets.

8. **Validate Feasibility**: For each selected hypothesis, confirm with engineering that the proposed change is technically feasible within the sprint timeline. Identify any dependencies on other teams, data availability constraints, or compliance requirements that could block implementation.

## Deliverables

- Growth model map with conversion rates and impact analysis per stage
- Data review summary highlighting key drop-offs, segments, and patterns
- Qualitative insights synthesis mapped to funnel stages
- Hypothesis backlog with 15-20 structured hypotheses
- Prioritization scorecard with ICE/RICE scores and final ranking
- Sprint plan with the top 3-5 hypotheses selected for testing

## Quality Gate

Hypothesis generation is complete when all of the following conditions are met:

- Every selected hypothesis is written in the structured format with change, audience, outcome, and rationale
- Each hypothesis is supported by at least one quantitative and one qualitative data point
- Prioritization scores have been reviewed and validated by the growth team
- Engineering has confirmed feasibility for all selected hypotheses within the sprint timeline
- No selected hypothesis conflicts with ongoing experiments or recently shipped changes
- The hypothesis backlog contains at least 15 structured hypotheses for future sprint consideration
- The sprint plan identifies dependencies and risks for each selected hypothesis
- The sprint plan has been approved by the growth lead or product owner
- Each selected hypothesis has a designated owner responsible for driving it through the experiment lifecycle
- Competitive analysis findings are documented and available for reference in future sprint planning
- The growth model map has been updated with current conversion rates validated against recent data

## Next Phase

Proceed to **01-design.md** (Experiment Design) to define the experimental parameters, success metrics, audience targeting, and duration for each selected hypothesis. The prioritized hypothesis backlog and feasibility confirmations from this phase are inputs to the design process.
