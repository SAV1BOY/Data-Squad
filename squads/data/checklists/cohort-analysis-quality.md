# Cohort Analysis Quality Checklist
> Gate type: Review
> Owner: Fader
> Applies to: Cohort analysis reports, retention cohort tables, and behavioural cohort studies

## Purpose
Cohort analysis is one of the most powerful tools for understanding user behaviour over time, but it is also one of the easiest to get wrong. Poorly defined cohorts, survivorship bias, and incorrect timeframe choices can lead to conclusions that are mathematically valid but practically misleading. This gate ensures the analysis is rigorous, unbiased, and decision-ready.

## Checklist Items

1. - [ ] **Cohort definition clarity** -- The rule that assigns a user to a cohort is explicit, deterministic, and reproducible.
   - Pass criteria: Cohort assignment rule is a single, unambiguous statement (e.g., "Users whose first purchase occurred in calendar week W").
   - Fail signal: Cohort definition is vague ("early adopters"), overlapping (users can belong to multiple cohorts), or undocumented.
   - Action if fail: Rewrite the cohort definition as a precise WHERE clause; confirm mutual exclusivity.

2. - [ ] **Cohort grain justification** -- The time grain of cohorts (daily, weekly, monthly) is justified by the business context.
   - Pass criteria: Grain chosen matches the product's natural usage cycle; rationale documented.
   - Fail signal: Grain chosen arbitrarily or defaults to "monthly" without consideration of usage frequency.
   - Action if fail: Assess typical usage intervals and select a grain that captures meaningful behaviour differences.

3. - [ ] **Observation window sufficiency** -- The analysis covers enough time periods after cohort formation to observe the behaviour of interest.
   - Pass criteria: Observation window extends at least 2x the expected behaviour cycle (e.g., 12 weeks for a product with a 6-week activation window).
   - Fail signal: Observation window too short; recent cohorts have mostly empty cells, making trends unreliable.
   - Action if fail: Extend the window or explicitly flag immature cohorts as preliminary.

4. - [ ] **Survivorship bias check** -- The analysis accounts for users who drop out and does not conflate surviving users with the full cohort.
   - Pass criteria: Denominator is the original cohort size, not the number of active users in a given period.
   - Fail signal: Percentages calculated on shrinking denominators, making later periods look artificially healthy.
   - Action if fail: Fix denominators to original cohort size; present both absolute counts and percentages.

5. - [ ] **Selection bias assessment** -- External factors that differ across cohorts (seasonality, marketing campaigns, product changes) are acknowledged.
   - Pass criteria: A "context" row or annotation notes major external events that may affect cohort behaviour.
   - Fail signal: Cohorts compared as if they formed under identical conditions.
   - Action if fail: Add a context timeline noting product launches, campaigns, and seasonal effects alongside the cohort table.

6. - [ ] **Sample size adequacy** -- Each cohort has enough members to produce statistically stable rates.
   - Pass criteria: Minimum cohort size threshold stated (e.g., n > 100); small cohorts flagged or excluded.
   - Fail signal: Cohorts with fewer than 30 members presented with the same visual weight as large cohorts.
   - Action if fail: Merge small cohorts or add confidence intervals to rates from small samples.

7. - [ ] **Metric consistency** -- The behaviour metric (retention, revenue, activity) is defined identically across all cohorts.
   - Pass criteria: Metric definition referenced; same event or transaction used for every cohort period.
   - Fail signal: Metric definition changed mid-analysis (e.g., "active" redefined from login to feature use partway through).
   - Action if fail: Apply a single metric definition retroactively across all cohorts.

8. - [ ] **Visualisation accuracy** -- The cohort table or chart accurately represents the underlying data without distortion.
   - Pass criteria: Heatmap colour scale anchored to absolute values; axes labeled; incomplete cells clearly marked.
   - Fail signal: Colour scale auto-adjusted making small differences look dramatic; incomplete periods not distinguished.
   - Action if fail: Fix colour scale anchoring; grey-out or hatch incomplete cells.

9. - [ ] **Comparison to baseline** -- Cohort results are compared against a meaningful baseline (overall average, prior year, benchmark).
   - Pass criteria: A baseline row or reference line is present; deviations from baseline highlighted.
   - Fail signal: Cohort results presented in isolation with no comparative context.
   - Action if fail: Add a blended baseline cohort and highlight cohorts that deviate significantly.

10. - [ ] **Causal humility** -- The analysis distinguishes between correlation and causation in its conclusions.
    - Pass criteria: Findings stated as associations ("Cohort X shows higher retention, possibly due to...") with explicit caveats.
    - Fail signal: Causal claims made without controlled experiments (e.g., "the new onboarding caused higher retention").
    - Action if fail: Reframe conclusions as observations and recommend experiments to test causal hypotheses.

11. - [ ] **Decision recommendation** -- The analysis ends with a specific, actionable recommendation tied to the findings.
    - Pass criteria: Recommendation names an action, an owner, and a success metric (e.g., "Replicate Cohort Q3's onboarding flow for all new users; measure D30 retention").
    - Fail signal: Analysis ends with "further investigation needed" or no recommendation at all.
    - Action if fail: Formulate at least one concrete recommendation with owner and timeline.

12. - [ ] **Reproducibility** -- The query or notebook that generates the cohort table is version-controlled and can be re-run.
    - Pass criteria: SQL or notebook file linked; re-running produces the same results for historical periods.
    - Fail signal: Analysis created in a one-off spreadsheet with manual steps.
    - Action if fail: Migrate the analysis to a version-controlled query or notebook and link it from the report.

## Cross-References
- [Retention Quality Checklist](retention-quality.md)
- [Segmentation Quality Checklist](segmentation-quality.md)
- [Metric Definition Quality Checklist](metric-definition-quality.md)
- [LTV/CLV Model Quality Checklist](ltv-clv-model-quality.md)
