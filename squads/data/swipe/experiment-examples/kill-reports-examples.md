# Kill Report Examples

Experiments killed with good documentation -- how to capture value from experiments that don't ship.

---

## 1. LinkedIn - Gamification of Profile Completion

**Company/Context:** LinkedIn (2019). The growth team tested adding gamification elements (progress bars, badges, streaks) to encourage profile completion.

**What They Did:**
- Added a visible progress bar ("Your profile is 65% complete"), achievement badges for milestones (first endorsement, 100+ connections), and a "profile strength" streak (days in a row with profile updates).
- **Why It Was Killed:** Profile completion rate increased by 18%, but the quality of added information decreased dramatically. Users added low-quality skills, endorsements, and experience entries just to "complete" the gamification loop. Recruiter satisfaction with search results declined 8%.
- **Kill Decision:** The experiment improved the input metric (completion rate) but degraded the outcome metric (profile quality and recruiter utility). Shipped metrics looked good; system-level metrics looked bad.

**Metrics Used:** Profile completion rate (+18%), profile quality score (-12%), recruiter search satisfaction (-8%), endorsement quality index (-22%), time-to-revert for low-quality additions.

**What Worked in Documentation:** The kill report explicitly documented the "input vs. outcome divergence" -- the phenomenon where optimizing an input metric degrades the downstream outcome it was supposed to serve. This became a cautionary case study used in experiment design reviews.

**What Failed in Documentation:** The initial kill report only said "quality declined." Adding specific examples (users adding "Microsoft Word" as a skill 50+ times, endorsing strangers in bulk) made the failure concrete and memorable.

**Lessons Captured:** Gamification incentivizes completion of the gamification loop, not completion of the underlying goal. Always measure outcome quality alongside input quantity. When these diverge, the input metric is misleading.

**Application to Data Squad:** When clients propose gamification experiments, insist on quality guardrails alongside quantity metrics. Document the input-vs-outcome divergence pattern for client education.

---

## 2. Uber - Surge Pricing Transparency Experiment

**Company/Context:** Uber (2018). The team tested showing riders a detailed breakdown of surge pricing (base fare, surge multiplier, estimated driver earnings) to improve price transparency.

**What They Did:**
- Treatment showed: "Your fare is $24.50 = $14.00 base + $10.50 surge (1.75x). Surge pricing helps get more drivers on the road during busy times."
- **Why It Was Killed:** Ride request rate during surge dropped by 12% in the treatment group. Revenue per surge period dropped 8%. But cancellation rate during surge actually decreased (users who accepted the transparent price were more committed).
- **Kill Decision:** The transparency reduced demand more than it reduced cancellations. Net revenue impact was -6%. The insight was correct (transparency builds trust) but the implementation was wrong (showing the multiplier anchored users on the markup).

**Metrics Used:** Ride request rate during surge (-12%), cancellation rate during surge (-4%), net revenue per surge period (-8%), rider NPS during surge (+3%), rider trust score (+5%).

**What Worked in Documentation:** The kill report separated the "correct insight" from the "wrong implementation." Transparency did build trust (NPS up, cancellations down), but the specific format (showing the multiplier) backfired. This led to the eventual "upfront pricing" model (fixed total fare, no visible multiplier).

**What Failed in Documentation:** The report initially framed it as "transparency doesn't work." A reframe to "this format of transparency doesn't work" opened the door for the successful upfront pricing approach.

**Lessons Captured:** Kill reports should distinguish between "the hypothesis was wrong" and "the implementation was wrong." The same hypothesis can succeed with a different implementation. Anchoring effects in pricing are powerful -- showing a multiplier anchors users on the markup, not the value.

**Application to Data Squad:** Frame kill reports as hypothesis validation, not just experiment outcomes. Separate "what we learned about user behavior" from "what we learned about this specific implementation."

---

## 3. Slack - AI-Powered Channel Recommendations

**Company/Context:** Slack (2021). The product team tested recommending channels to join based on a user's role, team, and activity patterns.

**What They Did:**
- New users and existing users with low channel count received weekly recommendations: "Based on your role as a Product Manager, you might find #product-roadmap and #user-research useful."
- **Why It Was Killed:** Channel join rate from recommendations was high (25% of recommended channels were joined), but engagement in those channels was 60% lower than organically joined channels. Users joined recommended channels but didn't participate, creating "lurker bloat."
- **Kill Decision:** The feature succeeded at channel discovery but failed at channel engagement. Lurker bloat degraded the experience for active channel members (lower response rates, perceived "dead" channels).

**Metrics Used:** Recommendation acceptance rate (25%), message-sent rate in recommended vs. organic channels (40% vs. 100% baseline), channel-level engagement decline (-15% messages per active member in channels with high recommendation traffic), user satisfaction with channel experience.

**What Worked in Documentation:** The kill report introduced the "lurker bloat" concept: features that increase passive membership without active engagement can degrade the experience for existing active members. This became a standard guardrail for all recommendation features.

**What Failed in Documentation:** The report didn't initially quantify the "right" ratio of lurkers to active members. Follow-up analysis found that channels with more than 70% lurkers had significantly lower engagement per active member. This threshold was documented for future experiments.

**Lessons Captured:** Recommendation systems optimize for acceptance, not for engagement. In community-like products, passive membership growth can harm active member experience. Measure post-recommendation engagement, not just acceptance.

**Application to Data Squad:** For recommendation features, always measure downstream engagement, not just click/accept rates. For community products, track the lurker-to-active ratio as a guardrail.

---

## 4. Spotify - Social Listening Feature

**Company/Context:** Spotify (2020). The team tested a feature showing friends' real-time listening activity prominently in the app (expanded from the hidden sidebar to the main navigation).

**What They Did:**
- Made "Friend Activity" a tab in main navigation, showing what friends were listening to right now, with a "listen along" button.
- **Why It Was Killed:** "Listen along" clicks were high initially (novelty), but dropped 70% by week 3. More critically, 15% of users in the treatment group changed their listening behavior when they knew it was visible -- switching to "private session" more often or listening to different music. This reduced the authenticity signal and the effectiveness of Spotify's own recommendation engine (less honest listening data).
- **Kill Decision:** The feature created a social desirability bias in listening behavior, which degraded the quality of behavioral data feeding the recommendation algorithm. The downstream impact on recommendation quality outweighed the social engagement benefit.

**Metrics Used:** Listen-along clicks (high initially, -70% by week 3), private session usage (+15%), recommendation algorithm accuracy (-2% in treatment group), listening diversity index change, user self-reported "music discovery" satisfaction.

**What Worked in Documentation:** The kill report identified a new class of experiment risk: "behavioral distortion" -- features that change the behavior they're supposed to observe. This concept was added to the experiment review checklist as a mandatory consideration for any social feature.

**What Failed in Documentation:** The initial analysis missed the recommendation quality impact for 3 weeks. Adding "recommendation algorithm performance in treatment vs. control" as a standard metric for any experiment that could alter user behavior patterns was a key process improvement.

**Lessons Captured:** Social features can distort the behavior they make visible. When users know their actions are observed, they perform rather than behave naturally. This "observer effect" can degrade data quality for machine learning systems.

**Application to Data Squad:** When evaluating social or visibility features, assess whether making behavior visible will distort that behavior. Add "behavioral distortion" and "data quality impact" as standard guardrail checks.
