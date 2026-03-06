# Lifecycle Messaging Impact Checklist

## Purpose

Measure the true impact of lifecycle messages (onboarding emails, re-engagement pushes, upgrade nudges, renewal reminders) on user retention and revenue. This gate prevents the common trap of sending more messages without knowing whether they help, hurt, or are ignored.

---

## Checklist Items

### 1. Each Message Has a Clear Retention Hypothesis

- **Pass:** Every lifecycle message specifies: the target segment, the behavioral trigger, the intended action, and the retention metric it aims to influence. Example: "Day-3 onboarding email targets users who signed up but did not complete setup, aiming to increase Day-7 activation rate."
- **Fail:** Messages are sent because "we always send a Day-3 email" without a stated goal or target metric.

### 2. Holdout Groups Exist for Causal Measurement

- **Pass:** At least 10% of eligible users in each message flow are held out (receive no message) as a control group. The holdout is persistent for the duration of the measurement window.
- **Fail:** Every eligible user receives the message, making it impossible to measure incremental impact.

### 3. Impact Is Measured on Retention, Not Just Engagement

- **Pass:** Success is measured by downstream retention metrics (Day-7 activation, Day-30 retention, churn rate), not just email opens or click-through rates. A message with 40% open rate but no retention lift is not considered effective.
- **Fail:** The team celebrates high open rates without measuring whether the message changed user behavior.

### 4. Message Fatigue and Negative Effects Are Monitored

- **Pass:** Unsubscribe rates, spam complaints, and notification opt-out rates are tracked per message and in aggregate. If a new message increases opt-outs, the net effect on retention is assessed (possible negative ROI).
- **Fail:** More messages are added to the lifecycle without monitoring whether users are opting out of all communications.

### 5. Timing and Frequency Are Optimized With Data

- **Pass:** Send time and cadence are tested (e.g., Day 1 vs. Day 3, morning vs. evening). The current schedule is backed by test results, not assumptions.
- **Fail:** All messages send at 10am local time because that is the default, and no timing test has been run.

### 6. Personalization Claims Are Validated

- **Pass:** If the message uses personalization (user name, recommended content, usage data), the team has tested personalized vs. generic versions and measured the incremental lift of personalization specifically.
- **Fail:** Messages are personalized because "personalization is best practice" without ever measuring its specific contribution.

### 7. Revenue Impact Is Calculated

- **Pass:** For messages tied to monetization (upgrade nudges, renewal reminders), the incremental revenue from the message (treatment minus holdout) is compared against the cost of the messaging infrastructure and team effort.
- **Fail:** Revenue impact is assumed ("people who get the email convert more") without comparing against the holdout.

### 8. Underperforming Messages Are Sunset

- **Pass:** Messages that show no statistically significant lift after adequate sample sizes are paused or redesigned. The team reviews the full lifecycle flow quarterly and removes dead weight.
- **Fail:** The lifecycle flow only grows; no message has ever been removed, and several have unknown impact.

---

## Cross-References

- [Churn Taxonomy](churn-taxonomy.md) -- Message targeting should align with churn type (early churn gets onboarding messages, mature churn gets re-engagement).
- [Winback QA](winback-qa.md) -- Winback messages are a specific lifecycle flow with additional ethical considerations.
- [Consent Mode Tracking QA](../instrumentation/consent-mode-tracking-qa.md) -- Messaging must respect communication consent preferences.
