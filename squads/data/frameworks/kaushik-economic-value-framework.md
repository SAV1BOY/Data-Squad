# Kaushik Economic Value Framework

## Overview

The Economic Value Framework is Avinash Kaushik's methodology for assigning monetary value to every
meaningful action on a digital property, not just revenue-generating transactions. Most websites
have one macro conversion (purchase, subscription) that generates direct revenue, but dozens of
micro conversions (email sign-ups, content downloads, tool usage) that create value without
immediate revenue. Without economic value assignment, organizations cannot measure the true ROI
of campaigns, content, and channels that drive non-revenue actions.

The framework transforms analytics from counting conversions to valuing them, enabling apples-to-
apples comparison across all digital activities.

## Origin

Developed by **Avinash Kaushik** and detailed in *Web Analytics 2.0* and extensively on his blog
*Occam's Razor*. The framework addresses Kaushik's observation that organizations either ignore
non-revenue conversions entirely (losing visibility into value creation) or treat all conversions
as equal (distorting investment decisions). Economic value assignment is what makes Pillar 2
(Outcomes) of his Web Analytics 2.0 framework operational.

## Core Model

### Macro Conversions

Macro conversions are the primary value-generating actions on your digital property. They have
direct, measurable economic impact.

**Examples by business model:**
- E-commerce: completed purchase (value = revenue or margin)
- SaaS: paid subscription start (value = first payment or estimated LTV)
- Lead generation: qualified lead submission (value = close rate x average deal value)
- Media/publishing: premium subscription (value = subscription fee)
- Marketplace: completed transaction (value = take rate x GMV)

**Characteristics:**
- Directly tied to revenue
- Relatively rare compared to micro conversions
- Well-tracked in most organizations
- Easy to assign economic value

### Micro Conversions

Micro conversions are the supporting actions that create value indirectly. They either lead toward
macro conversions or generate standalone value that is harder to quantify.

**Process milestones** (steps toward macro conversion):
- Account creation without purchase
- Adding items to cart or wishlist
- Starting but not completing a form
- Viewing pricing page
- Requesting a demo or consultation
- Starting a free trial

**Secondary value generators** (standalone value):
- Email newsletter sign-up
- Content or resource download
- Video watch completion
- Social sharing of content
- Creating a saved search or alert
- Store locator usage
- Engagement with interactive tools (ROI calculators, product configurators)

### Assigning Economic Value

The core methodology for value assignment follows a structured approach:

**Method 1: Back-calculation from macro conversion**
For process milestones, calculate the conversion rate from micro to macro, then multiply by macro
conversion value.

Example: Email sign-up to purchase conversion rate is 5%. Average purchase value is $80.
Economic value of email sign-up = 0.05 x $80 = $4.00.

**Method 2: Replacement cost**
For actions that would otherwise require paid channels, use the cost of the alternative.

Example: A customer who uses the store locator and then visits a physical store has an estimated
value equal to the cost-per-store-visit from paid campaigns (e.g., $12 per store visit from local
search ads).

**Method 3: Revenue attribution from downstream data**
Connect micro conversions to eventual revenue using CRM or customer data platform data.

Example: Webinar attendees generate $15,000 in average pipeline within 6 months, with a 20% close
rate. Economic value of webinar attendance = $15,000 x 0.20 = $3,000 per attendee.

**Method 4: Informed estimation**
When data is insufficient for precise calculation, use structured estimation. Gather 3-5
stakeholders, present available data, and agree on a defensible estimate. Document assumptions.
Plan to refine as data accumulates.

### The Economic Value Formula

Total Page Economic Value = Sum of (Macro Conversion Value) + Sum of (Micro Conversion Value)

Per Visit Economic Value = Total Economic Value / Total Visits

This "per visit economic value" becomes the universal currency for comparing channels, campaigns,
content, and segments.

## Application Steps

### Step 1: Inventory All Conversions
List every meaningful action on your digital property. Be exhaustive. Include actions you currently
track and actions you should be tracking. Categorize each as macro or micro.

### Step 2: Assess Data Availability
For each micro conversion, determine what data exists to calculate economic value. Do you have
downstream conversion rates? Replacement cost data? Revenue attribution data? Identify gaps.

### Step 3: Assign Values Using Best Available Method
Start with process milestones closest to macro conversion (highest data quality) and work backward.
Use the four methods above in order of precision: back-calculation, replacement cost, revenue
attribution, informed estimation.

### Step 4: Implement Value Tracking
Configure your analytics platform to record economic value for each conversion type. In Google
Analytics, this means assigning goal values. In other platforms, equivalent configuration.

