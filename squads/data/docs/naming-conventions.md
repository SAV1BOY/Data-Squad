# Naming Conventions

## Purpose

Consistent naming eliminates ambiguity, reduces errors, and makes it possible to find things. These conventions are mandatory for all Data Squad artifacts: metrics, events, dashboards, experiments, tables, and columns.

## General Rules

1. Use lowercase with underscores for technical names (snake_case). Use title case for human-readable names.
2. Be descriptive, not clever. `user_signup_completed` beats `usr_su_c`.
3. Use American English spelling consistently.
4. Avoid abbreviations unless they are universally understood in the company (e.g., `clv`, `nps`, `mrr`).
5. Never use special characters, spaces, or leading numbers in technical names.

## Metrics

**Format:** `[object]_[measure]_[modifier]`

**Examples:**
- `user_activation_rate` (not `activation_rate` -- specify the object)
- `revenue_monthly_recurring` (not `MRR` as the metric name, though `mrr` is acceptable as an alias)
- `session_duration_median` (not `avg_session_time` -- specify the aggregation)

**Rules:**
- Always specify the object (user, session, account, transaction).
- Always specify the aggregation method in the name if it is not a count: `_mean`, `_median`, `_p95`, `_sum`, `_rate`.
- Counts do not need an aggregation suffix: `user_signups` implies count.
- Ratios and rates always end with `_rate` or `_ratio`.
- Currency metrics include the currency if not the default: `revenue_total_brl`.

## Events (Tracking)

**Format:** `[object]_[action]_[modifier]`

**Examples:**
- `button_clicked_signup` (not `signup_click` or `click_signup_button`)
- `page_viewed_pricing` (not `pricing_page_view`)
- `form_submitted_checkout` (not `checkout_form_submit`)

**Rules:**
- Object comes first: what was interacted with.
- Action uses past tense: `clicked`, `viewed`, `submitted`, `completed`, `started`.
- Modifier provides context: which button, which page, which form.
- Server-side events use the same convention: `order_completed_subscription`.
- Properties within events use snake_case: `user_id`, `session_id`, `plan_type`.

## Dashboards

**Format:** `[Domain] - [Specific Topic]`

**Examples:**
- `Retention - Weekly Cohort Analysis`
- `Activation - Onboarding Funnel`
- `Revenue - MRR Trends and Segments`
- `Experiments - Active Portfolio`

**Rules:**
- Domain comes first for discoverability when sorted alphabetically.
- Use title case for readability.
- Do not include dates in the name (use versioning if needed).
- One dashboard per question; the name should hint at the question it answers.

## Experiments

**Format:** `[YYYY-QN]-[sequential]-[brief-description]`

**Examples:**
- `2026-Q1-014-simplified-checkout-flow`
- `2026-Q1-015-pricing-page-social-proof`
- `2026-Q2-001-onboarding-wizard-removal`

**Rules:**
- Year and quarter prefix for chronological ordering.
- Sequential number within the quarter for uniqueness.
- Brief description in kebab-case (lowercase with hyphens).
- The description should convey what is being tested, not the hypothesis.

## Database Tables and Columns

**Tables:**
- Format: `[schema].[domain]_[entity]_[modifier]`
- Examples: `analytics.user_events_daily`, `metrics.retention_cohorts_weekly`
- Staging tables prefix with `stg_`, intermediate with `int_`, final with no prefix.

**Columns:**
- Format: `[entity]_[attribute]` in snake_case.
- Examples: `user_id`, `event_timestamp`, `session_duration_seconds`.
- Always include the unit in the column name for numeric fields: `_seconds`, `_cents`, `_count`, `_rate`.
- Boolean columns prefix with `is_` or `has_`: `is_active`, `has_subscription`.
- Timestamp columns suffix with `_at` or `_timestamp`: `created_at`, `event_timestamp`.
- Date columns suffix with `_date`: `signup_date`, `cohort_date`.

## Files and Documents

**Format:** `kebab-case-description.extension`

**Examples:**
- `retention-diagnostics-workflow.md`
- `dashboard-philosophy.md`
- `2026-q1-experiment-results.md`

**Rules:**
- All lowercase with hyphens separating words.
- Descriptive names that indicate content without opening the file.
- Workflows end with `-workflow.md`.
- Guides end with `-guide.md`.

## Changing a Name

If an existing name does not follow these conventions, do not silently rename it. Follow the metric-deprecation-workflow (for metrics) or document the rename in the change log with a mapping from old name to new name and a migration date. Downstream consumers must be notified.
