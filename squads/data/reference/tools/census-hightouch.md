# Reverse ETL: Census and Hightouch

## Overview

Reverse ETL is the process of syncing data from your data warehouse to operational tools (CRM, marketing platforms, customer success tools, ad platforms). Census and Hightouch are the two leading reverse ETL platforms. They turn your warehouse into an operational hub, ensuring business tools always have the freshest, most accurate data.

## Why Reverse ETL Matters

### The Problem

Data teams spend significant effort building clean, trusted data models in the warehouse. But operational teams use tools like Salesforce, HubSpot, Braze, and Intercom that have their own siloed data. The result:

- Sales reps see different numbers than the analytics dashboard.
- Marketing segments are based on stale CRM data, not real product usage.
- Customer success teams lack product engagement data in their workflows.
- Ad platforms get manual CSV uploads instead of automated audience syncs.

### The Solution

Reverse ETL closes the loop: warehouse data flows back to operational tools automatically.

```
Source Systems ──> Warehouse (dbt models) ──> Reverse ETL ──> Operational Tools
                                                              - CRM
                                                              - Email/Marketing
                                                              - Ad Platforms
                                                              - Customer Success
                                                              - Support
```

## Census

### What It Is

Census is a reverse ETL platform that syncs data from your warehouse to 200+ business tools. It emphasizes data governance, live syncs, and an audience hub for marketing.

### Key Features

| Feature | Description |
|---------|-------------|
| Models | Define source data using SQL or dbt models |
| Syncs | Scheduled or triggered data pushes to destinations |
| Audience Hub | Build marketing audiences from warehouse data |
| Computed Columns | Enrich data without writing SQL |
| Entity Resolution | Match warehouse records to destination records |
| Live Syncs | Near real-time syncs using warehouse change data capture |
| Data Governance | Column-level permissions, PII detection, audit logs |

### How Syncs Work

1. **Define a model:** A SQL query or reference to a dbt model that produces the data you want to sync.
2. **Choose a destination:** Salesforce, HubSpot, Braze, Google Ads, etc.
3. **Map fields:** Connect warehouse columns to destination fields.
4. **Set a sync key:** The unique identifier used to match records (e.g., email, user_id).
5. **Choose sync behavior:** Insert, update, upsert, or mirror.
6. **Schedule:** Run on a cron schedule, after dbt completes, or on demand.

### Sync Behaviors

| Behavior | Description | Use Case |
|----------|-------------|----------|
| **Upsert** | Insert new, update existing | Default for most syncs |
| **Update only** | Only update existing records | When destination controls creation |
| **Mirror** | Upsert + delete records not in source | Keep destination in exact sync |
| **Insert only** | Only create new records | Event-like data (activities, tasks) |
| **Append** | Add to a list or array field | Tags, list memberships |

### Example: Sync Product Usage to Salesforce

```sql
-- Census model (or dbt model)
SELECT
    u.email,
    u.company_name,
    u.plan,
    u.created_at,
    COALESCE(usage.active_days_30d, 0) AS active_days_30d,
    COALESCE(usage.features_used_30d, 0) AS features_used_30d,
    CASE
        WHEN usage.active_days_30d >= 20 THEN 'Power User'
        WHEN usage.active_days_30d >= 5 THEN 'Regular'
        WHEN usage.active_days_30d >= 1 THEN 'Light'
        ELSE 'Inactive'
    END AS engagement_tier,
    usage.last_login_at
FROM analytics.dim_users u
LEFT JOIN analytics.fct_user_engagement_30d usage
    ON u.user_id = usage.user_id
WHERE u.is_customer = TRUE
```

Sync this to Salesforce Account or Contact records, mapping `engagement_tier` and `active_days_30d` to custom fields.

## Hightouch

### What It Is

Hightouch is a reverse ETL and data activation platform. It provides similar core functionality to Census with additional features around audience management, AI-powered recommendations, and a visual audience builder.

### Key Features

| Feature | Description |
|---------|-------------|
| Models | SQL, dbt models, or visual model builder |
| Syncs | Scheduled pushes to 150+ destinations |
| Audiences | Visual audience builder for marketing teams |
| Customer Studio | Self-serve audience building without SQL |
| Match Booster | Enrich records with third-party data for better ad matching |
| AI Recommendations | ML-powered product recommendations |
| Extensions | Custom sync logic with JavaScript |

### Customer Studio

Hightouch's differentiator for marketing teams:

