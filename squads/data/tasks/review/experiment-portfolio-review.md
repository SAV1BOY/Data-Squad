# Task: Experiment Portfolio Review
> Agent(s): sean-ellis, data-chief
> Frameworks: experiment-framework, ellis-high-tempo-testing
> Checklists: experiment-design-quality, experiment-analysis-quality
> Templates: (none)
> Registry: experiment-registry, lessons-learned-registry

## Objective
Review the complete experiment portfolio to assess learning velocity, success rates, impact
generated, and process health, ensuring the experimentation program is delivering maximum
value and continuously improving.

## Prerequisites
- Experiment registry with historical experiment data.
- At least 10 completed experiments in the review period.
- Experiment results are documented with outcomes.
- Experimentation team capacity data is available.

## Steps
1. **Define the review period** -- Specify the time range (last quarter or last 6 months)
   and pull all experiments that were active or completed during that period.
2. **Summarize the portfolio** -- Calculate portfolio-level metrics:
   - Total experiments run.
   - Experiments completed vs. in-progress vs. killed early.
   - Average experiment duration.
   - Team capacity utilization (concurrent experiment slots used).
3. **Calculate success metrics** -- For completed experiments:
   - Win rate: % of experiments with statistically significant positive results.
   - Ship rate: % of experiments that were shipped to production.
   - Average effect size of shipped experiments.
   - Cumulative impact: total metric lift from all shipped experiments.
4. **Analyze learning velocity** -- Measure the pace of learning:
   - Experiments per month.
   - Time from hypothesis to result.
   - Number of unique hypotheses tested.
   - Insights generated per experiment (even from failed experiments).
5. **Review experiment quality** -- Assess the rigor of experiments:
   - Were hypotheses documented pre-launch?
   - Were power analyses conducted?
   - Were results analyzed per the pre-registered plan?
   - Were SRM checks performed?
   Score each experiment 1-5 on rigor.
6. **Analyze failure patterns** -- For experiments that did not win:
   - What types of hypotheses failed most often?
   - Were there common failure modes (wrong metric, insufficient power, etc.)?
   - What was learned from the failures?
7. **Review area coverage** -- Assess where experiments are run:
   - Which product areas have high experimentation coverage?
   - Which areas have low or no coverage?
   - Is experimentation aligned with strategic priorities?
8. **Calculate experiment ROI** -- Estimate the return on experimentation:
   - Total impact from shipped experiments (annualized revenue or metric lift).
   - Total cost of experimentation (team time, opportunity cost).
   - ROI = impact / cost.
9. **Identify process improvements** -- Based on the review, find:
   - Bottlenecks in the experiment pipeline.
   - Tools or infrastructure gaps.
   - Knowledge sharing gaps (are learnings being reused?).
10. **Update experimentation standards** -- Based on quality review findings,
    update the experiment design and analysis guidelines.
11. **Set goals for next period** -- Define targets:
    - Number of experiments.
    - Win rate target.
    - Coverage of strategic areas.
    - Process improvements to implement.
12. **Present findings** -- Share the portfolio review with leadership and the
    experimentation team.

## Deliverable
An experiment portfolio review report containing:
- Portfolio summary (count, duration, utilization).
- Success metrics (win rate, ship rate, effect sizes).
- Learning velocity assessment.
- Experiment quality scores.
- Failure pattern analysis.
- Area coverage map.
- Experiment ROI calculation.
- Process improvement recommendations.
- Goals for the next period.

## Quality Gate
- [ ] All experiments in the period are included in the review.
- [ ] Win rate and ship rate are calculated.
- [ ] At least 3 learning velocity metrics are reported.
- [ ] Experiment quality is scored (rigor assessment).
- [ ] Failure patterns are analyzed.
- [ ] Area coverage is mapped against strategic priorities.
- [ ] Experiment ROI is estimated.
- [ ] Goals for the next period are set.

## Registry Update
- Verify `experiment-registry` is current (all experiments have final status).
- Add portfolio review summary to `analysis-registry`.
- Log task completion in `task-log` with portfolio metrics.
