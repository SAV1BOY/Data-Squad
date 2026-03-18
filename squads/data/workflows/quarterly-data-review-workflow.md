# Quarterly Data Review Workflow

## Purpose
Conduct a comprehensive quarterly review of the data squad's performance, key metric trends, and strategic alignment to produce actionable priorities and an execution plan for the next quarter.

## Trigger
- End of each fiscal quarter (scheduled)
- Major strategic pivot that requires mid-quarter review

## Agents Involved
- **data-chief**: Leads the strategic review and priority setting
- **avinash-kaushik**: Prepares metric trend analysis and infrastructure review
- **wes-kao**: Synthesizes findings and facilitates the review meetings
- **avinash-kaushik**: Reports on data quality trends and SLA performance
- **sean-ellis**: Reviews experiment portfolio and learnings

## Steps

### Phase 1: Review Preparation (Week 1)
1. **avinash-kaushik** compiles metric performance: North Star, input metrics, and supporting metrics vs. targets.
2. **avinash-kaushik** produces the quarterly data quality report: SLA adherence, issues resolved, persistent problems.
3. **sean-ellis** summarizes the experiment portfolio: tests run, win rate, cumulative impact, key learnings.
4. **avinash-kaushik** reviews infrastructure health: pipeline reliability, query performance, cost trends.
5. **wes-kao** gathers feedback from stakeholders across squads: satisfaction surveys, request volume, and common pain points.

### Phase 2: Insight Synthesis (Week 2)
6. **wes-kao** identifies the top 5 insights from the quarter: what surprised us, what confirmed our hypotheses, what changed.
7. **data-chief** evaluates strategic progress: are we moving toward our annual goals? Where are we ahead or behind?
8. **avinash-kaushik** identifies technical debt and infrastructure gaps that affected delivery quality or speed.
9. **sean-ellis** distills the meta-learnings: what themes emerge from the experiment results? Where should we invest next?
10. **wes-kao** compiles a draft quarterly review document.

### Phase 3: Priority Setting (Week 3)
11. **data-chief** proposes next-quarter priorities based on: metric gaps, strategic alignment, stakeholder feedback, and technical debt.
12. **data-chief** ranks priorities using weighted scoring: business impact (40%), feasibility (30%), urgency (20%), learning value (10%).
13. **avinash-kaushik** estimates capacity requirements for each priority and identifies resource constraints.
14. **data-chief** makes trade-off decisions: what we will do, what we will not do, and what we will deprioritize.

### Phase 4: Plan Creation (Week 3-4)
15. **data-chief** creates the quarterly plan: priorities, owners, milestones, dependencies, and success criteria.
16. **avinash-kaushik** defines the technical roadmap: infrastructure improvements, new data sources, pipeline upgrades.
17. **sean-ellis** builds the experiment backlog for the quarter with prioritized hypotheses.
18. **avinash-kaushik** sets data quality targets and monitoring improvements for the quarter.
19. **wes-kao** prepares the quarterly review presentation for leadership.

### Phase 5: Communicate and Execute (Week 4)
20. **wes-kao** presents the quarterly review to the data squad and collects team input.
21. **wes-kao** presents the review and plan to leadership for alignment and resource approval.
22. **data-chief** finalizes the plan incorporating feedback and publishes it as the quarterly commitment.
23. **avinash-kaushik** updates all registry entries to reflect new quarter priorities and targets.

## Inputs
- Metric performance data for the quarter
- Data quality SLA reports
- Experiment results and portfolio summary
- Stakeholder feedback surveys
- Infrastructure health metrics
- Annual strategic goals

## Outputs
- Quarterly review document with insights and performance analysis
- Prioritized plan for next quarter with owners and milestones
- Experiment backlog for the quarter
- Data quality targets and improvement plan
- Leadership presentation and alignment record

## Quality Gates

| Gate | Criteria | Owner |
|------|----------|-------|
| G1: Data Complete | All metric, quality, and experiment data compiled before synthesis | avinash-kaushik |
| G2: Insights Validated | Top 5 insights reviewed by at least 2 agents for accuracy | wes-kao |
| G3: Priorities Scored | Every priority has a weighted score and explicit trade-off rationale | data-chief |
| G4: Plan Feasible | Capacity estimates confirm the plan is achievable with current resources | avinash-kaushik |
| G5: Leadership Aligned | Plan presented and approved by leadership | wes-kao |

## Registry Updates
- **Priority Registry**: Update with new quarter priorities, owners, and success criteria.
- **Metric Registry**: Adjust targets based on quarterly performance and strategy changes.
- **Experiment Registry**: Populate with new quarter experiment backlog.
- **Capacity Log**: Record planned vs. actual hours for the completed quarter and planned allocation for next quarter.
- **Change Log**: Document all priority changes, deprioritizations, and rationale.
