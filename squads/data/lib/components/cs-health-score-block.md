# Customer Success Health Score Block

A reusable component for defining, calculating, and acting on customer health scores.

---

## Template

### Score Overview

| Field              | Value                                   |
|--------------------|-----------------------------------------|
| **Score Name**     | _e.g., Account Health Score_            |
| **Score Range**    | 0-100                                   |
| **Update Cadence** | _e.g., Weekly, every Monday 06:00 UTC_  |
| **Owner**          | _e.g., CS Operations_                   |
| **Model Version**  | _e.g., v2.3_                            |

### Input Signals and Weights

Each input contributes to the composite score. Weights must sum to 1.0.

| Input Signal            | Source Table               | Metric                      | Weight | Range  | Rationale                              |
|-------------------------|----------------------------|-----------------------------|--------|--------|----------------------------------------|
| Product Usage           | `analytics.daily_active`   | DAU/MAU ratio               | 0.30   | 0-100  | Core engagement indicator              |
| Feature Adoption        | `analytics.feature_events` | % of key features used      | 0.15   | 0-100  | Breadth of value realization           |
| Support Ticket Velocity | `support.tickets`          | Tickets opened last 30 days | 0.15   | 0-100  | Inverse: more tickets = lower score    |
| NPS / CSAT              | `surveys.responses`        | Latest NPS score            | 0.15   | 0-100  | Direct sentiment signal                |
| Contract Utilization    | `billing.usage`            | % of licensed seats active  | 0.10   | 0-100  | Value realization vs. purchase         |
| Executive Engagement    | `crm.interactions`         | Exec meetings last 90 days  | 0.10   | 0-100  | Relationship strength                  |
| Payment History         | `billing.invoices`         | Days late on avg invoice     | 0.05   | 0-100  | Inverse: late payments = lower score   |

### Score Calculation

```
health_score = sum(normalized_input_i * weight_i) for all inputs
```

**Normalization rules:**

- **Ratio metrics (DAU/MAU, utilization):** Already 0-1; multiply by 100.
- **Count metrics (tickets, meetings):** Apply min-max normalization against the customer population.
- **Inverse metrics (tickets, late payments):** Score = 100 - normalized_value.
- **Missing data:** Use the population median for that signal. Flag the account for data quality review.

### Thresholds and Tiers

| Tier        | Score Range | Label        | Color  | Population % (Target) |
|-------------|-------------|-------------|--------|------------------------|
| Tier 1      | 80-100      | Healthy      | Green  | 40-50%                 |
| Tier 2      | 60-79       | Stable       | Blue   | 25-35%                 |
| Tier 3      | 40-59       | At Risk      | Yellow | 15-20%                 |
| Tier 4      | 0-39        | Critical     | Red    | 5-10%                  |

### Actions Per Tier

**Tier 1 - Healthy (80-100):**
- Quarterly business review cadence.
- Proactive expansion conversations (upsell, cross-sell).
- Nominate for case study, reference program, or advisory board.
- CSM touch: Monthly check-in (low-touch or automated).

**Tier 2 - Stable (60-79):**
- Monthly business review cadence.
- Identify adoption gaps in unused features; schedule enablement sessions.
- Monitor for downward trend over 3 consecutive periods.
- CSM touch: Bi-weekly check-in.

**Tier 3 - At Risk (40-59):**
- Bi-weekly review with CS manager involvement.
- Create a success plan with specific milestones and deadlines.
- Executive sponsor outreach within 2 weeks.
- CSM touch: Weekly check-in with documented action items.

**Tier 4 - Critical (0-39):**
- Immediate escalation to CS leadership and account executive.
- Executive-to-executive outreach within 48 hours.
- Daily monitoring of usage signals.
- Develop retention offer or remediation plan within 1 week.
- CSM touch: Multiple times per week; war-room if ARR > threshold.

### Score Change Alerts

| Trigger                              | Action                                    |
|--------------------------------------|-------------------------------------------|
| Score drops 15+ points in one period | Alert CSM and CS manager immediately      |
| Score crosses from Tier 1 to Tier 3+ | Escalate to CS director                   |
| Score improves from Tier 4 to Tier 2+| Notify team for recognition and learning  |
| Score is missing for 2+ periods      | Flag for data quality investigation       |

### Validation and Calibration

- **Backtest:** Compare historical scores against actual churn/expansion outcomes quarterly.
- **CSM override:** Allow CSMs to flag scores as "inaccurate" with justification; feed overrides back into model tuning.
- **Weight review:** Re-evaluate weights semi-annually using logistic regression against renewal outcomes.
- **Bias check:** Ensure scores are not systematically biased by company size, industry, or geography.
