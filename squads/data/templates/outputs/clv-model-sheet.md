# CLV Model Documentation

> Use this template to document a Customer Lifetime Value model.
> Covers methodology, features, validation, and operational details.

---

## 1. Model Overview

**Model Name:** [Descriptive name]
**Version:** [e.g., "v2.1"]
**Owner:** [Name, Team]
**Date Created:** [YYYY-MM-DD]
**Last Retrained:** [YYYY-MM-DD]
**Status:** [Development / Staging / Production / Deprecated]

_Example:_
**Model Name:** Predicted 24-Month CLV for Self-Serve Customers
**Version:** v2.1
**Owner:** Sarah Kim, Data Science
**Date Created:** 2025-09-15
**Last Retrained:** 2026-02-01
**Status:** Production

---

## 2. CLV Definition [REQUIRED]

**What "Value" Means:** [Revenue / Gross Margin / Net Revenue / Other]
**Time Horizon:** [e.g., "24 months from current date"]
**Granularity:** [Per user / Per account / Per cohort]
**Currency:** [e.g., "USD"]
**Discount Rate:** [e.g., "10% annual" or "Not applied"]

**Formula (Conceptual):**
```
CLV = [description of value calculation over time horizon]
```

_Example:_
**What "Value" Means:** Gross margin (revenue minus hosting and support COGS)
**Time Horizon:** 24 months from prediction date (rolling forward)
**Granularity:** Per customer account
**Currency:** USD
**Discount Rate:** 10% annual, applied monthly

**Formula (Conceptual):**
```
CLV_24m = SUM(predicted_monthly_gross_margin[t] * discount_factor[t]) for t = 1..24
where discount_factor[t] = 1 / (1 + 0.10/12)^t
```

---

## 3. Methodology [REQUIRED]

**Approach:** [e.g., "Probabilistic (BG/NBD + Gamma-Gamma)" or "ML regression" or "Cohort-based"]
**Algorithm:** [e.g., "XGBoost regressor" or "BG/NBD model"]
**Training Data:** [Time period and sample size]
**Validation Strategy:** [e.g., "Train on 18 months, validate on next 6 months"]

_Example:_
**Approach:** Two-stage ML model (churn probability + revenue conditional on retention)
**Algorithm:** Stage 1: XGBoost classifier (churn within 24 months) / Stage 2: XGBoost regressor (revenue if retained)
**Training Data:** Customers who started between Jan 2023 and Dec 2024 (n=22,400) with full 24-month observation windows
**Validation Strategy:** Temporal split - trained on 2023 cohorts, validated on 2024 cohorts. 5-fold cross-validation within training set.

---

## 4. Features [REQUIRED]

