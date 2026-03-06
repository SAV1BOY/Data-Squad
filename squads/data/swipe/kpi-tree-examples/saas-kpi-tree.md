# SaaS KPI Tree: MRR -> Drivers -> Inputs

Real-world examples of SaaS companies decomposing MRR into actionable driver trees.

---

## 1. Slack - MRR Decomposition Tree

**Company/Context:** Slack (2018-2019). The finance and growth teams needed a shared mental model connecting every team's work to MRR.

**What They Did:**
- Level 0: MRR
- Level 1: New MRR + Expansion MRR + Reactivation MRR - Contraction MRR - Churn MRR
- Level 2 (New MRR): New customers x average starting plan value. New customers decomposed into: self-serve sign-ups x free-to-paid conversion rate + sales-assisted wins.
- Level 2 (Expansion MRR): Seat expansion (existing customers adding users) + plan upgrades + add-on purchases. Seat expansion further decomposed into: eligible accounts x expansion probability x average seats added.
- Level 2 (Churn MRR): Voluntary churn (cancellation) + involuntary churn (payment failure). Voluntary decomposed by reason: competitive loss, budget cut, low usage, champion left.
- Each leaf node was assigned to a specific team with a quarterly target.

**Metrics Used:** MRR, New MRR, Expansion MRR, Contraction MRR, Churn MRR, free-to-paid conversion, seat expansion rate, churn reasons.

**What Worked:** Assigning leaf nodes to specific teams eliminated the "MRR is everyone's job, therefore no one's job" problem. The seat expansion branch revealed that workspace-level network effects (every new user makes the product more valuable) were the primary growth driver, not new customer acquisition.

**What Failed:** The first tree was too deep (5 levels), making it impossible to maintain consistent definitions. Collapsing to 3 levels with optional drill-downs kept it manageable.

**Lessons:** KPI trees should have 3 levels max for operational use. Assign every leaf node to a team. The tree reveals which branch is the actual growth engine.

**Application to Data Squad:** When building SaaS KPI trees, limit to 3 levels. Assign ownership at the leaf level. Use the tree to identify which branch (new, expansion, retention) is the primary growth engine.

---

## 2. HubSpot - Multi-Product MRR Tree

**Company/Context:** HubSpot (2020). With Marketing Hub, Sales Hub, Service Hub, and CMS Hub, they needed a KPI tree that captured cross-product dynamics.

**What They Did:**
- Level 0: Total MRR
- Level 1: MRR by product hub (Marketing, Sales, Service, CMS, Operations)
- Level 2: For each hub: New hub MRR + Cross-sell MRR (customers buying a second hub) + Expansion within hub - Churn.
- Level 2 (Cross-sell): Cross-sell eligible accounts x cross-sell conversion rate x average cross-sell ACV. Eligible defined as: active for 90+ days, health score above 60, not already using all hubs.
- A "bundle effect" metric tracked how multi-hub customers retained differently: 1 hub = 82% annual retention, 2 hubs = 91%, 3+ hubs = 97%.

**Metrics Used:** MRR by product, cross-sell conversion rate, bundle effect (retention by product count), cross-sell eligible pool size, hub-specific NRR.

**What Worked:** The bundle effect data (retention jumping from 82% to 97% with 3+ hubs) justified aggressive cross-sell investment. The KPI tree made clear that cross-sell MRR had a double benefit: direct revenue plus retention improvement.

**What Failed:** Initially treated each hub's tree independently, missing the cross-product dynamics. Adding "cross-sell MRR" as a distinct branch (separate from new and expansion) captured the multi-product strategy.

**Lessons:** Multi-product SaaS needs a KPI tree that explicitly models cross-sell as a distinct growth lever with retention implications, not just a revenue source.

**Application to Data Squad:** For multi-product clients, always model cross-sell as its own branch in the KPI tree. Quantify the "bundle effect" on retention to justify cross-sell investment.

---

## 3. Zoom - Usage-to-Revenue KPI Tree

**Company/Context:** Zoom (2020). With explosive growth, they needed to connect product usage metrics to revenue outcomes.

**What They Did:**
- Level 0: ARR
- Level 1: Customers x ARPC (average revenue per customer)
- Level 2 (Customers): Self-serve customers (sign-ups x conversion rate) + Enterprise customers (pipeline x win rate)
- Level 2 (ARPC): Base plan price x (1 + add-on attach rate) x (1 + seat multiplier)
- Usage bridge: linked usage metrics (meeting minutes, participants per meeting, Zoom Phone calls) to revenue inputs (plan tier selection, add-on adoption, seat count)
- Each usage metric had a "monetization threshold": the usage level at which customers typically upgraded (e.g., 10+ participants per meeting predicted upgrade to Pro)

**Metrics Used:** ARR, ARPC, add-on attach rate, seat multiplier, meeting minutes, participants per meeting, monetization thresholds.

**What Worked:** Monetization thresholds became leading indicators for upsell timing. When an account crossed the threshold for participant count, sales received an automated alert. This improved upsell conversion by 25%.

**What Failed:** The usage-to-revenue bridge initially assumed linear relationships (more usage = more revenue). In reality, the relationship was step-function (usage above thresholds triggered plan changes). Modeling as step functions improved revenue forecasting.

**Lessons:** Usage-to-revenue relationships are typically step functions at plan boundaries, not linear. Identify the thresholds and use them as leading indicators for expansion.

**Application to Data Squad:** When building KPI trees that connect usage to revenue, identify the step-function thresholds where usage triggers plan changes. Use these as expansion signals.

---

## 4. Atlassian - Free-to-Paid Conversion Tree

**Company/Context:** Atlassian (2019). With massive free user bases across Jira, Confluence, and Trello, they needed a tree focused on the free-to-paid conversion engine.

**What They Did:**
- Level 0: New Paid MRR from self-serve
- Level 1: Free active teams x conversion rate x average starting ACV
- Level 2 (Free active teams): New free sign-ups x activation rate (defined as team reaching 5+ active users with 2+ weeks of consistent usage)
- Level 2 (Conversion rate): Decomposed by conversion trigger -- hit free tier limit (users, storage, features) x upgrade rate per trigger type
- Level 2 (Starting ACV): Plan tier selected x team size x annual vs. monthly billing preference
- Each conversion trigger had its own funnel: limit approached, limit hit, upgrade prompt shown, pricing page visited, checkout completed

**Metrics Used:** Free team activation rate, conversion rate by trigger type, limit-hit frequency, upgrade prompt CTR, checkout completion rate, starting ACV.

**What Worked:** Decomposing conversion by trigger type revealed that the "hit user limit" trigger converted at 3x the rate of "hit storage limit." The team redesigned the free tier to make the user limit more prominent and the storage limit less restrictive, increasing overall conversion without degrading the free experience.

**What Failed:** Counting "pricing page visited" as a conversion step overestimated intent. Many visitors were comparison-shopping. Adding "pricing page dwell time > 30 seconds" as the real intent signal halved the noise.

**Lessons:** Free-to-paid conversion trees must decompose by trigger type. Not all limits are equal -- the limit that maps to core product value converts best.

**Application to Data Squad:** For freemium clients, build conversion trees by trigger type. Identify which free-tier limit best aligns with core value and optimize around it.
