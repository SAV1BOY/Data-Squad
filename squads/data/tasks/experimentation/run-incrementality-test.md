# Task: Run Incrementality Test
> Agent(s): sean-ellis, data-chief
> Frameworks: experiment-framework, bayesian-vs-frequentist-testing
> Checklists: experiment-design-quality, experiment-analysis-quality
> Templates: outputs/experiment-analysis
> Registry: experiment-registry, decision-registry

## Objective
Measure the true incremental impact of a marketing channel, campaign, or feature by isolating
its causal contribution from organic behavior, avoiding attribution model biases.

## Prerequisites
- Channel or initiative to test is identified and measurable.
- Sufficient scale for statistical power (minimum 10,000 exposed users or 20 geo regions).
- Ability to withhold treatment from a control group (holdout or geo-split).
- Historical baseline data for the target metric (minimum 8 weeks).
- Stakeholder alignment that a holdout is acceptable.

## Steps
1. **Define the treatment** -- Precisely describe what is being tested: a marketing channel
   (paid search, display, email), a campaign, or a product feature.
2. **Choose the test design** -- Select the appropriate methodology:
   - User-level holdout: randomly withhold treatment from X% of eligible users.
   - Geo-based test: select matched treatment and control geographic regions.
   - Time-based on/off: alternating periods of treatment and no treatment.
   Document tradeoffs and rationale for the chosen design.
3. **Select metrics** -- Define:
   - Primary: the metric expected to be incrementally driven (conversions, revenue).
   - Secondary: upstream and downstream metrics.
   - Cost metric: spend or effort associated with the treatment.
4. **Power analysis** -- Calculate required sample size or number of geo regions.
   For geo tests, ensure minimum 5 regions per group. For user holdouts, run standard
   power analysis with expected lift.
5. **Set up test and control groups** -- Implement the randomization or geo-matching:
   - For user holdouts: use the experimentation platform to create groups.
   - For geo tests: match regions on pre-period metric values using synthetic control
     or propensity matching. Validate balance on key covariates.
6. **Run pre-period validation** -- Before activating treatment, run the test framework on
   pre-period data to confirm no pre-existing differences between groups (placebo test).
7. **Activate the test** -- Start the treatment for the test group while withholding from
   the control group. Run for the pre-determined duration.
8. **Monitor during test** -- Check daily for:
   - Data quality issues.
   - Group balance drift.
   - External confounders.
9. **Analyze results** -- After the test period:
   a. Calculate the incremental lift: (treatment outcome - control outcome).
   b. Calculate confidence intervals for the lift.
   c. Calculate iROAS (incremental Return on Ad Spend) if applicable.
   d. Test for statistical significance.
10. **Estimate incrementality rate** -- Calculate: incremental conversions / total
    attributed conversions. This reveals how much of attributed activity is truly
    incremental vs. would have happened organically.
11. **Translate to business impact** -- Calculate annualized incremental value and compare
    to the cost of the treatment. Compute incremental ROI.
12. **Document and recommend** -- Write the report with findings and recommendation:
    scale up, scale down, optimize, or stop.

## Deliverable
An incrementality test report containing:
- Test design and methodology.
- Group balance validation (pre-period and during test).
- Incremental lift with confidence intervals.
- Incrementality rate (incremental / attributed).
- iROAS and incremental ROI calculations.
- Recommendation (scale, optimize, or stop).

## Quality Gate
- [ ] Test design is documented with rationale for methodology choice.
- [ ] Pre-period validation shows no significant pre-existing differences.
- [ ] Test ran for the full pre-determined duration.
- [ ] Incremental lift is calculated with confidence intervals.
- [ ] Incrementality rate is calculated.
- [ ] iROAS or ROI is computed.
- [ ] Results are statistically significant or power limitations are noted.
- [ ] Recommendation includes clear next steps.

## Registry Update
- Log experiment in `experiment-registry` with type `incrementality`.
- Record incrementality rate for the channel/campaign.
- Log task completion in `task-log` with test ID and business impact.
