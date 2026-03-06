# Churn Taxonomy Checklist

## Purpose

Classify churn into distinct types so that each receives the appropriate diagnostic and intervention. Treating all churn as one category leads to generic, ineffective retention efforts. This gate ensures the team knows what kind of churn they are fighting.

---

## Checklist Items

### 1. Churn Definition Is Operationalized

- **Pass:** "Churn" has a precise, measurable definition: the specific inactivity window (e.g., 30 days without login), the event that marks churn (subscription cancellation, account deletion), and whether churn is measured at user, account, or revenue level.
- **Fail:** "Churn" means different things to different teams, or the inactivity window is chosen arbitrarily.

### 2. Early Churn Is Separated from Mature Churn

- **Pass:** Users who churn within the first 30 days (or first billing cycle) are classified separately from those who churn after 90+ days. Each group has its own analysis and intervention strategy.
- **Fail:** A user who never activated and a 2-year subscriber who canceled are analyzed as the same cohort.

### 3. Voluntary vs. Involuntary Churn Is Distinguished

- **Pass:** The team tracks whether churn was deliberate (user-initiated cancellation, account deletion) or involuntary (payment failure, credit card expiry). Involuntary churn rate and recovery rate are monitored separately.
- **Fail:** Payment failures and active cancellations are lumped together, masking that 30% of churn is recoverable with dunning.

### 4. Churn Reasons Are Captured and Categorized

- **Pass:** Exit surveys, cancellation flow reasons, and support ticket analysis provide a coded taxonomy of churn reasons (price, competitor, no longer needed, bad experience, missing feature). Reasons are reviewed quarterly.
- **Fail:** No exit survey exists, or the survey has a single open-text field that no one analyzes.

### 5. Dormant vs. Churned Users Are Differentiated

- **Pass:** Users who reduce activity significantly but have not crossed the churn threshold are flagged as "dormant" or "at-risk." These users receive proactive interventions before they formally churn.
- **Fail:** Users are only identified as churned after the fact, missing the intervention window.

### 6. Seasonal and Cyclical Patterns Are Identified

- **Pass:** Churn rate is analyzed by month, day-of-week, and relative to billing cycles to identify predictable patterns (e.g., post-holiday churn, end-of-free-trial churn). Seasonal baselines are established.
- **Fail:** A January churn spike causes alarm when it is actually a predictable annual pattern.

### 7. Churn Is Quantified in Revenue Terms

- **Pass:** Beyond user count, churn is expressed as MRR/ARR lost per churn type. High-value customer churn is flagged separately even if the user count is small.
- **Fail:** Churn is reported only as a user percentage; the loss of one enterprise account worth 100 SMBs goes unnoticed.

### 8. Reactivation Is Tracked as a Distinct Flow

- **Pass:** Previously churned users who return are identified and tracked separately. The team knows the reactivation rate by churn type and the average time-to-return.
- **Fail:** Reactivated users are mixed with new users, inflating acquisition metrics and hiding that "new" sign-ups are actually returning churned users.

---

## Cross-References

- [Winback QA](winback-qa.md) -- Churn taxonomy determines which segments are eligible for winback campaigns.
- [Lifecycle Messaging Impact](lifecycle-messaging-impact.md) -- Different churn types need different messaging strategies.
- [Retention Intervention ROI](retention-intervention-roi.md) -- ROI calculations depend on correctly categorizing churn.
