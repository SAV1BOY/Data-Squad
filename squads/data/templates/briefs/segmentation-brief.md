# Segmentation Brief

> Use this template to scope a customer or user segmentation project.
> Segmentation is only valuable if it leads to differentiated action.
> Fill in each section; replace examples with your specifics.

---

## 1. Project Overview [REQUIRED]

**Project Name:** [Descriptive name for the segmentation effort]
**Requestor:** [Name, Team]
**Date:** [YYYY-MM-DD]
**Priority:** [High / Medium / Low]

_Example:_
**Project Name:** B2B Customer Behavioral Segmentation for Retention
**Requestor:** Nina Alvarez, Customer Success
**Date:** 2026-03-06
**Priority:** High

---

## 2. Segmentation Hypothesis [REQUIRED]

What do you believe the segmentation will reveal? Why do you think distinct segments exist?

**Hypothesis:**
We believe that [population] can be meaningfully segmented by [dimension(s)],
and that these segments differ in [behavior/outcome],
which will allow us to [action].

_Example:_
**Hypothesis:**
We believe that our B2B customer base can be meaningfully segmented by product usage patterns (feature breadth, login frequency, team size),
and that these segments differ significantly in 12-month retention rates,
which will allow us to tailor CS playbooks and intervention timing per segment.

---

## 3. Population and Scope [REQUIRED]

**Population:** [Who is being segmented, e.g., "All active B2B customers with >90 days tenure"]
**Time Window:** [What period of data to use, e.g., "Behavioral data from last 6 months"]
**Exclusions:** [Who to exclude, e.g., "Free tier users, internal test accounts"]
**Estimated Population Size:** [e.g., "~4,200 customers"]

_Example:_
**Population:** All active B2B customers with at least 90 days since first paid subscription
**Time Window:** Usage data from Sep 2025 - Feb 2026 (6 months)
**Exclusions:** Free-tier accounts, internal/test accounts, enterprise custom contracts
**Estimated Population Size:** ~4,200 customer accounts

---

## 4. Data Available [REQUIRED]

List all data sources and variables you expect to use for segmentation.

| Data Category         | Variables Available                           | Source              | Quality    |
|-----------------------|-----------------------------------------------|---------------------|------------|
| [e.g., "Usage"]     | [e.g., "DAU, feature usage counts, session duration"]| [e.g., "Amplitude"]| [Good/Fair/Poor]|
| [e.g., "Firmographic"]| [e.g., "Industry, company size, region"]    | [e.g., "Salesforce"]| [Good/Fair/Poor]|
| [e.g., "Outcome"]   | [e.g., "Churn date, expansion, NPS"]         | [e.g., "Warehouse"]| [Good/Fair/Poor]|

_Example:_

| Data Category    | Variables Available                              | Source      | Quality |
|------------------|--------------------------------------------------|-------------|---------|
| Usage behavior   | DAU, features_used, sessions/week, API calls     | Amplitude   | Good    |
| Firmographic     | Industry, employee count, region, plan tier      | Salesforce  | Good    |
| Engagement       | Support tickets, NPS score, CSM touchpoints      | Zendesk/SF  | Fair    |
| Outcome          | Churn flag, expansion revenue, contraction date  | Warehouse   | Good    |
| Financial        | MRR, payment history, discount applied           | Stripe      | Good    |

---

## 5. Use Case and Actionability [REQUIRED]

How will segments be used once defined? Be specific about the actions each segment enables.

**Primary Use Case:** [e.g., "Differentiated CS playbooks per segment"]

| Potential Segment Type      | Possible Action                                  | Action Owner       |
|-----------------------------|--------------------------------------------------|--------------------|
| [e.g., "Power users"]     | [e.g., "Upsell to enterprise, invite to beta"]  | [e.g., "Sales"]   |
| [e.g., "At-risk users"]   | [e.g., "Trigger proactive CS outreach"]          | [e.g., "CS"]      |
| [e.g., "Underutilizers"]  | [e.g., "Send adoption campaign, training"]       | [e.g., "Marketing"]|

_Example:_
**Primary Use Case:** Differentiated CS engagement model per segment

| Potential Segment Type  | Possible Action                              | Action Owner |
|-------------------------|----------------------------------------------|--------------|
| Power users             | Advocate program, early access, upsell       | CS + Sales   |
| Steady-state users      | Quarterly check-in, feature education        | CS           |
| At-risk / declining     | Proactive intervention within 14 days        | CS           |
| New and ramping         | Guided onboarding, milestone celebrations    | CS + Product |

---

## 6. Method Preferences

**Preferred Approach:** [e.g., "Data-driven clustering (k-means)" or "Rule-based" or "Open to recommendation"]
**Number of Segments:** [e.g., "3-5 segments preferred for actionability" or "Let data determine"]
**Naming Convention:** [e.g., "Descriptive labels (not Segment 1, 2, 3)"]

_Example:_
**Preferred Approach:** Start with k-means clustering on behavioral variables, validate with outcome data
**Number of Segments:** 3-5 segments (must be distinct enough for different CS playbooks)
**Naming Convention:** Use descriptive, intuitive labels (e.g., "Champions," "At-Risk," not "Cluster A")

---

## 7. Validation Criteria

How will you know the segmentation is good?

- [ ] [e.g., "Segments show statistically different retention rates"]
- [ ] [e.g., "Each segment contains at least 10% of the population"]
- [ ] [e.g., "CS team can independently assign customers to segments based on descriptions"]
- [ ] [e.g., "Segments are stable over a 3-month rerun"]

---

## 8. Deliverables

| Deliverable                              | Format                | Audience          |
|------------------------------------------|-----------------------|-------------------|
| [e.g., "Segment definitions and profiles"]| [e.g., "Report/doc"]| [e.g., "CS + Exec"]|
| [e.g., "Customer-to-segment mapping"]    | [e.g., "CSV/table"] | [e.g., "CS Ops"]  |
| [e.g., "Segment dashboard"]              | [e.g., "Looker"]    | [e.g., "CS team"] |

---

## 9. Timeline

| Milestone                   | Target Date | Owner   |
|-----------------------------|-------------|---------|
| Brief approved              | [Date]      | [Name]  |
| Data exploration complete   | [Date]      | [Name]  |
| Initial segments proposed   | [Date]      | [Name]  |
| Stakeholder validation      | [Date]      | [Name]  |
| Final segments + handoff    | [Date]      | [Name]  |

---

## 10. Risks

| Risk                                        | Mitigation                                   |
|---------------------------------------------|----------------------------------------------|
| [e.g., "Data quality issues in usage data"]| [e.g., "Run data quality checks first"]     |
| [e.g., "Segments too granular to act on"]  | [e.g., "Cap at 5 segments, test with CS"]   |

---

## Approval

| Role         | Name | Date | Status             |
|--------------|------|------|--------------------|
| Requestor    |      |      | Submitted          |
| Data Lead    |      |      | Pending / Approved |
