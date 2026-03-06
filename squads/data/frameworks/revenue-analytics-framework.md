# Revenue Analytics Framework

## Overview

Revenue analytics measures the financial health and growth dynamics of a business through metrics like Monthly Recurring Revenue (MRR), churn, expansion, and customer lifetime value. For subscription and SaaS businesses, revenue analytics is the language of the boardroom -- it determines fundraising narratives, company valuation, and strategic resource allocation.

For data squads, revenue analytics requires the highest precision and governance because the numbers are scrutinized by executives, investors, and auditors. An error in a dashboard is embarrassing; an error in revenue reporting can be catastrophic.

## Origin

Revenue analytics for recurring business models was formalized by SaaS pioneers and the investor community in the 2000s-2010s. David Skok (Matrix Partners), Jason Lemkin (SaaStr), and Tomasz Tunguz (Redpoint) published extensively on SaaS metrics, establishing the vocabulary and benchmarks that the industry now uses. The framework below codifies these practices for data squad implementation.

## Key Concepts

### Monthly Recurring Revenue (MRR)

MRR is the normalized monthly revenue from all active subscriptions. It is the fundamental building block of SaaS revenue analytics.

**MRR components:**
- **New MRR** -- Revenue from newly acquired customers this month
- **Expansion MRR** -- Revenue increase from existing customers (upgrades, additional seats, add-ons)
- **Contraction MRR** -- Revenue decrease from existing customers (downgrades, seat reductions)
- **Churned MRR** -- Revenue lost from customers who cancelled
- **Reactivation MRR** -- Revenue from previously churned customers who returned

**Net New MRR** = New + Expansion + Reactivation - Contraction - Churned

A healthy SaaS business has positive Net New MRR every month, driven increasingly by Expansion rather than just New.

### Annual Recurring Revenue (ARR)

ARR = MRR x 12. Used for annual planning and valuation. For businesses with a mix of monthly and annual contracts, calculate ARR by annualizing each contract appropriately.

### Churn Metrics

**Logo churn rate** -- Percentage of customers who cancel in a period. Measures customer count loss.

**Revenue churn rate (Gross)** -- Percentage of MRR lost to downgrades and cancellations. Measures revenue loss.

**Net Revenue Retention (NRR)** -- (Starting MRR + Expansion - Contraction - Churn) / Starting MRR. If NRR > 100%, existing customers are growing faster than they are shrning, meaning the business grows even without new customer acquisition.

**NRR benchmarks:**
- < 90% -- Significant retention problem
- 90-100% -- Adequate for SMB; concerning for enterprise
- 100-120% -- Good; expansion offsets churn
- > 120% -- Excellent; strong product-market fit with expansion

### Customer Lifetime Value (LTV)

LTV estimates the total revenue a customer will generate over their relationship with the company:

**Simple formula:** LTV = ARPU / Churn Rate (monthly)
**More accurate:** LTV = ARPU x Gross Margin / Churn Rate
**Cohort-based:** Calculate actual cumulative revenue by cohort vintage. Most accurate but requires historical data.

LTV is used for:
- Evaluating acquisition channel efficiency (LTV:CAC ratio)
- Segmenting customers by value
- Forecasting revenue
- Setting pricing strategy

### Cohort Revenue Analysis

Track revenue metrics by customer cohort (signup month/quarter) to reveal trends:
- Is LTV improving for newer cohorts? (Product improvements working)
- Is time-to-expansion shortening? (Faster value realization)
- Is churn timing consistent? (Predictable vs. event-driven churn)

Cohort analysis is superior to aggregate metrics because it separates the performance of different customer vintages.

### Revenue Expansion Drivers

Expansion revenue comes from:
- **Seat expansion** -- Adding users within the account
- **Plan upgrades** -- Moving to a higher tier
- **Cross-sell** -- Purchasing additional products
- **Usage-based growth** -- Increasing consumption of metered resources

Understanding which drivers are dominant shapes the product and sales strategy for revenue growth.

### Unit Economics

