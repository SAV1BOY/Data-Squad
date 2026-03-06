# McClure Pirate Metrics (AARRR) Framework

## Overview

Dave McClure's AARRR framework -- Acquisition, Activation, Retention, Referral, Revenue -- is arguably the most widely adopted metrics framework in startup and growth product management. Named "Pirate Metrics" for the sound of the acronym, it provides a funnel-based mental model for understanding how users flow through a product and where the biggest opportunities (or leaks) exist.

For data squads, AARRR serves as a foundational organizing principle for product metrics. It is simple enough to communicate across the organization yet structured enough to prevent the common failure of tracking disconnected KPIs. When a team asks "what should we measure?", AARRR is often the right starting point.

## Origin

Dave McClure presented AARRR at the 2007 Ignite Seattle conference in a talk titled "Startup Metrics for Pirates." McClure, a prolific angel investor and founder of 500 Startups (now 500 Global), developed the framework from his experience advising dozens of early-stage companies that struggled to focus their measurement efforts.

The framework was deliberately simple. McClure's observation was that most startups tracked either too many metrics (everything the analytics tool could produce) or too few (just revenue). AARRR provided five buckets that covered the complete customer lifecycle without overwhelming the team.

Since 2007, the framework has been extended by various practitioners. Notable evolutions include AAARRR (adding "Awareness" before Acquisition) and RARRA (reordering to prioritize Retention), but the original five-stage model remains the canonical version.

## Key Concepts

### Acquisition

How do users find you? Acquisition metrics measure the top of the funnel -- the channels and campaigns that bring visitors or signups. Key metrics include:

- Visitors by channel (organic, paid, referral, direct)
- Cost per acquisition by channel
- Signup or install rate by channel
- Channel-specific quality indicators (bounce rate, session depth)

The critical insight is that acquisition volume means nothing without acquisition quality. 10,000 visitors from a misleading ad are worth less than 500 from an intent-matched search query.

### Activation

Do users have a good first experience? Activation is the most underrated stage. It measures whether new users reach the "aha moment" -- the point where they experience the product's core value for the first time. Key metrics include:

- Percentage of signups completing onboarding
- Time to first key action (first message sent, first item purchased, first report created)
- Setup completion rate
- First-session engagement depth

Activation is where most products leak the most value. Poor activation means every dollar spent on acquisition is partially wasted.

### Retention

Do users come back? Retention is the heart of the framework and the strongest signal of product-market fit. Key metrics include:

- Day 1 / Day 7 / Day 30 retention rates
- Weekly or monthly active user ratios
- Cohort retention curves (the shape matters: flattening is good, declining to zero is fatal)
- Resurrection rate (returning after dormancy)

Without retention, the other four stages are academic. A product with high acquisition and zero retention is a leaky bucket with the faucet on.

### Referral

Do users tell others? Referral measures organic growth through word-of-mouth or structured referral programs. Key metrics include:

- Net Promoter Score (NPS) as a proxy for referral intent
- Viral coefficient (invites sent per user x conversion rate of invites)
- Percentage of new users from referral channels
- Social sharing rate

Referral is both a growth lever and a quality signal. Users only refer products they genuinely value.

### Revenue

Do users pay (enough)? Revenue metrics close the loop by measuring monetization. Key metrics include:

- Conversion rate from free to paid
- Average revenue per user (ARPU)
- Customer lifetime value (LTV)
- LTV-to-CAC ratio
- Revenue per channel (connecting back to Acquisition)

Revenue is deliberately last in the framework. Not because it is least important, but because sustainable revenue is the result of getting the first four stages right.

### The Funnel as Diagnostic Tool

AARRR is most powerful when used as a diagnostic tool. By measuring conversion rates between stages, the data squad can identify the biggest bottleneck. If activation is 15% but retention of activated users is 80%, the team should focus on activation. If activation is 90% but retention is 10%, the product has a value problem, not an onboarding problem.

### Stage Ordering for Prioritization

McClure's original ordering (A-A-R-R-R) reflects the user journey, but prioritization should follow a different logic:

1. **Retention first** -- Fix the bucket before pouring more water in
2. **Activation second** -- Maximize conversion of acquired users
3. **Revenue third** -- Monetize the retained base
4. **Referral fourth** -- Amplify through satisfied users
5. **Acquisition last** -- Scale what works

This inversion (sometimes called RARRA) was popularized by Brian Balfour and others, but the principle was implicit in McClure's original work.

## Application to Data Squad

### AARRR as Dashboard Architecture

Organize primary product dashboards around the five AARRR stages. Each stage gets its own section with 3-5 metrics, conversion rates between stages, and trend lines. This gives stakeholders an immediate view of where the funnel is healthy and where it needs attention.

### Event Taxonomy Alignment

Map the event taxonomy to AARRR stages. Every tracked event should belong to at least one stage. Events that do not map to any stage should be questioned -- they may be noise.

### Cross-Functional Metric Ownership

Assign metric ownership across teams using AARRR as the organizing principle. Marketing owns Acquisition metrics. Product owns Activation and Retention. Growth or product owns Referral. Finance and product own Revenue. This prevents metric orphans.

### Cohort-Stage Matrix

Build a matrix view where rows are signup cohorts and columns are AARRR stages. Each cell shows the conversion rate for that cohort at that stage. This reveals whether product changes are improving the funnel over time, not just in aggregate.

### Segmented AARRR

Apply AARRR separately to different user segments (by plan, geography, acquisition channel, persona). A product can have excellent aggregate AARRR numbers while hiding poor performance in a critical segment.

## Pitfalls

### Treating AARRR as Linear

Real user journeys are not strictly linear. Users may refer before they pay, or become retained users who never fully "activated" by the defined criteria. Use AARRR as a mental model, not a rigid pipeline.

### Vanity Acquisition Metrics

Total signups is a vanity metric if not paired with activation quality. Data squads must ensure acquisition metrics always include a quality dimension.

### Defining Activation Incorrectly

The "aha moment" is often assumed rather than validated. Use data analysis (retention correlation with early actions) to empirically determine what activation means for your product, rather than guessing.

### Retention Window Mismatch

Using daily retention for a product people use monthly (like a tax filing tool) will produce misleading results. Match the retention window to natural usage frequency.

### Ignoring the Feedback Loops

AARRR is presented as a funnel, but in practice, referral creates new acquisition, revenue funds more acquisition, and retention drives referral. The framework is a cycle, not just a funnel.

## Cross-References

- **ries-lean-startup-metrics.md** -- AARRR operationalizes Ries's engines of growth (sticky = retention, viral = referral, paid = acquisition + revenue)
- **cagan-inspired-metrics.md** -- Activation and retention are the outcome metrics Cagan advocates for
- **product-analytics-framework.md** -- Detailed application of AARRR in product analytics practice
- **marketing-analytics-framework.md** -- Deep dive on the Acquisition stage and attribution
- **revenue-analytics-framework.md** -- Deep dive on the Revenue stage and monetization metrics
- **definition-layer.md** -- Where AARRR stage definitions are codified into the metric taxonomy
- **kohavi-online-experiments.md** -- How to run experiments to improve conversion between AARRR stages
