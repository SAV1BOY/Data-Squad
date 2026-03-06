# CLV by Cohort Examples

Real-world customer lifetime value cohort analyses showing how CLV varies by acquisition period, channel, and behavior.

---

## 1. Stitch Fix - CLV by Acquisition Cohort and Fix Frequency

**Company/Context:** Stitch Fix (2019). The finance team needed to understand how CLV varied across quarterly acquisition cohorts and whether newer cohorts were trending better or worse.

**What They Did:**
- Calculated 24-month observed CLV for each quarterly acquisition cohort from Q1 2017 through Q4 2019.
- Decomposed CLV into: number of Fixes ordered x average revenue per Fix x gross margin percentage.
- Discovered a concerning trend: Q3 and Q4 2019 cohorts had 15% lower 6-month CLV than 2017 cohorts, driven by lower Fix frequency (fewer reorders, not lower revenue per Fix).
- Segmented by acquisition channel: referral cohorts had 40% higher 24-month CLV than paid social cohorts, driven entirely by higher Fix frequency (same revenue per Fix).
- Built CLV projections by extrapolating observed cohort curves using a shifted beta-geometric model.

**Metrics Used:** 24-month observed CLV, CLV by acquisition quarter, CLV by channel, Fix frequency, revenue per Fix, gross margin, projected CLV (sBG model).

**What Worked:** The cohort-level CLV trend (declining for newer cohorts) revealed that growth was coming at the cost of quality. This wasn't visible in aggregate metrics because total revenue was still growing. The cohort view forced a strategic conversation about sustainable growth vs. user-count growth.

**What Failed:** Initial CLV projections assumed all cohorts would converge to the same long-term behavior. In reality, paid social cohorts never caught up to referral cohorts. Using channel-specific projection curves improved forecast accuracy by 35%.

**Lessons:** CLV must be tracked by acquisition cohort to reveal quality trends over time. Channel-specific CLV projections are essential for accurate unit economics. Declining cohort CLV is a leading indicator of unsustainable growth.

**Application to Data Squad:** Build cohort CLV trend charts for every subscription/repeat-purchase client. Flag declining cohort CLV as a strategic risk. Use channel-specific projections, not blended.

---

## 2. Spotify - CLV by Subscription Entry Point

**Company/Context:** Spotify (2019). The finance team analyzed CLV differences between users who entered through different subscription paths: organic free-to-premium conversion, promotional trial ($0.99 for 3 months), student plan, and family plan invite.

**What They Did:**
- Tracked 36-month CLV by entry point, including subscription revenue, ad revenue during free periods, and churn timing.
- Organic converters: 36-month CLV of $285 (low churn, stable paying). Promotional trial: $195 (higher month-4 churn when full price kicked in, but survivors retained well). Student plan: $165 (lower price, moderate retention, but upgrade potential at graduation). Family plan invite: $95 (attributed share of family plan revenue, moderate churn).
- Calculated "CLV-to-CAC ratio" by entry point: organic had best ratio (low CAC), promotional had worst (high CAC + lower CLV).

**Metrics Used:** 36-month CLV by entry point, churn timing by entry point, CLV-to-CAC ratio, price-step churn rate (churn when transitioning from trial to full price), upgrade rate (student to regular).

**What Worked:** The price-step churn analysis (month-4 churn for promotional trial users) isolated the exact moment and reason for churn. Users who survived the price step retained comparably to organic converters. This insight led to "step-up pricing" (gradually increasing from trial to full price over 3 months), which reduced price-step churn by 30%.

**What Failed:** Student plan CLV was initially calculated at the student price, undervaluing the segment. Adding expected graduation upgrade revenue (modeled from historical graduation-to-individual conversion rates) increased student CLV estimate by 40% and justified continued investment.

**Lessons:** CLV by entry point reveals which acquisition strategies produce sustainable value. Price-step churn (when subsidized pricing ends) is a predictable and addressable CLV leak. Include future state-change revenue (upgrades, graduations) in CLV projections.

