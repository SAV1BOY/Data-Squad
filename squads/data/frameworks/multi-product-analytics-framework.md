# Multi-Product Analytics Framework

## Overview

Multi-product analytics addresses the measurement challenges that arise when an organization offers more than one product, service, or platform. It encompasses cross-sell analysis, portfolio health assessment, cannibalization detection, and the unique complexities of measuring success across interconnected product ecosystems.

For data squads, multi-product analytics is significantly harder than single-product analytics because user journeys span products, success metrics may conflict between products, and portfolio-level optimization requires balancing individual product growth against collective value.

## Origin

Multi-product analytics practices were pioneered by platform companies (Amazon, Google, Microsoft, Apple) and diversified SaaS businesses (Salesforce, Adobe, HubSpot) that needed to understand how their products interacted in the market and within customer accounts. The field draws from portfolio management theory in finance, product line analysis in consumer goods, and platform economics in technology.

As more companies adopt multi-product strategies (either through internal development or acquisition), multi-product analytics has shifted from a niche concern to a core data squad competency.

## Key Concepts

### Cross-Product User Journey

In a multi-product company, the user journey extends across products:
- Which product do users adopt first? (Entry product)
- What is the typical sequence of product adoption? (Cross-sell pathway)
- How long between adopting the first and second product? (Cross-sell velocity)
- Does adopting multiple products change retention in each? (Portfolio retention effect)

Mapping these journeys reveals natural cross-sell opportunities and helps product and marketing teams target the right customers with the right product at the right time.

### Cross-Sell Metrics

- **Cross-sell rate** -- Percentage of customers using Product A who also adopt Product B within a given period
- **Cross-sell velocity** -- Median time from first product adoption to second product adoption
- **Products per customer** -- Average number of products used per customer. Track over time and by cohort.
- **Cross-sell revenue contribution** -- Percentage of total revenue from customers using multiple products
- **Cross-sell conversion funnel** -- Awareness of other products -> consideration -> trial -> adoption

### Portfolio Health Metrics

Beyond individual product metrics, assess the health of the portfolio as a whole:

- **Portfolio revenue mix** -- Revenue contribution by product. Over-concentration in one product is a risk.
- **Portfolio growth balance** -- Are all products growing, or is growth concentrated? Identify products in growth, maturity, and decline phases.
- **Portfolio NRR** -- Net revenue retention at the customer level across all products. A customer who churns one product but expands another is different from one who churns entirely.
- **Customer health across products** -- Aggregate engagement scores that account for usage across the full portfolio.

### Cannibalization Analysis

When products overlap in functionality or target audience, they may cannibalize each other:

- **Revenue cannibalization** -- Does launching Product B reduce Product A's revenue? Measure by comparing Product A's performance in markets where Product B is and is not available.
- **User cannibalization** -- Do Product B users come from Product A's prospect pool, or from new market segments?
- **Feature cannibalization** -- Does a feature in the free product reduce the incentive to upgrade to the paid product?

Cannibalization is not always bad. If Product B cannibalizes Product A but generates more total value (higher LTV, larger market), the portfolio benefits even if Product A shrinks.

### Bundling and Packaging Analytics

Multi-product companies must decide how to package products:

- **Individual pricing** -- Each product priced separately. Maximizes flexibility but complicates cross-sell.
- **Bundles** -- Products sold together at a discount. Increases multi-product adoption but may reduce revenue per product.
- **Tiered packages** -- Different tiers include different product combinations. Balances simplicity and value.

Analytics to inform packaging decisions:
- Willingness-to-pay analysis by product combination
- Bundle adoption rate vs. individual adoption rate
- Revenue per customer under different packaging models
- Churn rate by package type

### Shared Identity and Data Model

Multi-product analytics requires a unified customer identity:
- A single customer may have separate accounts in each product. Identity resolution must connect them.
- User-level vs. account-level vs. organization-level analytics may produce different pictures.
- Shared dimensions (company, industry, plan) must be consistent across products.

