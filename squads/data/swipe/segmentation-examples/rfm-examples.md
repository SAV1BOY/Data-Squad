# RFM Segmentation Examples with Actions Per Segment

Real-world RFM (Recency, Frequency, Monetary) segmentation implementations with segment-specific strategies.

---

## 1. Sephora - Beauty Retail RFM with Loyalty Integration

**Company/Context:** Sephora (2019). The CRM team combined RFM scoring with their Beauty Insider loyalty program to create actionable customer segments.

**What They Did:**
- Scored customers on R, F, M each from 1-5 (5 = best), creating 125 possible cells, then collapsed into 8 actionable segments:
  - **Champions** (R:5, F:5, M:5): Top 3% of customers. 12+ purchases/year, $1,200+ annual spend. Recent purchase within 14 days.
  - **Loyal Customers** (R:4-5, F:4-5, M:3-5): Top 15%. Consistent purchasers with moderate-to-high spend.
  - **Potential Loyalists** (R:4-5, F:2-3, M:2-3): Recent buyers with growing frequency. The segment with highest upside.
  - **New Customers** (R:5, F:1, M:1-2): First or second purchase in last 30 days.
  - **Promising** (R:3-4, F:1-2, M:1-2): Bought recently but not yet habitual.
  - **At Risk** (R:2-3, F:3-5, M:3-5): Previously loyal but recency declining. Haven't purchased in 60-90 days.
  - **Can't Lose Them** (R:1-2, F:4-5, M:4-5): High-value customers who haven't purchased in 90+ days. Critical recovery targets.
  - **Hibernating** (R:1, F:1-2, M:1-2): Low engagement across all dimensions. 180+ days since last purchase.

- **Actions per segment:**
  - Champions: Early access to new products, exclusive events, VIB Rouge tier perks, referral program enrollment.
  - Potential Loyalists: Cross-category recommendations ("You love skincare -- have you tried our fragrance collection?"), free samples with next order.
  - At Risk: "We miss you" email with personalized discount based on favorite category, loyalty points reminder.
  - Can't Lose Them: Direct outreach from store associate, high-value recovery offer (20% off + free gift), win-back survey to understand why they left.
  - Hibernating: Low-cost reactivation (email only, no paid media spend). If no response after 3 attempts, suppress from campaigns to protect sender reputation.

**Metrics Used:** Segment sizes, migration rates between segments, segment-specific conversion rates for campaigns, recovery rate for At Risk and Can't Lose, campaign ROI by segment.

**What Worked:** The "Can't Lose Them" segment (high historical value, declining recency) delivered the highest campaign ROI. Recovery offers to this segment had a 22% conversion rate vs. 3% for Hibernating. Investing disproportionately in recovery for this segment returned $4.2M in recovered revenue quarterly.

**What Failed:** The initial segmentation used fixed thresholds for R, F, M that didn't account for product category differences. Beauty tools (brushes, devices) naturally had lower frequency than consumables (skincare, makeup). Adding category-adjusted frequency scores improved segment accuracy.

**Lessons:** RFM segments must have distinct, pre-defined actions per segment. The highest-ROI segment for campaigns is often "Can't Lose Them" (high value, declining recency), not Champions. Adjust frequency scoring for product purchase cycles.

**Application to Data Squad:** Build RFM segmentations with pre-defined action playbooks per segment. Prioritize "Can't Lose Them" recovery before "Hibernating" reactivation. Adjust frequency expectations by product category.

---

## 2. Chewy - Pet Supply RFM with Autoship Integration

**Company/Context:** Chewy (2020). The marketing team used RFM to identify which customers to push toward Autoship (subscription) enrollment.

**What They Did:**
- RFM scoring adapted for consumable products (pet food, treats, supplies): R = days since last order, F = orders in last 12 months, M = total spend in last 12 months.
- Key innovation: added a 4th dimension, P (Predictability) -- how consistent was the customer's order timing? High P = orders arrived like clockwork (strong Autoship candidate). Low P = irregular ordering (may not benefit from subscription).
- Segments with Autoship strategy:
  - **High F, High P, No Autoship**: "Natural subscribers" -- already ordering regularly, just not enrolled. Light nudge: "Save 5% by setting up Autoship for items you already buy on schedule."
  - **High F, Low P, No Autoship**: Irregular heavy buyers. Needs investigation: do they buy in bulk? Wait for sales? Offer: "Set your own Autoship schedule" with flexible timing.
  - **Low F, High M**: Bulk buyers (few large orders). Autoship may not fit. Offer: quantity discounts and bulk replenishment reminders instead.
  - **Declining R, High Historical F**: Previously regular customers whose recency is slipping. Win-back priority: "Your pet's food might be running low" with one-click reorder.