| Feature Name              | Category      | Description                            | Importance Rank | Source          |
|---------------------------|---------------|----------------------------------------|-----------------|-----------------|
| [e.g., "tenure_months"]  | [Lifecycle]   | [e.g., "Months since first payment"] | [#]             | [e.g., "Billing DB"]|
| [e.g., "avg_dau_m3"]    | [Usage]       | [e.g., "Avg DAU in most recent 3 months"]| [#]          | [e.g., "Amplitude"]|
| [e.g., "plan_type"]     | [Contract]    | [e.g., "Current plan tier"]           | [#]             | [e.g., "Stripe"]|

_Example:_

| Feature Name              | Category    | Description                          | Importance | Source     |
|---------------------------|-------------|--------------------------------------|-----------|------------|
| mrr_current               | Financial   | Current monthly recurring revenue    | 1         | Stripe     |
| feature_breadth_90d       | Usage       | Unique features used in last 90 days | 2         | Amplitude  |
| tenure_months             | Lifecycle   | Months since first payment           | 3         | Billing DB |
| dau_wau_ratio_90d         | Usage       | DAU/WAU ratio over last 90 days     | 4         | Amplitude  |
| support_tickets_90d       | Support     | Support tickets in last 90 days      | 5         | Zendesk    |
| plan_type                 | Contract    | Current plan (starter/pro/business)  | 6         | Stripe     |
| expansion_events          | Financial   | Number of plan upgrades to date      | 7         | Billing DB |
| nps_latest                | Sentiment   | Most recent NPS score                | 8         | Surveys    |
| team_size                 | Usage       | Active users on the account          | 9         | Product DB |
| payment_failures_12m      | Financial   | Failed payments in last 12 months    | 10        | Stripe     |

---

## 5. Model Performance [REQUIRED]

### Overall Performance

| Metric                         | Training Set | Validation Set | Acceptable Threshold |
|--------------------------------|-------------|----------------|----------------------|
| [e.g., "MAE"]                | [value]     | [value]        | [threshold]          |
| [e.g., "MAPE"]               | [value]     | [value]        | [threshold]          |
| [e.g., "R-squared"]          | [value]     | [value]        | [threshold]          |
| [e.g., "Decile lift (top 10%)"]| [value]   | [value]        | [threshold]          |

_Example:_

| Metric                      | Training | Validation | Threshold |
|-----------------------------|----------|------------|-----------|
| MAE (mean absolute error)   | $142     | $168       | <$200     |
| MAPE (mean abs % error)     | 18.2%    | 21.4%      | <25%      |
| R-squared                   | 0.78     | 0.72       | >0.65     |
| Top-decile capture rate     | 42%      | 38%        | >30%      |
| Spearman rank correlation   | 0.84     | 0.79       | >0.70     |

### Performance by Segment

| Segment       | MAE    | MAPE   | R-squared | Notes                     |
|---------------|--------|--------|-----------|---------------------------|
| [Segment 1]   | [val]  | [val]  | [val]     | [Notes]                   |
| [Segment 2]   | [val]  | [val]  | [val]     | [Notes]                   |

_Example:_

| Segment      | MAE    | MAPE   | R-sq  | Notes                          |
|--------------|--------|--------|-------|--------------------------------|
| Starter plan | $48    | 24.1%  | 0.58  | Lower accuracy; less variance  |
| Pro plan     | $185   | 19.8%  | 0.74  | Good fit                       |
| Business plan| $420   | 18.2%  | 0.76  | Best fit; most predictable     |

---

## 6. Output Specification

**Score Name:** [e.g., "predicted_clv_24m"]
**Score Range:** [e.g., "$0 - $50,000"]
**Output Format:** [e.g., "Numeric value per account + percentile rank + tier label"]

**Tier Definitions:**

| Tier       | CLV Range         | % of Accounts | Label Used In Tools    |
|------------|-------------------|---------------|------------------------|
| [Tier 1]   | [Range]           | [%]           | [e.g., "Platinum"]    |
| [Tier 2]   | [Range]           | [%]           | [e.g., "Gold"]        |

_Example:_

| Tier       | CLV Range        | % of Accounts | Label         |
|------------|------------------|---------------|---------------|
| Platinum   | >$5,000          | 8%            | High Value    |
| Gold       | $2,000 - $5,000  | 22%           | Growth        |
| Silver     | $500 - $2,000    | 45%           | Standard      |
| Bronze     | <$500            | 25%           | Low Value     |

---

## 7. Operational Details

**Refresh Cadence:** [e.g., "Monthly, 1st of each month"]
**Pipeline:** [e.g., "Airflow DAG: clv_model_monthly"]
**Output Table:** [e.g., "analytics.clv_scores"]
**Surfaced In:** [e.g., "Salesforce, Looker, CS tool"]
**SLA:** [e.g., "Scores available by 8am ET on refresh day"]
**Monitoring:** [e.g., "Score distribution drift alert if KL divergence >0.1"]

---

## 8. Known Limitations

- [e.g., "Model accuracy is lower for accounts < 3 months old (limited behavioral data)"]
- [e.g., "Does not account for potential enterprise conversion (separate model needed)"]
- [e.g., "Assumes current pricing structure; major pricing changes require retraining"]

---

## 9. Retraining Schedule

| Trigger                                  | Action                              |
|------------------------------------------|-------------------------------------|
| Quarterly scheduled                      | Retrain on latest 24-month data     |
| MAPE degrades >5pp from baseline         | Investigate and retrain if needed   |
| Major pricing or product change          | Retrain within 1 month of change    |
| Score distribution drift detected        | Investigate root cause              |

---

## 10. Changelog

| Version | Date       | Author   | Changes                                     |
|---------|------------|----------|---------------------------------------------|
| [v#]    | [Date]     | [Name]   | [e.g., "Initial production model"]         |
| [v#]    | [Date]     | [Name]   | [e.g., "Added NPS feature, retrained"]     |