### Step 5: Calculate Per Visit Economic Value
Once values are assigned and tracking, calculate economic value per visit by source, medium,
campaign, content, landing page, and any other dimension that drives decisions.

### Step 6: Use Economic Value for Decision-Making
Replace conversion count comparisons with economic value comparisons. A channel that drives 100
visits worth $5 each ($500 total) is more valuable than a channel that drives 200 visits worth $1
each ($200 total), even though the second channel has more volume.

### Step 7: Validate and Refine Quarterly
Economic values are estimates that improve over time. Each quarter, re-examine assumptions using
accumulated data. Adjust values as you learn more about actual downstream conversion rates and
revenue patterns.

## Worked Example: B2B Software Company

**Macro conversion:** Demo request
- Average deal value: $50,000/year
- Demo-to-close rate: 15%
- Economic value: $50,000 x 0.15 = $7,500 per demo request

**Micro conversions:**

| Action | Method | Calculation | Value |
|--------|--------|-------------|-------|
| Whitepaper download | Back-calc | 3% convert to demo; 0.03 x $7,500 | $225 |
| Webinar attendance | Revenue attr | $12,000 avg pipeline x 18% close | $2,160 |
| Pricing page view | Back-calc | 8% request demo; 0.08 x $7,500 | $600 |
| Newsletter sign-up | Back-calc | 1.5% convert to demo within 6mo; 0.015 x $7,500 | $112.50 |
| ROI calculator use | Back-calc | 12% request demo; 0.12 x $7,500 | $900 |
| Blog engagement (3+ pages) | Estimation | Stakeholder consensus with data review | $25 |

**Application:** Content marketing drives 2,000 whitepaper downloads/month ($450,000 economic value)
and 500 webinar attendees/month ($1,080,000 economic value). Despite lower volume, webinars produce
2.4x the economic value, informing resource allocation toward webinar production.

## Key Distinctions

- **Economic value is not revenue.** It is the estimated future revenue contribution of an action,
  discounted by probability. It is a planning tool, not an accounting figure.
- **All values are estimates.** Some are precise (purchase revenue), some are calculated (email
  sign-up value), and some are estimated (blog engagement). All are better than zero, which is the
  implicit value assigned when you do not do this exercise.
- **Micro conversions are not secondary.** They often represent the majority of economic value
  created on a site, especially in long-cycle B2B businesses where direct online conversion is rare.
- **Per-visit economic value enables comparison.** Without it, you cannot meaningfully compare
  channels that drive different conversion types. Economic value creates a common currency.
- **The exercise itself has value.** The process of defining and valuing micro conversions forces
  organizations to articulate what actions matter and why, which clarifies strategy.

## Pitfalls

1. **Assigning zero value to non-revenue actions.** This is the default and it is wrong. An email
   sign-up has non-zero value. The question is not whether to assign value but how precisely.
2. **Over-precision in estimation.** A whitepaper download is not worth exactly $225.00. It is worth
   approximately $200-250. Do not let false precision obscure the directional insight.
3. **Double-counting value.** If a user downloads a whitepaper and then attends a webinar and then
   requests a demo, you cannot count all three values independently. Establish attribution rules.
4. **Static values in a dynamic business.** Conversion rates change. Deal sizes change. Values
   must be refreshed regularly or they become misleading.
5. **Ignoring negative value.** Some actions (high bounce rate pages, support ticket creation)
   destroy value. A complete framework includes value destruction, not just creation.
6. **Using economic value to justify vanity metrics.** If your value assignment makes every metric
   look good, your assignments are too generous. Some content and channels should show low value.
7. **Forgetting time value.** A conversion that leads to revenue in 30 days is more valuable than
   one that leads to revenue in 12 months. Long cycles should include a time discount.

## Cross-References

- **Kaushik DMMM** -- Economic value feeds directly into DMMM target-setting. Targets can be
  expressed in economic value terms rather than raw conversion counts.
- **Kaushik See-Think-Do-Care** -- Each STDC stage has different conversion types needing value
  assignment. Think stage micro conversions particularly benefit from this framework.
- **Kaushik Web Analytics 2.0** -- Economic value is the operational core of Pillar 2 (Outcomes
  Analysis) in the four-pillar model.
- **Fader CLV as North Star** -- CLV provides the downstream revenue data needed for precise
  back-calculation of micro conversion values.
- **Fader Whale Curve** -- The whale curve reveals that economic value varies enormously by
  customer segment, suggesting value assignment should be segment-specific.
- **Ellis Growth Equation** -- Each stage in the growth equation (Reach, Activation, Engagement,
  Revenue, Referral) benefits from economic value assignment for intermediate actions.
