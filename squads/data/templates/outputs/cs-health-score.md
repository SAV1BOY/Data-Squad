# Customer Health Score Design Document

> Use this template to document the design and implementation of a customer health score.
> Health scores must be predictive, explainable, and actionable.

---

## 1. Overview

**Score Name:** [Name]
**Version:** [e.g., "v2.0"]
**Owner:** [Name, Team]
**Date:** [YYYY-MM-DD]
**Status:** [Design / Validation / Production / Deprecated]
**Customer Type(s) Covered:** [e.g., "SMB and Mid-Market accounts"]

_Example:_
**Score Name:** Customer Health Score (CHS)
**Version:** v2.0
**Owner:** Sarah Kim, Data Science
**Date:** 2026-03-06
**Status:** Production
**Customer Type(s) Covered:** SMB (self-serve) and Mid-Market (sales-assisted) accounts

---

## 2. Score Design [REQUIRED]

**Prediction Target:** [What the score predicts, e.g., "Probability of churn within 90 days"]
**Score Range:** [e.g., "0-100"]
**Score Format:** [Numeric / Categorical / Both]

**Score Tiers:**

| Tier    | Range   | Meaning                                    | Color  | Expected % of Accounts |
|---------|---------|--------------------------------------------|--------|------------------------|
| [Tier]  | [Range] | [e.g., "High risk of churn"]              | [Color]| [%]                    |
| [Tier]  | [Range] | [e.g., "Moderate risk, needs attention"]  | [Color]| [%]                    |
| [Tier]  | [Range] | [e.g., "Healthy, engaged customer"]       | [Color]| [%]                    |

_Example:_

| Tier     | Range  | Meaning                                | Color  | Expected % |
|----------|--------|----------------------------------------|--------|-----------|
| Critical | 0-25   | High churn risk, immediate intervention| Red    | 12%       |
| At-Risk  | 26-50  | Declining signals, proactive outreach  | Orange | 18%       |
| Stable   | 51-75  | Healthy with some areas to improve     | Yellow | 40%       |
| Thriving | 76-100 | Strong engagement, expansion potential | Green  | 30%       |

---

## 3. Signal Categories and Weights [REQUIRED]

### Category Breakdown

| Category        | Weight | Description                                | Signals Included          |
|-----------------|--------|--------------------------------------------|---------------------------|
| [Category 1]    | [%]    | [e.g., "How actively the customer uses the product"]| [List of signals]  |
| [Category 2]    | [%]    | [e.g., "Support experience and satisfaction"]| [List of signals]       |
| [Category 3]    | [%]    | [e.g., "Relationship and engagement depth"]| [List of signals]        |
| [Category 4]    | [%]    | [e.g., "Financial health indicators"]      | [List of signals]        |

_Example:_

| Category       | Weight | Description                          | Signals                                   |
|----------------|--------|--------------------------------------|-------------------------------------------|
| Product Usage  | 35%    | Depth and breadth of product usage   | DAU/WAU ratio, feature breadth, session duration |
| Support Health | 20%    | Support experience quality           | Ticket volume trend, CSAT, escalations    |
| Engagement     | 25%    | Relationship depth with company      | CSM meeting attendance, email engagement, NPS |
| Financial      | 20%    | Payment and contract health          | Payment failures, days to renewal, discount usage |

### Detailed Signal Specifications