**Application to Data Squad:** For clients with multiple pricing tiers or trial offers, calculate CLV by entry point including price-step churn analysis. Model future tier-change revenue.

---

## 3. Amazon Prime - CLV Pre-Prime vs. Post-Prime Enrollment

**Company/Context:** Amazon (2018). The retail analytics team quantified the CLV impact of Prime membership to justify continued investment in Prime benefits.

**What They Did:**
- Compared 24-month spending for customers in three cohorts: never-Prime, Prime-from-start (enrolled at account creation), and converted-to-Prime (enrolled after initial non-Prime purchases).
- Never-Prime: $420 annual spend. Prime-from-start: $1,340 annual spend. Converted-to-Prime: $680 pre-enrollment, $1,180 post-enrollment annual spend.
- The converted-to-Prime cohort showed a clear inflection: spend increased 74% in the 6 months after Prime enrollment.
- Decomposed the spend increase: 45% from increased order frequency, 30% from higher AOV (less price-shopping, more impulse buying), 25% from category expansion (buying categories they previously purchased elsewhere).

**Metrics Used:** Annual spend by Prime status, spend change pre/post enrollment, order frequency, AOV, category breadth, Prime retention rate.

**What Worked:** The converted-to-Prime cohort provided a natural experiment to isolate Prime's causal impact (same users, before and after). The 74% spend increase justified the cost of Prime benefits and informed the break-even analysis for Prime membership fee vs. increased GMV.

**What Failed:** The initial analysis didn't account for selection bias (users who chose to enroll in Prime were likely already increasing their Amazon usage). A regression discontinuity approach using users who enrolled during a free-trial promotion (lower selection bias) estimated the true causal effect at 45% spend increase -- still massive, but smaller than the naive 74%.

**Lessons:** Pre/post enrollment comparisons overestimate causal effects due to selection bias. Use promotional enrollment cohorts or natural experiments to approximate causal impact. Decompose CLV changes into frequency, AOV, and breadth for actionability.

**Application to Data Squad:** When clients claim a feature or program "doubles CLV," insist on selection-bias-adjusted analysis. Decompose CLV lifts into component drivers.

---

## 4. HubSpot - CLV by Product Adoption Sequence

**Company/Context:** HubSpot (2020). The product and CS teams analyzed whether the sequence of product adoption (which Hub a customer adopted first, second, third) affected CLV.

**What They Did:**
- Tracked the product adoption sequence for multi-Hub customers: which Hub was purchased first, time to second Hub, time to third Hub.
- Found that customers who started with Marketing Hub then added Sales Hub had 36-month CLV of $48K. Those who started with Sales Hub then added Marketing Hub had CLV of $36K -- a 33% difference for the same eventual product mix.
- The mechanism: Marketing Hub users had higher engagement (more daily users, more workflows) which created organizational dependency before expanding. Sales Hub users had fewer daily users, creating less lock-in.
- Built a "CLV-maximizing adoption sequence" recommendation for the CS team.

**Metrics Used:** 36-month CLV by adoption sequence, time between product additions, engagement depth by starting product, churn rate by sequence, number of daily active users by starting product.

**What Worked:** The adoption sequence analysis gave CS teams a concrete playbook: for customers considering both Marketing and Sales Hub, recommend Marketing Hub first. This increased 36-month CLV for dual-Hub customers by 12% when CSMs followed the recommended sequence.

**What Failed:** The analysis initially treated all customers equally, regardless of company size. When segmented by company size, the sequence effect was strong for mid-market (50-500 employees) but negligible for enterprise (500+), where both products were adopted simultaneously.

**Lessons:** Product adoption sequence affects CLV. The "stickier" product should be adopted first to create organizational dependency before expansion. Segment by company size -- sequence effects matter more for mid-market than enterprise.

**Application to Data Squad:** For multi-product clients, analyze CLV by adoption sequence. Build CS playbooks recommending the sequence that maximizes CLV. Segment by customer size.
