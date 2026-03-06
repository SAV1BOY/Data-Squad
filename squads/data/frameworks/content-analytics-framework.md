# Content Analytics Framework

## Overview

Content analytics measures how content -- articles, videos, guides, emails, social posts, help documentation -- performs in engaging audiences, driving conversions, and contributing to business objectives. For organizations where content is a primary engagement or acquisition mechanism, content analytics bridges the gap between creative output and measurable business impact.

For data squads, content analytics presents a unique challenge: content performance is influenced by distribution, timing, audience, format, and quality, making causal attribution difficult. The framework must account for this complexity while providing actionable guidance for content teams.

## Origin

Content analytics emerged from web analytics and content marketing, gaining sophistication as organizations invested more in content as a strategic capability. The shift from "publish and hope" to "publish, measure, optimize" was driven by the availability of granular engagement data (scroll depth, time on page, interaction events) and the rise of content marketing as a major acquisition channel.

Influences include Avinash Kaushik's digital analytics frameworks, Joe Pulizzi's content marketing methodology, and the editorial analytics practices of digital media companies like BuzzFeed, The New York Times, and Vox Media.

## Key Concepts

### Content Engagement Metrics

**Consumption metrics:**
- Page views / video views -- Volume of content consumed
- Unique visitors -- Reach of content
- Average time on page -- Depth of engagement (but be cautious: high time on page can indicate confusion, not interest)
- Scroll depth -- How far users scroll through content. Completion rate (reaching the end) is the key metric.
- Video completion rate -- Percentage watching to the end

**Interaction metrics:**
- Comments, shares, saves -- Active engagement signals
- Click-through rate on embedded links or CTAs -- Content driving action
- Content rating or feedback -- Direct quality signal
- Return visits attributed to content -- Content driving repeat engagement

**Engagement quality score:**
Combine multiple signals into a composite score that distinguishes genuinely engaged users from accidental or shallow visitors. Weight by business relevance: a user who reads an article and then starts a trial is more valuable than one who reads and leaves.

### Content Attribution

Content rarely converts directly. A blog post builds awareness; a comparison guide aids consideration; a case study supports the final decision. Content attribution requires multi-touch models:

- **Content-assisted conversions** -- How often does content appear in conversion paths, even if it is not the last touch?
- **Content influence score** -- For each piece of content, what percentage of converting users consumed it?
- **First-touch content attribution** -- Which content pieces are the entry point for users who eventually convert?
- **Content decay analysis** -- How long after consumption does content influence conversion? Some content has immediate impact; some has long-tail influence.

### Content Performance Taxonomy

Categorize content for comparative analysis:
- **By format** -- Articles, videos, infographics, guides, webinars, podcasts
- **By topic** -- Product education, thought leadership, use cases, industry news
- **By funnel stage** -- Awareness (broad topics), consideration (comparison, how-to), decision (case studies, demos)
- **By channel** -- Blog, email, social, partner, community
- **By effort** -- Quick posts vs. deep guides vs. multimedia productions. Compare performance relative to production effort.

### Content Lifecycle Metrics

Content is not a point-in-time event. Track performance over its lifecycle:

- **Launch performance** -- First 48 hours: initial distribution reach and engagement
- **Growth phase** -- First 30 days: organic discovery, social sharing, email distribution
- **Maturity** -- 30-180 days: search traffic, evergreen value, link accumulation
- **Decay** -- 180+ days: declining relevance, outdated information, diminishing traffic

Evergreen content that continues performing months after publication is more valuable per unit of effort than viral content that spikes and dies. Track the "half-life" of content to understand which types provide sustained value.

### Content Efficiency Metrics

- **Cost per content piece** -- Production cost (writer time, design, review)
- **Cost per engagement** -- Production cost divided by total meaningful engagements
- **Content ROI** -- Revenue attributed to content / content production cost
- **Publication velocity** -- Content pieces published per time period
- **Freshness rate** -- Percentage of content updated within the last 12 months

### Audience Development Metrics

Content should build an audience over time:
- **Subscriber growth** -- Email list, RSS, notification opt-ins
- **Return visitor rate** -- Percentage of content consumers who return
- **Audience overlap** -- How much audience is shared across content topics? Low overlap means you are reaching diverse segments.
- **Content-driven signups** -- Users who signed up for the product after consuming content

## Application to Data Squad

### Content Performance Dashboard

Build a dashboard with three views:
1. **Overview** -- Top-performing content this period, aggregate engagement trends, conversion contribution
2. **Content detail** -- Per-piece performance with engagement metrics, attribution, and lifecycle stage
3. **Comparative** -- Performance by format, topic, funnel stage, and channel to identify winning patterns

### Content-to-Conversion Funnel

Map the path from content consumption to business conversion:
Content view -> Engagement action -> Product visit -> Signup/Trial -> Activation -> Revenue

Measure conversion rates between each step and identify which content types have the strongest end-to-end conversion.

### Editorial Calendar Optimization

Provide data-informed input to editorial planning:
- Which topics drive the most engagement and conversion?
- Which formats perform best for each funnel stage?
- What is the optimal publication frequency?
- When is the best time to publish? (Day of week, time of day)

### Content Experimentation

Apply A/B testing to content where feasible:
- Headline testing (different titles for the same content)
- Format testing (video vs. article on the same topic)
- CTA placement and wording
- Distribution channel testing

### Search Performance Integration

Connect content analytics with search analytics (Google Search Console data):
- Which content ranks for target keywords?
- What is the click-through rate from search results?
- Which content gaps exist (high-value keywords without content)?

## Pitfalls

### Page Views as Primary Metric

Page views measure volume, not value. A high-traffic article that never converts is less valuable than a low-traffic article that consistently drives signups. Balance volume metrics with quality and conversion metrics.

### Ignoring Content Cannibalization

Multiple pieces targeting the same topic or keyword may compete with each other rather than compound. Monitor for cannibalization and consolidate where appropriate.

### Attribution Over-Claiming

Content teams are incentivized to claim credit for conversions. Ensure attribution methodology is transparent and consistent, and that the same conversion is not counted multiple times across channels.

### Short-Term Measurement Bias

Content value often accrues over months (SEO traffic, evergreen engagement). Evaluating content purely on launch-week performance systematically undervalues long-term content and overvalues viral content.

### Production Volume Over Quality

Measuring content team productivity by publication volume incentivizes quantity over quality. Pair volume metrics with per-piece performance metrics to maintain quality standards.

## Cross-References

- **marketing-analytics-framework.md** -- Content is often a primary marketing channel; content attribution feeds into marketing attribution
- **product-analytics-framework.md** -- Content consumption often precedes product engagement
- **mcclure-pirate-metrics-original.md** -- Content plays a role across AARRR stages, especially Acquisition and Activation
- **tufte-data-visualization-principles.md** -- Content performance dashboards should follow visualization best practices
- **goodhart-law-framework.md** -- Page view targets exemplify Goodhart's Law dynamics in content teams
- **analysis-layer.md** -- Content analysis uses cohort, funnel, and segmentation techniques
