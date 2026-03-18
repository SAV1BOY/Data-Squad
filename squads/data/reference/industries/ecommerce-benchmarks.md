# E-Commerce Benchmarks

## Overview

E-commerce benchmarks vary significantly by vertical, price point, and business model (DTC vs. marketplace vs. subscription box). This reference provides ranges by vertical so data teams can contextualize performance rather than rely on industry-wide averages. Sources include IRP Commerce, Littledata, Klaviyo, and Shopify benchmark reports.

---

## Conversion Rates

### Website Conversion Rate by Vertical

| Vertical | Bottom Quartile | Median | Top Quartile |
|----------|----------------|--------|--------------|
| Fashion/Apparel | 1.0% | 1.8% | 3.0% |
| Health & Beauty | 1.5% | 2.5% | 4.0% |
| Electronics | 0.8% | 1.5% | 2.5% |
| Food & Beverage | 2.0% | 3.5% | 5.5% |
| Home & Garden | 1.0% | 2.0% | 3.2% |
| Pet Supplies | 2.0% | 3.0% | 4.5% |

Mobile conversion rates are typically 40-60% of desktop rates. Track device-specific benchmarks separately.

### Add-to-Cart Rate

Overall median: 7-9%. Top quartile: 12%+. A large gap between add-to-cart and purchase indicates checkout friction. The ratio of purchase rate to add-to-cart rate (cart completion rate) should be above 30%.

---

## Average Order Value (AOV)

| Vertical | Bottom Quartile | Median | Top Quartile |
|----------|----------------|--------|--------------|
| Fashion/Apparel | $60 | $90 | $140 |
| Electronics | $120 | $200 | $350 |
| Health & Beauty | $35 | $55 | $85 |
| Home & Garden | $100 | $180 | $280 |
| Food & Beverage | $30 | $50 | $75 |

AOV varies dramatically by price point within vertical. Benchmark against competitors with similar product mix rather than the full vertical.

---

## Cart Abandonment

Overall cart abandonment rate: median 70%, range 65-80%. Abandonment by checkout step:

| Step | Typical Drop-off |
|------|-----------------|
| Cart to shipping info | 25-35% |
| Shipping info to payment | 15-25% |
| Payment to confirmation | 5-10% |

Top abandonment reasons: unexpected shipping costs (48%), required account creation (24%), complicated checkout (17%), concerns about payment security (11%).

---

## Return Rates

| Vertical | Median Return Rate |
|----------|-------------------|
| Fashion/Apparel | 20-30% |
| Electronics | 10-15% |
| Health & Beauty | 5-8% |
| Furniture/Home | 8-12% |
| Footwear | 25-35% |

Free returns increase purchase conversion by 15-25% but also increase return rates by 10-15 percentage points. Net impact must be measured at the margin level, not revenue level.

---

## Marketing Efficiency

### ROAS by Channel

| Channel | Bottom Quartile | Median | Top Quartile |
|---------|----------------|--------|--------------|
| Google Shopping | 2.5x | 4.0x | 7.0x |
| Meta (Facebook/Instagram) | 1.5x | 3.0x | 5.5x |
| Google Search (branded) | 8.0x | 15.0x | 25.0x+ |
| Google Search (non-branded) | 1.5x | 3.0x | 5.0x |
| Email (owned) | 20x | 35x | 50x+ |

Branded search ROAS is misleading — these users already know the brand. Evaluate non-branded and prospecting channels separately.

### Email Engagement

| Metric | Bottom Quartile | Median | Top Quartile |
|--------|----------------|--------|--------------|
| Open rate | 15% | 22% | 30% |
| Click-through rate | 1.0% | 2.5% | 4.5% |
| Revenue per email sent | $0.03 | $0.08 | $0.15 |
| List growth rate (monthly) | 1% | 3% | 6% |

Post-purchase flows and abandonment emails outperform broadcast by 3-5x on revenue per email.

---

## Retention and Repeat Purchase

### Repeat Purchase Rate

| Timeframe | Bottom Quartile | Median | Top Quartile |
|-----------|----------------|--------|--------------|
| 90-day | 10% | 20% | 32% |
| 365-day | 18% | 30% | 45% |

Subscription models (auto-replenishment) achieve 60-80% 365-day repeat rates.

### Retention Curve Shape

First-to-second purchase is the largest drop. Customers who make a third purchase have 3-5x higher lifetime value than one-time buyers. Focus retention efforts on converting first-time buyers to second purchase.

---

## Common Pitfalls

1. **Benchmarking against cross-vertical averages.** A 2% conversion rate is poor for food & beverage but strong for electronics.
2. **Reporting gross revenue without returns.** Net revenue after returns is the true performance indicator.
3. **Ignoring shipping cost in AOV.** Free shipping thresholds inflate AOV artificially.
4. **Comparing ROAS across channels without incrementality testing.** Branded search cannibalizes organic; email often captures demand created elsewhere.
5. **Using session-level conversion rates for user-level decisions.** Multi-session purchase journeys distort session conversion benchmarks.

---

## Cross-References

- **E-Commerce Data Playbook** (`reference/industries/ecommerce-data-playbook.md`) — Full analytics playbook.
- **Attribution Quality Checklist** (`checklists/attribution-quality.md`) — Multi-touch attribution validation.

---

*Version: 1.0 | Last updated: 2026-03-18*
