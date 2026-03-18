# Experiment Portfolio Review Workflow

## Purpose
Review the full experiment portfolio to assess backlog health, consolidate results, extract cross-experiment learnings, and rebalance investment across experiment categories for maximum impact.

## Trigger
- Monthly experiment portfolio review cadence
- Experiment win rate drops below target threshold
- Quarterly planning requires experiment backlog prioritization
- Resource allocation decisions need experiment ROI data

## Agents Involved
- **sean-ellis**: Leads the review and rebalancing decisions
- **avinash-kaushik**: Provides data on experiment results and portfolio metrics
- **data-chief**: Ensures alignment with strategic priorities
- **wes-kao**: Communicates portfolio insights and learnings

## Steps

### Phase 1: Backlog Health Assessment (Days 1-2)
1. **sean-ellis** reviews the full backlog: total experiments proposed, in progress, completed, and stale (no action > 30 days).
2. **sean-ellis** removes stale experiments: if the hypothesis is no longer relevant, archive it with a reason.
3. **sean-ellis** categorizes active backlog by type: growth, retention, activation, monetization, UX, and infrastructure.
4. **avinash-kaushik** checks resource utilization: what percentage of experiment capacity was used vs. available?

### Phase 2: Results Consolidation (Days 2-4)
5. **avinash-kaushik** compiles results for all experiments completed since the last review: effect sizes, confidence intervals, and decisions.
6. **sean-ellis** calculates portfolio metrics: win rate (% of experiments with positive results), average effect size, and time-to-decision.
7. **sean-ellis** identifies high-impact wins and notable failures: what worked and what did not?
8. **avinash-kaushik** estimates the cumulative impact of shipped experiments on key metrics.

### Phase 3: Learning Extraction (Days 4-6)
9. **sean-ellis** identifies cross-experiment themes: what patterns emerge across wins and losses?
10. **sean-ellis** documents the meta-learnings: which types of changes tend to work? Which hypotheses were consistently wrong?
11. **wes-kao** synthesizes the learnings into a "What We Know Now" brief for the broader team.
12. **sean-ellis** updates the hypothesis generation framework based on learnings: what should we test more of, and what should we avoid?

### Phase 4: Rebalancing (Days 6-8)
13. **sean-ellis** evaluates category allocation: is the experiment portfolio balanced across growth, retention, activation, and monetization?
14. **data-chief** reviews allocation against strategic priorities: does the portfolio reflect where the business needs to invest?
15. **sean-ellis** proposes rebalancing: shift experiment capacity toward underinvested high-priority categories.
16. **sean-ellis** reprioritizes the backlog using updated ICE scores informed by learnings.
17. **sean-ellis** identifies the top 5 experiments for the next cycle with clear owners and timelines.
18. **wes-kao** presents the portfolio review to the data squad and relevant stakeholders.

## Inputs
- Experiment registry with all active and completed experiments
- Experiment results data (effect sizes, p-values, decisions)
- Resource capacity data
- Strategic priorities for the current period

## Outputs
- Portfolio health report: backlog size, status distribution, stale experiments removed
- Results summary: win rate, average effect size, cumulative impact
- Meta-learnings brief: cross-experiment themes and updated hypothesis framework
- Rebalanced backlog with top 5 next experiments
- Portfolio review presentation

## Quality Gates

| Gate | Criteria | Owner |
|------|----------|-------|
| G1: Backlog Clean | All stale experiments archived with documented rationale | sean-ellis |
| G2: Results Complete | Every completed experiment has documented results and decision | sean-ellis |
| G3: Learnings Documented | At least 3 cross-experiment meta-learnings identified and recorded | sean-ellis |
| G4: Portfolio Balanced | Category allocation reviewed against strategic priorities and adjusted | data-chief |
| G5: Next Cycle Planned | Top 5 experiments for next cycle identified with owners and timelines | sean-ellis |

## Registry Updates
- **Experiment Registry**: Update status for all experiments reviewed, archive stale entries, add new prioritized experiments.
- **Knowledge Base**: Add meta-learnings and update the hypothesis generation framework.
- **Capacity Log**: Record experiment capacity utilization and planned allocation for next cycle.
- **Change Log**: Document rebalancing decisions and rationale.

## Portfolio Health Benchmarks
| Metric | Healthy | Warning | Critical |
|--------|---------|---------|----------|
| Win rate | > 30% | 20-30% | < 20% |
| Backlog staleness | < 10% stale | 10-25% stale | > 25% stale |
| Time-to-decision | < 4 weeks avg | 4-6 weeks | > 6 weeks |
| Category coverage | All 4 categories | 3 categories | < 3 categories |
