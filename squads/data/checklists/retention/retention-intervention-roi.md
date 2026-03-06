# Retention Intervention ROI Checklist

## Purpose

Quantify the return on investment of retention interventions (onboarding improvements, feature nudges, loyalty programs, winback campaigns, dunning flows) so the team invests in what actually works and stops funding what does not.

---

## Checklist Items

### 1. Incremental Retention Lift Is Measured Causally

- **Pass:** Every retention intervention has a holdout or control group. The incremental lift (treatment retention minus control retention) is the basis for ROI calculation, not the raw retention rate of treated users.
- **Fail:** ROI is calculated by comparing retained users to all churned users, ignoring that many treated users would have retained anyway.

### 2. Revenue Impact Is Calculated Over the Full LTV Window

- **Pass:** The incremental retained users are valued at their expected remaining LTV, not just one month's revenue. The LTV estimate accounts for the user's segment, tenure, and historical behavior.
- **Fail:** Revenue impact is one month of subscription revenue times the number of saved users, ignoring that some will churn next month anyway.

### 3. All Costs Are Included

- **Pass:** The ROI denominator includes: direct costs (discounts, credits, free months), infrastructure costs (tooling, messaging platform fees), and labor costs (team hours to design, build, and maintain the intervention).
- **Fail:** Only the discount cost is counted; the 3 engineering sprints to build the feature are excluded.

### 4. Time-to-Payback Is Estimated

- **Pass:** The team calculates how long it takes for the incremental revenue to exceed the intervention cost. Interventions with payback periods longer than 12 months are flagged for additional scrutiny.
- **Fail:** ROI is presented as a single number without indicating when the investment breaks even.

### 5. Cannibalization and Substitution Effects Are Assessed

- **Pass:** The analysis checks whether the intervention pulled forward revenue that would have occurred anyway (e.g., a discount that accelerated a purchase the user planned to make), or whether it cannibalized a more profitable path (e.g., users downgrade to a discounted plan instead of staying on full price).
- **Fail:** All revenue from treated users is counted as incremental without checking for substitution.

### 6. Second-Order Effects Are Considered

- **Pass:** The analysis includes effects beyond direct revenue: reduced support ticket volume, referral behavior of retained users, and brand perception impact. These are estimated conservatively and reported separately from primary ROI.
- **Fail:** Second-order effects are either ignored (understating ROI) or wildly inflated (overstating ROI).

### 7. Diminishing Returns Are Identified

- **Pass:** For interventions that can be scaled (e.g., increasing winback offer size, extending free trial), the team plots the marginal ROI curve and identifies the point of diminishing returns.
- **Fail:** The team assumes that if $1 of discount saves X users, $2 will save 2X users, without testing.

### 8. Portfolio-Level Prioritization Is Applied

- **Pass:** All retention interventions are ranked by incremental ROI in a single view. Budget and team effort are allocated to the highest-ROI interventions first. Low-ROI interventions are paused or sunset.
- **Fail:** Each intervention is evaluated in isolation; the team cannot answer "if we had one more dollar, where would it go?"

---

## Cross-References

- [Churn Taxonomy](churn-taxonomy.md) -- ROI differs dramatically by churn type; the same intervention has different returns for different segments.
- [Winback QA](winback-qa.md) -- Winback-specific ROI must track reactivated user quality over 90+ days.
- [Lifecycle Messaging Impact](lifecycle-messaging-impact.md) -- Messaging interventions are a subset of the retention portfolio.
