# Winback QA Checklist

## Purpose

Ensure winback campaigns (targeting churned users to re-engage them) are well-timed, properly segmented, and ethically sound. Poorly executed winback efforts waste budget on unrecoverable users, annoy people who left for good reasons, and can damage brand trust.

---

## Checklist Items

### 1. Eligibility Criteria Are Defined and Justified

- **Pass:** Winback targets are segmented based on churn type, tenure, lifetime value, and recency of churn. Users who explicitly requested data deletion, filed complaints, or churned due to trust violations are excluded.
- **Fail:** Every churned user receives the same winback campaign regardless of reason or context.

### 2. Timing Is Based on Data, Not Guesswork

- **Pass:** The optimal winback window (days since churn) is determined by analyzing historical reactivation patterns. The team knows the probability of return by time-since-churn and targets the peak window.
- **Fail:** Winback fires exactly 30 days after churn for everyone because that was the first idea proposed.

### 3. The Offer Is Proportional to User Value

- **Pass:** Incentives (discounts, free months, feature unlocks) are tiered based on the user's historical LTV and the expected reactivation probability. The cost of the incentive is less than the expected revenue from reactivation.
- **Fail:** A blanket 50% discount is offered to all churned users, including those with near-zero LTV.

### 4. Communication Consent Is Verified

- **Pass:** Winback messages are only sent to users who have valid, opt-in communication consent. Users who unsubscribed from marketing emails are not contacted via email. Push notifications respect OS-level opt-outs.
- **Fail:** Churned users receive emails they cannot unsubscribe from, or consent status is not checked.

### 5. A Control Group Measures Incremental Lift

- **Pass:** At least 15% of eligible users are held out from the winback campaign. The reactivation rate of the treatment group is compared to the control to measure true incremental reactivations (not users who would have returned anyway).
- **Fail:** No control group exists; all reactivations are credited to the campaign.

### 6. Reactivated User Quality Is Tracked

- **Pass:** Users who reactivate through winback are monitored for 90+ days. Their retention rate, engagement, and revenue are compared to organically reactivated users and to new users. If winback users churn again within 30 days, the campaign's true ROI is adjusted downward.
- **Fail:** Success is measured as "number of reactivations" without tracking whether those users stay.

### 7. Frequency and Channel Limits Are Enforced

- **Pass:** A user receives a maximum of 2-3 winback attempts across all channels. After the final attempt, the user is moved to a "do not contact" list for at least 6 months. Channel selection (email, push, SMS, ad retargeting) respects user preference.
- **Fail:** Churned users are bombarded across multiple channels indefinitely.

### 8. Ethical Boundaries Are Explicit

- **Pass:** The team has documented what they will not do: no dark patterns in cancellation-reversal flows, no misleading "your account will be deleted" urgency, no re-subscribing users without explicit action. These boundaries are reviewed with legal/compliance.
- **Fail:** Winback tactics include manipulative urgency, hidden re-activation, or false scarcity claims.

---

## Cross-References

- [Churn Taxonomy](churn-taxonomy.md) -- Winback eligibility depends on the type of churn.
- [Retention Intervention ROI](retention-intervention-roi.md) -- Winback ROI must account for reactivated user quality.
- [LGPD Compliance Check](../security-privacy/lgpd-compliance-check.md) -- Winback campaigns must comply with data protection regulations.