Without unified identity, multi-product analytics is impossible. With incorrect identity resolution, it is worse than impossible -- it is misleading.

### Platform Effects

In platform businesses where products interact (e.g., a CRM that integrates with a marketing tool that connects to a support tool), cross-product usage creates network effects:
- Users of multiple products may retain better because switching costs are higher
- Integrations between products create additional value that single-product users do not experience
- Platform lock-in is both a retention mechanism and a potential customer satisfaction risk

Measure the incremental retention and expansion effect of multi-product adoption to quantify platform value.

## Application to Data Squad

### Unified Customer Data Model

Build a customer data model that spans all products:
- Unified customer identity (resolved across products)
- Product-level engagement metrics for each product
- Account-level aggregate metrics across all products
- Revenue attribution by product and by customer

This model is the foundation for all multi-product analytics.

### Cross-Sell Dashboard

Build a dashboard showing:
- Cross-sell rates between all product pairs
- Cross-sell funnel by product combination
- Revenue concentration by number of products used
- Retention rate by number of products used
- Top cross-sell opportunities (customers likely to adopt a second product)

### Cannibalization Monitoring

Establish monitoring for cannibalization signals:
- Track Product A's metrics (growth, usage, retention) before and after Product B's launch
- Segment Product B adopters by whether they were existing Product A users, new customers, or competitive wins
- Alert when Product A's new customer rate declines coincident with Product B's growth

### Portfolio Health Review

Conduct quarterly portfolio health reviews that examine each product's contribution to the portfolio and the interactions between products. This replaces product-by-product reviews, which miss the interdependencies.

### Pricing and Packaging Experimentation

Run experiments on pricing and packaging using Kohavi's experimentation principles:
- Test bundle vs. individual pricing for new customers
- Test cross-sell offers at different points in the customer lifecycle
- Measure long-term retention, not just short-term conversion, to avoid optimizing for immediate revenue at the expense of lifetime value

### Customer Journey Mapping Across Products

Map the actual customer journey across products, identifying:
- Natural adoption sequences
- Friction points in cross-product transitions
- Integration adoption rates (are customers connecting their products?)
- Points of abandonment in cross-sell funnels

## Pitfalls

### Product Silos in Analytics

Separate analytics teams for each product that do not share data, definitions, or insights. Multi-product analytics requires a unified analytical view, which requires organizational coordination.

### Forcing Cross-Sell

Pushing cross-sell aggressively can damage the primary product relationship. A customer who is happy with Product A but pestered to buy Product B may churn from A entirely. Measure cross-sell impact on primary product satisfaction and retention.

### Double-Counting Revenue

When products are bundled, attributing revenue to individual products is ambiguous. Establish clear attribution rules and apply them consistently. Avoid claiming the same revenue in multiple product dashboards.

### Identity Resolution Errors

Incorrect identity resolution (merging different customers or failing to connect the same customer) corrupts all multi-product metrics. Invest in identity resolution quality and monitor it continuously.

### Ignoring Portfolio-Level Optimization

Optimizing each product individually may harm the portfolio. A pricing decision that maximizes Product A's revenue may reduce cross-sell to Product B, lowering total customer value. Portfolio-level analysis must inform individual product decisions.

## Cross-References

- **product-analytics-framework.md** -- Single-product analytics foundations that extend to multi-product contexts
- **revenue-analytics-framework.md** -- MRR, churn, and NRR calculations become more complex in multi-product settings
- **marketing-analytics-framework.md** -- Cross-sell marketing requires adapted attribution models
- **definition-layer.md** -- Multi-product requires reconciled metric definitions across products
- **collection-layer.md** -- Unified data models require integration across product data sources
- **governance-layer.md** -- Cross-product data governance and identity resolution governance
- **kohavi-online-experiments.md** -- Experimentation for pricing and packaging decisions
