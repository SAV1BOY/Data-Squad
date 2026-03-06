# Executive Dashboard Examples

Real-world examples of "one-slide truth" dashboards that executives actually use.

---

## 1. Netflix - Content Performance Executive View

**Company/Context:** Netflix (2019-2021 era). Leadership needed a single view to decide content investment across 190+ countries.

**What They Did:**
- Built a single-screen dashboard combining completion rate, cost-per-view-hour, and acquisition attribution for every original title.
- Used a "efficiency index" (view-hours divided by production cost) as the north-star metric visible at the top.
- Color-coded tiles: green (above benchmark), yellow (within 1 SD), red (below benchmark).
- Included a 90-day trailing trend spark-line next to each metric so execs could see direction without drilling in.

**Metrics Used:** Completion rate, cost-per-view-hour, member acquisition attributed to title, efficiency index, churn-save rate (members who would have churned but stayed for a title).

**What Worked:** The efficiency index forced apples-to-apples comparison across genres. Execs stopped asking "how did show X do?" and started asking "how efficient was show X?" -- a far more actionable question.

**What Failed:** Initial versions included too many secondary metrics (social mentions, critic scores). These were removed after execs admitted they never looked at them. The dashboard also initially lacked regional breakdowns, which led to wrong conclusions about globally-averaged data.

**Lessons:** One north-star ratio beats five vanity counts. Always include trend direction. Strip out anything nobody acts on within 30 days.

**Application to Data Squad:** When building exec dashboards, start with a single composite ratio that captures the trade-off leadership actually debates. Add sparklines for trend. Ruthlessly cut metrics nobody references in meetings.

---

## 2. Spotify - Two-Sided Marketplace Health

**Company/Context:** Spotify (2020). C-suite needed to monitor the health of both the listener side and the creator/label side on one screen.

**What They Did:**
- Split the dashboard into two halves: Listener Health (left) and Creator Health (right).
- Listener side: MAU, DAU/MAU ratio, streaming hours per user, premium conversion rate.
- Creator side: active artists uploading, catalog growth rate, per-stream payout trend, label satisfaction index.
- A single "marketplace balance" score at the top indicated whether growth was lopsided.

**Metrics Used:** DAU/MAU ratio, streaming hours/user, premium conversion, active uploading artists, catalog growth rate, marketplace balance score.

**What Worked:** The marketplace balance score surfaced a problem early: listener growth was outpacing creator uploads in emerging markets, predicting future content gaps. This led to proactive creator acquisition programs.

**What Failed:** The label satisfaction index was a quarterly survey metric that updated too slowly for a weekly exec review. It created a false sense of stability between survey periods.

**Lessons:** Every metric on an exec dashboard must update at the cadence the dashboard is reviewed. Quarterly metrics on a weekly dashboard create blind spots.

**Application to Data Squad:** For any two-sided platform client, design the exec view as a balance sheet -- supply health vs. demand health -- with a single balance indicator. Ensure every metric refreshes at review cadence.

---

## 3. Airbnb - Guest and Host Unit Economics

**Company/Context:** Airbnb (2018-2019, pre-IPO). The finance and product leadership needed a single view connecting product metrics to unit economics.

**What They Did:**
- Top row: nights booked (volume), ADR (price), gross booking value (revenue).
- Middle row: guest acquisition cost, host acquisition cost, guest LTV, host LTV.
- Bottom row: contribution margin per booking, trailing-12-month trend.
- Interactive filter by market tier (top 20 cities vs. long tail).

**Metrics Used:** Nights booked, ADR, GBV, guest CAC, host CAC, guest LTV, host LTV, contribution margin per booking.

**What Worked:** Linking product metrics (nights, ADR) directly to unit economics on the same screen forced product and finance to speak the same language. Market-tier filtering revealed that long-tail markets had better unit economics, shifting investment strategy.

**What Failed:** The first version used blended global averages, which masked that top-5 cities were margin-negative due to regulatory costs. Adding the tier filter fixed this but took two iterations.

**Lessons:** Blended averages are the enemy of exec dashboards. Always provide at least one segmentation dimension. Link product metrics to financial outcomes on the same screen.

**Application to Data Squad:** When a client's exec team includes both product and finance leaders, bridge the gap by placing product KPIs and unit economics side-by-side. Include at least one segmentation cut.

---

## 4. HubSpot - Weekly Operating Cadence Dashboard

**Company/Context:** HubSpot (2020). The executive team reviewed a single dashboard every Monday to decide where to focus the week.

**What They Did:**
- Three sections: Acquire (traffic, MQLs, demo requests), Convert (free-to-paid rate, sales cycle length, win rate), Expand (NRR, cross-sell attach rate, support ticket volume).
- Each metric had a "status" indicator: on-pace, off-pace, or critical -- based on monthly targets prorated to the current week.
- A single "confidence score" at the top: probability of hitting monthly revenue target based on current pipeline and conversion rates.

**Metrics Used:** Traffic, MQLs, demo requests, free-to-paid rate, sales cycle days, win rate, NRR, cross-sell rate, support tickets, monthly confidence score.

**What Worked:** The confidence score became the single most-discussed number in Monday meetings. When it dipped below 70%, the team immediately triaged pipeline gaps.

**What Failed:** Early versions showed trailing indicators only (what happened last week). Adding leading indicators (pipeline created this week, demo requests trending) made the dashboard predictive rather than retrospective.

**Lessons:** Exec dashboards must be forward-looking. A confidence score or forecast probability forces the team to act rather than react.

**Application to Data Squad:** Build a "confidence of hitting target" metric into every exec dashboard. Use pace-based RAG status (red/amber/green) against prorated targets, not just trailing actuals.

---

## 5. Figma - Product-Led Growth Executive View

**Company/Context:** Figma (2021). Leadership needed to track PLG health across self-serve and enterprise motions.

**What They Did:**
- Funnel view: sign-ups, activated (created first file with 2+ collaborators), converted to paid, expanded (added seats).
- Cohort overlay: each funnel stage showed the current month's cohort vs. the trailing 3-month average.
- Viral coefficient displayed prominently: average new users invited per activated user.
- Enterprise section: PQLs generated from self-serve usage, enterprise conversion rate.

**Metrics Used:** Sign-ups, activation rate, paid conversion, seat expansion rate, viral coefficient, PQL generation rate, enterprise close rate.

**What Worked:** Showing the viral coefficient on the exec dashboard made it a first-class metric. When it dipped from 1.4 to 1.1, the team prioritized collaboration features that drove invites.

**What Failed:** The PQL definition was initially too broad (any team with 3+ users), generating noise. Tightening to "teams with 10+ active users and cross-department usage" improved enterprise conversion signal dramatically.

**Lessons:** In PLG companies, the viral coefficient deserves top billing on the exec dashboard. PQL definitions must be iterated until they predict enterprise conversion reliably.

**Application to Data Squad:** For PLG clients, always surface virality and PQL-to-enterprise conversion on the exec view. Treat PQL definition as a living metric that needs quarterly calibration.
