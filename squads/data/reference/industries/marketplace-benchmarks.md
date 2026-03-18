# Marketplace Benchmarks

## Overview

Marketplace businesses have unique dynamics: they must balance supply and demand, manage two-sided network effects, and monetize transactions without alienating either side. Benchmarks differ substantially between managed marketplaces (Instacart), peer-to-peer (Airbnb), and B2B marketplaces (Faire). Sources include a16z, NFX, Bessemer, and Version One marketplace analyses.

---

## Take Rate

Take rate is the percentage of GMV captured as revenue. It reflects the value the marketplace provides and the competitive alternatives available.

| Marketplace Type | Bottom Quartile | Median | Top Quartile |
|-----------------|----------------|--------|--------------|
| Services (local) | 10% | 15% | 25% |
| Physical goods | 8% | 12% | 18% |
| Digital goods | 15% | 25% | 35% |
| B2B wholesale | 3% | 6% | 10% |
| Food delivery | 15% | 22% | 30% |

High take rates are sustainable only when the marketplace provides significant value (demand generation, logistics, trust, payment processing). If alternatives exist, sellers will disintermediate.

---

## GMV Growth

### Annual GMV Growth by Stage

| Stage | Bottom Quartile | Median | Top Quartile |
|-------|----------------|--------|--------------|
| Pre-product-market-fit | — | — | — |
| $1M-$10M GMV | 80% | 150% | 300%+ |
| $10M-$100M GMV | 40% | 80% | 150% |
| $100M-$1B GMV | 25% | 50% | 80% |
| $1B+ GMV | 10% | 25% | 40% |

Early-stage marketplace growth is often lumpy because geographic or category expansion drives step-function increases rather than smooth curves.

---

## Liquidity Metrics

Liquidity is the probability that a participant completes a transaction successfully. It is the core health metric for any marketplace.

### Supply-Side Liquidity

- **Seller utilization rate:** Percentage of listed supply that transacts within a period. Healthy: 30-60% monthly.
- **Time-to-first-sale:** Median time from listing to first transaction. Best-in-class: under 7 days. If above 30 days, supply-side churn will be high.
- **Idle supply:** Percentage of active listings with zero transactions in 90 days. Above 40% indicates oversupply or poor matching.

### Demand-Side Liquidity

- **Search-to-fill rate:** Percentage of searches that result in a transaction. Mature marketplaces: 15-30%.
- **Zero-result rate:** Percentage of searches with no available supply. Should be below 10%.
- **Time-to-purchase:** Median time from first search to completed transaction.

---

## Retention Metrics

### Buyer Retention

| Period | Bottom Quartile | Median | Top Quartile |
|--------|----------------|--------|--------------|
| Month 1 (M1) | 15% | 25% | 40% |
| Month 6 | 8% | 15% | 28% |
| Month 12 | 5% | 12% | 22% |

Repeat purchase rate (12-month): median 30%, top quartile 50%+. Marketplaces with consumable or recurring needs (food, cleaning services) have higher repeat rates.

### Seller Retention

Annual seller retention: median 60%, top quartile 80%. Seller retention is directly correlated with earnings velocity. Sellers who earn within the first 14 days have 3x higher 12-month retention.

---

## Supply-Demand Balance

### Key Ratios

- **Buyer-to-seller ratio:** Varies by category. Services: 5-15 buyers per provider. Goods: 50-200 buyers per seller.
- **Listings per seller:** Median 3-8 for goods marketplaces. More than 50 suggests aggregator/arbitrage behavior.
- **Concentration risk:** If the top 10% of sellers drive more than 60% of GMV, the marketplace has dangerous supply concentration.

### Geographic Density

For local marketplaces, density matters more than total users. Measure active supply per geographic unit (ZIP code, neighborhood) rather than total supply. A marketplace with 10,000 sellers in one city outperforms one with 10,000 sellers spread across 50 cities.

---

## Unit Economics

### Contribution Margin

| Component | Typical Range |
|-----------|--------------|
| Take rate revenue | 10-25% of GMV |
| Payment processing | -2.5 to -3.5% of GMV |
| Support/trust & safety | -1 to -3% of GMV |
| Fraud/chargebacks | -0.3 to -1% of GMV |
| Net contribution | 5-18% of GMV |

### Customer Acquisition Cost

Marketplace CAC must be evaluated per side. Demand-side CAC: median $15-40 for consumer, $100-500 for B2B. Supply-side CAC: often lower due to organic acquisition, median $10-30 for consumer, $50-200 for B2B.

---

## Common Pitfalls

1. **Reporting GMV as revenue.** GMV is transaction volume; revenue is GMV multiplied by take rate.
2. **Ignoring supply-side metrics.** Most marketplace failures are supply problems, not demand problems.
3. **Measuring national liquidity instead of local.** A marketplace can have high aggregate liquidity and zero liquidity in most geographies.
4. **Subsidizing both sides simultaneously.** Burning cash on both buyer and seller subsidies without improving organic matching is unsustainable.
5. **Using average take rate when rate varies by category.** Shift in GMV mix changes blended take rate without any pricing change.

---

## Cross-References

- **Marketplace Data Playbook** (`reference/industries/marketplace-data-playbook.md`) — Full analytics playbook.
- **Activation Funnel Quality Checklist** (`checklists/activation-funnel-quality.md`) — First-transaction funnel analysis.

---

*Version: 1.0 | Last updated: 2026-03-18*
