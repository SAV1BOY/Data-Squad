# Marketing Analytics Framework

## Overview

Marketing analytics measures the effectiveness of marketing efforts in acquiring, engaging, and converting customers. It answers fundamental business questions: which channels bring the most valuable customers, how much should we spend to acquire a customer, and what is the return on marketing investment? For data squads, marketing analytics is often the most politically charged analytical domain because it directly affects budget allocation and channel team performance.

This framework covers attribution modeling, cost efficiency metrics, channel performance analysis, and the organizational practices needed to produce trustworthy marketing measurement.

## Origin

Marketing analytics evolved from direct response advertising (where every coupon had a code) through the digital analytics revolution (web tracking, click attribution) to the current era of multi-touch attribution, privacy-constrained measurement, and marketing mix modeling. The field has been shaped by the tension between marketers' desire for precise attribution and the mathematical reality that isolating the impact of individual marketing touches is fundamentally difficult.

Key influences include the direct marketing tradition (Lester Wunderman, David Ogilvy), digital analytics pioneers (Avinash Kaushik), and the econometric approach to marketing mix modeling used by consumer goods companies for decades.

## Key Concepts

### Attribution Models

Attribution determines which marketing touchpoints receive credit for conversions:

**Last-touch attribution** -- 100% credit to the last touchpoint before conversion. Simple but biased toward bottom-of-funnel channels (search, retargeting).

**First-touch attribution** -- 100% credit to the first touchpoint. Biased toward top-of-funnel channels (display, social awareness).

**Linear attribution** -- Equal credit to all touchpoints. Democratic but does not reflect actual influence.

**Time-decay attribution** -- More credit to touchpoints closer to conversion. A reasonable default that acknowledges recency.

**Position-based (U-shaped)** -- 40% to first touch, 40% to last touch, 20% distributed among middle touches. Balances discovery and conversion.

**Data-driven attribution** -- Algorithmic models that assign credit based on observed contribution to conversion. Most accurate but requires significant data volume and technical sophistication.

**Marketing Mix Modeling (MMM)** -- Econometric models that estimate channel contribution from aggregate spend and outcome data. Works without user-level tracking, making it privacy-compliant. Best for strategic budget allocation across channels.

No attribution model is "correct." Each reveals a different perspective. Data squads should present multiple attribution views and help stakeholders understand the tradeoffs.

### Customer Acquisition Cost (CAC)

CAC = Total marketing and sales spend / Number of new customers acquired

Variations:
- **Blended CAC** -- Total spend divided by total new customers (includes organic acquisition)
- **Paid CAC** -- Only paid marketing spend divided by customers from paid channels
- **Fully-loaded CAC** -- Includes salaries, tools, and overhead in addition to media spend
- **CAC by channel** -- Isolates efficiency of each channel

CAC must always be evaluated relative to customer lifetime value (LTV). A high CAC is acceptable if LTV is proportionally higher.

### LTV:CAC Ratio

The ratio of customer lifetime value to customer acquisition cost. Benchmarks:

- **< 1:1** -- Losing money on each customer. Unsustainable.
- **1:1 to 3:1** -- Marginal. Sustainable only if retention improves or CAC decreases.
- **3:1 to 5:1** -- Healthy. Indicates efficient acquisition and strong retention.
- **> 5:1** -- May indicate underinvestment in growth. Could be acquiring more customers at a higher but still profitable CAC.

### Return on Ad Spend (ROAS)

ROAS = Revenue attributed to ads / Ad spend

ROAS is a direct efficiency metric for paid advertising. Unlike ROI, ROAS typically does not account for costs beyond ad spend (production costs, salaries, overhead). This makes it useful for tactical campaign optimization but insufficient for strategic budget decisions.

### Channel Performance Analysis

For each marketing channel, track:
- **Volume** -- How many visitors, leads, or customers does this channel produce?
- **Quality** -- What is the conversion rate, activation rate, and retention rate of users from this channel?
- **Cost** -- What is the CAC for this channel?
- **Scalability** -- Can spend be increased while maintaining efficiency? (Most channels have diminishing returns.)
- **Attribution sensitivity** -- How does this channel's contribution change under different attribution models? Channels that appear strong only under last-touch may be receiving undeserved credit.