**Metrics Used:** RFMP scores, Autoship enrollment rate by segment, Autoship retention rate by enrollment source, LTV lift from Autoship conversion, segment migration rates.

**What Worked:** The "High F, High P, No Autoship" segment was a goldmine. These customers were already behaving like subscribers but paying full price. A simple "set it and forget it" email with their actual order history pre-populated converted 35% to Autoship -- the highest conversion rate of any enrollment campaign.

**What Failed:** Pushing Autoship to the "Low F, High M" (bulk buyer) segment backfired. These customers deliberately bought in bulk to save, and Autoship's smaller, more frequent deliveries felt like a downgrade. Offering bulk-specific subscription options (quarterly large shipments) was more effective.

**Lessons:** Adding a Predictability dimension to RFM transforms it from a retrospective segmentation to a behavioral prediction tool. Match the subscription offer to the customer's natural buying rhythm, not a one-size-fits-all cadence.

**Application to Data Squad:** For clients with subscription/repeat purchase models, add a Predictability (order regularity) dimension to RFM. Use it to identify "natural subscribers" and match subscription offers to actual buying patterns.

---

## 3. Spotify - Digital RFM for Re-engagement

**Company/Context:** Spotify (2020). The growth team adapted RFM for a digital product where "monetary" was replaced with engagement depth.

**What They Did:**
- Adapted RFM for a freemium digital product:
  - R = days since last session.
  - F = sessions per month (average over last 3 months).
  - E (Engagement depth, replacing M) = average session duration x feature breadth (how many distinct features used: playlists, podcasts, social, radio, etc.).
- Segments with tailored re-engagement:
  - **Power Users** (R:5, F:5, E:5): Daily users with deep engagement. Strategy: premium feature highlights, early access to new features, ambassador/beta-tester recruitment.
  - **Casual Listeners** (R:3-4, F:2-3, E:1-2): Use Spotify a few times a week for background music. Strategy: personalized Discover Weekly push notifications, podcast recommendations to deepen engagement.
  - **Weekend Warriors** (R:3, F:1-2, E:3-4): Low frequency but deep sessions (long weekend listening binges). Strategy: Friday playlist push notifications, weekend-specific content recommendations.
  - **Fading** (R:2, F declining, E declining): Were regular users, now pulling back. Strategy: "Your Discover Weekly is ready" notification, re-engagement email with listening stats ("You discovered 45 new artists this year").
  - **Ghosting** (R:1, F:1, E:1): Haven't opened the app in 60+ days. Strategy: win-back email with social proof ("12 million new songs added since you last visited"), push notification with a specific artist they follow who released new music.

**Metrics Used:** RFE scores, segment sizes, re-engagement campaign response rates by segment, session recovery rate, premium conversion rate by segment.

**What Worked:** "Weekend Warriors" was an invisible segment in traditional engagement metrics (low daily active, moderate monthly active) but turned out to have the highest premium conversion rate of any non-Power-User segment. Their deep engagement during sessions indicated high willingness to pay. Targeted premium offers during their typical listening windows converted at 8%, vs. 2% for Casual Listeners.

**What Failed:** Using "days since last session" as Recency penalized Weekend Warriors unfairly (a 5-day gap was normal for them). Switching to "days since last session relative to their typical cadence" made Recency meaningful across different usage patterns.

**Lessons:** RFM for digital products should replace Monetary with Engagement Depth. Recency should be relative to the user's own cadence, not absolute days. Non-obvious segments (Weekend Warriors) can be the highest-value conversion targets.

**Application to Data Squad:** Adapt RFM for digital products using Engagement Depth instead of Monetary. Make Recency relative to user cadence. Look for non-obvious high-value segments hiding in moderate-frequency, high-depth patterns.
