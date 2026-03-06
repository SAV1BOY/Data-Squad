# Metric Definition

> Use this template to formally define a metric. Every metric used in dashboards,
> reports, or decision-making should have a definition document.
> One file per metric. Replace examples with your specifics.

---

## 1. Metric Identity [REQUIRED]

**Metric Name:** [Human-readable name]
**Metric ID:** [Unique identifier, e.g., "metric_trial_to_paid_rate"]
**Owner:** [Name, Team]
**Date Defined:** [YYYY-MM-DD]
**Last Updated:** [YYYY-MM-DD]
**Status:** [Draft / Active / Deprecated]

_Example:_
**Metric Name:** Trial-to-Paid Conversion Rate
**Metric ID:** metric_trial_to_paid_rate
**Owner:** Sarah Kim, Product Analytics
**Date Defined:** 2026-01-15
**Last Updated:** 2026-03-06
**Status:** Active

---

## 2. Formula [REQUIRED]

**Plain Language:** [Describe what this metric measures in one sentence]

**Formula:**
```
[Numerator description]
-------------------------------------------
[Denominator description]
```

**Precise Definition:**
```sql
-- SQL or pseudocode representation
[numerator] / NULLIF([denominator], 0)
```

_Example:_
**Plain Language:** The percentage of free trial users who convert to a paid subscription within their trial window.

**Formula:**
```
Count of trial users who activated a paid plan within 14 days of trial start
---------------------------------------------------------------------------
Count of trial users whose 14-day window has fully elapsed
```

**Precise Definition:**
```sql
COUNT(DISTINCT CASE WHEN paid_activation_date <= trial_start_date + INTERVAL 14 DAY
                     THEN user_id END)
/
NULLIF(COUNT(DISTINCT CASE WHEN trial_start_date <= CURRENT_DATE - INTERVAL 14 DAY
                           THEN user_id END), 0)
```

---

## 3. Data Source [REQUIRED]

**Primary Source Table:** [e.g., "analytics.fct_trial_conversions"]
**Source System:** [e.g., "BigQuery, populated by dbt"]
**Upstream Dependencies:** [e.g., "stripe.subscriptions, core.users, segment.tracks"]

| Source Table                  | Fields Used                     | Join Key    | Refresh Cadence |
|-------------------------------|---------------------------------|-------------|-----------------|
| [e.g., "core.users"]        | [e.g., "user_id, trial_start_date"]| [e.g., "user_id"]| [e.g., "Hourly"]|
| [e.g., "stripe.subscriptions"]| [e.g., "subscription_id, status, start_date"]| [e.g., "user_id"]| [e.g., "Hourly"]|

_Example:_

| Source Table              | Fields Used                          | Join Key | Refresh   |
|---------------------------|--------------------------------------|----------|-----------|
| core.users                | user_id, trial_start_date, plan_type | user_id  | Hourly    |
| stripe.subscriptions      | user_id, status, activated_at        | user_id  | Hourly    |
| analytics.fct_trial_conversions | Pre-computed, all fields        | user_id  | Daily 6am |

---

## 4. Time Window [REQUIRED]

**Observation Window:** [e.g., "14-day trial period from trial_start_date"]
**Reporting Granularity:** [e.g., "Daily, Weekly, Monthly"]
**Cohort Definition:** [e.g., "Grouped by trial_start_date (week)"]
**Lag / Maturation:** [e.g., "Metric is only final 14 days after trial start"]

_Example:_
**Observation Window:** 14-day trial period measured from trial_start_date
**Reporting Granularity:** Weekly cohorts (Monday-Sunday), also available daily
**Cohort Definition:** Users grouped by the week of their trial_start_date
**Lag / Maturation:** This metric is preliminary until 14 days after the cohort's last trial start. Immature cohorts are labeled as "(preliminary)" in dashboards.

---

## 5. Exclusions [REQUIRED]

List what is excluded from this metric and why.

| Exclusion                              | Reason                                         |
|----------------------------------------|-------------------------------------------------|
| [e.g., "Internal users (@acme.com)"] | [e.g., "Not real customers"]                   |
| [e.g., "Enterprise trials"]          | [e.g., "Different conversion process"]          |
| [e.g., "Duplicate accounts"]         | [e.g., "Would inflate denominator"]             |

_Example:_

| Exclusion                         | Reason                                       |
|-----------------------------------|----------------------------------------------|
| Internal users (email @acme.com)  | Not real customers, would inflate numbers    |
| Enterprise trials (sales-assisted)| Different conversion process and timeline     |
| Users with trial < 1 day         | Likely bot signups or accidental registrations|
| Test accounts (flagged in DB)     | QA and testing data                           |

---

## 6. Segments and Dimensions

List the standard breakdowns available for this metric.

| Dimension          | Values                                     | Source Field              |
|--------------------|--------------------------------------------|---------------------------|
| [e.g., "Plan type"]| [e.g., "starter, pro, business"]         | [e.g., "users.plan_type"]|
| [e.g., "Source"]   | [e.g., "organic, paid, referral"]        | [e.g., "users.signup_source"]|
| [e.g., "Region"]   | [e.g., "NA, EMEA, APAC, LATAM"]         | [e.g., "users.region"]   |

_Example:_

| Dimension        | Values                          | Source Field            |
|------------------|---------------------------------|-------------------------|
| Plan type        | starter, pro, business          | users.trial_plan_type   |
| Signup source    | organic, paid, referral, partner| users.signup_source     |
| Region           | NA, EMEA, APAC, LATAM          | users.geo_region        |
| Device type      | desktop, mobile, tablet         | sessions.device_type    |

---

## 7. Thresholds and Alerts

| Condition                               | Severity | Action                              |
|-----------------------------------------|----------|-------------------------------------|
| [e.g., "Drops below 25% for 7 days"]  | [High]   | [e.g., "Notify Growth + Product"]  |
| [e.g., "Changes >5pp week-over-week"] | [Medium] | [e.g., "Investigate in weekly review"]|

_Example:_

| Condition                            | Severity | Action                              |
|--------------------------------------|----------|-------------------------------------|
| Drops below 25% for 7+ consecutive days | High  | Slack alert to #growth-alerts, investigate immediately |
| Changes >5pp week-over-week         | Medium   | Flag in weekly analytics review     |
| Reaches >45%                         | Info     | Celebrate and investigate what's working |

---

## 8. Known Limitations

- [e.g., "Does not account for users who convert after the 14-day window (late converters are ~3%)"]
- [e.g., "Plan downgrades within 24 hours are still counted as conversions"]
- [e.g., "Historical data before 2025-06 uses a different trial length (7 days)"]

---

## 9. Related Metrics

| Related Metric                | Relationship                                    |
|-------------------------------|-------------------------------------------------|
| [e.g., "Activation Rate"]   | [e.g., "Subset - activation is a step toward conversion"]|
| [e.g., "Time to Conversion"]| [e.g., "Companion - measures speed, not rate"] |
| [e.g., "MRR from New"]      | [e.g., "Downstream - revenue impact of conversions"]|

---

## 10. Changelog

| Date       | Author   | Change                                     | Reason                          |
|------------|----------|--------------------------------------------|---------------------------------|
| [Date]     | [Name]   | [e.g., "Created metric definition"]       | [e.g., "New metric"]          |
| [Date]     | [Name]   | [e.g., "Changed window from 7 to 14 days"]| [e.g., "Trial length changed"]|
