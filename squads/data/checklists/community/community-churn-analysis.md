# Community Churn Analysis Checklist

## Purpose

Understand who leaves the community, when they leave, and why -- then use that understanding to improve retention of valuable members. Community churn is often invisible because members do not "cancel"; they simply stop showing up. This gate makes the invisible visible.

---

## Checklist Items

### 1. Community Churn Is Operationally Defined

- **Pass:** A member is classified as "churned" after N days of inactivity (e.g., 60 days without login, post, or reaction). The threshold is based on analysis of return probability -- chosen where the likelihood of a member returning drops below 10%.
- **Fail:** No churn definition exists; the team only tracks total member count, which never goes down.

### 2. Churn Rate Is Measured Cohort-by-Cohort

- **Pass:** Members are grouped by join date (monthly cohorts). Churn curves are plotted per cohort showing the percentage still active at 30, 60, 90, and 180 days. Trends across cohorts are compared.
- **Fail:** Only an aggregate "active members" number is tracked, hiding whether recent cohorts retain better or worse than older ones.

### 3. Churn Is Segmented by Member Type

- **Pass:** Churn rates are broken down by: contribution level (lurker, occasional, active, power user), join source (organic, invite, event, campaign), and engagement type (Q&A, discussion, content creation). The segments with highest churn are identified.
- **Fail:** All members are treated as homogeneous; the team does not know if they are losing lurkers or losing their best contributors.

### 4. Pre-Churn Behavioral Signals Are Identified

- **Pass:** Analysis of churned members' activity in their final 30 active days reveals patterns: declining post frequency, shorter sessions, shift from creating to only viewing, unanswered questions. These signals are used for early intervention.
- **Fail:** Churn is only identified after the fact; no leading indicators are tracked.

### 5. Exit Reasons Are Investigated

- **Pass:** A mix of methods is used to understand why members leave: automated exit surveys for members who explicitly leave, qualitative interviews with a sample of recently churned valuable members, and analysis of their last interactions for friction signals.
- **Fail:** No one asks or investigates why members leave; the assumption is "they just got busy."

### 6. Content and Experience Gaps Are Linked to Churn

- **Pass:** The team correlates churn with specific experience failures: unanswered posts, negative moderation interactions, content quality decline in specific categories, or platform UX issues. Fixable causes are prioritized.
- **Fail:** Churn is treated as inevitable rather than investigating whether community-side changes could reduce it.

### 7. High-Value Member Churn Gets Special Attention

- **Pass:** When a power user, ambassador, or highly-connected member churns, an individual review is conducted. Their departure may signal systemic issues and can trigger a cascade of further churn among their connections.
- **Fail:** The departure of a key community member is noticed anecdotally but not formally investigated.

### 8. Retention Interventions Are Tested and Measured

- **Pass:** The team runs targeted interventions for at-risk members (personalized outreach, content recommendations, event invitations) with holdout groups to measure incremental impact on retention.
- **Fail:** Interventions are launched without measurement, or no interventions are attempted at all.

---

## Cross-References

- [Community Health Score](community-health-score.md) -- Rising churn should depress the health score.
- [Ambassador Program QA](ambassador-program-qa.md) -- Ambassador churn deserves specific analysis.
- [Churn Taxonomy](../retention/churn-taxonomy.md) -- Community churn types may parallel product churn types.
