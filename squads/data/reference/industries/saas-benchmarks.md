# SaaS KPI Benchmarks

## Overview

SaaS benchmarks vary significantly by stage, vertical, and go-to-market motion. This reference provides benchmark ranges by company stage (ARR tier) so that data teams can contextualize metrics rather than chase a single "good" number. All figures are based on industry surveys and publicly available data from OpenView, Bessemer, KeyBanc, and SaaS Capital.

---

## Revenue Growth

### ARR Growth Rate

| ARR Tier | Bottom Quartile | Median | Top Quartile |
|----------|----------------|--------|--------------|
| < $1M | 50% | 100% | 200%+ |
| $1M - $10M | 30% | 60% | 100% |
| $10M - $50M | 20% | 40% | 70% |
| $50M - $100M | 15% | 30% | 50% |
| $100M+ | 10% | 20% | 35% |

Growth rates decelerate with scale. A company growing at 40% at $50M ARR is performing at the same percentile as one growing at 100% at $5M.

### Net Revenue Retention (NRR)

| Segment | Bottom Quartile | Median | Top Quartile |
|---------|----------------|--------|--------------|
| SMB-focused | 85% | 95% | 105% |
| Mid-market | 95% | 105% | 115% |
| Enterprise | 105% | 115% | 130% |

NRR above 100% means the company grows even without new customers. Enterprise products typically have higher NRR due to seat expansion and upsell motions.

### Expansion Revenue

Expansion revenue as a percentage of new ARR: median 30%, top quartile 45%. Companies with usage-based pricing components tend to have higher expansion rates (median 40%).

---

## Churn Metrics

### Gross Revenue Churn (Monthly)

| Segment | Bottom Quartile | Median | Top Quartile |
|---------|----------------|--------|--------------|
| SMB | 3.0% | 2.0% | 1.2% |
| Mid-market | 1.5% | 1.0% | 0.5% |
| Enterprise | 0.8% | 0.5% | 0.2% |

Monthly churn compounds aggressively. A 2% monthly churn rate means losing 21.5% of revenue annually.

### Logo Churn (Annual)

SMB: median 15-20%. Mid-market: median 8-12%. Enterprise: median 5-8%. Logo churn is always higher than revenue churn because smaller customers churn more frequently.

---

## Unit Economics

### CAC Payback Period (Months)

| ARR Tier | Bottom Quartile | Median | Top Quartile |
|----------|----------------|--------|--------------|
| < $10M | 18 | 12 | 6 |
| $10M - $50M | 24 | 18 | 12 |
| $50M+ | 28 | 20 | 14 |

Payback period under 12 months is considered efficient. Above 24 months signals a potential unit economics problem.

### CAC:LTV Ratio

Healthy range: 1:3 to 1:5. Below 1:3 suggests underinvestment in growth or poor retention. Above 1:5 may indicate underinvestment in acquisition.

### Gross Margin

SaaS gross margin median: 72%. Top quartile: 80%+. Infrastructure-heavy products (AI/ML, video) may have lower margins (55-65%) and should benchmark against peers rather than the overall SaaS median.

---

## Customer Satisfaction

### NPS

| Category | Below Average | Average | Above Average |
|----------|--------------|---------|---------------|
| B2B SaaS | < 20 | 20-40 | 40-60 |
| Best-in-class | — | — | 60+ |

NPS varies by category. Developer tools tend to have higher NPS than enterprise procurement-driven products.

---

## Operational Metrics

### Rule of 40

Growth rate + profit margin should exceed 40%. Median publicly traded SaaS: 32%. Top quartile: 50%+.

### Burn Multiple

Net burn / net new ARR. Below 1x is efficient. Between 1x and 2x is acceptable for high-growth companies. Above 2x signals inefficiency.

### Magic Number

Net new ARR / prior quarter sales and marketing spend. Above 1.0: invest more in sales. Between 0.5-1.0: healthy. Below 0.5: fix efficiency before scaling spend.

---

## Common Pitfalls

1. **Comparing SMB metrics to enterprise benchmarks.** Churn, NRR, and CAC payback differ dramatically by segment.
2. **Using annual churn when monthly churn compounds.** Always clarify the time period.
3. **Ignoring contraction in NRR calculations.** Downgrades are churn, not just cancellations.
4. **Benchmarking against outliers.** Top-decile companies are not representative targets.

---

## Cross-References

- **SaaS Data Playbook** (`reference/industries/saas-data-playbook.md`) — Full SaaS analytics playbook.
- **LTV/CLV Model Quality Checklist** (`checklists/ltv-clv-model-quality.md`) — LTV calculation methodology.

---

*Version: 1.0 | Last updated: 2026-03-18*
