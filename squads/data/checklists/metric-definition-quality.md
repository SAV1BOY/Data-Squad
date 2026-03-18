# Metric Definition Quality Checklist
> Gate type: Review
> Owner: Data Chief
> Applies to: Metric definition documents, data dictionaries, and metric registries

## Purpose
A metric without a precise definition is a metric that different people interpret differently, leading to conflicting reports and eroded trust. This gate ensures every metric has an unambiguous formula, a declared data source, defined time windows, explicit exclusions, and documented edge cases so that any analyst can reproduce the same number independently.

## Checklist Items

1. - [ ] **Unambiguous formula** -- The metric has a single written formula that can be computed without interpretation.
   - Pass criteria: Formula expressed in plain math or SQL pseudocode (e.g., "SUM(revenue) / COUNT(DISTINCT user_id) WHERE status = 'paid'").
   - Fail signal: Description is verbal only (e.g., "average revenue per user") without specifying numerator/denominator filters.
   - Action if fail: Write the formula in explicit mathematical or SQL notation.

2. - [ ] **Source table and column** -- The exact database table(s), column(s), and join logic are specified.
   - Pass criteria: Source section lists schema.table.column for every component of the formula.
   - Fail signal: Source described as "the orders table" without schema, column, or join details.
   - Action if fail: Document the full qualified path and join conditions.

3. - [ ] **Time window** -- The aggregation window is stated (daily, trailing-7, monthly, all-time) along with timezone.
   - Pass criteria: Window type, boundary rules (e.g., calendar month vs. rolling 30 days), and timezone specified.
   - Fail signal: Metric says "monthly" without clarifying calendar vs. rolling or timezone.
   - Action if fail: Add explicit window definition with timezone and boundary rules.

4. - [ ] **Inclusion and exclusion criteria** -- Filters that include or exclude records are listed (e.g., exclude test accounts, include only paid plans).
   - Pass criteria: A "Filters" section enumerates every WHERE clause condition with rationale.
   - Fail signal: Filters implied or discovered only by reading the query.
   - Action if fail: Extract all filters from the query and document them with justification.

5. - [ ] **Edge case documentation** -- Known edge cases are described with their handling approach.
   - Pass criteria: At least three edge cases listed (e.g., zero-denominator, refunds, mid-period plan changes) with stated behaviour.
   - Fail signal: No edge cases discussed; metric assumed to work in all situations.
   - Action if fail: Brainstorm edge cases with engineering and product; document handling for each.

6. - [ ] **Unit and precision** -- The unit of measure (dollars, percentage, count) and decimal precision are specified.
   - Pass criteria: Unit stated; rounding rule declared (e.g., "two decimal places, round half up").
   - Fail signal: Ambiguous whether value is a percentage (0.05) or a percent display (5%).
   - Action if fail: State unit, display format, and rounding convention.

7. - [ ] **Owner and approval** -- A named individual or team owns the metric definition and has approved the current version.
   - Pass criteria: Owner field populated; approval date recorded.
   - Fail signal: No owner; definition written by an analyst but never reviewed.
   - Action if fail: Assign an owner and route for approval.

8. - [ ] **Version history** -- Changes to the definition are tracked with date, author, and reason.
   - Pass criteria: Changelog exists with at least the initial entry.
   - Fail signal: No version history; impossible to tell when or why the definition changed.
   - Action if fail: Start a changelog; backfill the initial version date.

9. - [ ] **Reproducibility test** -- Two analysts independently compute the metric for the same period and get the same result.
   - Pass criteria: Reproducibility test performed and documented with matching values.
   - Fail signal: Only one person has ever computed the metric; no verification.
   - Action if fail: Have a second analyst compute the metric and compare results.

10. - [ ] **Null and missing data handling** -- The definition states how NULLs and missing values are treated.
    - Pass criteria: Explicit statement (e.g., "NULL revenue rows excluded from both numerator and denominator").
    - Fail signal: NULL handling not mentioned; behaviour depends on database defaults.
    - Action if fail: Add NULL handling rules and confirm they match the query implementation.

11. - [ ] **Relationship to other metrics** -- The definition states how this metric relates to parent or child metrics in the KPI tree.
    - Pass criteria: Cross-reference to at least one related metric (e.g., "This is a component of Customer LTV").
    - Fail signal: Metric exists in isolation with no connection to the broader measurement framework.
    - Action if fail: Map the metric to its position in the KPI tree and note relationships.

12. - [ ] **Alert thresholds** -- If the metric is monitored, acceptable ranges and alert thresholds are defined.
    - Pass criteria: Upper and lower bounds documented; alert recipient and escalation path stated.
    - Fail signal: Metric monitored but thresholds set arbitrarily or not documented.
    - Action if fail: Establish thresholds based on historical variance and document escalation steps.

## Cross-References
- [KPI Tree Quality Checklist](kpi-tree-quality.md)
- [Dashboard Quality Checklist](dashboard-quality.md)
- [Cohort Analysis Quality Checklist](cohort-analysis-quality.md)
- [LTV/CLV Model Quality Checklist](ltv-clv-model-quality.md)

---

## Applied In

| Task | Gate Level | Path |
|------|-----------|------|
| define-north-star-metric | G1 -- Definition | `tasks/definition/define-north-star-metric.md` |
| define-metric-officially | G1 -- Definition | `tasks/definition/define-metric-officially.md` |
| metric-sunset | G1 -- Definition | `tasks/definition/metric-sunset.md` |

**Quality Gate Type:** mandatory
