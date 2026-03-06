# Experiment One-Pager Examples

Well-written experiment one-pagers from real companies, showing how to document hypothesis, design, and decision criteria.

---

## 1. Booking.com - Urgency Messaging Experiment

**Company/Context:** Booking.com (2019). Known as one of the most experiment-driven companies in the world, running 25,000+ experiments per year.

**What They Did:**
One-pager structure used at Booking.com:
- **Hypothesis:** Showing "Only 2 rooms left!" urgency messaging on hotel listing pages will increase booking conversion by 3-5% by creating scarcity pressure, without increasing cancellation rates.
- **Primary Metric:** Booking conversion rate (search-to-booking).
- **Guardrail Metrics:** Cancellation rate within 48 hours, customer support contacts about availability, NPS for bookers.
- **Segment:** All logged-in users on desktop and mobile web, excluding business travel accounts.
- **Sample Size Calculation:** 500K users per variant for 2% MDE at 95% confidence, estimated 14-day run time.
- **Decision Framework:** Ship if conversion lifts 2%+ AND cancellation rate does not increase by more than 0.5% AND NPS does not decline.
- **Risks:** Potential trust erosion if messaging is perceived as manipulative. Regulatory risk in EU markets (dark pattern scrutiny).

**Metrics Used:** Booking conversion, cancellation rate, support contact rate, NPS, revenue per visitor.

**What Worked:** The one-pager format forced the team to pre-commit to decision criteria, preventing post-hoc rationalization. Including guardrail metrics (cancellation rate, NPS) caught a problem: conversion increased 4% but cancellations increased 2%, making the net impact marginal.

**What Failed:** The initial one-pager didn't include regulatory risk. After EU regulators flagged urgency messaging as a potential dark pattern, all urgency experiments required legal review. This was added as a mandatory field for future one-pagers.

**Lessons:** Pre-commit to decision criteria including guardrails. Include downstream effects (cancellation, support load) not just the primary conversion metric. Document regulatory and ethical risks.

**Application to Data Squad:** Use the Booking.com one-pager template: hypothesis, primary metric, guardrail metrics, sample size, decision framework, and risks. Require pre-commitment to ship/kill criteria.

---

## 2. Netflix - Artwork Personalization Experiment

**Company/Context:** Netflix (2018). The artwork team tested whether personalized title artwork (showing different images to different users based on their viewing history) would increase title engagement.

**What They Did:**
- **Hypothesis:** Showing personalized artwork (e.g., a romance-oriented image for romance viewers, an action-oriented image for action viewers) will increase title-level click-through rate by 10-15% and play rate by 5-8%.
- **Primary Metric:** Take rate (clicks on artwork that result in a play).
- **Secondary Metrics:** Browse-to-play rate, member streaming hours, title diversity (did users watch a broader range of titles?).
- **Control:** Default artwork (single image per title chosen by content team).
- **Treatment:** Algorithmically selected artwork from a set of 5-10 candidate images per title, chosen based on the user's genre affinity profile.
- **Duration:** 4 weeks to capture both novelty effect and steady-state behavior.
- **Decision Framework:** Ship if take rate improves 5%+ at steady state (week 3-4, after novelty fades).

**Metrics Used:** Take rate, browse-to-play rate, streaming hours, title diversity, novelty decay curve.

**What Worked:** The one-pager explicitly addressed novelty effects by requiring steady-state measurement (weeks 3-4). The experiment showed 20% lift in take rate during week 1, decaying to 12% by week 4 -- still well above the 5% threshold.

**What Failed:** The one-pager didn't address the operational cost of generating multiple artwork variants per title. Adding a "cost-to-implement at scale" section would have surfaced this earlier. The team had to negotiate additional design resources post-experiment.

**Lessons:** Include novelty-decay considerations in experiment design. Measure steady-state, not just initial lift. Add operational cost estimates to one-pagers for experiments that require ongoing investment.

**Application to Data Squad:** For experiments likely to have novelty effects (UI changes, messaging changes), require a minimum run time that captures decay. Add an "implementation cost" section to one-pagers.

