# Community Scorecard Examples

Real-world community scorecards showing how to measure community health, engagement, and business impact.

---

## 1. Salesforce Trailblazer Community - Community Health Scorecard

**Company/Context:** Salesforce (2020). The Trailblazer Community team needed a scorecard that tracked community health beyond simple member counts.

**What They Did:**
- Built a 5-dimension scorecard, reviewed monthly:
  1. **Vitality** (is the community active?): Monthly active members, posts per member, response rate (% of questions that received at least one answer), median time to first response.
  2. **Depth** (is engagement meaningful?): Average thread length, accepted answer rate, content quality score (upvotes per post), knowledge base articles generated from community threads.
  3. **Breadth** (is it reaching enough people?): Member growth rate, new member activation rate (posted or replied within 30 days), geographic and product-area distribution.
  4. **Health** (is the community self-sustaining?): Peer-to-peer answer ratio (answers from community vs. staff), repeat contributor rate (% of answerers who answered 3+ questions this month), staff-to-community content ratio.
  5. **Impact** (does it drive business value?): Support ticket deflection (% of members who visited community then didn't file a ticket), product adoption correlation, certification completion rate for active community members.

**Metrics Used:** MAM, posts per member, response rate, time to first response, peer answer ratio, ticket deflection rate, new member activation rate.

**What Worked:** The peer-to-peer answer ratio became the north star for community self-sustainability. When peer answers exceeded 70% of total answers, staff could shift from answering to curating. Tracking this ratio over time showed the community becoming more self-sustaining (from 45% peer answers in 2018 to 78% in 2020).

**What Failed:** "Member count" was initially a headline metric but was dropped after analysis showed no correlation with any business outcome. Active member count and activation rate were far more meaningful.

**Lessons:** Community scorecards must measure self-sustainability (peer-to-peer ratios), not just volume. Activation rate (new members who participate) matters more than total member count. Ticket deflection is the strongest business-impact metric.

**Application to Data Squad:** Build community scorecards with 5 dimensions: vitality, depth, breadth, health, and impact. Drop vanity metrics (total members). Measure self-sustainability via peer-to-peer ratios.

---

## 2. Notion Ambassadors - Ambassador Program Scorecard

**Company/Context:** Notion (2021). The community team needed to measure the impact of their Ambassador program (power users who created content, hosted events, and evangelized Notion).

**What They Did:**
- Ambassador-level scorecard tracking individual and cohort performance:
  - **Activity**: Templates published, tutorials created, events hosted, social posts, forum answers.
  - **Reach**: Total views/downloads of ambassador content, event attendance, social impressions.
  - **Conversion**: Sign-ups attributed to ambassador content (tracked via UTM links and referral codes), free-to-paid conversion of ambassador-referred users.
  - **Quality**: Content rating (community upvotes/downloads), event NPS, referred-user retention rate at 90 days.
- Cohort-level scorecard: compared ambassador cohorts (quarterly enrollment batches) on ramp-up time, peak activity, and sustained engagement.
- Identified that ambassador tenure of 6-12 months was peak contribution; after 12 months, 40% became less active.

**Metrics Used:** Ambassador activity rate, content reach, attributed sign-ups, referred-user conversion rate, ambassador tenure curve, ambassador cohort comparison.

**What Worked:** Tracking referred-user quality (90-day retention) alongside volume prevented optimizing for sign-up counts at the expense of user quality. Top ambassadors by volume and top ambassadors by referred-user retention were only 30% overlapping, revealing two distinct ambassador archetypes: "evangelists" (high volume, moderate quality) and "educators" (moderate volume, high quality).

**What Failed:** The initial scorecard rewarded all activity equally. An ambassador who published a low-effort template counted the same as one who created a detailed video tutorial. Weighting by content type and engagement metrics fixed the incentive misalignment.

**Lessons:** Ambassador scorecards must measure quality (referred-user retention) alongside quantity (sign-ups). Identify ambassador archetypes and tailor programs to each. Track the ambassador tenure curve to anticipate and manage burnout.

**Application to Data Squad:** Build ambassador/advocate scorecards with quality-weighted activity metrics. Track referred-user quality, not just volume. Monitor the ambassador tenure curve and build re-engagement programs for the 12-month dip.

---

## 3. Figma Community - Platform Community Scorecard

**Company/Context:** Figma (2021). The community platform (where users shared templates, plugins, and widgets) needed a scorecard that tracked creator-consumer marketplace health.

**What They Did:**
- Two-sided scorecard:
  - **Creator side**: Active creators (published in last 90 days), resources published per creator, creator retention (% still publishing after 6 months), earnings/downloads per resource (creator value proposition).
  - **Consumer side**: Monthly resource users, resources installed per user, resource-to-daily-use rate (% of installed resources actually used regularly), NPS for community resources.
  - **Marketplace balance**: Creator-to-consumer ratio, resources per category (identifying over- and under-served categories), discovery effectiveness (% of resources with 0 installs after 30 days).
  - **Business impact**: Users who installed community resources had 2.1x higher retention than non-community users. Plugin users had 1.8x higher team expansion rate.

**Metrics Used:** Active creators, resources published, creator retention, resources per user, resource usage rate, marketplace balance ratios, community-user retention lift.

**What Worked:** The "resources with 0 installs" metric (30% of published resources had zero installs after 30 days) identified a discovery problem. Improving search and recommendation for community resources reduced this to 15% and increased overall community engagement.

**What Failed:** Creator retention was initially measured as "still has an account." Changing to "published a new or updated resource in the last 90 days" revealed that 60% of "retained" creators were actually dormant. Active creator retention was the more honest metric.

**Lessons:** Platform community scorecards must measure both sides (creator and consumer) and marketplace balance. Discovery effectiveness (do resources find their audience?) is often the bottleneck. Use active definitions, not account existence, for retention.

**Application to Data Squad:** For platform communities, build two-sided scorecards. Measure discovery effectiveness alongside content volume. Track the business impact (retention lift) of community participation.
