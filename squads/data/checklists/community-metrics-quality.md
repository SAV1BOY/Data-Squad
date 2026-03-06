# Community Metrics Quality Checklist

> Gate type: Review
> Owner: Spinks (Community Strategy Lead)
> Applies to: Any community health report, engagement dashboard, or community program evaluation

## Purpose

Community metrics are uniquely prone to vanity inflation -- big member counts that mask low engagement, activity spikes driven by bots, or "growth" that is really just lurker accumulation. This gate ensures community measurement focuses on genuine participation, return behavior, and business impact rather than numbers that look good but mean nothing.

## Checklist Items

1. - [ ] **Active member definition stated** -- "Active" is explicitly defined (e.g., "posted or reacted at least once in the last 30 days"), not just "registered."
   - Pass criteria: Definition includes the specific action(s) and the time window.
   - Fail signal: "We have 10,000 members" with no distinction between active and registered.
   - Action if fail: Define active membership criteria and restate all engagement metrics using the active base.

2. - [ ] **Contribution ratio tracked** -- The percentage of active members who create content (posts, replies, resources) vs. those who only consume is measured.
   - Pass criteria: Contribution ratio reported (e.g., "12% of active members posted; 35% replied; 53% read only").
   - Fail signal: Only total post count reported without relating it to the member base.
   - Action if fail: Calculate and segment the contributor / responder / lurker breakdown.

3. - [ ] **Return rate measured** -- The percentage of members who were active in period N and also active in period N+1 is tracked.
   - Pass criteria: Month-over-month or week-over-week return rate reported with a trend over >= 3 periods.
   - Fail signal: Growth reported without any retention or return metric.
   - Action if fail: Compute cohort return rates and add them alongside growth numbers.

4. - [ ] **Engagement loops identified** -- The report describes what brings members back (notifications, content cadence, events, peer replies) rather than just measuring that they return.
   - Pass criteria: At least one loop hypothesis with supporting data (e.g., "members who receive a reply within 24h return at 2x the rate").
   - Fail signal: Return rate reported with no investigation into drivers.
   - Action if fail: Analyze return behavior by trigger type and add findings.

5. - [ ] **Belonging signals included** -- At least one qualitative or proxy-quantitative measure of belonging is tracked (e.g., NPS, "I feel welcome" survey, introductions posted).
   - Pass criteria: A belonging metric is reported with a baseline and trend.
   - Fail signal: Community health is measured entirely by volume metrics with no sentiment layer.
   - Action if fail: Add a periodic belonging survey or identify a proxy metric (e.g., % of new members who post an introduction).

6. - [ ] **Vanity metrics flagged** -- Any metric that can grow without genuine engagement improvement (total members, total posts all-time) is either excluded or explicitly labeled as a vanity metric.
   - Pass criteria: Vanity metrics are in a clearly labeled "context" section, not in the headline KPIs.
   - Fail signal: "Total registered members" is the lead metric in the executive summary.
   - Action if fail: Move vanity metrics to an appendix and promote active/return/contribution metrics to the headline.

7. - [ ] **Bot and spam activity excluded** -- Automated posts, spam accounts, and test accounts are filtered from engagement counts.
   - Pass criteria: Filtering logic documented; known bot accounts listed or pattern-matched.
   - Fail signal: A spike in "engagement" is actually a spam wave or integration-generated posts.
   - Action if fail: Implement bot/spam filtering and restate affected metrics.

8. - [ ] **Business impact linked** -- At least one connection between community activity and a business outcome (support ticket deflection, product adoption, NRR) is attempted.
   - Pass criteria: A correlation, case study, or directional analysis linking community participation to a business metric.
   - Fail signal: Community report exists in isolation with no tie to company KPIs.
   - Action if fail: Match community members to product usage or support data and test for a measurable relationship.

9. - [ ] **Event impact measured separately** -- Spikes from events (AMAs, launches, challenges) are distinguished from organic baseline activity.
   - Pass criteria: Event periods annotated on charts; baseline vs. event-driven activity separated.
   - Fail signal: A challenge week inflates the monthly average, making organic engagement look higher than it is.
   - Action if fail: Annotate event periods and report baseline engagement alongside event-boosted figures.

10. - [ ] **New member onboarding funnel tracked** -- The journey from join to first action to return visit is measured as a funnel.
    - Pass criteria: Funnel stages defined (join -> profile complete -> first post/reply -> return within 7 days) with conversion rates.
    - Fail signal: New member count reported without any activation or onboarding success metric.
    - Action if fail: Build the onboarding funnel from event data and identify the biggest drop-off point.

11. - [ ] **Platform-specific nuances noted** -- Metrics account for the specific platform's mechanics (e.g., Discord roles, Discourse trust levels, Slack thread behavior).
    - Pass criteria: Metric definitions reference platform-specific features where relevant.
    - Fail signal: Generic "posts per user" applied to a platform where most interaction happens in reactions or threads.
    - Action if fail: Adjust metrics to capture the platform's primary interaction mode.

## Cross-References

- See `data-storytelling-quality.md` for how to present community metrics without misleading audiences.
- See `data-quality-quality.md` for freshness and completeness checks on the community data pipeline.
- See `exec-report-quality.md` for how community health fits into broader executive reporting.
