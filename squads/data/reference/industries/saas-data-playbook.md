# SaaS Data Playbook

## Core Metrics

### Revenue Metrics

| Metric | Definition | Why It Matters |
|--------|-----------|----------------|
| **MRR** (Monthly Recurring Revenue) | Sum of all recurring subscription revenue, normalized to monthly | Primary revenue health indicator |
| **ARR** (Annual Recurring Revenue) | MRR x 12 | Standard metric for annual planning and valuation |
| **New MRR** | MRR from new customers acquired in the period | Measures acquisition engine effectiveness |
| **Expansion MRR** | Additional MRR from existing customers (upgrades, add-ons) | Measures land-and-expand success |
| **Contraction MRR** | Lost MRR from downgrades (customer still active) | Early warning for churn |
| **Churned MRR** | Lost MRR from cancelled customers | Direct revenue loss |
| **Net New MRR** | New + Expansion - Contraction - Churned | Overall revenue momentum |

### MRR Waterfall

Every month, decompose MRR changes:

```
Starting MRR: $500,000
  + New MRR:        $60,000
  + Expansion MRR:  $25,000
  - Contraction MRR: $8,000
  - Churned MRR:    $22,000
= Ending MRR: $555,000
  Net New MRR: $55,000
```

### Retention Metrics

| Metric | Definition | Benchmark |
|--------|-----------|-----------|
| **Gross Revenue Retention (GRR)** | (Starting MRR - Contraction - Churn) / Starting MRR | > 90% (SMB), > 95% (Enterprise) |
| **Net Revenue Retention (NRR)** | (Starting MRR + Expansion - Contraction - Churn) / Starting MRR | > 100% (healthy), > 120% (excellent) |
| **Logo Retention** | (Starting customers - Churned) / Starting customers | > 85% (SMB), > 95% (Enterprise) |
| **Dollar-Weighted Churn** | Churned MRR / Starting MRR | < 2% monthly |

NRR above 100% means your existing customer base grows even without new customers. This is the single most important SaaS metric for long-term sustainability.

### Customer Metrics

| Metric | Definition | Notes |
|--------|-----------|-------|
| **CAC** (Customer Acquisition Cost) | Total sales & marketing spend / New customers | Include all costs: salaries, tools, ads |
| **LTV** (Lifetime Value) | ARPU / Monthly churn rate (simplified) | Use cohort-based LTV for accuracy |
| **LTV:CAC Ratio** | LTV / CAC | Target > 3:1 |
| **CAC Payback** | CAC / (ARPU x Gross Margin) | Target < 12 months |
| **ACV** (Annual Contract Value) | Average annual value per customer | Track by segment |
| **ARPU** (Avg Revenue Per User) | MRR / Active customers | Track trend, not just snapshot |

## Cohort Analysis

### Revenue Cohorts

Group customers by signup month and track their cumulative revenue over time:

| Cohort | Month 0 | Month 3 | Month 6 | Month 12 |
|--------|---------|---------|---------|----------|
| 2024-01 | $100K | $280K | $520K | $980K |
| 2024-04 | $120K | $340K | $610K | $1.1M |
| 2024-07 | $95K | $260K | $480K | -- |

**What to look for:**
- Are newer cohorts performing better than older ones? (Improving product-market fit)
- Do cohorts expand over time, or stay flat? (Expansion effectiveness)
- When does cohort MRR start declining? (Churn timing)

### Engagement Cohorts

Track product engagement by signup cohort:

- Week 1 activation rate: Did users reach the "aha moment"?
- 30-day feature adoption: How many core features are used?
- DAU/MAU ratio by cohort: Are users engaged or just logged in?

### Churn Cohorts

Track when customers churn relative to their start date:

- Month 1-3: Onboarding failure. Fix the first-run experience.
- Month 4-6: Value realization failure. The user never found the core value.
- Month 7-12: Competitive loss or changing needs. Investigate win/loss.
- Month 13+: Renewal decision. Contract terms and negotiation matter.

## SaaS Data Architecture

### Key Data Sources

| Source | Data |
|--------|------|
| Billing system (Stripe, Chargebee, Recurly) | Subscriptions, invoices, payments, MRR |
| CRM (Salesforce, HubSpot) | Pipeline, deals, contacts, account metadata |
| Product analytics (Mixpanel, Amplitude, GA4) | Feature usage, engagement, activation events |
| Support (Zendesk, Intercom) | Tickets, CSAT, first response time |
| CS platform (Gainsight, Vitally) | Health scores, playbook outcomes |

### Recommended dbt Models

```
staging/
  stg_stripe_subscriptions.sql
  stg_stripe_invoices.sql
  stg_salesforce_opportunities.sql
  stg_product_events.sql

intermediate/
  int_mrr_movements.sql          -- Classify MRR changes
  int_user_engagement_daily.sql  -- Daily engagement per user

marts/
  fct_mrr_monthly.sql            -- MRR waterfall by month
  fct_subscription_events.sql    -- Subscription lifecycle events
  dim_customers.sql              -- Customer attributes
  fct_cohort_retention.sql       -- Cohort-based retention
  fct_user_engagement_monthly.sql -- Monthly engagement
```

## Key Dashboards

### Executive Dashboard

- MRR trend (line chart, 12 months)
- MRR waterfall (current month)
- NRR and GRR (monthly trend)
- New customers and CAC payback
- NPS trend

### Product Dashboard

- DAU/WAU/MAU trends
- Feature adoption heatmap
- Activation funnel (signup to aha moment)
- Engagement by plan tier

### Revenue Operations Dashboard

- Pipeline by stage and expected close date
- Win rate trends
- ACV distribution
- Sales cycle length
- Quota attainment

### Customer Success Dashboard

- Health score distribution (green/yellow/red)
- Upcoming renewals (next 90 days) with health status
- Expansion pipeline
- Churn reasons analysis

## Common SaaS Analytics Mistakes

1. **Calculating MRR from invoices instead of subscriptions.** Invoices include one-time charges, prorations, and timing differences. Use subscription data.
2. **Not segmenting metrics by plan/tier.** SMB and Enterprise behave differently. Blended metrics hide problems.
3. **Ignoring contraction.** A customer who downgrades is sending a warning signal about future churn.
4. **Using simple LTV formulas for complex products.** Cohort-based LTV is more accurate than ARPU/churn rate for products with expansion revenue.
5. **Conflating user-level and account-level metrics.** A B2B product should track both: user engagement (product health) and account-level revenue (business health).
6. **Not connecting product usage to revenue outcomes.** The most valuable analysis links specific product behaviors to retention and expansion.

## Quick Wins

1. Build the MRR waterfall first. It is the single most informative view of SaaS business health.
2. Calculate NRR by cohort. It reveals whether your product is getting better at retaining and expanding customers.
3. Define and track the activation metric. The leading indicator of retention is whether users reach the aha moment quickly.
4. Segment everything by plan tier and acquisition channel. Blended metrics average away problems and opportunities.
