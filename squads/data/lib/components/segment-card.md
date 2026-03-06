# Segment Card Component

A reusable template for documenting, sharing, and acting on user or customer segments.

---

## Template

### Segment Identity

| Field              | Value                                       |
|--------------------|---------------------------------------------|
| **Segment Name**   | _e.g., High-Value Power Users_              |
| **Segment ID**     | _e.g., SEG-HV-001_                         |
| **Owner**          | _Team responsible for this segment_         |
| **Created**        | _Date_                                      |
| **Last Refreshed** | _Date and cadence_                          |
| **Status**         | Active / Deprecated / Experimental          |

### Definition

**Plain language:** _Users who have made 3+ purchases totaling over $500 in the last 90 days and have logged in at least 10 times in the last 30 days._

**SQL-level definition:**
```sql
SELECT user_id
FROM user_segments
WHERE total_purchases_90d >= 3
  AND total_revenue_90d >= 500
  AND login_count_30d >= 10
  AND account_status = 'active'
  AND is_internal = FALSE
```

**Inclusion criteria:**
- At least 3 completed purchases in the trailing 90 days.
- Cumulative spend of $500 or more in the trailing 90 days.
- 10+ login sessions in the trailing 30 days.

**Exclusion criteria:**
- Internal/test accounts.
- Accounts flagged for fraud.
- Accounts in grace period (churned but within win-back window).

### Size and Value

| Metric                    | Value       | % of Total     |
|---------------------------|-------------|----------------|
| Segment Size (users)      | 8,420       | 6.2% of MAU    |
| Revenue Contribution      | $1.84M/mo   | 34.1% of total |
| Avg Revenue per User      | $218.50     | 3.4x average   |
| Avg LTV (projected 12mo)  | $2,180      | 2.8x average   |
| Avg Sessions per Month    | 18.3        | 2.1x average   |

### Behavior Characteristics

Describe what makes this segment distinct from the general population:

| Behavior                  | Segment Value | Population Avg | Index  |
|---------------------------|---------------|----------------|--------|
| Sessions per Week         | 4.6           | 2.2            | 209    |
| Features Used (of 12)     | 9.1           | 4.3            | 212    |
| Support Tickets (30d)     | 0.8           | 1.4            | 57     |
| Referral Rate             | 12.3%         | 3.1%           | 397    |
| NPS Score                 | 62            | 34             | 182    |
| Churn Risk (next 90d)     | 4.2%          | 11.8%          | 36     |

**Behavioral narrative:** These users are deeply engaged across multiple features, generate significantly more revenue, and are far more likely to refer others. They submit fewer support tickets, suggesting high self-sufficiency. Their churn risk is very low.

### Trends

| Period     | Segment Size | Revenue Contribution | Avg Revenue/User |
|------------|-------------|---------------------|-------------------|
| Current    | 8,420       | $1.84M              | $218.50           |
| Prior Month| 8,110       | $1.76M              | $217.00           |
| 3 Months Ago| 7,650     | $1.62M              | $211.80           |
| 6 Months Ago| 6,900     | $1.41M              | $204.30           |

**Trend interpretation:** Segment is growing steadily at ~3-4% per month. Revenue per user is also increasing, suggesting deepening engagement.

### Recommended Actions

| Action                         | Priority | Owner         | Expected Impact              |
|--------------------------------|----------|---------------|------------------------------|
| Enroll in loyalty/VIP program  | High     | CRM Team      | Reduce already-low churn further |
| Target for referral campaign   | High     | Growth Team   | 4x referral rate = high ROI  |
| Beta access to new features    | Medium   | Product Team  | Deepen engagement, get feedback |
| Exclude from discounting       | High     | Revenue Team  | Protect margin; they convert at full price |
| Invite to advisory board       | Low      | CS Team       | Build relationship, gather insights |

### Overlap Analysis

Show how this segment overlaps with other defined segments:

| Other Segment              | Overlap Size | % of This Segment | % of Other |
|----------------------------|--------------|--------------------|------------|
| Enterprise Accounts        | 3,200        | 38.0%              | 22.4%      |
| Mobile-First Users         | 1,890        | 22.4%              | 8.1%       |
| Trial Converters (last 6mo)| 620         | 7.4%               | 12.8%      |

---

## Maintenance

- Refresh segment membership at least weekly; daily if used for targeting.
- Review the definition quarterly; business context shifts may require criteria changes.
- Archive segments that have not been used in any campaign, report, or experiment for 6 months.
