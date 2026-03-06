# Experiment Analysis Examples

Well-executed experiment analyses from real companies, showing how to move from raw results to actionable insights.

---

## 1. Airbnb - Search Ranking Algorithm Change

**Company/Context:** Airbnb (2019). The search team tested a new ranking algorithm that weighted guest reviews more heavily and listing photos less heavily.

**What They Did:**
- Ran a 5% traffic holdback experiment for 6 weeks across all markets.
- Primary analysis: booking conversion rate increased by 2.1% (statistically significant, p < 0.001).
- Heterogeneity analysis: segmented results by market maturity (established vs. new), listing type (entire home vs. shared), and guest experience level (first-time vs. repeat).
- Discovered that the new algorithm helped repeat guests (+3.4%) but hurt first-time guests (-0.8%) who relied on photos to evaluate unfamiliar listing types.
- Long-term analysis: tracked cohorts exposed to new vs. old algorithm for 90 days post-experiment. New algorithm cohort had 5% higher rebooking rate.

**Metrics Used:** Booking conversion, revenue per search, rebooking rate, segment-level treatment effects, confidence intervals per segment.

**What Worked:** The heterogeneity analysis prevented a bad decision. The aggregate +2.1% lift would have been shipped immediately, but the -0.8% effect on first-time guests (a critical growth segment) led to a modified algorithm: review-weighted ranking for repeat guests, photo-weighted ranking for first-time guests.

**What Failed:** The initial analysis only looked at 2-week results. The 90-day cohort follow-up was added after the fact and revealed the long-term rebooking benefit. This became a standard requirement for all search experiments.

**Lessons:** Always run heterogeneity analysis across key segments before declaring a winner. Aggregate lifts can mask segment-level harm. Long-term cohort follow-ups should be standard for foundational changes.

**Application to Data Squad:** Build heterogeneity analysis into every experiment analysis template. Require segment cuts across user experience level, customer value tier, and key behavioral dimensions.

---

## 2. Microsoft (Bing) - Revenue Per Search Impact Analysis

**Company/Context:** Bing (2019). A UI change to ad placement was tested with the expectation of increasing ad clicks, but the analysis uncovered complex second-order effects.

**What They Did:**
- The experiment moved ads from the right sidebar to inline with organic results (a change Google had made years earlier).
- Primary metric: revenue per search increased 12% (very significant).
- But the analysis went deeper: user-level analysis showed that search sessions became shorter. Users were clicking ads earlier and leaving, reducing organic click-throughs and subsequent searches.
- Calculated a "session-level revenue" metric: revenue per search was up, but searches per session were down, making session-level revenue only +3%.
- Further analysis: 30-day user-level analysis showed no change in total searches per user, suggesting the session effect was a redistribution, not a net loss.

**Metrics Used:** Revenue per search, clicks per search, searches per session, session-level revenue, 30-day user-level search volume, ad click-through rate.

**What Worked:** The multi-level analysis (per-search, per-session, per-user, per-30-days) revealed that the same data told different stories at different levels of aggregation. The 30-day user-level analysis confirmed the change was net positive.

**What Failed:** Relying solely on revenue-per-search would have overestimated the impact by 4x. The team built a standard "zoom out" checklist: per-action, per-session, per-user-day, per-user-month.

**Lessons:** Always analyze experiments at multiple levels of aggregation. Per-action metrics can be misleading when the action count changes. Build a "zoom out" analysis checklist.

**Application to Data Squad:** Require multi-level analysis for every experiment: per-action, per-session, per-user-period. Flag any experiment where the per-action metric moves significantly differently from the per-user metric.

---

## 3. Spotify - Podcast Recommendation Experiment

**Company/Context:** Spotify (2020). The team tested adding podcast recommendations to the music home feed to increase podcast adoption.

**What They Did:**
- Treatment: 20% of home feed slots replaced with podcast recommendations for users who had never listened to a podcast.
- Primary metric: podcast trial rate (% of users who played at least 1 podcast episode in 30 days).
- Analysis revealed: podcast trial rate increased from 4% to 11% (strong lift), but music streaming hours decreased by 3%.
- Substitution analysis: calculated "total listening hours" (music + podcast). Total hours increased by 1.5%, indicating podcasts were mostly additive but partially substituted for music.
- Revenue impact: podcast listeners had 15% lower churn at 6 months, but podcast ad revenue per hour was lower than music subscription revenue per hour. Net revenue impact was modeled as +2% at 12-month horizon.

**Metrics Used:** Podcast trial rate, music streaming hours, total listening hours, substitution rate, 6-month churn rate by content type, net revenue impact.

**What Worked:** The substitution analysis was critical. Without it, the team would have either: (a) celebrated the podcast trial lift and ignored the music decline, or (b) panicked about the music decline and killed a net-positive experiment. Calculating total listening hours and long-term retention impact gave the full picture.

**What Failed:** The revenue modeling initially used current podcast ad rates, which were depressed due to low inventory. Forward-looking estimates (based on podcast adoption targets) were needed to make the business case.

**Lessons:** When an experiment promotes one behavior at the potential expense of another, always run a substitution analysis. Calculate net effect across all affected metrics before deciding.

**Application to Data Squad:** For experiments that shift user behavior between product areas, build a substitution analysis framework: what was gained, what was lost, what's the net across the full portfolio.

---

## 4. Amazon - Buy Box Algorithm Experiment

**Company/Context:** Amazon (2018). The marketplace team tested changes to the Buy Box algorithm (which seller wins the default "Add to Cart" button).

**What They Did:**
- Tested weighting delivery speed more heavily in Buy Box selection (favoring FBA and fast-shipping sellers).
- Analysis included: purchase conversion (up 1.8%), average selling price (up 0.3% -- faster sellers charged slightly more), return rate (down 0.5%), and seller ecosystem impact.
- Seller ecosystem analysis: tracked whether non-FBA sellers lost sales share, and whether this led to seller churn or FBA enrollment.
- 90-day follow-up: 12% of disadvantaged sellers enrolled in FBA, 3% churned, 85% continued with lower Buy Box win rates.
- Customer lifetime impact: buyers who experienced faster delivery in the experiment had 4% higher 90-day reorder rate.

**Metrics Used:** Purchase conversion, ASP, return rate, seller Buy Box win rate distribution, FBA enrollment rate, seller churn, buyer reorder rate.

**What Worked:** Analyzing the seller-side ecosystem impact (not just the buyer-side conversion) prevented a narrow optimization that could have damaged the marketplace long-term. The 12% FBA enrollment rate showed that the algorithm change could drive seller behavior improvement.

**What Failed:** The initial analysis treated all sellers equally. Segmenting by seller size revealed that small sellers were disproportionately impacted. The final implementation included a "small seller boost" to prevent ecosystem concentration.

**Lessons:** Marketplace experiments must analyze both sides. Seller-side impacts (churn, behavior change) have long-term consequences that buyer-side metrics miss. Segment by participant size.

**Application to Data Squad:** For marketplace experiments, always analyze both supply-side and demand-side impacts. Include ecosystem health metrics (supply diversity, participant churn) alongside conversion metrics.
