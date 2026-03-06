# Community Analytics: Orbit and Common Room

## Overview

Community analytics platforms help companies measure and grow developer communities, open-source projects, and user communities. Orbit and Common Room are the two leading platforms in this space. They aggregate community interactions from multiple channels, identify key members, and measure community health.

## Why Community Analytics Matters

Communities drive growth for developer tools, open-source projects, and product-led growth companies:

- **Signal for product-market fit:** Active, growing communities indicate strong engagement.
- **Pipeline generation:** Community members convert to customers at higher rates.
- **Product feedback:** Community discussions surface feature requests and bugs.
- **Advocacy:** Engaged community members become brand ambassadors.
- **Support deflection:** Community members help each other, reducing support costs.

## Orbit

### What It Was

Orbit was a community analytics platform that tracked member activity across multiple channels and visualized engagement using the "Orbit Model." Note: Orbit was acquired by Postman in 2023. As of this writing, the standalone product may have changed. The concepts and metrics remain valuable regardless of tooling.

### The Orbit Model

A framework for understanding community engagement through two dimensions:

| Dimension | Description |
|-----------|-------------|
| **Love** (Y-axis) | Depth of engagement. How much effort a member puts into the community. |
| **Reach** (X-axis) | Breadth of influence. How many people a member can reach. |

### Orbit Levels

Members are categorized into concentric rings:

| Level | Name | Description | Examples |
|-------|------|-------------|---------|
| **Orbit 1** | Ambassadors | Most engaged, highest impact | Core contributors, advocates, speakers |
| **Orbit 2** | Contributors | Regularly active, creating content | PR submitters, forum answerers, content creators |
| **Orbit 3** | Participants | Occasionally active | Issue reporters, event attendees, commenters |
| **Orbit 4** | Observers | Passive engagement | Newsletter subscribers, social followers, lurkers |

### Key Metrics

| Metric | Definition | Why It Matters |
|--------|-----------|----------------|
| Active Members | Members with activity in the period | Community vitality |
| New Members | First-time contributors | Community growth |
| Returning Members | Members active again after absence | Re-engagement success |
| Activities | Total interactions across channels | Engagement volume |
| Orbit Level Distribution | % of members in each level | Community depth |
| Member Trajectory | Movement between orbit levels | Engagement trends |

### Activity Types Tracked

| Channel | Activities |
|---------|-----------|
| GitHub | Stars, forks, PRs, issues, comments, reviews |
| Discord | Messages, reactions, thread participation |
| Slack | Messages, reactions, thread replies |
| Twitter/X | Mentions, retweets, replies |
| Stack Overflow | Questions, answers tagged with your technology |
| Dev.to / Hashnode | Blog posts mentioning your product |
| Events | Meetup RSVPs, conference talks |
| Custom | Any activity via API or webhook |

## Common Room

### What It Is

Common Room is a community intelligence platform that aggregates community signals, identifies members, and connects community activity to business outcomes (pipeline, revenue).

### Key Differentiators from Orbit

| Aspect | Orbit (Historical) | Common Room |
|--------|-------------------|-------------|
| Focus | Community engagement metrics | Community-led growth (CLG) + revenue attribution |
| Identity resolution | Basic cross-channel matching | Advanced, connects to CRM contacts |
| Sales integration | Limited | Deep (Salesforce, HubSpot integration) |
| Signal-to-pipeline | Conceptual | Operationalized with alerts and workflows |

### Core Features

#### Unified Member Profiles

Common Room merges identities across channels to create a single member profile:

- Matches GitHub handle + Discord username + email + LinkedIn.
- Enriches profiles with company, role, and social data.
- Connects community members to CRM contacts and accounts.

#### Segments and Audiences

Create segments based on community behavior:

- "Users who opened a GitHub issue AND joined Discord in the last 30 days."
- "Members from enterprise companies who are active in the community."
- "Champions who have contributed content and have decision-making roles."

#### Signals and Alerts

Trigger workflows based on community activity:

| Signal | Alert | Action |
|--------|-------|--------|
| Enterprise user asks a question | Notify sales team | Personalized outreach |
| Champion changes jobs | Notify account team | Re-engage at new company |
| Spike in negative sentiment | Notify community team | Investigate and respond |
| Competitor mention | Notify product marketing | Prepare response materials |
| New contributor submits PR | Notify community team | Welcome and nurture |