### Incrementality Testing

The most rigorous way to measure marketing effectiveness is through incrementality tests -- holdout experiments where a portion of the target audience does not receive the marketing intervention. The difference in outcomes between the exposed and holdout groups measures the incremental impact of the marketing.

Incrementality tests answer: "How many of these conversions would have happened without this marketing?" This is the question attribution models try to answer but cannot definitively resolve.

### Funnel Metrics by Stage

**Awareness** -- Impressions, reach, brand recall lift
**Consideration** -- Click-through rate, site visits, content engagement, lead generation
**Conversion** -- Signup rate, purchase rate, cost per conversion
**Retention** -- Repeat purchase rate, LTV by acquisition channel
**Advocacy** -- Referral rate, NPS by acquisition channel

### Privacy and Measurement

Privacy regulations (GDPR, CCPA) and platform changes (iOS ATT, cookie deprecation) are fundamentally reshaping marketing measurement:

- User-level tracking is becoming less reliable
- Cross-device attribution is harder
- Marketing Mix Modeling is gaining renewed importance
- First-party data becomes more valuable
- Aggregated measurement (Meta's Aggregated Event Measurement, Google's Privacy Sandbox) replaces granular tracking

Data squads must adapt measurement approaches to the privacy-constrained reality rather than clinging to deprecated tracking methods.

## Application to Data Squad

### Multi-Model Attribution Dashboard

Build a dashboard that shows marketing performance under multiple attribution models side by side. This prevents the organizational trap of optimizing for a single model's perspective and surfaces the channels where attribution models disagree most.

### Channel-Level Unit Economics

For each channel, calculate and display the full unit economics: CAC, activation rate, LTV of acquired users, LTV:CAC ratio, and payback period. This enables data-informed budget allocation.

### Incrementality Testing Program

Establish a regular incrementality testing cadence for the largest marketing channels. Start with the channels where the most money is spent and the attribution is most uncertain.

### Marketing-Product Analytics Integration

Connect marketing acquisition data with product analytics data. The most valuable marketing insight is not which channel drives the most signups but which channel drives the most retained, monetizing customers. This requires joining marketing attribution data with product retention and revenue data.

### Campaign Reporting Automation

Automate regular campaign performance reports that standardize metrics across channels. Manual reporting is slow, error-prone, and inconsistent. Automation frees the data team for analysis and insight.

### Budget Allocation Modeling

Build models that estimate the incremental value of shifting budget between channels. This enables data-informed conversations about budget allocation rather than political negotiations.

## Pitfalls

### Attribution as Truth

No attribution model reflects reality perfectly. Present attribution as a lens, not a truth. Different models tell different stories; the reality is somewhere in the combination.

### CAC Without LTV

Optimizing CAC in isolation drives the organization toward cheap, low-quality acquisition channels. Always evaluate CAC in the context of the LTV of acquired customers.

### Ignoring Organic Cannibalization

Paid channels may cannibalize organic acquisition. Bidding on your brand terms in search may simply redirect users who would have found you organically. Incrementality testing detects this.

### Short-Term ROAS Optimization

Optimizing for short-term ROAS favors retargeting and bottom-of-funnel tactics at the expense of brand building and top-of-funnel investment. This creates a "harvesting" strategy that depletes the prospect pool over time.

### Measurement Gap During Privacy Transition

As tracking capabilities degrade, there is a temptation to simply report less. Instead, invest in privacy-compatible measurement methods (MMM, incrementality testing, first-party data strategies) to maintain measurement capability.

## Cross-References

- **mcclure-pirate-metrics-original.md** -- AARRR's Acquisition stage is the marketing analytics domain
- **revenue-analytics-framework.md** -- LTV calculations connect marketing analytics to revenue analytics
- **product-analytics-framework.md** -- Activation and retention of acquired users completes the acquisition quality picture
- **kohavi-online-experiments.md** -- Incrementality tests are controlled experiments applied to marketing
- **analysis-layer.md** -- Attribution modeling uses analytical techniques from the analysis layer
- **governance-layer.md** -- Marketing data governance, especially privacy compliance
- **simpson-paradox-awareness.md** -- Channel mix shifts can create Simpson's Paradox in aggregate marketing metrics
