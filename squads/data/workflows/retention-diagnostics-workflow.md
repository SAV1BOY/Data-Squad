# Retention Diagnostics Workflow

## Purpose
Diagnose retention issues systematically by moving from early signals through cohort analysis to root-cause identification, intervention design, and impact measurement.

## Trigger
- North Star or retention metric drops below threshold for two consecutive periods
- Product launch shows lower-than-expected retention curves
- Executive review flags retention as a concern
- Churn investigation reveals a systemic pattern

## Agents Involved
- **peter-fader**: Leads the diagnostic process and designs interventions
- **avinash-kaushik**: Builds cohort models and provides data infrastructure
- **sean-ellis**: Designs tests for proposed interventions
- **wes-kao**: Communicates findings and recommendations

## Steps

### Phase 1: Signal Detection (Days 1-2)
1. **peter-fader** reviews the retention dashboard and identifies which cohorts, timeframes, or segments show degradation.
2. **avinash-kaushik** pulls retention curves (D1, D7, D14, D30, D60, D90) for affected segments and compares to historical baselines.
3. **peter-fader** categorizes the signal: is it new-user retention, mature-user retention, or reactivation failure?
4. **peter-fader** establishes the investigation scope and timeline.

### Phase 2: Cohort Deep-Dive (Days 3-6)
5. **avinash-kaushik** builds cohort segmentations by: acquisition channel, activation status, feature usage, geography, and platform.
6. **peter-fader** identifies which cohorts diverge most from healthy baselines.
7. **avinash-kaushik** runs survival analysis to pinpoint the critical drop-off windows.
8. **peter-fader** maps the user journey for churning cohorts: what do they do (and not do) before leaving?
9. **avinash-kaushik** compares feature usage patterns of retained vs. churned users within each cohort.

### Phase 3: Driver Identification (Days 7-9)
10. **peter-fader** synthesizes quantitative findings into a ranked list of retention drivers and detractors.
11. **peter-fader** cross-references with qualitative data: support tickets, NPS verbatims, churn surveys.
12. **peter-fader** identifies the top 3 addressable drivers with the highest expected impact.
13. **wes-kao** documents the causal model: what we believe causes the retention gap and why.

### Phase 4: Intervention Design (Days 10-13)
14. **peter-fader** proposes interventions for each driver: product changes, onboarding improvements, re-engagement campaigns.
15. **sean-ellis** designs an experiment for the highest-priority intervention.
16. **peter-fader** defines the expected impact: "If we fix X, we expect D30 retention to improve by Y%."
17. **wes-kao** prepares the recommendation deck for stakeholder alignment.

### Phase 5: Measure Impact (Ongoing)
18. **sean-ellis** launches the intervention experiment following the experiment-cycle-workflow.
19. **peter-fader** monitors retention curves for the treated cohort weekly.
20. **avinash-kaushik** builds a retention impact model comparing projected vs. actual curves.
21. **peter-fader** evaluates whether the intervention moved the needle and documents the outcome.
22. **wes-kao** publishes the retention diagnostic report with results and next steps.

## Inputs
- Retention dashboards and historical baselines
- User-level event data for cohort analysis
- Qualitative feedback (NPS, support tickets, surveys)
- Feature usage logs

## Outputs
- Signal detection summary with affected segments
- Cohort analysis with retention curves by segment
- Ranked list of retention drivers and detractors
- Intervention proposals with expected impact
- Post-intervention impact report

## Quality Gates

| Gate | Criteria | Owner |
|------|----------|-------|
| G1: Signal Confirmed | Retention drop validated across at least 2 independent data sources | peter-fader |
| G2: Cohorts Defined | At least 5 meaningful segmentations analyzed | avinash-kaushik |
| G3: Drivers Ranked | Top 3 drivers identified with supporting data | peter-fader |
| G4: Intervention Testable | Each intervention has a measurable hypothesis and experiment design | sean-ellis |
| G5: Impact Measured | Post-intervention retention measured for at least one full retention cycle | peter-fader |

## Registry Updates
- **Metric Registry**: Update retention metric definitions if the diagnostic reveals measurement issues.
- **Insight Registry**: Record the causal model, drivers, and intervention outcomes.
- **Experiment Registry**: Log any experiments run as part of the intervention.
- **Playbook Library**: Add successful interventions as reusable playbooks for future retention issues.
