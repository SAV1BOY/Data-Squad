# Community-Led Growth Metrics Framework

> Sources: David Spinks (The Business of Belonging), Orbit Model, community practice

---

## Overview

Community-led growth (CLG) leverages a community of users, advocates, and contributors
as a growth engine. Unlike traditional marketing channels, community generates value
through peer-to-peer interaction, content creation, and social proof. This framework
defines the metrics needed to measure community health, contribution quality,
engagement loops, and the ROI attribution of community activity to business outcomes.

---

## When to Use

- When a company has invested in a community (forum, Slack/Discord, events) and needs
  to demonstrate its business value.
- When building a community strategy and need to define success metrics from the start.
- When leadership asks "what is the ROI of the community?"
- When designing contribution incentive programs and need to measure their impact.
- When comparing community-acquired customers to other acquisition channels.

---

## Core Concept

### Community Health Metrics

| Category          | Metrics                                                   |
|-------------------|-----------------------------------------------------------|
| **Size**          | Total members, growth rate, active member %               |
| **Activity**      | Posts, replies, reactions per period; DAU/MAU equivalent   |
| **Depth**         | Threads per topic, reply depth, time to first response    |
| **Diversity**     | % of content from non-staff, Gini coefficient of posts    |
| **Sentiment**     | NPS of community, positive/negative ratio                 |

### Contribution Metrics

Not all community activity is equal. Track contribution by type and quality:

| Contribution Type | Examples                         | Quality Signal                  |
|-------------------|----------------------------------|---------------------------------|
| Content creation  | Posts, guides, tutorials         | Views, saves, upvotes           |
| Peer support      | Answering questions              | Accepted answers, resolution %  |
| Feedback          | Feature requests, bug reports    | Product team response rate      |
| Advocacy          | Referrals, testimonials, events  | Attributed signups, revenue     |

### Engagement Loops

A healthy community creates self-reinforcing loops:

```
New Member -> Consumes Content -> Asks Question -> Gets Answer -> Answers Others
     ^                                                                |
     +----------------------------------------------------------------+
                     (Becomes advocate, attracts new members)
```

Measure each transition in the loop:
- Lurker -> Consumer (first content view)
- Consumer -> Contributor (first post/question)
- Contributor -> Regular (3+ contributions per month)
- Regular -> Champion (recognized helper, content creator)

### ROI Attribution

The hardest part: connecting community activity to business outcomes.

| Attribution Method      | Approach                                           |
|-------------------------|----------------------------------------------------|
| **Direct tracking**     | UTM-tagged community links to signup/purchase       |
| **Cohort comparison**   | Compare community-engaged vs. non-engaged customers |
| **Survey attribution**  | "How did you hear about us?" with community option  |
| **Matched-pair analysis**| Match community members to similar non-members      |
| **Incrementality test** | Randomly offer community access and measure uplift  |

---

## Steps / Process

### Step 1: Define Community Goals
- Is the community primarily for support deflection, product feedback, brand advocacy,
  or user acquisition? The goal determines which metrics matter most.

### Step 2: Instrument Community Activity
- Integrate community platform data (Discourse, Slack, Discord) with the data
  warehouse.
- Map community user IDs to product/CRM user IDs.

### Step 3: Build the Contribution Funnel
- Track members across the engagement stages: Lurker -> Consumer -> Contributor ->
  Regular -> Champion.
- Measure conversion rates between stages.

### Step 4: Measure Health Metrics
- Dashboard the health metrics (size, activity, depth, diversity, sentiment).
- Set thresholds for healthy ranges.

### Step 5: Attribute Business Impact
- Choose 1-2 attribution methods and implement them.
- Compare community-sourced or community-influenced customers on:
  - Activation rate
  - Retention rate
  - CLV
  - Support ticket volume
  - NPS

### Step 6: Calculate Community ROI
```
Community ROI = (Attributed Revenue + Support Deflection Savings + Brand Value)
                / Community Operating Cost
```
- Be conservative in attribution. Over-claiming erodes credibility.

### Step 7: Report and Iterate
- Monthly: community health dashboard.
- Quarterly: ROI report to leadership.
- Annually: strategic review of community goals and investment.

---

## Inputs / Outputs

### Inputs
| Input                          | Source                          |
|--------------------------------|---------------------------------|
| Community platform data        | Discourse, Slack, Discord API   |
| Product usage data             | Data warehouse                  |
| Customer revenue data          | Billing / CRM                   |
| Support ticket data            | Support platform                |

### Outputs
| Output                         | Consumer                        |
|--------------------------------|---------------------------------|
| Community health dashboard     | Community team, leadership      |
| Contribution funnel report     | Community team                  |
| ROI attribution report         | Leadership, finance             |
| Community-influenced CLV comp  | Marketing, product              |

---

## Pitfalls

1. **Vanity metrics.** Total members means little if 90% are inactive. Focus on active
   members and contribution quality.

2. **Over-attributing.** Claiming all revenue from community-engaged customers as
   community ROI is misleading. Use causal methods (matched pairs, incrementality).

3. **Ignoring the lurker majority.** Most community members consume but do not post.
   Content consumption is still valuable (support deflection, education).

4. **Staff-dominated content.** If 80% of posts are from staff, it is a content
   channel, not a community. Track the diversity ratio.

5. **No ID linkage.** Without mapping community IDs to product IDs, attribution is
   impossible. Solve the identity problem early.

6. **Short-term ROI pressure.** Community value compounds over years. Quarterly ROI
   demands can lead to premature defunding.

7. **Toxic dynamics.** Unhealthy community culture (harassment, spam, negativity)
   destroys value. Monitor sentiment and enforce guidelines.

---

## Cross-References

- [Spinks Community Business Model](spinks-community-business-model.md) -- Strategic
  framing for community investment.
- [Spinks Orbit Model](spinks-orbit-model.md) -- Engagement gravity model for members.
- [Spinks Contribution Path](spinks-contribution-path.md) -- Designing the contributor
  journey.
- [Attribution & Incrementality](attribution-and-incrementality.md) -- Methods for
  causal attribution of community impact.
- [AARRR Pirate Metrics](aarrr-pirate-metrics.md) -- Community as an acquisition and
  referral channel.
