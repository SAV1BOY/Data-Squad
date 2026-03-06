# Kaushik See-Think-Do-Care Deep Dive

## Overview

See-Think-Do-Care (STDC) is Avinash Kaushik's audience-intent framework that replaces the
traditional marketing funnel with a model based on the size of the addressable audience and their
intent signals. Rather than forcing people through a linear funnel, STDC acknowledges that audiences
exist in different intent states and that marketing, content, and measurement must align to each
state independently.

The framework solves a pervasive problem: organizations that measure awareness campaigns by
conversion rate, or judge content marketing by immediate revenue. STDC forces stage-appropriate
measurement.

## Origin

Created by **Avinash Kaushik** and published on his blog *Occam's Razor*. Kaushik developed STDC
as a replacement for the traditional purchase funnel (Awareness-Consideration-Purchase), which he
argued was brand-centric rather than audience-centric. The framework emerged from his observation
that most digital marketing failure stems from mismatched intent and messaging -- serving "Buy Now"
to someone in the "See" stage, or measuring "Do" metrics on "Think" content.

## Core Model

### Stage 1: See
**Audience:** The largest possible qualified audience. Everyone who could ever be your customer,
regardless of current commercial intent.

**Intent signal:** None. These people are not actively considering your category. They are living
their lives and may encounter your brand passively.

**Content types:**
- Brand storytelling and awareness content
- Entertaining or inspiring video content
- Social media presence (non-promotional)
- Sponsorships and partnerships
- Broad display and video campaigns

**Metrics:**
- Reach and impressions (qualified audience)
- Video view-through rates (25%, 50%, 75%, 100%)
- Brand lift studies (aided and unaided recall)
- Social engagement rate (shares, saves, comments)
- New visitor percentage from See campaigns
- Cost per thousand qualified impressions (CPM)

**Tracking requirements:**
- Brand lift survey integration (Google Brand Lift, Meta Brand Lift)
- View-through attribution windows (minimum 7 days)
- Audience segment definitions in ad platforms
- Social listening tools for sentiment baseline
- Cross-channel reach deduplication

### Stage 2: Think
**Audience:** The subset of the See audience that has some commercial intent in your category.
They are considering options but have not decided to buy.

**Intent signal:** Active research behavior. Searching for category terms, reading reviews,
comparing options, visiting category content.

**Content types:**
- Educational content (how-to guides, comparison articles)
- Category-level SEO content
- Email nurture sequences
- Webinars and detailed demonstrations
- Remarketing to engaged See audience
- Social proof and case studies

**Metrics:**
- Organic search traffic for category/informational queries
- Content engagement depth (scroll depth, time on page)
- Email sign-up rate from Think content
- Return visit rate within 30-day window
- Micro-conversion completion rate (tool usage, quiz completion)
- Assisted conversions attributed to Think touchpoints
- Cost per engaged Think visitor

**Tracking requirements:**
- Enhanced content analytics (scroll tracking, element visibility)
- Query classification (informational vs. transactional intent)
- Cross-session user stitching (authenticated and probabilistic)
- Email engagement tracking with content attribution
- Multi-touch attribution model incorporating Think touchpoints

### Stage 3: Do
**Audience:** The subset with clear commercial intent. They have decided to buy in the category
and are choosing a specific product or vendor.

**Intent signal:** Transactional behavior. Searching for specific products, visiting product
pages, adding to cart, requesting quotes, starting trials.

**Content types:**
- Product pages and landing pages
- Pricing and packaging pages
- Free trial or demo flows
- Retargeting with specific offers
- Search ads on branded and high-intent terms
- Shopping campaigns and product feeds
- Reviews and testimonials pages

**Metrics:**
- Conversion rate (macro: purchase, trial, demo request)
- Revenue per visitor
- Cart abandonment rate and recovery rate
- Cost per acquisition (CPA)
- Return on ad spend (ROAS) for Do campaigns
- Transaction completion time (sessions to conversion)
- Average order value
- Payment method success rate

**Tracking requirements:**
- Full e-commerce or conversion tracking implementation
- Cart and checkout funnel instrumentation
- A/B testing infrastructure on conversion paths
- Real-time bidding integration for ROAS optimization
- Cross-device conversion tracking
- Offline conversion import (for lead-based businesses)

### Stage 4: Care
**Audience:** Existing customers. People who have already converted at least once (or twice,
for higher-value thresholds).

**Intent signal:** Post-purchase behavior. Product usage, support interactions, account
management, repeat visits.

**Content types:**
- Onboarding sequences and product education
- Loyalty programs and exclusive content
- Customer community and forums
- Upsell and cross-sell recommendations
- Customer success outreach
- Referral programs
- Win-back campaigns for lapsed customers

