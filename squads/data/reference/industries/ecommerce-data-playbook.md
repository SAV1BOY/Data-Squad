# E-Commerce Data Playbook

## Overview

E-commerce analytics centers on the purchase funnel, repeat purchase behavior,
and marketing efficiency. Unlike SaaS, revenue is transactional rather than
recurring, which makes customer lifetime value harder to model and attribution
more critical. The margin between profitable and unprofitable growth is often
razor-thin, making data quality a competitive advantage.

---

## Core Metrics

### Transaction Metrics

**AOV (Average Order Value):** Total revenue divided by number of orders. Track
AOV trends over time and by segment. Rising AOV can mask declining order volume;
always report both.

**Purchase Frequency:** Average number of orders per customer over a defined
period. Segment by first-purchase cohort and acquisition channel. A small
increase in purchase frequency often has a larger LTV impact than the same
increase in AOV.

**Conversion Rate:** Sessions (or visitors) that result in a completed purchase.
Segment by traffic source, device, new vs. returning, and landing page. Beware
of denominator choice — sessions vs. users vs. unique visitors all yield
different rates.

**Cart Abandonment Rate:** Percentage of users who add items to cart but do not
complete purchase. Industry average is 65-75%. Segment by step in checkout
(address, shipping, payment) to find specific friction points.

### Customer Metrics

**CLV (Customer Lifetime Value):** In non-contractual e-commerce, CLV is harder
to estimate than in SaaS because there is no explicit churn event. Use
probabilistic models (BG/NBD + Gamma-Gamma) or historical cohort analysis.

**Repeat Purchase Rate:** Percentage of first-time buyers who make a second
purchase within a defined window (typically 90 or 365 days). This is the
single most important retention metric in e-commerce.

**Customer Acquisition Cost (CAC):** Total marketing spend divided by new
customers acquired. In e-commerce, CAC varies dramatically by channel and must
be compared against first-order contribution margin, not just AOV.

**RFM Segmentation:** Recency, Frequency, Monetary value scoring to segment
customers for targeted marketing. Simple but effective when combined with
lifecycle stage.

### Inventory and Operations Metrics

**Sell-Through Rate:** Units sold divided by units received, by period. Indicates
inventory health and demand accuracy.

**Return Rate:** Percentage of orders returned. Track by product category, SKU,
and reason code. High return rates erode margin and may indicate product
listing quality issues.

---

## Key Analytical Patterns

### Attribution Modeling

E-commerce typically involves multi-touch customer journeys across paid search,
social, email, organic, and direct channels. Key practices:
- Run incrementality tests for top-spending channels quarterly
- Use blended CAC (total marketing / total new customers) as a sanity check
- Track self-reported attribution ("how did you hear about us?")
- Be skeptical of platform-reported ROAS — each platform takes full credit

### Cohort-Based LTV Analysis

Track revenue by first-purchase month cohort:
- Cumulative revenue per customer at 30, 60, 90, 180, 365 days
- Repeat purchase rate by cohort
- AOV progression (does AOV increase with purchase number?)
- Channel-level cohort performance (which channels produce high-LTV customers?)

### Promotional Impact Analysis

Promotions drive short-term revenue but can erode margin and train customers
to wait for sales. Analyze:
- Incremental revenue vs. cannibalized revenue
- Margin impact (not just top-line)
- Pull-forward effect (did the promotion borrow from future periods?)
- Customer quality (do promo-acquired customers have lower LTV?)

---

## Common Pitfalls

1. **Optimizing for ROAS without margin.** A channel with 5x ROAS on a
   10% margin product is worse than 3x ROAS on a 50% margin product.
2. **Ignoring returns in revenue reporting.** Gross revenue looks great;
   net revenue after returns tells the truth.
3. **Session-based conversion rate masking user-level behavior.** A user may
   visit 5 times before purchasing. Session conversion is 20%; user
   conversion is 100%.
4. **Last-click attribution overvaluing branded search.** Users search your
   brand name to navigate to your site — branded search gets credit for
   conversions actually driven by other channels.
5. **Averaging across product categories.** A store selling both electronics
   (low margin, low frequency) and consumables (high margin, high frequency)
   needs category-level analysis.

---

## Cross-References

- **LTV/CLV Model Quality Checklist** (`checklists/ltv-clv-model-quality.md`) — Non-contractual CLV modeling.
- **Attribution Quality Checklist** (`checklists/attribution-quality.md`) — Multi-touch attribution validation.
- **Activation Funnel Quality Checklist** (`checklists/activation-funnel-quality.md`) — First-purchase funnel analysis.
- **Framing Effects in Reports** (`reference/psychology/framing-effects-in-reports.md`) — Gross vs. net revenue framing.

---

*Version: 1.0 | Last updated: 2026-03-06*
