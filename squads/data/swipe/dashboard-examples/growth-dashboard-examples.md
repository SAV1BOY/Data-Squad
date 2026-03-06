# Growth Dashboard Examples

Real-world activation funnels, experiment velocity trackers, and growth dashboards.

---

## 1. Dropbox - Activation Funnel Dashboard

**Company/Context:** Dropbox (2017-2018). The growth team needed to identify where new users dropped off between sign-up and becoming habitual users.

**What They Did:**
- Defined a 7-step activation funnel: sign-up, download client, first file upload, first folder created, first file shared, second device connected, 7-day return.
- Dashboard showed conversion rate between each step, segmented by acquisition channel.
- Added "time to complete" for each step -- users who uploaded within 1 hour had 3x higher 30-day retention.
- Highlighted the biggest drop-off step with a red banner and auto-generated Slack alert when drop-off exceeded threshold.

**Metrics Used:** Step-to-step conversion rates, time-to-complete per step, 30-day retention by activation depth, channel-segmented funnel.

**What Worked:** Discovering that "second device connected" was the strongest predictor of retention (not file sharing, as assumed) shifted the entire onboarding flow to prioritize multi-device setup. This single insight drove a 15% improvement in 30-day retention.

**What Failed:** The initial funnel was linear, but real user behavior was non-linear. Some users shared before uploading. Adding a "flexible funnel" view (any-order completion) revealed different optimization opportunities.

**Lessons:** Activation funnels should track both linear and non-linear paths. Time-to-complete is often more predictive than completion alone.

**Application to Data Squad:** When building activation dashboards, always include time-to-complete alongside conversion rates. Test whether the funnel is truly sequential or if users take multiple paths.

---

## 2. Slack - Experiment Velocity Tracker

**Company/Context:** Slack (2019-2020). The growth team ran 40+ experiments per quarter and needed visibility into experiment throughput and learning rate.

**What They Did:**
- Dashboard tracked: experiments launched this week/month/quarter, experiments concluded, win rate (% of experiments that shipped), average experiment duration, and "learning velocity" (new validated insights per week).
- Each experiment card showed: hypothesis, metric moved, statistical significance status, and days running.
- A backlog health section showed experiments queued, blocked (waiting for engineering), and average time-in-queue.

**Metrics Used:** Experiments launched/concluded per period, win rate, average duration, learning velocity, backlog depth, time-in-queue.

**What Worked:** Tracking "learning velocity" rather than just win rate changed the culture. Teams stopped viewing non-winning experiments as failures and started valuing the insight generated. Backlog visibility reduced engineering bottlenecks by 30%.

**What Failed:** Initially counted all experiments equally. A button color test counted the same as a pricing experiment. Adding an "impact tier" (S/M/L based on addressable metric movement) fixed prioritization.

**Lessons:** Experiment velocity dashboards must distinguish between experiment volume and experiment impact. Learning velocity is a better north star than win rate.

**Application to Data Squad:** Build experiment trackers with impact tiers. Measure learning velocity (insights per week) as the primary growth team health metric.

---

## 3. Pinterest - Channel-Level Growth Dashboard

**Company/Context:** Pinterest (2018). The growth team needed to understand acquisition efficiency across SEO, paid, viral, and direct channels simultaneously.

**What They Did:**
- Four-panel dashboard, one per channel: SEO (pages indexed, click-through rate, sign-ups from search), Paid (CAC by channel, ROAS, budget utilization), Viral (invites sent, invite conversion rate, K-factor), Direct (brand search volume, direct URL visits, reactivation rate).
- Each panel showed a 12-week trend and a "health score" (0-100) based on whether the channel was improving or declining.
- Cross-channel view showed marginal CAC curves to identify the optimal spend allocation.

**Metrics Used:** Channel-specific CAC, ROAS, K-factor, pages indexed, invite conversion, brand search volume, marginal CAC curves.

**What Worked:** The marginal CAC curve view revealed that Pinterest was over-investing in paid (diminishing returns above $X/day) and under-investing in SEO (still on the steep part of the curve). Reallocation improved blended CAC by 22%.

**What Failed:** Viral metrics were initially self-reported by the product team and didn't match finance numbers. Aligning on a single attribution model took 6 weeks but was essential for the dashboard to be trusted.

**Lessons:** Growth dashboards must use consistent attribution across all channels. Marginal CAC curves (not averages) reveal the real optimization opportunity.

**Application to Data Squad:** When clients ask for growth dashboards, push for marginal analysis over averages. Ensure attribution methodology is agreed upon before building the dashboard.

---

## 4. Duolingo - Daily Engagement and Streak Dashboard

**Company/Context:** Duolingo (2020). The growth team treated daily engagement as the core growth lever and needed real-time visibility.

**What They Did:**
- Real-time dashboard showing: DAU (current vs. same day last week), lesson completions, streak holders (users with active streaks), streak-at-risk (users who haven't completed today's lesson by 6 PM local time).
- Notification effectiveness panel: push notification send rate, open rate, lesson-start rate post-notification, and streak-save rate.
- A/B test panel showing all active engagement experiments with real-time lift estimates.

**Metrics Used:** DAU, lessons completed, streak count distribution, streak-at-risk count, notification open rate, streak-save rate, experiment lift estimates.

**What Worked:** The "streak-at-risk" metric became the team's obsession. They built automated notification triggers when streak-at-risk exceeded historical norms, reducing streak breaks by 12%. Real-time experiment monitoring caught a notification experiment that was accidentally suppressing sends within 4 hours.

**What Failed:** The real-time view initially caused over-reaction to normal daily fluctuations. Adding confidence intervals and "expected range" bands reduced false alarms.

**Lessons:** Real-time dashboards need expected-range bands to prevent panic over normal variance. Identify the "at-risk" segment for your core engagement metric and make it prominent.

**Application to Data Squad:** For engagement-focused products, build an "at-risk" metric that identifies users about to lose their habit. Add expected-range bands to any real-time dashboard.

---

## 5. Notion - Product-Qualified Lead Scoring Dashboard

**Company/Context:** Notion (2021). The growth team needed to identify which free workspaces were ready for sales outreach.

**What They Did:**
- Scored every free workspace on: team size, weekly active editors, content volume (pages created), integration usage, template usage, and cross-functional spread (number of distinct teams using the workspace).
- Dashboard showed: PQL volume by score tier, conversion rate by tier, average days from PQL to close, and a "PQL quality trend" line showing whether average PQL score was improving.
- Sales team had a companion view showing their assigned PQLs ranked by score.

**Metrics Used:** PQL score, PQL volume by tier, PQL-to-close conversion rate, days-to-close, PQL quality trend, workspace activity metrics.

**What Worked:** Cross-functional spread (number of teams) was the single strongest predictor of enterprise conversion, outperforming team size and content volume. Adding this signal increased PQL-to-close rate by 35%.

**What Failed:** The scoring model initially weighted all activity equally. A workspace with 50 pages created by 1 person scored similarly to one with 20 pages created by 10 people. Weighting breadth of usage over depth fixed this.

**Lessons:** In PLG scoring, breadth of adoption (how many teams, roles, use cases) typically outpredicts depth (how much one team uses it).

**Application to Data Squad:** When building PQL dashboards, prioritize breadth-of-adoption signals over depth-of-usage signals. Track PQL quality trends to ensure the pipeline isn't degrading as volume scales.
