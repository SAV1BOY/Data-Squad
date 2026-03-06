# Marketplace Data Playbook

## Overview

Marketplaces connect supply (sellers, providers, hosts) with demand (buyers,
consumers, guests). The core analytical challenge is managing a two-sided
network where value depends on balance. Too much supply with insufficient
demand leads to provider churn; too much demand without supply leads to poor
customer experience. Data teams in marketplaces must track both sides
simultaneously and optimize for the health of the ecosystem, not just one side.

---

## Core Metrics

### Volume and Value Metrics

**GMV (Gross Merchandise Value):** Total value of transactions processed through
the marketplace. GMV is a vanity metric if not paired with take rate and net
revenue. A marketplace can grow GMV while losing money on each transaction.

**Net Revenue:** GMV multiplied by take rate, minus refunds, chargebacks, and
provider payouts. This is the actual revenue the marketplace earns.

**Take Rate:** Net revenue divided by GMV. Represents the marketplace's
commission or fee percentage. Track take rate trends — declining take rate
under competitive pressure is an early warning sign.

### Liquidity Metrics

**Liquidity:** The probability that a listing results in a transaction within a
defined time window. This is the single most important marketplace health
metric. Variations include:
- **Search-to-fill rate:** Percentage of searches that lead to a transaction.
- **Listing-to-transaction rate:** Percentage of listings that result in a sale.
- **Time-to-transaction:** Median time from listing creation to first sale.

**Supply-Demand Ratio:** Available supply divided by active demand, by market
segment and geography. Imbalances indicate where to focus acquisition efforts.

### Supply-Side Metrics

**Provider Activation Rate:** Percentage of new providers who complete their
first transaction within N days.

**Provider Retention:** Percentage of active providers who remain active over
successive periods. Segment by provider size and tenure.

**Provider Concentration:** What percentage of GMV comes from the top 10% of
providers? High concentration creates platform risk.

### Demand-Side Metrics

**Buyer Conversion Rate:** Percentage of visitors who complete a purchase.
Funnel analysis from search to browse to cart to purchase.

**Repeat Purchase Rate:** Percentage of buyers who transact again within N days.
Track whether buyers return to the same providers or discover new ones.

**Buyer NPS / Satisfaction:** Post-transaction satisfaction scores, segmented
by category and provider quality.

---

## Key Analytical Patterns

### Two-Sided Cohort Analysis

Unlike single-sided businesses, marketplaces need parallel cohort analyses:
- Supply cohorts: Provider signup month vs. GMV contribution, retention, quality
- Demand cohorts: Buyer first-purchase month vs. repeat rate, AOV, channel

The interaction between supply and demand cohorts matters: new buyer retention
is highly dependent on supply quality and availability at the time of their
first experience.

### Market-Level Analysis

Most marketplaces operate across multiple local or category markets. Aggregate
metrics hide critical variation. Analyze each market for:
- Local supply-demand balance
- Local liquidity rates
- Market maturity stage (launching, growing, mature, saturated)
- Investment priority (where does incremental supply or demand have the most
  impact on liquidity?)

### Network Effects Measurement

The core value proposition of a marketplace is network effects. Measure them:
- Does adding one more provider measurably improve buyer conversion?
- Does adding one more buyer measurably improve provider retention?
- At what density do network effects plateau in a given market?

---

## Common Pitfalls

1. **Optimizing one side at the expense of the other.** Aggressive buyer
   acquisition without sufficient supply leads to poor first experiences and
   negative word of mouth.
2. **GMV as a North Star.** GMV growth can mask declining take rates,
   increasing refunds, or provider subsidies. Net revenue is the real metric.
3. **Ignoring provider quality.** High supply quantity with low quality
   destroys buyer trust. Track quality metrics (ratings, return rates,
   response times) alongside volume.
4. **Uniform take rate analysis.** Take rates vary by category, provider
   size, and payment method. Blended take rate hides margin differences.
5. **Assuming national-level metrics apply locally.** A marketplace can be
   liquid in Sao Paulo and illiquid in Curitiba. National averages are
   misleading for local operational decisions.

---

## Cross-References

- **Activation Funnel Quality Checklist** (`checklists/activation-funnel-quality.md`) — Both supply and demand activation.
- **Retention Quality Checklist** (`checklists/retention-quality.md`) — Two-sided retention analysis.
- **LTV/CLV Model Quality Checklist** (`checklists/ltv-clv-model-quality.md`) — CLV for both buyers and providers.
- **Attribution Quality Checklist** (`checklists/attribution-quality.md`) — Acquisition channel attribution per side.

---

*Version: 1.0 | Last updated: 2026-03-06*
