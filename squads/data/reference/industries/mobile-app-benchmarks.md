# Mobile App Benchmarks

## Overview

Mobile app benchmarks are highly category-dependent. A social app with 20% D30 retention is strong; a utility app with the same number is struggling. This reference provides benchmarks segmented by app category to enable meaningful comparison. Sources include Adjust, AppsFlyer, Sensor Tower, data.ai, and Leanplum reports.

---

## Retention by Category

### Day 1 / Day 7 / Day 30 Retention

| Category | D1 | D7 | D30 |
|----------|-----|-----|------|
| Social/Communication | 30-40% | 18-25% | 10-15% |
| Gaming (casual) | 25-35% | 10-18% | 5-10% |
| Gaming (mid-core) | 20-30% | 12-20% | 8-14% |
| E-commerce/Shopping | 20-28% | 10-15% | 5-9% |
| Health & Fitness | 22-30% | 12-18% | 7-12% |
| Finance | 25-35% | 15-22% | 10-16% |
| News/Media | 22-30% | 10-16% | 5-10% |
| Productivity/Utilities | 18-25% | 8-14% | 4-8% |
| Food Delivery | 20-28% | 12-18% | 7-12% |
| Education | 18-28% | 10-16% | 5-10% |

### Interpreting Retention Curves

- **D1 retention** measures first-impression quality. Below 20% for any category signals onboarding or expectation-setting problems.
- **D7 retention** measures habit formation. The D1-to-D7 ratio should be above 40%. If it drops below 30%, users are not finding recurring value.
- **D30 retention** measures product-market fit for the retained audience. The curve should begin to flatten between D14 and D30.

---

## Engagement Metrics

### DAU/MAU Ratio (Stickiness)

| Category | Bottom Quartile | Median | Top Quartile |
|----------|----------------|--------|--------------|
| Social/Communication | 25% | 35% | 50%+ |
| Gaming (casual) | 10% | 18% | 28% |
| E-commerce | 8% | 12% | 18% |
| Finance | 15% | 22% | 32% |
| Health & Fitness | 12% | 20% | 30% |
| Productivity | 15% | 25% | 38% |

A DAU/MAU ratio above 25% indicates daily-use behavior. Below 10% suggests the app serves episodic needs and should be evaluated on different engagement metrics (weekly or monthly active use).

### Session Metrics

| Category | Median Sessions/Day | Median Session Length |
|----------|-------------------|---------------------|
| Social/Communication | 5-8 | 3-6 minutes |
| Gaming (casual) | 2-4 | 6-12 minutes |
| E-commerce | 1-2 | 4-8 minutes |
| News/Media | 2-4 | 4-8 minutes |
| Finance | 1-2 | 2-4 minutes |
| Health & Fitness | 1-2 | 5-10 minutes |

Session length is less meaningful than sessions per day for most categories. Short, frequent sessions indicate habitual use; long, infrequent sessions may indicate task-based use.

---

## Push Notification Metrics

### Opt-In Rates

| Platform | Bottom Quartile | Median | Top Quartile |
|----------|----------------|--------|--------------|
| iOS | 35% | 45% | 58% |
| Android | 75% | 82% | 90% |

Android opt-in is higher because notifications are enabled by default. iOS requires explicit permission, making the ask timing critical.

### Push Engagement

| Metric | Bottom Quartile | Median | Top Quartile |
|--------|----------------|--------|--------------|
| Open rate (direct) | 2.0% | 4.5% | 8.0% |
| Influenced open rate | 8% | 15% | 25% |
| Unsubscribe rate (per send) | — | 0.3% | < 0.1% |

Influenced opens (app opens within 2 hours of a push, even without direct tap) are a more complete measure of push effectiveness than direct open rate alone.

### Best Practices for Push Timing

- Request iOS push permission after the user has experienced value, not on first launch. Delaying the ask to the second or third session increases opt-in rates by 15-30%.
- Optimal send frequency: 2-5 pushes per week for most categories. Above 7 per week increases unsubscribe rates by 2-3x.
- Personalized pushes (name, activity-based) have 2-3x higher open rates than broadcast.

---

## Monetization

### In-App Purchase Conversion

| Category | % of Users Who Purchase | Median ARPPU (Monthly) |
|----------|------------------------|----------------------|
| Gaming (casual) | 2-5% | $8-15 |
| Gaming (mid-core) | 5-10% | $15-40 |
| Health & Fitness | 3-8% | $10-20 |
| Productivity | 2-6% | $5-12 |
| Dating | 5-12% | $15-30 |

ARPPU (Average Revenue Per Paying User) should be tracked separately from ARPU (Average Revenue Per User). Blending the two obscures both conversion rate and willingness to pay.

### Subscription Metrics

- Free-to-paid conversion: median 2-5% for freemium, 15-30% for free trial.
- Trial-to-paid conversion: median 40-55% for 7-day trials, 25-40% for 14-day trials, 15-30% for 30-day trials.
- Annual vs. monthly split: offering an annual plan increases LTV by 20-40% for users who select it, but only 15-25% of subscribers choose annual.

---

## Common Pitfalls

1. **Comparing retention across categories without segmenting.** A 10% D30 is great for casual gaming, poor for social apps.
2. **Optimizing for installs instead of activated users.** Install-to-activation rate is the critical metric, not raw install volume.
3. **Measuring DAU/MAU for episodic apps.** Weekly or monthly engagement ratios are more appropriate for shopping and travel apps.
4. **Sending push notifications to maximize opens.** High-frequency push drives short-term opens but increases long-term unsubscribe rates.
5. **Ignoring organic vs. paid user quality.** Paid users typically have 20-40% lower retention than organic. Blend obscures both.

---

## Cross-References

- **Activation Funnel Quality Checklist** (`checklists/activation-funnel-quality.md`) — Onboarding funnel analysis.
- **Anchoring Bias in Analytics** (`reference/psychology/anchoring-in-data-analysis.md`) — Benchmark anchoring effects.

---

*Version: 1.0 | Last updated: 2026-03-18*