- Non-technical users build audiences using a visual interface.
- "Users who purchased in the last 30 days AND have not logged in for 7 days."
- Audiences auto-sync to ad platforms, email tools, and CRM.
- No SQL required; all queries run against the warehouse.

### Match Booster

Improves ad platform match rates:

- Enriches your customer data with additional identifiers (hashed emails, phone numbers).
- Increases match rates on Facebook, Google, and other ad platforms from typical 30-40% to 60-80%.
- Privacy-safe: uses hashed matching without exposing PII.

## Common Use Cases

### CRM Enrichment

Sync product usage data to Salesforce/HubSpot so sales and CS teams have context:

| Warehouse Field | CRM Field | Value |
|----------------|-----------|-------|
| `active_days_30d` | Custom: Active Days | 22 |
| `features_used` | Custom: Features Used | 8 |
| `nps_score` | Custom: NPS Score | 9 |
| `health_score` | Custom: Health Score | 85 |
| `mrr` | Custom: MRR | 2500.00 |
| `engagement_tier` | Custom: Engagement Tier | Power User |

### Ad Platform Audiences

Sync high-value customer segments to ad platforms for lookalike targeting:

- "Users with LTV > $1000" synced to Facebook Custom Audiences.
- "Free trial users who activated" synced to Google Ads for suppression.
- "Churned customers" synced for win-back campaigns.

### Marketing Automation

Sync behavioral data to email/messaging tools:

- Send product usage triggers to Braze or Customer.io.
- "User completed onboarding" triggers a welcome sequence.
- "User has not logged in for 14 days" triggers a re-engagement campaign.
- Personalize emails with warehouse data (usage stats, recommendations).

### Customer Success

Sync health scores and usage data to Gainsight or Vitally:

- Automate health score calculation in the warehouse (where the data is cleanest).
- Sync to CS platforms for playbook triggers.
- CSMs see real-time product engagement without switching tools.

### Product Analytics Enrichment

Sync warehouse-computed properties back to Mixpanel or Amplitude:

- Send LTV, cohort assignments, or segment labels as user properties.
- Enables richer segmentation in product analytics without tracking these values client-side.

## Census vs. Hightouch Comparison

| Aspect | Census | Hightouch |
|--------|--------|-----------|
| Core strength | Data governance, live syncs | Audience building, marketer-friendly |
| Visual audience builder | Audience Hub | Customer Studio |
| Self-serve for marketers | Good | Better (more visual) |
| Live/real-time syncs | Yes (CDC-based) | Limited |
| Match boosting | No | Yes |
| AI recommendations | No | Yes |
| Governance features | Strong (PII detection, audit logs) | Good |
| Destination count | 200+ | 150+ |
| Pricing | Based on synced records | Based on synced records |

## Implementation Best Practices

### Data Model Preparation

1. **Build clean dbt models first.** Reverse ETL should sync trusted, transformed data, not raw tables.
2. **Include a sync key.** Every model needs a unique, stable identifier (email, user_id, account_id).
3. **Denormalize for the destination.** CRM tools expect flat records, not normalized schemas.
4. **Handle nulls explicitly.** Decide whether null means "clear the field" or "do not update."

### Sync Configuration

1. **Start with upsert.** It is the safest behavior for most use cases.
2. **Use incremental syncs.** Only sync changed records to reduce warehouse costs and API calls.
3. **Set appropriate schedules.** Not everything needs real-time. Most CRM syncs work fine hourly or daily.
4. **Monitor sync health.** Set up alerts for failed syncs, rejected records, and rate limit errors.

### Governance

1. **Define who can create syncs.** Not everyone should be able to push data to production CRM.
2. **Audit what data flows where.** Especially PII flowing to third-party tools.
3. **Document every sync.** What model, what destination, what fields, why.
4. **Test in sandbox first.** Salesforce and HubSpot have sandbox environments. Use them.

## Common Pitfalls

1. **Syncing raw data instead of clean models.** Always sync from dbt marts, not staging or raw tables.
2. **Overwriting manual CRM entries.** Sales reps update fields manually. Your sync overwrites them. Use "only update if warehouse value is not null" logic.
3. **Not handling rate limits.** CRM and ad platform APIs have rate limits. Large syncs can fail partway.
4. **Syncing too frequently.** Hourly syncs when daily would suffice waste warehouse compute and API quota.
5. **No monitoring.** A failed sync means stale data in production tools. Set up alerts.
6. **PII compliance.** Syncing user data to ad platforms requires consent. Ensure your consent management covers reverse ETL flows.
