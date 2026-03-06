# Task: Renewal Risk Analysis
> Agent(s): Customer Success Analyst, Data Analyst
> Frameworks: Renewal Risk Framework, Predictive Risk Scoring
> Checklists: renewal-risk-checklist, analysis-rigor-checklist
> Template: renewal-risk-template
> Registry: analysis-registry, metric-registry

## Objective
Assess renewal risk for upcoming customer renewals by combining quantitative signals and
qualitative factors into a risk rating, enabling the CS team to focus retention efforts on
the highest-risk, highest-value accounts.

## Prerequisites
- Renewal dates are tracked in the CRM or billing system.
- Customer health score is available (see cs-health-score-design).
- Usage and engagement data is current.
- Minimum 90-day lookahead of upcoming renewals.

## Steps
1. **Pull the renewal pipeline** -- Extract all accounts with renewals in the next 90 days.
   Include: account name, renewal date, contract value (ARR/MRR), contract length,
   CSM assignment.
2. **Attach quantitative signals** -- For each account, pull:
   - Health score (current and 30-day trend).
   - Product usage metrics (login frequency, feature adoption, last active date).
   - Support ticket volume and sentiment.
   - NPS/CSAT score (if available).
   - Payment history (failed payments, late payments).
3. **Attach qualitative signals** -- Have CSMs assess:
   - Champion status (active, departed, unknown).
   - Executive sponsor engagement (strong, weak, none).
   - Competitive threat (aware of competitors, actively evaluating).
   - Organizational changes (layoffs, restructuring, acquisition).
   - Stated renewal intent (committed, uncertain, at risk).
4. **Score renewal risk** -- Combine signals into a risk rating:
   - Low risk: healthy usage, active champion, stated intent to renew.
   - Medium risk: declining usage or some qualitative concerns.
   - High risk: low health score, champion departed, or stated risk.
   - Critical risk: multiple high-risk signals, actively evaluating alternatives.
5. **Prioritize by value-at-risk** -- Calculate: Value at Risk = Contract Value x Risk
   Probability. Sort accounts by value-at-risk descending. This is the prioritized
   action list for the CS team.
6. **Analyze risk patterns** -- Across the renewal portfolio:
   - What % of renewals are at risk by contract value?
   - What are the most common risk factors?
   - Which customer segments have the highest risk rates?
7. **Forecast renewal outcomes** -- Based on risk ratings, project:
   - Expected gross retention rate.
   - Expected revenue retained vs. at-risk.
   - Best case, expected case, and worst case scenarios.
8. **Define intervention plans** -- For each high-risk and critical account:
   - Specific actions to mitigate risk (executive outreach, success plan, discount offer).
   - Owner and deadline for each action.
   - Escalation path if intervention fails.
9. **Track intervention effectiveness** -- Create a tracker for at-risk accounts:
   - Intervention performed (yes/no and type).
   - Outcome (renewed, churned, downgraded).
   - Calculate save rate: % of at-risk accounts that renewed after intervention.
10. **Review cadence** -- Establish a weekly renewal risk review meeting with CS leadership
    to review the pipeline, update risk ratings, and track interventions.
11. **Document and present** -- Create the renewal risk report for the current quarter.

## Deliverable
A renewal risk analysis package containing:
- Renewal pipeline with risk ratings and value-at-risk.
- Risk factor analysis (most common risk drivers).
- Renewal forecast (best/expected/worst case).
- Intervention plans for high-risk accounts.
- Save rate tracking dashboard.
- Weekly review cadence documentation.

## Quality Gate
- [ ] All upcoming renewals (90-day window) are included.
- [ ] Both quantitative and qualitative signals are incorporated.
- [ ] Risk ratings are assigned to every account.
- [ ] Value-at-risk is calculated and accounts are prioritized.
- [ ] Intervention plans exist for all high-risk and critical accounts.
- [ ] Renewal forecast includes scenario analysis.
- [ ] Weekly review cadence is established.
- [ ] Report is shared with CS and finance leadership.

## Registry Update
- Update renewal risk ratings in CRM or CS platform.
- Track save rate as a metric in `metric-registry`.
- Log analysis in `analysis-registry`.
- Log task completion in `task-log`.