| Signal Name              | Category | Source      | Scoring Logic                              | Max Points |
|--------------------------|----------|-------------|---------------------------------------------|-----------|
| [e.g., "dau_wau_ratio"] | [Cat]    | [Source]    | [e.g., ">0.4 = 10, 0.2-0.4 = 6, <0.2 = 2"]| [#]      |
| [e.g., "ticket_trend"]  | [Cat]    | [Source]    | [e.g., "Decreasing = 10, Flat = 6, Increasing = 2"]| [#]|

_Example:_

| Signal Name         | Category | Source    | Scoring Logic                                  | Max Pts |
|---------------------|----------|-----------|------------------------------------------------|---------|
| dau_wau_ratio       | Usage    | Amplitude | >0.4: 10 / 0.2-0.4: 6 / <0.2: 2              | 10      |
| feature_breadth     | Usage    | Amplitude | 5+: 10 / 3-4: 7 / 1-2: 3 / 0: 0              | 10      |
| session_duration_avg| Usage    | Amplitude | >15min: 10 / 5-15min: 6 / <5min: 2            | 10      |
| ticket_trend_30d    | Support  | Zendesk   | Decreasing: 10 / Flat: 6 / Increasing: 2      | 10      |
| csat_avg            | Support  | Zendesk   | >4.5: 10 / 3.5-4.5: 6 / <3.5: 2              | 10      |
| csm_meeting_attend  | Engage   | Gainsight | >80%: 10 / 50-80%: 6 / <50%: 2                | 10      |
| nps_score           | Engage   | Surveys   | Promoter: 10 / Passive: 5 / Detractor: 0      | 10      |
| payment_failures    | Finance  | Stripe    | 0: 10 / 1: 5 / 2+: 0                          | 10      |
| days_to_renewal     | Finance  | Billing   | >90d: 10 / 30-90d: 7 / <30d: 4 (extra weight) | 10     |

---

## 4. Sub-Scores

Each category produces a sub-score visible alongside the overall score.

| Sub-Score Name         | Calculation                                    | Display Range |
|------------------------|------------------------------------------------|---------------|
| [e.g., "Usage Score"] | [e.g., "Weighted sum of usage signals, normalized to 0-100"]| [0-100]|
| [e.g., "Support Score"]| [e.g., "Weighted sum of support signals, normalized to 0-100"]| [0-100]|

_Example:_

| Sub-Score Name    | Calculation                                         | Range |
|-------------------|-----------------------------------------------------|-------|
| Usage Score       | (dau_wau + feature_breadth + session_dur) / 30 * 100 | 0-100 |
| Support Score     | (ticket_trend + csat) / 20 * 100                     | 0-100 |
| Engagement Score  | (csm_attend + nps) / 20 * 100                        | 0-100 |
| Financial Score   | (payment_failures + days_to_renewal) / 20 * 100      | 0-100 |

---

## 5. Explainability

The health score surfaces the top contributing factors for each account.

**Top Positive Factors:** [Number shown, e.g., "Top 3 signals helping the score"]
**Top Negative Factors:** [Number shown, e.g., "Top 3 signals hurting the score"]

_Example display:_
```
Account: Acme Corp         Health Score: 42 (At-Risk)
---
Top Positive:  Feature breadth (7/10), CSAT (8/10), NPS Promoter (10/10)
Top Negative:  DAU/WAU ratio (2/10), Payment failures (0/10), Ticket trend increasing (2/10)
Recommendation: Address payment issue immediately. Schedule usage review with champion.
```

---

## 6. Alerting and Actions [REQUIRED]

| Trigger                                  | Alert Channel   | Action Required                        | Owner    |
|------------------------------------------|-----------------|----------------------------------------|----------|
| [e.g., "Score drops >15pts in 7 days"] | [e.g., "Slack"]| [e.g., "CSM reviews account within 48h"]| [Role] |
| [e.g., "Score enters Critical tier"]    | [e.g., "Email"]| [e.g., "Manager escalation"]          | [Role]  |

_Example:_

| Trigger                           | Channel              | Action                                | Owner       |
|-----------------------------------|----------------------|---------------------------------------|-------------|
| Score drops >15 points in 7 days  | Slack #cs-alerts     | CSM reviews account within 48 hours   | Assigned CSM|
| Account enters Critical tier      | Slack + Email to mgr | Manager review, escalation plan       | CS Manager  |
| Account moves to Thriving tier    | Slack #cs-wins       | Evaluate for advocacy/expansion       | Assigned CSM|
| Score unchanged for 60+ days      | Weekly digest        | Verify data freshness                 | Data team   |

---

## 7. Override Policy

**Can CSMs Override?** [Yes / No]
**Override Duration:** [e.g., "30 days, then auto-reverts to model score"]
**Override Tracking:** [e.g., "Logged in Salesforce with reason field"]
**Override Review:** [e.g., "Monthly review of all overrides to improve model"]

---

## 8. Validation Results

| Metric                              | Value    | Threshold | Pass? |
|-------------------------------------|----------|-----------|-------|
| [e.g., "AUC for churn prediction"]| [value]  | [>0.75]   | [Y/N] |
| [e.g., "Precision at Red tier"]   | [value]  | [>70%]    | [Y/N] |
| [e.g., "CSM agreement rate"]      | [value]  | [>75%]    | [Y/N] |

_Example:_

| Metric                          | Value | Threshold | Pass |
|---------------------------------|-------|-----------|------|
| AUC for 90-day churn prediction | 0.81  | >0.75     | Yes  |
| Precision at Critical tier      | 74%   | >70%      | Yes  |
| CSM agreement rate (survey)     | 82%   | >75%      | Yes  |
| Recall for actual churners      | 68%   | >60%      | Yes  |

---

## 9. Operational Details

**Refresh Cadence:** [e.g., "Daily at 6am ET"]
**Pipeline:** [e.g., "Airflow DAG: health_score_daily"]
**Output Table:** [e.g., "analytics.customer_health_scores"]
**Surfaced In:** [e.g., "Salesforce, Looker, Gainsight"]

---

## 10. Changelog

| Version | Date     | Author | Changes                                |
|---------|----------|--------|----------------------------------------|
| [v#]    | [Date]   | [Name] | [e.g., "Initial launch"]             |
| [v#]    | [Date]   | [Name] | [e.g., "Added financial sub-score"]  |
