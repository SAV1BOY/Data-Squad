# Metric Naming Standard

## Purpose

Consistent metric naming eliminates ambiguity, reduces miscommunication, and makes metrics discoverable in the data catalog. This standard applies to all metrics defined in the data warehouse, BI tools, and documentation.

## General Principles

1. **One name, one meaning.** A metric name must map to exactly one definition. No two metrics should share the same name with different calculations.
2. **Self-documenting.** A reader should understand what the metric measures from its name alone, without needing to look up the definition.
3. **Consistent structure.** All metric names follow the same pattern, making them predictable and searchable.
4. **Tool-agnostic.** The canonical name is the same regardless of where it appears (warehouse, dashboard, Slack, documents).

## Naming Pattern

```
[qualifier]_[object]_[measure]_[time_grain]
```

### Components

| Component | Required | Description | Examples |
|-----------|----------|-------------|----------|
| **qualifier** | Optional | Narrows the scope or applies a filter | `active`, `new`, `paid`, `organic`, `monthly` |
| **object** | Required | The entity being measured | `user`, `order`, `subscription`, `session`, `ticket` |
| **measure** | Required | The aggregation or calculation type | `count`, `rate`, `revenue`, `avg_value`, `p95_latency` |
| **time_grain** | Optional | The time period, if not obvious from context | `daily`, `weekly`, `monthly`, `7d`, `30d`, `trailing_12m` |

### Examples

| Metric Name | Meaning |
|-------------|---------|
| `active_user_count_monthly` | Number of users active in a given month |
| `new_user_count_daily` | Number of new users acquired per day |
| `order_revenue_monthly` | Total order revenue per month |
| `paid_subscription_count` | Number of active paid subscriptions (snapshot) |
| `session_avg_duration` | Average session duration |
| `support_ticket_resolution_rate` | Percentage of tickets resolved |
| `order_avg_value` | Average order value |
| `user_churn_rate_monthly` | Monthly user churn rate |
| `new_user_activation_rate_7d` | Percentage of new users who activate within 7 days |

## Formatting Rules

### Case and Separators

- Use `snake_case` for all metric names in code, SQL, and the data catalog.
- In dashboards and documents, use Title Case with spaces: "Monthly Active User Count."
- Never use camelCase, PascalCase, or kebab-case for metric names.

### Abbreviations

Avoid abbreviations unless they are universally understood within the organization.

| Allowed Abbreviation | Meaning |
|---------------------|---------|
| `avg` | Average |
| `p50`, `p95`, `p99` | Percentile |
| `7d`, `30d`, `90d` | Day-based periods |
| `12m` | 12 months |
| `mrr` | Monthly Recurring Revenue (industry standard) |
| `arr` | Annual Recurring Revenue (industry standard) |
| `clv` or `ltv` | Customer Lifetime Value |
| `cac` | Customer Acquisition Cost |
| `nps` | Net Promoter Score |

Do NOT abbreviate: `usr` (use `user`), `rev` (use `revenue`), `sub` (use `subscription`), `conv` (use `conversion`).

### Qualifiers

Use qualifiers to distinguish metric variants. Place qualifiers at the beginning of the name.

| Qualifier | Meaning | Example |
|-----------|---------|---------|
| `new` | First-time occurrence | `new_user_count` |
| `active` | Met an activity threshold | `active_user_count_monthly` |
| `paid` | Paying customers only | `paid_user_count` |
| `organic` | Non-paid acquisition | `organic_session_count` |
| `churned` | Lost / inactive | `churned_subscription_count` |
| `retained` | Still active after a period | `retained_user_rate_30d` |
| `gross` | Before deductions | `gross_revenue_monthly` |
| `net` | After deductions | `net_revenue_monthly` |
| `trailing` | Rolling window | `trailing_12m_revenue` |

## Measure Types

### Counts

- Use `_count` for absolute numbers: `user_count`, `order_count`.
- Use `_unique_count` when deduplication matters: `session_unique_page_count`.

### Rates and Ratios

- Use `_rate` for percentages: `conversion_rate`, `churn_rate`.
- Use `_ratio` for non-percentage ratios: `ltv_cac_ratio`.
- Always specify the denominator in the metric definition, even if not in the name.

### Averages and Aggregations

- `avg_` prefix for averages: `order_avg_value`, `session_avg_duration`.
- `total_` prefix for sums when needed to distinguish from other aggregations: `total_revenue`.
- `median_` or percentile prefixes: `session_p95_latency`.

### Financial Metrics

- `_revenue` for money earned: `order_revenue`, `subscription_revenue`.
- `_cost` for money spent: `acquisition_cost`, `support_cost`.
- `_margin` for revenue minus cost: `gross_margin`.
- Always specify currency in the metric definition (not the name).

## Time Grain Conventions

| Suffix | Meaning |
|--------|---------|
| `_daily` | Calculated per calendar day |
| `_weekly` | Calculated per calendar week (Monday start) |
| `_monthly` | Calculated per calendar month |
| `_quarterly` | Calculated per calendar quarter |
| `_7d` | Rolling 7-day window |
| `_30d` | Rolling 30-day window |
| `_trailing_12m` | Rolling 12-month window |

If no time grain is specified, the metric is either a snapshot (point-in-time) or the grain is determined by the report context. Document which.

## Anti-Patterns

| Bad Name | Problem | Better Name |
|----------|---------|-------------|
| `MAU` | Acronym-only, ambiguous | `active_user_count_monthly` |
| `revenue` | No qualifier, no grain | `net_revenue_monthly` |
| `users` | Count? Active? All-time? | `active_user_count` |
| `good_leads` | Subjective qualifier | `qualified_lead_count` |
| `conversion` | Rate? Count? Of what? | `signup_conversion_rate` |
| `growth` | Growth of what? | `user_count_growth_rate_monthly` |
| `ARPU` | Acronym-only | `avg_revenue_per_user_monthly` |
| `new_users_v2` | Version in name | Fix the definition, keep the name |

## Metric Versioning

- Do NOT version metric names (`revenue_v2`). If the definition changes, update the definition in the catalog with a changelog.
- If a metric must be fundamentally replaced, deprecate the old name and introduce a new descriptive name.
- Maintain a changelog in the metric definition that records what changed and when.

## Certification Levels

| Level | Meaning | Where It Can Appear |
|-------|---------|-------------------|
| **Certified** | Reviewed, validated, single source of truth | Executive dashboards, external reports, OKRs |
| **Draft** | Defined but not yet validated | Internal analysis, exploration |
| **Deprecated** | Superseded by a newer metric | Nowhere new; existing references should migrate |

## Governance

- Metric names are approved by the Metric Owner for the relevant domain.
- Name changes to certified metrics require a 2-week notice and migration plan.
- The data catalog is the authoritative source for metric names and definitions.
- Duplicated or conflicting metrics discovered in BI tools must be resolved within 10 business days.
