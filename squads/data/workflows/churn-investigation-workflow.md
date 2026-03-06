# Churn Investigation Workflow

## Purpose
Investigate churn signals rapidly by diagnosing root causes, segmenting affected users into cohorts, designing targeted interventions, and measuring the impact of those interventions on reducing churn.

## Trigger
- Churn rate exceeds threshold for two consecutive measurement periods
- Customer health early warning system generates a cluster of Critical alerts
- Major product change coincides with retention decline
- Executive or board requests a churn deep-dive

## Agents Involved
- **Retention Strategist**: Leads the investigation and designs interventions
- **Analytics Architect**: Performs quantitative analysis and cohort modeling
- **Experiment Strategist**: Designs intervention experiments
- **Insight Narrator**: Communicates findings and facilitates decision-making

## Steps

### Phase 1: Signal Characterization (Days 1-2)
1. **Retention Strategist** confirms the churn signal: is the increase real or an artifact of measurement changes?
2. **Analytics Architect** quantifies the churn increase: magnitude, timing, and affected customer base size.
3. **Analytics Architect** checks for confounding factors: seasonality, pricing changes, competitor launches, data pipeline issues.
4. **Retention Strategist** determines the urgency level: Critical (>2x baseline), High (1.5x baseline), or Moderate (<1.5x baseline).

### Phase 2: Diagnostic Analysis (Days 3-6)
5. **Analytics Architect** segments churned users by: tenure, plan type, usage pattern, acquisition channel, geography, and company size.
6. **Analytics Architect** compares the behavioral trail of churned users vs. retained users in the same cohort.
7. **Analytics Architect** identifies the leading indicators: which behavioral changes preceded churn by 2-4 weeks?
8. **Retention Strategist** cross-references with qualitative signals: churn survey responses, cancellation reasons, support ticket themes.
9. **Retention Strategist** builds a root cause tree: categorize causes as product (missing feature, bug, performance), value (price vs. value perception), competitive (switched to alternative), or circumstantial (budget cut, team change).

### Phase 3: Cohort Definition (Days 7-8)
10. **Retention Strategist** defines the at-risk cohort: users who show the same leading indicators but have not yet churned.
11. **Analytics Architect** sizes the at-risk cohort and estimates the revenue impact if they churn.
12. **Analytics Architect** profiles the at-risk cohort: what do they have in common, and how do they differ from healthy users?
13. **Retention Strategist** prioritizes cohort segments for intervention based on revenue impact and intervention feasibility.

### Phase 4: Intervention Design (Days 9-12)
14. **Retention Strategist** designs targeted interventions for each priority cohort segment: product fixes, proactive outreach, pricing adjustments, onboarding improvements, or feature education.
15. **Experiment Strategist** selects the highest-impact intervention and designs a controlled test.
16. **Experiment Strategist** defines success metrics: reduction in churn probability, increase in engagement, or NPS improvement.
17. **Insight Narrator** documents the investigation findings and intervention plan for stakeholder review.

### Phase 5: Measure Impact (30-90 days post-intervention)
18. **Experiment Strategist** launches the intervention experiment following the experiment-cycle-workflow.
19. **Analytics Architect** monitors the at-risk cohort weekly: are the leading indicators improving?
20. **Retention Strategist** evaluates the intervention after one full churn cycle: did it reduce churn for the targeted cohort?
21. **Insight Narrator** publishes the investigation report: root causes found, interventions tested, results achieved.
22. **Retention Strategist** feeds successful interventions into the standard retention playbook library.

## Inputs
- Churn data (cancellations, downgrades, inactivity)
- User behavioral data for churned and retained users
- Qualitative data (churn surveys, support tickets, NPS)
- Customer health scores
- Revenue and contract data

## Outputs
- Churn signal characterization with urgency level
- Root cause analysis with categorized drivers
- At-risk cohort definition with revenue impact estimate
- Intervention plan with experiment design
- Impact report with results and playbook updates

## Quality Gates

| Gate | Criteria | Owner |
|------|----------|-------|
| G1: Signal Validated | Churn increase confirmed as real, not measurement artifact | Analytics Architect |
| G2: Root Causes Identified | At least 2 root causes identified with supporting quantitative and qualitative evidence | Retention Strategist |
| G3: Cohort Sized | At-risk cohort defined, sized, and revenue impact estimated | Analytics Architect |
| G4: Intervention Designed | Top intervention has a controlled experiment design with success metrics | Experiment Strategist |
| G5: Impact Measured | Intervention outcome measured after one full churn cycle | Retention Strategist |

## Registry Updates
- **Churn Investigation Log**: Record investigation dates, root causes, cohorts, interventions, and outcomes.
- **Retention Playbook Library**: Add successful interventions as reusable playbooks.
- **Metric Registry**: Update churn metric definitions if measurement issues were discovered.
- **Health Score Model**: Incorporate newly identified leading indicators into the health scoring model.
