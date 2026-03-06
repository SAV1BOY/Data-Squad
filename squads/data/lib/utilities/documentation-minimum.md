# Documentation Minimum

The minimum documentation required for each type of data artifact. If it does not meet these minimums, it is not ready for production or sharing.

---

## Metric

Every metric in the metric catalog must have:

| Field              | Required | Example                                              |
|--------------------|----------|------------------------------------------------------|
| Name               | Yes      | `user_count_active_daily`                            |
| Display Name       | Yes      | Daily Active Users                                   |
| Definition         | Yes      | Count of distinct users with at least one qualifying event per day |
| Formula            | Yes      | `COUNT(DISTINCT user_id) WHERE event_type IN ('page_view','action')` |
| Source Model       | Yes      | `mart_daily_active_users`                            |
| Owner              | Yes      | Growth Analytics (Jane Doe)                          |
| Grain              | Yes      | Daily                                                |
| Dimensions         | Yes      | Platform, Country, Plan Type                         |
| Exclusions         | Yes      | Internal users, bots, test accounts                  |
| Version            | Yes      | v1.2.0                                               |
| Created Date       | Yes      | 2025-08-01                                           |
| Last Modified      | Yes      | 2026-02-15                                           |
| Tier (L0-L3)       | Recommended | L1                                                |
| Target             | Recommended | 150,000                                           |
| Related Metrics    | Recommended | Weekly Active Users, MAU, Activation Rate         |

**Not ready if missing:** Name, definition, formula, source model, or owner.

---

## Dashboard

Every dashboard must have:

| Field              | Required | Example                                              |
|--------------------|----------|------------------------------------------------------|
| Title              | Yes      | Growth - Weekly Acquisition Review                   |
| Purpose            | Yes      | Track weekly acquisition funnel performance for Growth team syncs |
| Audience           | Yes      | Growth team, VP Growth                               |
| Owner              | Yes      | Growth Analytics (Jane Doe)                          |
| Data Sources       | Yes      | `mart_daily_active_users`, `mart_funnel_events`      |
| Refresh Cadence    | Yes      | Daily at 07:00 UTC                                   |
| Key Metrics Listed | Yes      | DAU, Signup Rate, Activation Rate, D7 Retention      |
| Filter Descriptions| Yes      | Date range (default: last 30 days), Platform (default: all) |
| Known Limitations  | Recommended | Mobile data is delayed by 1 day; excludes in-app browser |
| Last Reviewed      | Recommended | 2026-02-01                                        |
| Link to Metric Cards | Recommended | Links to each metric's definition in the catalog |

**Not ready if missing:** Title, purpose, audience, owner, or data sources.

---

## Experiment

Every experiment must have (see experiment one-pager for full template):

| Field                   | Required | Notes                                          |
|-------------------------|----------|------------------------------------------------|
| Name                    | Yes      | Short, descriptive                             |
| Hypothesis              | Yes      | If/then/because format                         |
| Primary Metric          | Yes      | Single metric with baseline and MDE            |
| Secondary Metrics       | Yes      | At least 1 secondary metric                    |
| Guardrails              | Yes      | At least 1 guardrail metric with threshold     |
| Audience                | Yes      | Who is eligible, exclusions, sample size        |
| Duration                | Yes      | Planned runtime with rationale                 |
| Success Criteria        | Yes      | Ship/iterate/kill decision rules               |
| Power Calculation       | Yes      | Sample size, power, significance level         |
| Owner                   | Yes      | Person accountable for execution               |
| Status                  | Yes      | Draft/Approved/Running/Concluded               |

**Not ready to launch if missing:** Hypothesis, primary metric, guardrails, success criteria, or power calculation.

---

## Data Pipeline / Model

Every dbt model or data pipeline must have:

| Field              | Required | Example                                              |
|--------------------|----------|------------------------------------------------------|
| Model Name         | Yes      | `mart_order_summary`                                 |
| Description        | Yes      | One order per row with revenue, status, and customer attributes |
| Owner              | Yes      | Data Engineering (John Smith)                        |
| Source Tables      | Yes      | `stg_postgres_orders`, `stg_stripe_payments`         |
| Grain              | Yes      | One row per order_id                                 |
| Primary Key        | Yes      | `order_id`                                           |
| Key Columns        | Recommended | List and describe important columns               |
| Tests              | Yes      | Uniqueness on PK, not-null on required fields, referential integrity |
| Refresh Schedule   | Yes      | Daily at 05:00 UTC via Airflow                       |
| SLA                | Recommended | Data available by 06:00 UTC                       |
| Downstream Models  | Recommended | `mtr_daily_revenue`, `mart_customer_360`          |

**Not ready for production if missing:** Description, owner, source tables, grain, or tests.

---

## SQL Query (Ad-Hoc or Saved)

Any SQL query shared with others or saved for reuse must have:

| Field              | Required | Format                                               |
|--------------------|----------|------------------------------------------------------|
| Header comment     | Yes      | What the query produces, who requested it, date      |
| Source tables      | Yes      | Listed in the header or clear from the FROM clause   |
| Filter rationale   | Yes      | Comment explaining non-obvious WHERE conditions      |
| Output description | Yes      | What each column in the output represents            |

**Example header:**
```sql
/*
  Query: Weekly signup funnel by platform
  Requested by: Sarah Kim (Growth PM)
  Date: 2026-02-20
  Source: mart_funnel_events, mart_users
  Output: One row per week per platform with signup, activation, and conversion counts
  Notes: Excludes internal users and bot traffic
*/
```

---

## Documentation Review Cadence

| Artifact Type | Review Frequency | Reviewer                    |
|---------------|------------------|-----------------------------|
| Metrics       | Quarterly        | Metric owner + data team    |
| Dashboards    | Quarterly        | Dashboard owner             |
| Experiments   | At conclusion     | Experiment owner + peer     |
| Pipelines     | Semi-annually    | Data engineering            |
| Saved Queries | Annually         | Author or data team         |
