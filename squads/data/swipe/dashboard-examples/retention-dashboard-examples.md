# Retention Dashboard Examples

Real-world cohort curves, churn waterfalls, and retention dashboards.

---

## 1. Spotify - Cohort Retention Curves with Flattening Analysis

**Company/Context:** Spotify (2019). The retention team needed to understand when cohorts "flattened" (reached steady-state retention) and what drove early vs. late churn.

**What They Did:**
- Plotted 12-month retention curves for each monthly sign-up cohort, overlaid on the same chart.
- Added a "flattening point" marker: the week where the curve's slope first dropped below -0.5% per week.
- Segmented curves by activation depth: users who completed 0-1, 2-3, or 4+ onboarding actions.
- Below the curves, a table showed "flattening retention rate" and "weeks to flatten" for each cohort.

**Metrics Used:** Weekly retention rate by cohort, flattening point (week number), flattening retention rate, activation depth segmentation.

**What Worked:** Discovered that the flattening point shifted earlier (from week 8 to week 5) for users who created a playlist in week 1. This became the primary activation target, and onboarding was redesigned to drive playlist creation.

**What Failed:** Monthly cohorts were too coarse for fast-moving product changes. Switching to weekly cohorts for the most recent 3 months revealed that a specific release had degraded early retention by 4 points -- invisible in monthly aggregation.

**Lessons:** Cohort granularity matters. Use weekly cohorts for recent periods and monthly for historical. Always mark the flattening point to separate "activation problem" from "engagement problem."

**Application to Data Squad:** Build retention dashboards with dual granularity (weekly recent, monthly historical). Automate flattening-point detection and surface it as a key metric.

---

## 2. Shopify - Merchant Churn Waterfall

**Company/Context:** Shopify (2020). The retention team needed to decompose monthly churn into actionable categories.

**What They Did:**
- Built a waterfall chart starting with beginning-of-month active merchants and ending with end-of-month active merchants.
- Positive flows: new merchants, reactivated merchants, plan upgrades.
- Negative flows: voluntary churn (cancelled), involuntary churn (payment failed), downgrade churn (moved to free/lower plan), dormant (no activity for 60+ days but still paying).
- Each churn category linked to a drill-down with top reasons (survey data, support tickets, usage patterns).

**Metrics Used:** Gross churn rate, net churn rate, voluntary vs. involuntary churn split, reactivation rate, downgrade rate, dormancy rate.

**What Worked:** Separating involuntary churn (payment failures) from voluntary revealed that 23% of all churn was recoverable through better dunning. Implementing smart retry logic and pre-dunning emails recovered $2.3M ARR annually.

**What Failed:** The "dormant" category was initially ignored because those merchants were still paying. When they finally churned 3-6 months later, the spike looked sudden. Adding dormancy as a leading indicator of future churn improved forecasting.

**Lessons:** Churn waterfalls must separate voluntary from involuntary churn -- the solutions are completely different. Dormancy is a leading indicator that deserves its own category.

**Application to Data Squad:** Every churn dashboard should be a waterfall, not a single number. Separate involuntary churn for quick-win recovery. Track dormancy as a churn predictor.

---

## 3. Peloton - Engagement-Based Retention Segmentation

**Company/Context:** Peloton (2020-2021). The retention team needed to understand the relationship between workout frequency and churn risk.

**What They Did:**
- Segmented subscribers into engagement tiers: Power (12+ workouts/month), Regular (5-11), Light (1-4), Dormant (0 in last 30 days).
- Dashboard showed: population distribution across tiers, month-over-month tier migration (who moved up/down), and 90-day churn probability per tier.
- A "tier migration matrix" showed transition probabilities (e.g., 15% of Light users become Dormant next month).

**Metrics Used:** Workouts per month, tier distribution, tier migration rates, churn probability per tier, tier-specific NPS.

**What Worked:** The migration matrix revealed that the Light-to-Dormant transition was the highest-volume churn risk (more total churners than Dormant-to-Churned because the Light tier was much larger). Targeting Light users with personalized workout recommendations reduced Light-to-Dormant migration by 18%.

**What Failed:** The tier definitions were static and didn't account for seasonality. January saw a surge in Power users who dropped to Light by March. Adding a "tenure-adjusted" view that compared users to their own historical baseline was more predictive.

**Lessons:** Tier migration matrices are more actionable than static retention rates. The highest-risk segment is often not the most disengaged but the largest segment with moderate disengagement.

**Application to Data Squad:** Build engagement-tier dashboards with migration matrices. Focus interventions on the tier with the highest absolute volume of at-risk users, not just the highest churn rate.

---

## 4. Slack - Logo vs. Revenue Retention Dashboard

**Company/Context:** Slack (2019). Finance and product disagreed on retention health because they measured different things -- logo retention (% of customers retained) vs. revenue retention (NRR).

**What They Did:**
- Side-by-side view: logo retention on the left, revenue retention on the right, with a reconciliation bridge in the middle.
- Bridge showed: expansion revenue from retained logos, contraction from downgrades, and the "size mix effect" (larger logos retained at higher rates, inflating revenue retention).
- Segmented both views by customer size tier: SMB, Mid-Market, Enterprise.

**Metrics Used:** Gross logo retention, gross revenue retention, NRR, expansion rate, contraction rate, size-tier segmentation.

**What Worked:** The bridge revealed that blended NRR of 130% masked SMB NRR of 95%. The SMB segment was net-contracting, hidden by Enterprise expansion. This led to a dedicated SMB retention program.

**What Failed:** Initially used annual cohorts, which were too slow. Switching to quarterly cohorts for SMB (shorter contracts) and annual for Enterprise (longer cycles) matched the natural rhythm of each segment.

**Lessons:** Always show logo and revenue retention side-by-side with a bridge. Segment by customer size -- blended metrics hide segment-level problems.

**Application to Data Squad:** For B2B SaaS clients, build the logo-vs-revenue retention bridge as a standard view. Insist on size-tier segmentation; blended NRR is a vanity metric.

---

## 5. Netflix - Content-Driven Retention Heatmap

**Company/Context:** Netflix (2020). The retention team needed to understand which content categories drove subscriber retention vs. acquisition.

**What They Did:**
- Built a heatmap: rows were content categories (original drama, licensed comedy, documentaries, etc.), columns were retention metrics (30-day, 90-day, 180-day, churn-save rate).
- Each cell showed the retention lift for users whose primary viewing was in that category vs. the overall average.
- A separate "content diversity" metric tracked how many categories a user watched -- higher diversity correlated with lower churn.

**Metrics Used:** Category-specific retention lift, churn-save rate by category, content diversity index, primary-category classification.

**What Worked:** Discovered that documentary viewers had the highest 30-day retention but the lowest 180-day retention (they binged and left). Original drama viewers had lower 30-day but much higher 180-day retention. This shifted content investment toward "slow burn" series.

**What Failed:** The heatmap was initially too granular (40+ subcategories) and became unreadable. Collapsing to 8-10 macro-categories with drill-down capability made it usable in exec reviews.

**Lessons:** Content or feature retention heatmaps should use 8-10 macro-categories for readability. Short-term and long-term retention can tell opposite stories.

**Application to Data Squad:** For content or feature-heavy products, build retention heatmaps by category. Always include both short-term and long-term retention -- they reveal different strategic insights.
