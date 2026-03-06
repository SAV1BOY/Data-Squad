# Retention Curve Examples with Interpretation

Real-world retention curve analyses showing how to read, interpret, and act on cohort retention data.

---

## 1. Duolingo - "Smile Curve" Retention Pattern

**Company/Context:** Duolingo (2020). The retention team discovered that their retention curves exhibited a rare "smile" pattern -- retention dipped in months 2-3 then recovered in months 4-6 for a subset of users.

**What They Did:**
- Plotted 12-month retention curves for monthly sign-up cohorts, segmented by activation depth (completed 1 lesson, completed 7-day streak, completed first unit).
- The "completed first unit" segment showed a dip from 45% (month 1) to 32% (month 3) then a recovery to 38% (month 6) -- the "smile curve."
- Investigation revealed the mechanism: users who completed a unit felt a sense of accomplishment, took a break, then returned when they received a "You're losing your progress" notification combined with a new course release.
- Non-activated users showed a standard decay curve with no recovery.

**Metrics Used:** Monthly retention by activation segment, curve shape classification (decay, flatten, smile), reactivation trigger analysis, notification response rates by dormancy length.

**What Worked:** Identifying the smile curve changed the retention strategy. Instead of treating month-2 dropoff as permanent churn, the team invested in reactivation campaigns timed to the natural recovery point (month 3-4). Reactivation email campaigns at the 60-day dormancy mark increased smile-curve recovery by 25%.

**What Failed:** Initially, the smile curve was invisible because it was averaged with non-activated users (who showed pure decay). Only segmenting by activation depth revealed the pattern. Global retention curves hid the most actionable insight.

**Lessons:** Always segment retention curves by activation depth. Rare curve shapes (smile, plateau-then-drop) contain the most actionable insights. Reactivation timing should match the natural recovery pattern, not be arbitrary.

**Application to Data Squad:** When analyzing retention curves, look for non-standard patterns in segments. A "smile curve" indicates reactivation opportunity. Time reactivation campaigns to the natural recovery point.

---

## 2. Notion - Retention by Use-Case Cohort

**Company/Context:** Notion (2021). The retention team found that overall retention curves were mediocre, but use-case-specific curves told dramatically different stories.

**What They Did:**
- Classified users by primary use case in their first 14 days: Personal Notes, Team Wiki, Project Management, Knowledge Base, Database/CRM.
- Plotted separate 12-month retention curves for each use-case cohort.
- Results: Team Wiki users retained at 72% at month 12. Personal Notes users retained at 18% at month 12. Project Management users retained at 55%.
- Cross-tabulated with team size: single-user retention was 25% at month 12 regardless of use case. Team users (3+) retained at 65%.

**Metrics Used:** 12-month retention by use case, retention by team size, use-case migration rate, multi-use-case adoption rate.

**What Worked:** The massive gap between Team Wiki (72%) and Personal Notes (18%) shifted the entire onboarding strategy. Instead of a generic onboarding, new users were routed into use-case-specific flows, with team-based use cases promoted first.

**What Failed:** Initial use-case classification was based on template selection, which many users skipped. Behavioral classification (analyzing actual content created in first 14 days) was more accurate but required ML model development.

**Lessons:** Aggregate retention curves for horizontal products are nearly meaningless. Use-case segmentation reveals which use cases drive retention and which are "tourist" behaviors. Team/collaborative use cases almost always retain better than individual ones.

**Application to Data Squad:** For horizontal products, segment retention by use case before drawing any conclusions. Push clients toward promoting high-retention use cases in onboarding.

---

## 3. Calm (Meditation App) - Retention with Habit Formation Markers

**Company/Context:** Calm (2020). The retention team wanted to identify the "habit formation" moment that predicted long-term retention.

**What They Did:**
- Tested multiple "habit markers" against 6-month retention: 1 session completed, 3 sessions in first week, 7 sessions in first 14 days, 3 consecutive days, 7 consecutive days, completed a program (multi-day series).
- Plotted retention curves for users who hit each marker vs. those who didn't.
- Found that "3 sessions in first 7 days" was the inflection point: users who hit this marker retained at 52% at month 6 vs. 11% for those who didn't.
- "Completed a program" retained at 68% at month 6 but was too high a bar (only 8% of users reached it in the first month).

**Metrics Used:** 6-month retention by habit marker, marker completion rate, time-to-marker, retention lift per marker (absolute and relative).

**What Worked:** The "3 in 7" marker balanced predictive power with achievability (35% of users hit it). Onboarding was redesigned around driving 3 sessions in 7 days: day-1 guided session, day-2 push notification with a different session type, day-5 "you're almost there" reminder. This increased the marker hit rate from 35% to 44%.

**What Failed:** The team initially targeted "7 consecutive days" (a streak), which had higher predictive power but only 12% of users achieved it. Optimizing for an unachievable marker wasted resources. The "good enough" marker with higher achievability drove more total retained users.

**Lessons:** The best activation marker balances predictive power with achievability. Maximize (predictive lift) x (% of users who can reach it). Streaks are powerful but often too demanding as initial activation targets.

**Application to Data Squad:** When identifying activation markers, calculate both predictive lift and achievability. Optimize for total retained users (lift x reach), not just the strongest correlation.

---

## 4. Shopify - Merchant Retention by First-Sale Timing

**Company/Context:** Shopify (2019). The retention team analyzed how quickly a new merchant's first sale predicted long-term retention.

**What They Did:**
- Segmented new merchants by days from sign-up to first sale: 0-7 days, 8-14 days, 15-30 days, 31-60 days, 60+ days, never.
- Plotted 12-month retention curves for each segment.
- Results: merchants with first sale in 0-7 days retained at 78% at month 12. First sale at 15-30 days: 52%. First sale at 60+ days: 23%. Never had a sale: 8%.
- The curves also showed different shapes: fast-first-sale merchants had a flat curve (stable retention), while slow-first-sale merchants had a steep decay (suggesting they were losing confidence).

**Metrics Used:** Days to first sale, 12-month retention by first-sale timing, curve shape (decay rate), GMV at month 12 by cohort.

**What Worked:** The stark difference (78% vs. 23% retention) justified massive investment in accelerating first-sale timing. Shopify built "Quick Start" programs, pre-built store templates, and first-sale celebration emails. Median days-to-first-sale decreased from 21 to 14 days, with measurable retention impact.

**What Failed:** The initial analysis didn't control for merchant intent. Merchants who signed up with a product ready (serious intent) naturally got first sales faster AND retained better. A causal analysis using instrumental variables (randomized onboarding speed) confirmed that faster first sale did causally improve retention, but the effect was smaller than the raw correlation suggested (3x lift, not 6x).

**Lessons:** Time-to-value metrics are powerful retention predictors but often have confounding factors. Attempt causal analysis before investing heavily. Even if the causal effect is smaller than correlation, it's usually still worth optimizing.

**Application to Data Squad:** Use time-to-first-value as a standard cohort segmentation. Be transparent with clients about correlation vs. causation, but note that accelerating time-to-value is almost always a worthwhile investment.
