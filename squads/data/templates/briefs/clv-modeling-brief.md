# CLV Modeling Brief

> Use this template to scope a Customer Lifetime Value modeling project.
> CLV models are only useful when connected to concrete business decisions.
> Fill in each section; replace examples with your specifics.

---

## 1. Project Overview [REQUIRED]

**Project Name:** [Descriptive name]
**Requestor:** [Name, Team]
**Date:** [YYYY-MM-DD]
**Priority:** [High / Medium / Low]

_Example:_
**Project Name:** Predicted CLV Model for SaaS Customer Acquisition Optimization
**Requestor:** Marcus Chen, Marketing
**Date:** 2026-03-06
**Priority:** High

---

## 2. Business Model Context [REQUIRED]

Describe the revenue model so the CLV approach can be tailored appropriately.

**Revenue Model:** [Subscription / Transactional / Hybrid / Marketplace / Usage-Based]
**Contract Type:** [Monthly / Annual / Multi-year / No contract]
**Pricing Tiers:** [List tiers and approximate price points]
**Expansion Revenue:** [Yes/No - upsells, cross-sells, seat expansion]
**Average Customer Tenure:** [e.g., "~18 months median"]

_Example:_
**Revenue Model:** SaaS Subscription (monthly and annual plans)
**Contract Type:** Monthly (65% of customers) and Annual (35%)
**Pricing Tiers:** Starter ($29/mo), Pro ($79/mo), Business ($199/mo)
**Expansion Revenue:** Yes - seat expansion and tier upgrades account for ~22% of MRR growth
**Average Customer Tenure:** ~14 months median (monthly), ~26 months median (annual)

---

## 3. Data Available [REQUIRED]

| Data Category         | Fields Available                                | Source           | History Depth | Quality    |
|-----------------------|-------------------------------------------------|------------------|---------------|------------|
| [e.g., "Revenue"]   | [e.g., "MRR, invoice amounts, discounts"]      | [e.g., "Stripe"]| [e.g., "3yr"]| [Good/Fair/Poor]|
| [e.g., "Churn"]     | [e.g., "Cancel date, cancel reason, reactivations"]| [e.g., "Billing DB"]| [e.g., "3yr"]| [Good/Fair/Poor]|
| [e.g., "Usage"]     | [e.g., "DAU, feature adoption, API calls"]     | [e.g., "Amplitude"]| [e.g., "2yr"]| [Good/Fair/Poor]|
| [e.g., "Acquisition"]| [e.g., "Channel, campaign, CAC"]               | [e.g., "HubSpot"]| [e.g., "2yr"]| [Good/Fair/Poor]|

_Example:_

| Data Category   | Fields Available                              | Source     | History | Quality |
|-----------------|-----------------------------------------------|------------|---------|---------|
| Revenue         | MRR, invoice amounts, discounts, refunds      | Stripe     | 3 years | Good    |
| Churn           | Cancel date, cancel reason, reactivation flag | Billing DB | 3 years | Good    |
| Usage           | DAU, features used, sessions/week, API calls  | Amplitude  | 2 years | Good    |
| Acquisition     | Channel, campaign, first-touch, CAC           | HubSpot    | 2 years | Fair    |
| Support         | Tickets, CSAT, resolution time                | Zendesk    | 2 years | Good    |
| Firmographic    | Industry, company size, region                | Salesforce | 3 years | Fair    |

---

## 4. Use Case [REQUIRED]

How will the CLV model be used? Check all that apply and add specifics.

- [ ] **Acquisition optimization** - [e.g., "Set CAC targets by channel based on predicted CLV"]
- [ ] **Customer segmentation** - [e.g., "Tier CS investment by predicted CLV"]
- [ ] **Retention prioritization** - [e.g., "Identify high-CLV customers at churn risk"]
- [ ] **Pricing decisions** - [e.g., "Validate pricing changes against CLV impact"]
- [ ] **Financial forecasting** - [e.g., "Predict future revenue from current cohorts"]
- [ ] **Other** - [Describe]

**Primary Decision This Model Will Drive:**
[One sentence describing the most important decision]

_Example:_
- [x] **Acquisition optimization** - Set max CAC targets per channel/campaign based on predicted 24-month CLV
- [x] **Retention prioritization** - Flag top-decile CLV customers for proactive CS engagement when risk signals appear
- [ ] **Customer segmentation**
- [ ] **Pricing decisions**
- [x] **Financial forecasting** - Forecast next-quarter revenue from existing customer base

**Primary Decision This Model Will Drive:**
Marketing will use predicted CLV to set channel-specific CAC ceilings, shifting ~$200K/quarter in spend toward higher-CLV channels.

---

## 5. Model Requirements

**CLV Definition:** [What counts as "value"? Revenue only? Gross margin? Include referrals?]
**Time Horizon:** [e.g., "12-month predicted CLV" or "Lifetime (until churn)"]
**Granularity:** [e.g., "Per customer account" or "Per user"]
**Update Frequency:** [e.g., "Monthly recalculation" or "Real-time scoring"]
**Approach Preference:** [e.g., "Open to recommendation" or "Must be interpretable (no black box)"]

_Example:_
**CLV Definition:** Gross margin (revenue minus COGS) over customer lifetime, excluding referral value
**Time Horizon:** 24-month predicted CLV from current date
**Granularity:** Per customer account (not individual users)
**Update Frequency:** Monthly recalculation, refreshed on the 1st of each month
**Approach Preference:** Must be interpretable - need to explain CLV drivers to marketing leadership

---

## 6. Success Criteria

How will you evaluate whether the CLV model is good enough to use?

- [ ] [e.g., "Predicted CLV correlates >0.7 with actual observed CLV for mature cohorts"]
- [ ] [e.g., "Model identifies top-decile customers with >80% precision"]
- [ ] [e.g., "Marketing team adopts CLV-based CAC targets within 60 days"]
- [ ] [e.g., "Model output is refreshed and available in the BI tool monthly"]

---

## 7. Known Challenges

| Challenge                                     | Impact                    | Proposed Approach               |
|-----------------------------------------------|---------------------------|---------------------------------|
| [e.g., "Right-censored data for active customers"]| [e.g., "Underestimates CLV"]| [e.g., "Use survival models"]|
| [e.g., "Plan changes mid-lifecycle"]         | [e.g., "Complicates revenue prediction"]| [e.g., "Model transitions separately"]|

---

## 8. Timeline [REQUIRED]

| Milestone                    | Target Date | Owner   |
|------------------------------|-------------|---------|
| Brief approved               | [Date]      | [Name]  |
| Data exploration complete    | [Date]      | [Name]  |
| Model V1 trained and tested  | [Date]      | [Name]  |
| Stakeholder validation       | [Date]      | [Name]  |
| Production deployment        | [Date]      | [Name]  |
| First decision made using CLV| [Date]      | [Name]  |

---

## 9. Deliverables

| Deliverable                          | Format            | Audience         |
|--------------------------------------|-------------------|------------------|
| [e.g., "Model documentation"]      | [e.g., "Doc"]    | [e.g., "Data team"]|
| [e.g., "CLV scores per customer"]  | [e.g., "Table"]  | [e.g., "CS/Sales"]|
| [e.g., "CLV dashboard"]            | [e.g., "Looker"] | [e.g., "Marketing"]|
| [e.g., "Driver analysis report"]   | [e.g., "Slides"] | [e.g., "Exec"]   |

---

## Approval

| Role         | Name | Date | Status             |
|--------------|------|------|--------------------|
| Requestor    |      |      | Submitted          |
| Data Lead    |      |      | Pending / Approved |
| Finance      |      |      | Pending / Approved |
