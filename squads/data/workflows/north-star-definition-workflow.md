# North Star Metric Definition Workflow

## Purpose
Define, validate, and instrument the North Star metric through rigorous research, hypothesis testing, organizational alignment, and ongoing monitoring to ensure the company optimizes for the right outcome.

## Trigger
- Company does not have a defined North Star metric
- Strategic pivot requires reevaluation of the current North Star
- Current North Star no longer correlates with business outcomes
- Annual strategic planning cycle

## Agents Involved
- **avinash-kaushik**: Leads quantitative research and instrumentation
- **sean-ellis**: Validates correlation with retention and long-term value
- **sean-ellis**: Tests causal relationships between candidate metrics and outcomes
- **wes-kao**: Facilitates alignment and communicates the rationale

## Steps

### Phase 1: Research (Days 1-7)
1. **avinash-kaushik** catalogs all candidate metrics currently tracked: engagement, revenue, retention, activation, and growth metrics.
2. **avinash-kaushik** runs correlation analysis between each candidate and long-term business outcomes (12-month revenue, retention, growth).
3. **sean-ellis** evaluates each candidate against North Star criteria: measurable, actionable, reflects customer value, leading indicator, and understandable by all teams.
4. **avinash-kaushik** produces a candidate scorecard ranking metrics on each criterion.

### Phase 2: Hypothesize (Days 8-10)
5. **sean-ellis** formulates hypotheses for the top 3 candidates: "If we improve Metric X by Y%, we expect Z% improvement in long-term outcome."
6. **avinash-kaushik** tests each hypothesis with historical data: does improving the candidate predict future business improvement?
7. **sean-ellis** identifies natural experiments or quasi-experiments that can provide causal evidence.
8. **avinash-kaushik** documents the evidence for and against each candidate.

### Phase 3: Align (Days 11-15)
9. **wes-kao** prepares the North Star proposal: top candidate, supporting evidence, how it connects to company mission.
10. **wes-kao** presents the proposal to department leaders for input and objections.
11. **wes-kao** facilitates a cross-functional workshop to pressure-test the candidate: can every team influence it? Does it avoid Goodhart's Law traps?
12. **sean-ellis** addresses objections and incorporates feedback into the final recommendation.
13. **wes-kao** obtains formal sign-off from the executive team.

### Phase 4: Define (Days 16-18)
14. **avinash-kaushik** writes the formal metric definition: calculation formula, data sources, filters, edge cases, and update frequency.
15. **avinash-kaushik** defines the input metrics tree: which sub-metrics feed into the North Star.
16. **sean-ellis** sets the initial target and defines the cadence for target review.
17. **avinash-kaushik** registers the North Star in the metric registry with full documentation.

### Phase 5: Instrument (Days 19-23)
18. **avinash-kaushik** builds the data pipeline to compute the North Star metric reliably.
19. **avinash-kaushik** creates the North Star dashboard with the input metrics tree, trends, and segment breakdowns.
20. **avinash-kaushik** validates the pipeline output against manual calculations.
21. **avinash-kaushik** configures automated alerts for significant changes in the North Star or its inputs.

### Phase 6: Monitor (Ongoing)
22. **sean-ellis** reviews the North Star weekly and its correlation with business outcomes monthly.
23. **avinash-kaushik** monitors for metric degradation: gaming, drift, or decoupling from business outcomes.
24. **sean-ellis** triggers a full reevaluation if the North Star stops predicting business outcomes for two consecutive quarters.

## Inputs
- Full metric catalog with historical data
- Business outcome data (revenue, retention, growth)
- Company mission and strategic priorities
- Stakeholder input from all departments

## Outputs
- Candidate metric scorecard with evidence
- North Star proposal with supporting analysis
- Formal metric definition in the registry
- North Star dashboard with input metrics tree
- Monitoring and alerting configuration

## Quality Gates

| Gate | Criteria | Owner |
|------|----------|-------|
| G1: Evidence-Based | Top candidate supported by correlation and historical causal evidence | avinash-kaushik |
| G2: Criteria Met | Candidate passes all 5 North Star criteria (measurable, actionable, customer-centric, leading, understandable) | sean-ellis |
| G3: Cross-Functional Buy-In | All department leads confirm they can influence the metric | wes-kao |
| G4: Definition Rigorous | Formal definition includes formula, sources, filters, edge cases | avinash-kaushik |
| G5: Pipeline Validated | Automated computation matches manual calculation within 0.1% | avinash-kaushik |

## Registry Updates
- **Metric Registry**: North Star metric registered with full definition, owner, computation pipeline, and target.
- **Dashboard Registry**: North Star dashboard registered with input metrics tree.
- **Decision Log**: Record the selection process, candidates considered, evidence, and final rationale.
- **Change Log**: If replacing a previous North Star, document the transition plan and sunset timeline.
