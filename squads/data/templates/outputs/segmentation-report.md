# Segmentation Report

> Use this template to document segmentation findings and recommendations.
> Segments must be actionable - each segment should trigger a different business response.

---

## 1. Report Overview

**Report Title:** [Descriptive name]
**Analyst:** [Name, Team]
**Date:** [YYYY-MM-DD]
**Segmentation Type:** [Behavioral / Demographic / Needs-based / Value-based / Hybrid]
**Population:** [Who was segmented]

_Example:_
**Report Title:** B2B Customer Behavioral Segmentation for CS Playbook Design
**Analyst:** Sarah Kim, Product Analytics
**Date:** 2026-03-06
**Segmentation Type:** Behavioral (usage patterns) + Value (revenue)
**Population:** 4,180 active B2B customers with 90+ days tenure

---

## 2. Methodology

**Approach:** [e.g., "K-means clustering on standardized behavioral features"]
**Features Used:** [List the variables used for segmentation]
**Validation Method:** [e.g., "Silhouette score, elbow method, business validation"]
**Optimal Segments:** [Number selected and why]

_Example:_
**Approach:** K-means clustering on standardized behavioral features, validated against retention outcomes
**Features Used:** Weekly active users per account, feature breadth (unique features/month), API call volume, support ticket frequency, login frequency, session duration
**Validation Method:** Silhouette score (0.62), elbow method suggested 4-5 clusters, CS team validated 4 as actionable
**Optimal Segments:** 4 segments - balances statistical separation with operational simplicity

---

## 3. Segment Profiles [REQUIRED]

### Segment 1: [Segment Name]

**Size:** [# and % of population]
**Revenue Share:** [% of total revenue]
**Profile Summary:** [2-3 sentence description of this segment]

| Attribute                  | Value               | vs Population Average |
|----------------------------|---------------------|-----------------------|
| [e.g., "WAU per account"]| [e.g., "12.4"]    | [e.g., "2.1x"]      |
| [e.g., "Features used"]  | [e.g., "6.2"]     | [e.g., "1.8x"]      |
| [e.g., "12-mo retention"]| [e.g., "94%"]     | [e.g., "+16pp"]     |
| [e.g., "Avg MRR"]        | [e.g., "$420"]    | [e.g., "1.4x"]      |

**Recommended Action:** [What should be done differently for this segment]

_Example:_

### Segment 1: Champions (Power Users)

**Size:** 840 accounts (20% of population)
**Revenue Share:** 38% of total MRR
**Profile Summary:** Deeply embedded teams with high daily usage, broad feature adoption, and the highest retention. These are your best customers and potential advocates.

| Attribute             | Value    | vs Population Avg |
|-----------------------|----------|--------------------|
| WAU per account       | 12.4     | 2.1x               |
| Features used/month   | 6.2      | 1.8x               |
| 12-month retention    | 94%      | +16pp               |
| Avg MRR               | $420     | 1.4x               |
| Support tickets/month | 0.3      | 0.5x               |
| NPS score             | 62       | +18 points          |

**Recommended Action:** Enroll in advocate program, offer early access to new features, pursue case studies and referrals. Light-touch CS (quarterly strategic review only).

### Segment 2: [Segment Name]

**Size:** [# and %]
**Revenue Share:** [%]
**Profile Summary:** [Description]

| Attribute          | Value | vs Population Avg |
|--------------------|-------|--------------------|
| [Attribute 1]      | [Val] | [Comparison]       |
| [Attribute 2]      | [Val] | [Comparison]       |

**Recommended Action:** [Action for this segment]

### Segment 3: [Segment Name]

**Size:** [# and %]
**Revenue Share:** [%]
**Profile Summary:** [Description]

| Attribute          | Value | vs Population Avg |
|--------------------|-------|--------------------|
| [Attribute 1]      | [Val] | [Comparison]       |
| [Attribute 2]      | [Val] | [Comparison]       |

**Recommended Action:** [Action for this segment]

### Segment 4: [Segment Name]

**Size:** [# and %]
**Revenue Share:** [%]
**Profile Summary:** [Description]

| Attribute          | Value | vs Population Avg |
|--------------------|-------|--------------------|
| [Attribute 1]      | [Val] | [Comparison]       |
| [Attribute 2]      | [Val] | [Comparison]       |

**Recommended Action:** [Action for this segment]

---

## 4. Segment Comparison Matrix

| Attribute               | Segment 1   | Segment 2   | Segment 3   | Segment 4   |
|-------------------------|-------------|-------------|-------------|-------------|
| Size (%)                | [%]         | [%]         | [%]         | [%]         |
| Revenue share (%)       | [%]         | [%]         | [%]         | [%]         |
| 12-mo retention         | [%]         | [%]         | [%]         | [%]         |
| Avg MRR                 | [$]         | [$]         | [$]         | [$]         |
| Expansion likelihood    | [H/M/L]    | [H/M/L]    | [H/M/L]    | [H/M/L]    |
| Churn risk              | [H/M/L]    | [H/M/L]    | [H/M/L]    | [H/M/L]    |

---

## 5. Recommendations

| # | Recommendation                                     | Segment(s) | Owner        | Priority | Expected Impact        |
|---|----------------------------------------------------|------------|--------------|----------|------------------------|
| 1 | [e.g., "Launch advocate program for Champions"]   | [1]        | [CS]         | [P0]     | [e.g., "+15 referrals/Q"]|
| 2 | [e.g., "Build proactive intervention playbook"]   | [3, 4]     | [CS]         | [P0]     | [e.g., "-5pp churn"]  |
| 3 | [e.g., "Create adoption campaign for Segment 2"] | [2]        | [Marketing]  | [P1]     | [e.g., "+8pp feature adoption"]|

---

## 6. Segment Assignment and Maintenance

**Assignment Method:** [e.g., "SQL model runs monthly, scores pushed to CRM"]
**Refresh Cadence:** [e.g., "Monthly on 1st of month"]
**Where Segments Live:** [e.g., "Salesforce account field + Looker dimension"]
**Segment Stability:** [e.g., "~12% of accounts change segment per month"]

---

## 7. Limitations and Caveats

- [e.g., "Segmentation based on last 6 months of behavior; seasonal patterns may shift segments"]
- [e.g., "Accounts with <90 days tenure excluded; new customer segmentation needs separate model"]
- [e.g., "NPS data available for only 60% of population; may bias relationship metrics"]

---

## 8. Next Steps

- [ ] [e.g., "Present to CS leadership for playbook design (Mar 15)"]
- [ ] [e.g., "Push segment assignments to Salesforce (Mar 20)"]
- [ ] [e.g., "Build segment monitoring dashboard (Mar 25)"]
- [ ] [e.g., "Re-run segmentation in Q3 and measure stability"]
