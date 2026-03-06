# Customer Health Score Brief

> Use this template to scope a customer health score design project.
> Health scores predict future outcomes (churn, expansion) from current signals.
> Fill in each section; replace examples with your specifics.

---

## 1. Project Overview [REQUIRED]

**Project Name:** [Descriptive name]
**Requestor:** [Name, Team]
**Date:** [YYYY-MM-DD]
**Priority:** [High / Medium / Low]

_Example:_
**Project Name:** Customer Health Score v2 - Predictive Churn and Expansion Signals
**Requestor:** Diana Ross, Customer Success
**Date:** 2026-03-06
**Priority:** High

---

## 2. Customer Types [REQUIRED]

Define the customer segments this health score will cover. Different customer types may need different scoring models.

| Customer Type          | Description                                    | Count  | Avg MRR   | Scored Today? |
|------------------------|------------------------------------------------|--------|-----------|---------------|
| [e.g., "SMB"]        | [e.g., "Self-serve, <50 employees"]           | [#]    | [$]       | [Yes/No]      |
| [e.g., "Mid-Market"] | [e.g., "Sales-assisted, 50-500 employees"]    | [#]    | [$]       | [Yes/No]      |
| [e.g., "Enterprise"]  | [e.g., "Named accounts, 500+ employees"]      | [#]    | [$]       | [Yes/No]      |

_Example:_

| Customer Type  | Description                          | Count | Avg MRR | Scored Today? |
|----------------|--------------------------------------|-------|---------|---------------|
| SMB            | Self-serve, <50 employees            | 3,200 | $85     | No            |
| Mid-Market     | Sales-assisted, 50-500 employees     | 480   | $650    | Yes (manual)  |
| Enterprise     | Named accounts, 500+ employees      | 42    | $8,500  | Yes (manual)  |

**Unified or Separate Models?** [e.g., "Separate models for SMB vs Mid-Market/Enterprise"]

---

## 3. Prediction Target [REQUIRED]

What outcome(s) should the health score predict?

| Outcome                | Definition                                           | Prediction Window        | Current Rate  |
|------------------------|------------------------------------------------------|--------------------------|---------------|
| [e.g., "Churn"]       | [e.g., "Customer cancels or does not renew"]        | [e.g., "Next 90 days"]  | [e.g., "4.2%/month"]|
| [e.g., "Expansion"]   | [e.g., "Customer increases MRR by >20%"]            | [e.g., "Next 6 months"] | [e.g., "8%/quarter"]|
| [e.g., "Contraction"] | [e.g., "Customer decreases MRR by >10%"]            | [e.g., "Next 90 days"]  | [e.g., "3%/month"]|

_Example:_

| Outcome      | Definition                                  | Prediction Window | Current Rate   |
|--------------|---------------------------------------------|-------------------|----------------|
| Churn        | Customer cancels subscription or fails to renew | Next 90 days  | 4.2% monthly   |
| Expansion    | Customer increases MRR by >20%              | Next 6 months     | 8% per quarter |

**Primary Target:** [Which outcome is most important? e.g., "Churn prediction is the priority"]

---

## 4. Data Available [REQUIRED]

List all signal categories and specific data points available for scoring.

| Signal Category     | Specific Signals                                    | Source          | Update Freq   | Quality    |
|---------------------|-----------------------------------------------------|-----------------|---------------|------------|
| [e.g., "Product usage"]| [e.g., "DAU, feature adoption %, session length"]| [e.g., "Amplitude"]| [e.g., "Daily"]| [Good/Fair/Poor]|
| [e.g., "Support"]    | [e.g., "Ticket volume, CSAT, escalations"]       | [e.g., "Zendesk"]| [e.g., "Daily"]| [Good/Fair/Poor]|
| [e.g., "Engagement"]  | [e.g., "CSM meeting attendance, email replies"]  | [e.g., "Gainsight"]| [e.g., "Weekly"]| [Good/Fair/Poor]|
| [e.g., "Financial"]   | [e.g., "Payment failures, discount usage"]       | [e.g., "Stripe"]| [e.g., "Daily"]| [Good/Fair/Poor]|
| [e.g., "Relationship"] | [e.g., "NPS score, champion changes, exec sponsor"]| [e.g., "CRM"]| [e.g., "Quarterly"]| [Good/Fair/Poor]|

_Example:_

| Signal Category  | Specific Signals                                | Source     | Update Freq | Quality |
|------------------|-------------------------------------------------|------------|-------------|---------|
| Product usage    | DAU/WAU ratio, features used, session duration  | Amplitude  | Daily       | Good    |
| Support          | Ticket volume, CSAT, time-to-resolution, escalations | Zendesk | Daily    | Good    |
| Engagement       | CSM meeting attendance, email response rate     | Gainsight  | Weekly      | Fair    |
| Financial        | Payment failures, discount %, invoice disputes  | Stripe     | Daily       | Good    |
| Relationship     | NPS score, champion changes, stakeholder count  | Salesforce | Quarterly   | Fair    |
| Contract         | Days to renewal, contract length, auto-renew    | Billing DB | Daily       | Good    |

---

## 5. Current Health Scoring (if any)

Describe how health is assessed today, even if informal.

**Current Approach:** [e.g., "CSMs assign Red/Yellow/Green manually in quarterly reviews"]
**Known Problems:**
- [e.g., "Subjective - varies by CSM"]
- [e.g., "Lagging - only updated quarterly"]
- [e.g., "No coverage for SMB segment"]

---

## 6. Score Design Preferences

**Score Format:** [e.g., "0-100 numeric" or "Red/Yellow/Green" or "Letter grade"]
**Composability:** [e.g., "Show sub-scores by category (Usage, Support, Engagement)"]
**Explainability:** [e.g., "Must show top 3 factors driving the score"]
**Override Capability:** [e.g., "CSMs can override with documented reason"]

_Example:_
**Score Format:** 0-100 numeric score, bucketed into Red (0-39), Yellow (40-69), Green (70-100)
**Composability:** Show sub-scores for Usage, Support, Engagement, and Financial health
**Explainability:** Display top 3 positive and top 3 negative contributing signals
**Override Capability:** CSMs can override with mandatory reason field; overrides tracked for model improvement

---

## 7. Integration and Consumption

Where should health scores be surfaced?

| Surface                    | Purpose                              | User              |
|----------------------------|--------------------------------------|--------------------|
| [e.g., "CRM"]            | [e.g., "Account-level visibility"]  | [e.g., "CSMs"]    |
| [e.g., "Dashboard"]      | [e.g., "Portfolio health overview"] | [e.g., "CS Leaders"]|
| [e.g., "Alerts"]         | [e.g., "Score drop notifications"] | [e.g., "CSMs"]    |

_Example:_

| Surface              | Purpose                          | User          |
|----------------------|----------------------------------|---------------|
| Salesforce account   | Account-level score visibility   | CSMs          |
| CS portfolio dashboard| Book-of-business health overview| CS Managers   |
| Slack alerts         | Score drops >15 points in 7 days | CSMs          |
| Weekly digest email  | Portfolio summary                | VP CS         |

---

## 8. Success Criteria

- [ ] [e.g., "Health score predicts churn with AUC >0.75"]
- [ ] [e.g., "85% of CSMs report the score is useful within 90 days"]
- [ ] [e.g., "At-risk interventions increase by 30% within first quarter"]
- [ ] [e.g., "False positive rate for Red scores is <25%"]

---

## 9. Timeline

| Milestone                      | Target Date | Owner   |
|--------------------------------|-------------|---------|
| Brief approved                 | [Date]      | [Name]  |
| Data exploration and feature engineering | [Date] | [Name] |
| Model V1 trained               | [Date]      | [Name]  |
| CSM validation and feedback    | [Date]      | [Name]  |
| Production deployment          | [Date]      | [Name]  |
| 90-day effectiveness review    | [Date]      | [Name]  |

---

## Approval

| Role         | Name | Date | Status             |
|--------------|------|------|--------------------|
| Requestor    |      |      | Submitted          |
| Data Lead    |      |      | Pending / Approved |
| CS Leader    |      |      | Pending / Approved |
