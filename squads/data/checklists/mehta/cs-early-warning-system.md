# CS Early Warning System

## Purpose

Audit the early warning system that identifies at-risk customers before they churn. Mehta emphasizes that by the time a customer says they want to cancel, you have already lost. The best CS organizations detect risk early through behavioral signals and intervene proactively.

---

## Checklist Items

### 1. Leading Indicators of Churn Are Identified
- **Pass:** The team has documented at least 5 leading indicators that historically precede churn (e.g., declining login frequency, reduced feature breadth, support ticket spike, champion departure, payment delays).
- **Fail:** The team knows customers churn but has not systematically identified what happens before churn.

### 2. Signals Are Monitored Automatically
- **Pass:** Leading indicators are tracked automatically in a CS platform or data pipeline. Alerts fire when a customer crosses a risk threshold without requiring manual monitoring.
- **Fail:** Risk detection depends on CSMs manually noticing changes, which fails at scale and misses accounts between check-ins.

### 3. Alert Thresholds Are Calibrated
- **Pass:** Alert thresholds are set based on historical data (e.g., "30% drop in weekly active users over 4 weeks" triggers an alert). Thresholds are tuned to balance sensitivity and false alarm rate.
- **Fail:** Thresholds are arbitrary, producing too many false alarms (CSMs ignore them) or too few true alerts (risks are missed).

### 4. Intervention Playbooks Exist
- **Pass:** For each risk signal or signal combination, there is a documented intervention playbook specifying: who acts, what they do, within what timeframe, and what escalation looks like.
- **Fail:** Alerts fire but there is no standard response. Each CSM improvises, leading to inconsistent outcomes.

### 5. Time-to-Intervention Is Tracked
- **Pass:** The time from alert to first CSM action is measured and targeted (e.g., "within 48 hours of red alert, CSM has made contact"). The target is met at least 80% of the time.
- **Fail:** Alerts sit unacknowledged for days or weeks. Nobody measures response time.

### 6. Champion and Stakeholder Changes Are Monitored
- **Pass:** The system tracks changes in customer contacts: departures of champions, new decision-makers, org restructures. These events trigger relationship-building actions.
- **Fail:** The team learns about champion departures when the renewal conversation reveals a new decision-maker who does not know the product.

### 7. Support Ticket Patterns Are Analyzed
- **Pass:** Support ticket trends (volume, severity, sentiment, time-to-resolution, repeat issues) are analyzed as churn predictors. Escalating ticket patterns trigger alerts.
- **Fail:** Support and CS are siloed. Support ticket data is not used for risk prediction.

### 8. Payment and Financial Signals Are Included
- **Pass:** Late payments, disputed invoices, budget freeze requests, and downtrade requests are tracked as risk signals and communicated to CS in real time.
- **Fail:** Finance and CS do not share data. A customer can be 90 days late on payment while the CSM reports the account as "healthy."

### 9. Intervention Outcomes Are Measured
- **Pass:** The team tracks whether interventions succeed (customer stabilized, risk resolved) or fail (customer still churned). This data improves playbook effectiveness over time.
- **Fail:** Interventions happen but nobody tracks whether they worked, so playbooks never improve.

### 10. The Warning System Is Reviewed Quarterly
- **Pass:** The signal set, thresholds, and playbooks are reviewed at least quarterly. New signals are added, stale ones are retired, and thresholds are recalibrated based on recent data.
- **Fail:** The warning system was configured once and has not been updated despite changes in the product, customer base, or churn patterns.

---

## Cross-References

- [Health Score Design](health-score-design.md) -- health score feeds the early warning system
- [NRR/GRR Definition and Reconciliation](nrr-grr-definition-and-recon.md) -- early warnings protect retention metrics
- [QBR Quality](qbr-quality.md) -- QBRs can surface risks that automated systems miss
- [Mehta Digital CS Audit](mehta-digital-cs-audit.md) -- digital CS can scale early warning responses