---

## 3. Duolingo - Notification Timing Experiment

**Company/Context:** Duolingo (2020). The growth team tested optimal push notification timing to maximize daily lesson completion without causing notification fatigue.

**What They Did:**
- **Hypothesis:** Sending the daily practice reminder at a time personalized to each user's historical lesson-completion time (rather than a fixed 7 PM) will increase day-of lesson completion by 5-8%.
- **Primary Metric:** Day-of lesson completion rate (% of users who complete at least one lesson on the day they receive the notification).
- **Guardrail Metrics:** Notification opt-out rate, 30-day retention, weekly lesson count (ensuring daily lift wasn't cannibalizing other-day engagement).
- **Variants:** Control (fixed 7 PM local time), Treatment A (personalized to user's modal lesson time +/- 30 min), Treatment B (personalized time with context-aware copy, e.g., "Time for your morning lesson!").
- **Exclusions:** Users who completed a lesson before notification send time that day.
- **Sample Size:** 200K per variant, 21-day run to capture weekly patterns.

**Metrics Used:** Day-of completion rate, notification opt-out rate, 30-day retention, weekly lesson count, notification open rate.

**What Worked:** Treatment B (personalized time + contextual copy) outperformed both control (+7.2% day-of completion) and Treatment A (+4.1%). The one-pager's guardrail on opt-out rate confirmed no increase in notification fatigue. The hypothesis about personalized timing was validated, and the contextual copy was a bonus insight.

**What Failed:** The one-pager didn't account for users in timezones where data was sparse (few users, unreliable modal time estimates). These users saw worse results in Treatment A/B than control. Adding a "minimum data threshold" (require 14+ days of history for personalization) fixed this.

**Lessons:** Multi-variant experiments should be documented with clear variant descriptions and expected lift ranges. Guardrails on user experience (opt-out rate) are as important as engagement metrics. Account for cold-start problems in personalization experiments.

**Application to Data Squad:** For personalization experiments, always include a cold-start contingency in the one-pager. Use guardrail metrics that capture user experience degradation (opt-outs, unsubscribes, complaints).

---

## 4. Stripe - Checkout Flow Simplification Experiment

**Company/Context:** Stripe (2021). The Checkout product team hypothesized that reducing form fields would increase payment completion without increasing fraud.

**What They Did:**
- **Hypothesis:** Removing the billing address requirement (using card BIN data for country detection instead) will increase checkout completion rate by 3-5% without increasing fraud or chargeback rates.
- **Primary Metric:** Checkout completion rate (% of sessions that reach payment confirmation).
- **Guardrail Metrics:** Fraud rate (chargebacks per 1000 transactions), address verification failure rate, merchant satisfaction (post-experiment survey).
- **Merchant Segmentation:** High-risk verticals (digital goods, gaming) analyzed separately from low-risk (physical goods, SaaS).
- **Rollback Plan:** If fraud rate increases by more than 0.1% in any segment, immediately revert that segment and continue for others.
- **Duration:** 30 days minimum to capture monthly fraud reporting cycles.

**Metrics Used:** Checkout completion rate, fraud rate, chargeback rate, address verification pass rate, merchant segment-level results.

**What Worked:** The segmented rollback plan was critical. Low-risk merchants saw 4.2% completion lift with no fraud increase. High-risk merchants saw 5.8% completion lift but 0.15% fraud increase -- triggering the automatic rollback for that segment while shipping for low-risk.

**What Failed:** The one-pager initially proposed a binary ship/kill decision. The segmented rollback plan was added after a review meeting and proved essential. One-pager templates were updated to require segment-level decision criteria.

**Lessons:** Experiments affecting risk metrics (fraud, safety, trust) need segment-level rollback plans, not just aggregate ship/kill decisions. Run for full reporting cycles.

**Application to Data Squad:** For experiments touching risk or trust metrics, require segment-level decision criteria in the one-pager. Include explicit rollback plans with automated triggers.
