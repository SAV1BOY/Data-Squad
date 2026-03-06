# A/B Test Launch Quality Checklist

> Gate type: Pre-delivery
> Owner: Ellis (Growth / Experimentation Lead)
> Applies to: Any A/B test, multivariate test, or feature-flag experiment before it begins collecting data

## Purpose

A poorly launched experiment wastes the entire test duration. If randomization is broken, the control is contaminated, or the duration is too short, the results will be uninterpretable -- and you will only discover this weeks later during analysis. This gate catches launch defects before a single user is assigned, saving weeks of wasted traffic and delayed decisions.

## Checklist Items

1. - [ ] **Experiment brief approved** -- A written brief exists with hypothesis, primary metric, secondary metrics, guardrails, and success criteria, and it has been reviewed by at least one other person.
   - Pass criteria: Brief is in the experiment tracker, reviewed and approved before launch.
   - Fail signal: The experiment is being launched based on a Slack message or verbal agreement with no written brief.
   - Action if fail: Write and get approval on the brief before launching. No exceptions.

2. - [ ] **Randomization unit defined and consistent** -- The unit of randomization (user, session, device, account) is explicitly chosen and is consistent with the analysis unit.
   - Pass criteria: Randomization unit documented; it matches the unit used in the primary metric calculation.
   - Fail signal: Randomized by session but analyzing by user, or randomization unit not stated.
   - Action if fail: Align randomization and analysis units. If they must differ, document the statistical implications.

3. - [ ] **Assignment mechanism verified** -- The technical implementation of random assignment has been tested to confirm even splits and deterministic bucketing.
   - Pass criteria: A dry-run or pre-launch audit shows variant assignment is within 1% of the target ratio across a test sample.
   - Fail signal: No pre-launch verification; reliance on "the library handles it."
   - Action if fail: Run a pre-launch assignment check on a sample of user IDs and verify the ratio before opening traffic.

4. - [ ] **Control group is truly untreated** -- The control group receives the exact current experience with no modifications, leaks, or partial treatments.
   - Pass criteria: Control experience verified by QA; no feature flags, UI changes, or backend differences affect control users.
   - Fail signal: Control users see a slightly different UI due to a separate deploy or feature flag interaction.
   - Action if fail: Fix the control experience and re-verify before launch. Check for interacting experiments.

5. - [ ] **Experiment interactions checked** -- Other running experiments that target the same users or affect the same metrics are identified and interaction risks are assessed.
   - Pass criteria: A check against the experiment registry shows no conflicting experiments, or mutual exclusion is configured.
   - Fail signal: Two experiments modify the same page element for the same user population simultaneously.
   - Action if fail: Set up mutual exclusion layers or stagger the experiments. Document known interactions.

6. - [ ] **Sample size and duration pre-calculated** -- Required sample size is computed based on baseline metric value, MDE, significance level (alpha), and power (beta).
   - Pass criteria: A power analysis document exists showing required sample size, expected daily traffic, and resulting minimum duration.
   - Fail signal: Duration chosen as "two weeks sounds right" with no power analysis.
   - Action if fail: Run a power analysis using the baseline metric data. Adjust duration or MDE until feasible.

7. - [ ] **Minimum duration accounts for cycles** -- The planned duration spans at least one full business cycle (typically 7 days minimum) to capture day-of-week effects.
   - Pass criteria: Duration >= 7 days; if the metric has monthly cycles (e.g., billing), >= 1 full month.
   - Fail signal: Experiment planned for 3 days to "get a quick read."
   - Action if fail: Extend to at least 7 days. If a faster signal is needed, consider a different metric with higher sensitivity.

8. - [ ] **Guardrail metrics defined** -- Metrics that must not regress (e.g., error rate, latency, revenue per user) are pre-registered with acceptable bounds.
   - Pass criteria: At least 2-3 guardrail metrics listed with thresholds (e.g., "error rate must not increase by > 0.5%").
   - Fail signal: Only the primary metric is tracked; no guardrails defined.
   - Action if fail: Add guardrail metrics covering system health, user experience, and revenue before launch.

9. - [ ] **Logging and instrumentation verified** -- All events needed to compute primary, secondary, and guardrail metrics are being logged correctly for both variants.
   - Pass criteria: A test event from each variant has been verified in the analytics pipeline; event schema matches expectations.
   - Fail signal: Logging was not tested; the experiment launches and discovers after one week that events are not being captured.
   - Action if fail: Send test events, verify they appear in the analytics tables, and confirm the schema before opening to real traffic.

10. - [ ] **Ramp plan documented** -- The traffic allocation plan is defined: starting percentage, ramp schedule, and criteria for full ramp or early stop.
    - Pass criteria: e.g., "Start at 5% for 24h to check for errors, ramp to 50/50 if no issues."
    - Fail signal: Experiment launches at 50/50 with no ramp or monitoring plan.
    - Action if fail: Define a ramp plan with at least an initial low-traffic phase and a health check before full ramp.

11. - [ ] **Early stopping rules defined** -- Criteria for stopping the experiment early (e.g., guardrail breach, overwhelming positive result) are pre-registered.
    - Pass criteria: Early stop rules documented with specific thresholds (e.g., "Stop if error rate > 2x baseline for 24h").
    - Fail signal: No early stop criteria; the experiment runs unmonitored until the planned end date.
    - Action if fail: Define early stop rules for both harm (guardrail breach) and benefit (clear winner with sufficient power).

12. - [ ] **Rollback plan ready** -- A mechanism to immediately disable the treatment variant exists and has been tested.
    - Pass criteria: Kill switch or feature flag toggle identified; tested in staging; can be executed in < 15 minutes.
    - Fail signal: Rolling back requires a code deploy or involves multiple teams.
    - Action if fail: Implement a feature flag kill switch and verify it works before launch.

## Cross-References

- See `experiment-analysis-quality.md` for the post-experiment analysis checklist that follows this one.
- See `alerting-quality.md` for how guardrail breach alerts should be configured during the experiment.
- See `data-quality-quality.md` for ensuring the experiment's event logging meets data quality standards.