- **LTV:CAC ratio** -- Target 3:1 or higher
- **CAC payback period** -- Months to recoup acquisition cost. Target 12-18 months for SaaS.
- **Gross margin** -- Revenue minus cost of goods sold (hosting, support, success). Target 70-80% for SaaS.
- **Revenue per employee** -- Efficiency metric. Varies by stage and model.

### Revenue Forecasting

Revenue forecasting for recurring businesses uses:
- **Bottoms-up forecasting** -- Apply expected churn, expansion, and new business rates to current MRR
- **Cohort-based forecasting** -- Project future revenue based on observed cohort revenue curves
- **Pipeline-based forecasting** -- For sales-driven businesses, forecast based on pipeline stage and conversion rates

Combine methods and report uncertainty ranges. Point forecasts create false precision.

## Application to Data Squad

### Revenue Data Architecture

Build a revenue data model that cleanly separates MRR components (new, expansion, contraction, churn, reactivation) by month and by customer. This requires:
- Subscription state tracking (start, change, cancel, reactivate events)
- Price normalization (annual contracts divided by 12)
- Edge case handling (mid-month changes, refunds, credits, trials)

### MRR Waterfall Dashboard

Build a waterfall chart showing how MRR flows from one month to the next: starting MRR, plus new and expansion, minus contraction and churn, equals ending MRR. This is the standard visualization for board-level revenue reporting.

### Churn Analysis Deep Dives

Build analytical capabilities for understanding churn:
- Churn by segment (plan, size, industry, acquisition channel)
- Churn timing (at what point in the customer lifecycle does churn concentrate?)
- Churn reasons (from cancellation surveys, support tickets, and CRM notes)
- Pre-churn behavioral signals (declining usage, support escalations, failed payments)

### Revenue Alert System

Automate alerts for:
- Unexpected churn spikes
- Expansion rate declines
- Large account downgrades or cancellations
- Revenue forecast deviation

### Investor-Grade Reporting

When preparing metrics for investors or board members, ensure:
- Definitions are explicit and consistent with industry standards
- Calculations are auditable
- Historical numbers are not retroactively changed without explanation
- Cohort views are included alongside aggregate views

### Revenue and Product Analytics Integration

Connect revenue metrics with product usage data. Which features are correlated with expansion? Which usage patterns predict churn? This integration enables the product team to build for revenue impact, not just engagement.

## Pitfalls

### Inconsistent MRR Definitions

MRR calculation has many edge cases (trials, discounts, multi-year contracts, usage-based components). Document every decision and apply it consistently. Inconsistency erodes trust in revenue reporting.

### Gross Churn Hiding Behind Net Retention

NRR can be above 100% while gross churn is high, masked by strong expansion from a small number of accounts. Report both gross churn and net retention to show the full picture.

### LTV Overestimation

Simple LTV formulas assume constant churn rates, which overestimates LTV for most businesses (churn is typically highest early in the customer lifecycle). Use cohort-based LTV when possible.

### Ignoring Revenue Quality

Not all revenue is equal. Revenue from annual prepaid contracts is more predictable than month-to-month. Revenue from diversified customers is more durable than concentration in a few large accounts. Report revenue quality alongside revenue quantity.

### Conflating Bookings, Revenue, and Cash

Bookings (contracts signed), revenue (recognized per accounting standards), and cash (money received) are different numbers with different timing. Data squads must be clear about which they are reporting.

## Cross-References

- **mcclure-pirate-metrics-original.md** -- Revenue is the fifth stage of the AARRR framework
- **marketing-analytics-framework.md** -- CAC and LTV:CAC connect revenue analytics to marketing analytics
- **product-analytics-framework.md** -- Product usage drives retention and expansion, connecting to revenue outcomes
- **collection-layer.md** -- Revenue data pipelines require high reliability and accuracy
- **governance-layer.md** -- Revenue metrics require the highest governance tier
- **taleb-antifragile-metrics.md** -- Revenue concentration and customer dependency are fragility indicators
- **definition-layer.md** -- MRR component definitions must be precise and universally applied