#### Revenue Attribution

Connect community activity to pipeline and revenue:

- "Community members generate 3x more pipeline than non-community leads."
- "Users who attend a meetup have 2x higher trial-to-paid conversion."
- Track the journey: community interaction, product signup, sales conversation, closed deal.

## Community Metrics Framework

Regardless of which tool you use, measure these dimensions:

### Growth Metrics

| Metric | Definition | Healthy Range |
|--------|-----------|---------------|
| New member rate | New members per week/month | Steady growth |
| Member growth rate | (New - Churned) / Total | > 5% monthly |
| Channel growth | Growth per channel (Discord, GitHub, etc.) | Positive across channels |

### Engagement Metrics

| Metric | Definition | Healthy Range |
|--------|-----------|---------------|
| Active member rate | Active / Total members | > 20% monthly |
| Contribution ratio | Members who create (vs. consume) | > 5% |
| Response time | Time to first response on questions | < 24 hours |
| Thread depth | Average replies per thread | > 2 |
| Return rate | Members active in 2+ consecutive periods | > 30% |

### Value Metrics

| Metric | Definition |
|--------|-----------|
| Community-influenced pipeline | Pipeline from accounts with community activity |
| Community-to-customer rate | % of community members who become customers |
| Support deflection | Questions answered by community vs. support team |
| Content generated | Blog posts, tutorials, talks by community members |
| Product feedback captured | Feature requests and bugs from community channels |

### Health Metrics

| Metric | Definition | Watch For |
|--------|-----------|-----------|
| Sentiment | Positive vs. negative tone | Declining sentiment |
| Concentration | % of activity from top 10% | Over-reliance on few members |
| Diversity | Geographic, role, company size distribution | Homogeneity |
| Toxicity incidents | Reports, bans, negative interactions | Any increase |

## Implementation Best Practices

### Setting Up Community Analytics

1. **Map your channels.** List every place your community interacts (GitHub, Discord, Slack, forums, Twitter, events).
2. **Connect data sources.** Integrate each channel with your analytics platform.
3. **Define your member journey.** How do observers become participants, contributors, and ambassadors?
4. **Set baseline metrics.** Measure current state before trying to improve.
5. **Align with business goals.** Community metrics should connect to company OKRs.

### Data Quality

1. **Identity resolution is hard.** The same person may have different usernames across channels. Invest in matching.
2. **Bot activity.** Filter out bots and automated messages from metrics.
3. **Spam.** Community channels attract spam. Exclude from analytics.
4. **Internal vs. external.** Separate employee activity from community member activity.

### Reporting

- **Weekly:** Activity summary, new members, notable interactions.
- **Monthly:** Growth trends, engagement metrics, top contributors, business impact.
- **Quarterly:** Strategic review, ROI analysis, program adjustments.

## Connecting Community Data to the Data Stack

### Integration Architecture

```
GitHub ───────┐
Discord ──────┤
Slack ────────┤──> Common Room / Orbit ──> CRM (Salesforce)
Twitter ──────┤                         ──> Data Warehouse
Events ───────┤                         ──> Product Analytics
Custom API ───┘
```

### Warehouse Integration

Export community data to your warehouse for advanced analysis:

- Join community activity with product usage data.
- Build attribution models: community touchpoints in the customer journey.
- Create predictive models: which community behaviors predict conversion.
- Combine with revenue data for ROI analysis.

## Common Mistakes

1. **Vanity metrics.** Total Discord members means nothing if 95% are inactive. Focus on active and engaged members.
2. **Not connecting to business outcomes.** Community metrics without revenue attribution struggle to justify budget.
3. **Ignoring the silent majority.** Most community members are observers. They still have value; do not focus exclusively on loud contributors.
4. **Over-automating engagement.** Automated welcome messages are fine; automated relationship-building is not.
5. **Not investing in moderation.** Toxic communities die. Invest in moderation early.
6. **Treating community as a marketing channel.** Communities built on genuine value thrive. Communities built for lead generation feel transactional and fail.
