# Product Analytics Framework

## Overview

Product analytics is the discipline of understanding how users interact with a product, what drives engagement and retention, and how product changes affect user behavior and business outcomes. It is the most common analytical domain for data squads in technology companies and sits at the intersection of product management, engineering, and data science.

This framework codifies the metrics, methods, and practices that comprise a mature product analytics capability. It translates the theoretical frameworks (AARRR, Cagan's outcome metrics, lean startup accounting) into concrete analytical practices that product teams can use daily.

## Origin

Product analytics emerged as a distinct discipline alongside the rise of SaaS, mobile apps, and digital products in the 2000s and 2010s. Companies like Facebook, Spotify, and Airbnb pioneered the practice of embedding analysts within product teams and building sophisticated instrumentation to understand user behavior at scale.

The discipline draws from web analytics (Google Analytics era), behavioral science (understanding user motivation), statistical experimentation (A/B testing), and product management (outcome-based roadmapping). Modern product analytics platforms (Amplitude, Mixpanel, Heap, PostHog) have made many techniques accessible without custom engineering.

## Key Concepts

### Event-Based Analytics

Product analytics is built on events -- discrete user actions captured with timestamps and properties. The event model enables:

- **Behavioral analysis** -- Understanding what users do, in what sequence, and how often
- **Funnel construction** -- Measuring conversion through multi-step processes
- **Cohort tracking** -- Comparing behavior across user groups over time
- **Feature measurement** -- Quantifying adoption, usage, and impact of specific features

Core event categories:
- **Lifecycle events** -- Signup, activation, subscription, cancellation
- **Engagement events** -- Feature usage, content consumption, social interactions
- **Transaction events** -- Purchases, upgrades, renewals
- **System events** -- Errors, performance, notifications delivered

### Feature Adoption Metrics

For every feature, track the adoption lifecycle:

1. **Discovery** -- What percentage of users encounter the feature? (Feature visibility)
2. **Trial** -- What percentage of discoverers try the feature at least once? (First-use conversion)
3. **Adoption** -- What percentage of trial users become regular users? (Habit formation)
4. **Retention** -- Do adopted users continue using the feature over time? (Sustained value)
5. **Impact** -- Does feature adoption correlate with improved product-level metrics? (Business value)

A feature with high discovery but low trial has a discoverability or value proposition problem. High trial but low adoption suggests the feature does not deliver sustained value.

### Engagement Metrics

Engagement measures the depth and breadth of product usage:

- **DAU/MAU ratio** -- Stickiness. What fraction of monthly users visit daily? Higher is stickier.
- **Session frequency** -- How often do users return? Varies by product type.
- **Session depth** -- How many actions per session? Indicates engagement intensity.
- **Feature breadth** -- How many distinct features does a user engage with? Broader is more embedded.
- **Time to value** -- How quickly does a new user reach meaningful engagement? Shorter is better.

### Retention Analysis

Retention is the most important product metric because it compounds: small retention improvements accumulate into large user base differences over time.

**N-day retention** -- Percentage of users active on day N after signup. Use for daily-use products.
**N-week/month retention** -- Percentage of users active in week/month N. Use for products with weekly or monthly natural cadence.
**Unbounded retention** -- Percentage of users active at any point during a window (week 2, for example). More forgiving than bounded retention.
**Rolling retention** -- Percentage of users who return on day N or any day after. Shows the long-term survival curve.

Retention curve shape matters: a curve that flattens indicates product-market fit for the retained segment. A curve that declines to zero indicates a fundamental value problem.

### Activation and the Aha Moment

The "aha moment" is the user action (or combination of actions) most correlated with long-term retention. Identifying it empirically:

1. List candidate early actions (profile completion, first content creation, first social connection, first purchase)
2. For each action, compare retention rates between users who performed it and users who did not
3. The action with the strongest retention uplift (controlling for user quality) is the likely aha moment
4. Validate with a second dataset or time period

Once identified, optimize the onboarding funnel to drive users toward the aha moment as quickly as possible.

### User Segmentation for Product

Product-relevant segments:

- **Power users** -- Top 10-20% by engagement. Study their behavior to understand what creates deep engagement.
- **Casual users** -- Regular but light usage. Understand what keeps them and what could deepen engagement.
- **At-risk users** -- Declining engagement. Identify early warning signals for intervention.
- **Resurrected users** -- Previously churned but returned. Understand what brought them back.
- **New users** -- In the activation window. Track their journey to the aha moment.

### Product Health Scorecard

A single view of product health combining:
- **Growth** -- New user acquisition rate, net user growth
- **Engagement** -- DAU/MAU, session frequency, feature breadth
- **Retention** -- Week 1, Month 1, Month 3 retention by cohort
- **Monetization** -- Conversion to paid, ARPU, expansion revenue
- **Quality** -- Error rate, performance metrics, support contact rate

## Application to Data Squad

### Instrumentation Partnership with Product Engineering

The data squad should collaborate closely with product engineering on tracking implementation. Provide tracking plans, review tracking code, and validate data quality before features launch. This prevents the common problem of launching features without analytics.

### Self-Service Product Analytics

Enable product managers to answer common questions without data team involvement:
- Pre-built funnel templates for key flows
- Cohort analysis tools with intuitive interfaces
- Feature adoption dashboards that update automatically
- Retention dashboards with segment filters

Reserve data team capacity for complex causal analyses and strategic investigations.

### Feature Launch Analytics Package

For every significant feature launch, provide a standard analytics package:
- Pre-launch: baseline metrics, experiment design (if applicable), success criteria
- Launch week: adoption tracking, error monitoring, funnel performance
- Post-launch (30 days): retention impact, engagement impact, OEC assessment
- Decision point: ship widely, iterate, or remove

### Product Review Data Preparation

Prepare data packages for regular product reviews:
- Cohort retention trends (are newer cohorts retaining better?)
- Feature adoption progress (which features are gaining traction?)
- Funnel conversion changes (where is the biggest opportunity?)
- Experiment results summary (what have we learned recently?)

### Alerting for Product Health

Build automated alerts for critical product health indicators:
- Retention rate drops below threshold for a cohort
- Funnel conversion rate drops significantly
- Error rate spikes
- Feature adoption stalls after launch

## Pitfalls

### Tracking Everything, Understanding Nothing

Instrumenting hundreds of events without a clear analytical plan creates noise. Start with the events needed for core funnels and retention analysis, then add events as specific questions arise.

### Feature Adoption Without Impact

High feature adoption does not necessarily improve product health. Always connect feature metrics to product-level outcomes (retention, monetization). A widely adopted feature that does not improve retention may not be valuable.

### Survivorship Bias in Retention

Users who stay are, by definition, the ones who found value. Studying only retained users tells you about survivors, not about why others left. Analyze churned users and early dropoffs with equal rigor.

### Ignoring Power User Distortion

Power users can dominate aggregate metrics. A product with 1,000 users where 50 account for 80% of activity looks healthy in aggregate but is fragile. Segment metrics by user type to see the full picture.

### Vanity Growth Metrics

Total signups growing while activation and retention decline is a warning sign, not a success story. Always pair top-of-funnel metrics with activation and retention.

## Cross-References

- **mcclure-pirate-metrics-original.md** -- AARRR provides the organizing framework for product metrics
- **cagan-inspired-metrics.md** -- Outcome-over-output philosophy guides metric selection
- **ries-lean-startup-metrics.md** -- Innovation accounting for early-stage products
- **instrumentation-layer.md** -- Product analytics depends on correct instrumentation
- **experimentation-layer.md** -- Experiments validate causal impact of product changes
- **analysis-layer.md** -- Cohort, funnel, and segmentation techniques used in product analytics
- **definition-layer.md** -- Product metric definitions should be standardized in the metric registry
