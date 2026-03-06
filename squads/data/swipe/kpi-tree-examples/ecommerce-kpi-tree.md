# E-Commerce KPI Tree: Revenue -> AOV x Frequency x Customers

Real-world examples of e-commerce companies decomposing revenue into actionable drivers.

---

## 1. Stitch Fix - Revenue Decomposition Tree

**Company/Context:** Stitch Fix (2019). As a subscription-style e-commerce business, they needed a KPI tree that reflected their unique model of curated "Fixes" shipped to customers.

**What They Did:**
- Level 0: Revenue
- Level 1: Active clients x Fixes per client per year x Revenue per Fix
- Level 2 (Active clients): New clients acquired + Returning clients - Churned clients. New clients decomposed into: marketing-driven (paid + referral) and organic (word of mouth + press).
- Level 2 (Fixes per client per year): Fix frequency (how often a client requests a Fix) x Fix acceptance rate (% of Fixes the client actually opens/keeps items from).
- Level 2 (Revenue per Fix): Items per Fix x Keep rate x Average item price. Keep rate decomposed by category (tops, bottoms, accessories, shoes).
- A "styling accuracy" metric bridged product quality to revenue: better style matches increased keep rate, which increased revenue per Fix.

**Metrics Used:** Active clients, Fix frequency, Fix acceptance rate, items per Fix, keep rate, average item price, styling accuracy score.

**What Worked:** The tree revealed that keep rate was the highest-leverage metric -- a 5% improvement in keep rate flowed directly to a 5% revenue increase with zero incremental customer acquisition cost. The team invested heavily in recommendation algorithm improvements.

**What Failed:** Initially treated all active clients equally. Adding a recency dimension (clients who received a Fix in the last 90 days vs. 90-180 days vs. 180+ days) revealed that 30% of "active" clients were effectively dormant and needed reactivation campaigns.

**Lessons:** For subscription e-commerce, the quality metric (keep rate, satisfaction, match accuracy) is often the highest-leverage branch. Define "active" with recency thresholds.

**Application to Data Squad:** In e-commerce KPI trees, identify the quality/satisfaction metric that multiplies revenue without incremental acquisition cost. Add recency-based definitions of "active."

---

## 2. Shopify Merchants - Standard Merchant Revenue Tree

**Company/Context:** Shopify (2020). Shopify provided merchants with a standard KPI tree framework through their analytics platform to help merchants understand their revenue drivers.

**What They Did:**
- Level 0: Gross Merchandise Value (GMV)
- Level 1: Traffic x Conversion Rate x AOV
- Level 2 (Traffic): Organic search + Paid ads + Email + Social + Direct. Each channel tracked visits, cost per visit, and trend.
- Level 2 (Conversion Rate): Product page view rate x Add-to-cart rate x Checkout initiation rate x Checkout completion rate. Each step segmented by device (mobile vs. desktop).
- Level 2 (AOV): Items per order x Average unit price. Items per order influenced by: cross-sell recommendations, bundle offers, free shipping threshold.
- Level 3: Free shipping threshold set at 1.3x current AOV drove +18% AOV lift on average across Shopify merchants.

**Metrics Used:** GMV, traffic by channel, 4-step conversion funnel, AOV, items per order, cart abandonment rate, free shipping threshold effect.

**What Worked:** The 4-step conversion funnel decomposition revealed that mobile checkout completion was 40% lower than desktop. Shopify's Shop Pay (accelerated checkout) improved mobile completion by 30%, showing up directly in the KPI tree.

**What Failed:** The tree initially didn't distinguish new vs. returning customer economics. Adding customer type as a dimension showed that returning customers had 2x higher conversion rate and 1.3x higher AOV but were being underinvested in relative to new customer acquisition.

**Lessons:** E-commerce KPI trees must segment by new vs. returning customer. The conversion rate branch almost always reveals the biggest opportunity when decomposed by device and step.

**Application to Data Squad:** For e-commerce clients, always build the 4-step conversion funnel segmented by device. Add new vs. returning customer as a dimension across all branches.

---

## 3. Chewy - Subscription and One-Time Purchase Tree

**Company/Context:** Chewy (2020). With both subscription (Autoship) and one-time purchase revenue, they needed a tree that captured the different economics of each.

**What They Did:**
- Level 0: Total Revenue
- Level 1: Autoship Revenue (70% of total) + One-Time Revenue (30% of total)
- Level 2 (Autoship): Autoship subscribers x Average order value x Order frequency (typically every 4-8 weeks). Subscribers decomposed into: new Autoship enrollments - Autoship cancellations + reactivations.
- Level 2 (One-Time): Customers x Orders per customer x AOV. One-time segmented into: first-time buyers and repeat one-time buyers.
- Bridge metric: Autoship conversion rate (% of one-time buyers who enrolled in Autoship within 90 days). This was the single most important growth lever.

**Metrics Used:** Autoship revenue share, Autoship enrollment rate, Autoship churn rate, one-time-to-Autoship conversion, AOV by purchase type, order frequency.

**What Worked:** The tree made explicit that the one-time-to-Autoship conversion rate was the highest-leverage metric. A 1% improvement generated more incremental revenue than a 10% increase in one-time traffic. The team focused on "first order to Autoship" conversion with targeted post-purchase emails and saved $15M in annual marketing spend.

**What Failed:** Autoship AOV was initially treated as static, but it actually declined over time as customers optimized their orders (removed trial items, found cheaper alternatives). Adding an "AOV decay curve" by Autoship tenure month revealed this leak.

**Lessons:** When a business has recurring and non-recurring revenue, the conversion rate between them is usually the highest-leverage metric. Track recurring AOV over tenure to catch decay.

**Application to Data Squad:** For e-commerce clients with subscription/repeat models, the non-recurring-to-recurring conversion rate deserves a prominent branch. Track AOV trends by customer tenure.

---

## 4. Warby Parker - Omnichannel Revenue Tree

**Company/Context:** Warby Parker (2021). With both online and retail stores, they needed a KPI tree that captured cross-channel dynamics.

**What They Did:**
- Level 0: Total Revenue
- Level 1: Online Revenue + Retail Revenue + Cross-Channel Revenue (customers who used both)
- Level 2 (Online): Website visitors x Conversion rate x AOV. Conversion split into: Home Try-On conversion (shipped 5 frames, purchased at least 1) + Direct purchase conversion.
- Level 2 (Retail): Store traffic x Conversion rate x AOV. Traffic decomposed by source: walk-in, appointment, online-to-store (booked appointment online).
- Level 2 (Cross-Channel): Cross-channel customers x Annual spend. Cross-channel customers spent 2.5x more annually than single-channel.
- Home Try-On funnel: HTO requests, HTO shipped, HTO returned, HTO purchased (conversion rate ~50%).

**Metrics Used:** Revenue by channel, HTO conversion rate, cross-channel multiplier (2.5x), store traffic by source, online-to-store rate, annual spend by channel type.

**What Worked:** The 2.5x cross-channel spending multiplier justified the cost of retail expansion. The KPI tree made this relationship explicit and measurable. Online-to-store appointment booking became a key growth metric.

**What Failed:** Initially counted Home Try-On requests as a conversion metric, but 20% of requests never shipped (address issues, inventory). Tracking HTO "shipped and received" as the real start of the funnel improved accuracy.

**Lessons:** Omnichannel KPI trees must explicitly model the cross-channel multiplier effect to justify channel investments. Include the full funnel for unique conversion paths (like Home Try-On).

**Application to Data Squad:** For omnichannel clients, quantify the cross-channel spending multiplier and make it a first-class branch in the KPI tree.
