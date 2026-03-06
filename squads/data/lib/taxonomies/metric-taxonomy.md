# Metric Classification Taxonomy

A system for classifying metrics along multiple dimensions to improve clarity, prioritization, and communication.

---

## Dimension 1: Input vs. Output

Classifies metrics by their position in the causal chain.

| Type    | Definition                                                | Examples                                |
|---------|-----------------------------------------------------------|-----------------------------------------|
| Input   | Metrics that measure actions, resources, or effort applied. The team directly controls these. | Emails sent, features shipped, ad spend, support tickets resolved |
| Output  | Metrics that measure results or outcomes. These are influenced by inputs but not directly controlled. | Revenue, retention rate, NPS, conversion rate |

**Why it matters:** Teams should set targets on output metrics but manage day-to-day work through input metrics. If outputs are lagging, investigate which inputs need adjustment.

**Mapping example:**

```
INPUT: Ad Spend -----------> OUTPUT: New Signups
INPUT: Features Shipped ----> OUTPUT: Feature Adoption Rate
INPUT: Support Response Time -> OUTPUT: CSAT Score
```

---

## Dimension 2: Leading vs. Lagging

Classifies metrics by their temporal relationship to the outcome you care about.

| Type     | Definition                                                | Examples                                |
|----------|-----------------------------------------------------------|-----------------------------------------|
| Leading  | Metrics that change before the outcome changes. They predict future performance. | Trial activations (leads revenue), NPS (leads retention), feature usage (leads expansion) |
| Lagging  | Metrics that measure past outcomes. They confirm whether strategies worked. | Quarterly revenue, annual churn rate, monthly LTV |

**Why it matters:** Leading indicators give you time to act. Lagging indicators tell you how you did. A balanced metric set includes both.

**Leading-Lagging pairs:**

| Leading Indicator            | Lagging Outcome              | Time Lag    |
|------------------------------|------------------------------|-------------|
| Weekly active users          | Monthly retention rate        | 2-4 weeks   |
| Trial activation rate        | Trial-to-paid conversion      | 14-30 days  |
| NPS score                    | Churn rate                    | 1-3 months  |
| Pipeline created             | Revenue closed                | 1-6 months  |
| Support ticket volume        | CSAT / NPS                    | 1-2 months  |

---

## Dimension 3: Health / Growth / Efficiency

Classifies metrics by the business function they serve.

### Health Metrics

Measure whether the business and product are functioning properly. These are monitored continuously and are the basis for alerts.

| Metric                  | What It Tells You                                |
|-------------------------|--------------------------------------------------|
| Error rate              | Product reliability                              |
| Uptime                  | Infrastructure stability                         |
| Data pipeline freshness | Data platform health                             |
| DAU/MAU ratio           | Core engagement consistency                      |
| Retention rate          | Product-market fit durability                    |
| NPS / CSAT              | Customer satisfaction baseline                   |
| Churn rate              | Revenue/customer leakage                         |

**Characteristics:** Should be stable. Movement is usually a signal to investigate, not celebrate.

### Growth Metrics

Measure whether the business is expanding. These are the focus of growth teams and strategic planning.

| Metric                  | What It Tells You                                |
|-------------------------|--------------------------------------------------|
| New user signups        | Top-of-funnel acquisition                        |
| Activation rate         | Effectiveness of onboarding                      |
| MRR / ARR               | Revenue trajectory                               |
| Net revenue retention   | Expansion vs. contraction within existing base   |
| Referral rate           | Organic growth potential                         |
| Market share            | Competitive position                             |

**Characteristics:** Expected to increase over time. Flat or declining growth metrics require strategic intervention.

### Efficiency Metrics

Measure how well resources are being used. These matter for sustainability and unit economics.

| Metric                  | What It Tells You                                |
|-------------------------|--------------------------------------------------|
| CAC (Customer Acquisition Cost) | Cost to acquire a new customer            |
| LTV:CAC ratio           | Return on acquisition investment                 |
| Payback period          | Time to recoup acquisition cost                  |
| Revenue per employee    | Organizational efficiency                        |
| Gross margin            | Unit economics health                            |
| Support cost per user   | Service delivery efficiency                      |
| Pipeline velocity       | Sales process efficiency                         |

**Characteristics:** Should improve or remain stable as the business scales. Deteriorating efficiency metrics suggest scaling problems.

---

## Classification Matrix

Every metric should be classified across all three dimensions:

| Metric                | Input/Output | Leading/Lagging | Category   |
|-----------------------|-------------|-----------------|------------|
| Daily Active Users    | Output      | Leading          | Health     |
| Monthly Revenue       | Output      | Lagging          | Growth     |
| Emails Sent           | Input       | Leading          | Growth     |
| Churn Rate            | Output      | Lagging          | Health     |
| CAC                   | Output      | Lagging          | Efficiency |
| Trial Activation Rate | Output      | Leading          | Growth     |
| Error Rate            | Output      | Leading          | Health     |
| Features Shipped      | Input       | Leading          | Growth     |
| LTV:CAC Ratio         | Output      | Lagging          | Efficiency |
| NPS Score             | Output      | Leading          | Health     |

---

## Using the Taxonomy

### For Metric Reviews

- Ensure each review covers at least one metric from each category (Health, Growth, Efficiency).
- Flag when a review is disproportionately focused on lagging indicators (no time to act).

### For Target Setting

- Set targets on output metrics.
- Define input metric commitments that will drive the output targets.
- Include at least one leading indicator per lagging target so you can course-correct.

### For Dashboard Organization

- Group metrics by category on dashboards.
- Health metrics go in the monitoring/operational dashboard.
- Growth metrics go in the strategic/executive dashboard.
- Efficiency metrics go in the finance/operations dashboard.

### For Alert Configuration

- Health metrics: Alert on threshold breaches and anomalies.
- Growth metrics: Alert on trend breaks (sustained decline).
- Efficiency metrics: Alert on deterioration beyond a budget or plan threshold.