**Metrics:**
- Net Promoter Score (NPS) or Customer Satisfaction (CSAT)
- Repeat purchase rate (30, 60, 90 day)
- Customer lifetime value trajectory
- Net revenue retention (NRR)
- Referral rate and program participation
- Support ticket volume and resolution satisfaction
- Product adoption depth (features used)
- Churn rate and churn prediction accuracy

**Tracking requirements:**
- Customer data platform (CDP) or unified customer profile
- Product analytics integration (Amplitude, Mixpanel, Pendo)
- Support system integration (Zendesk, Intercom)
- NPS/CSAT survey deployment and tracking
- Cohort analysis infrastructure
- Revenue attribution per customer over time
- Referral tracking and attribution

## Application Steps

### Step 1: Map Your Current Activity
Audit all marketing channels, content, and campaigns. Classify each into See, Think, Do, or Care.
Most organizations discover 70%+ of spend is on Do, with Care almost entirely neglected.

### Step 2: Identify Measurement Mismatches
Look for places where you measure a stage with the wrong metrics. The most common violation: judging
See campaigns by Do metrics (conversions). This always makes awareness campaigns look like failures.

### Step 3: Assign Stage-Appropriate KPIs
For each stage, select 3-5 KPIs from the metrics listed above. Ensure every campaign and content
piece has KPIs appropriate to its stage.

### Step 4: Build Stage-Specific Reporting
Create separate reporting views for each stage. A single dashboard that mixes all stages will
obscure performance. Executives need a summary; practitioners need stage-specific depth.

### Step 5: Allocate Budget Across Stages
Use STDC to have a deliberate conversation about stage allocation. If 90% of budget is on Do, you
are harvesting demand without creating it. If 90% is on See, you are building awareness without
capture mechanisms.

### Step 6: Design Content for the Right Stage
Stop creating generic content. Every piece should have a clear stage assignment, audience definition,
and success metric defined before production begins.

## Key Distinctions

- **STDC is not a funnel.** People do not move linearly from See to Do. A person can enter at any
  stage. Someone searching for "best CRM software" is in Think, regardless of whether they ever
  saw your brand.
- **See is not waste.** Organizations that cut all See activity eventually see their Do pipeline
  dry up. See creates the future Think and Do audience.
- **Care is not an afterthought.** For subscription businesses, Care is where most revenue is
  generated. Treating it as a cost center is a strategic error.
- **Each stage has its own ROI logic.** See ROI is measured in brand lift and audience growth. Think
  ROI is measured in engaged audience and pipeline creation. Do ROI is measured in revenue. Care ROI
  is measured in retention and lifetime value.
- **STDC replaces demographic targeting with intent targeting.** A 25-year-old and a 55-year-old
  searching "best hiking boots" are both in Think. Demographics are secondary to intent.

## Pitfalls

1. **Measuring all stages with Do metrics.** This is the single most common error in digital
   marketing measurement. It kills See and Think investment.
2. **Ignoring the Care stage entirely.** Many organizations have zero Care strategy. Acquiring
   customers and then neglecting them is the most expensive possible approach.
3. **Assuming linear progression.** Not everyone starts at See. Do not build mandatory sequential
   journeys. Build for each stage independently.
4. **Over-investing in Do at the expense of See and Think.** This feels efficient in the short
   term but creates a demand deficit over time.
5. **Using STDC as just a content taxonomy.** The framework is a measurement model, not just a
   content categorization system. The measurement alignment is the core value.
6. **Neglecting cross-stage attribution.** Understanding how See and Think influence Do requires
   multi-touch or incrementality measurement. Last-click attribution hides cross-stage value.
7. **Setting uniform benchmarks across stages.** A 2% conversion rate is terrible for a Do
   landing page and irrelevant for a See video campaign.

## Cross-References

- **Kaushik DMMM** -- Each STDC stage can have its own DMMM (Objective, Goal, KPI, Target) for
  structured measurement planning.
- **Kaushik Economic Value Framework** -- Micro-conversions in the Think stage need economic value
  assignment to justify investment.
- **Kaushik 10/90 Rule** -- Stage-appropriate measurement requires skilled analysts, not just tools.
  The 10/90 principle applies doubly when measuring across all four stages.
- **Ellis Activation and Aha Moment** -- The Care stage overlaps significantly with activation
  strategy in product-led growth.
- **Fader Customer Centricity** -- STDC's Care stage aligns with Fader's emphasis on differential
  investment based on customer value.
- **Mehta Customer Success Metrics** -- Care stage metrics overlap with Mehta's CS measurement
  framework, particularly health scoring and NRR.
