# Alert Severity Taxonomy

A four-level severity classification for data and metric alerts, with escalation rules, response expectations, and notification channels per level.

---

## Severity Levels

### Level 1: Info

**Definition:** A notable observation that does not require immediate action. For awareness and context.

| Attribute            | Details                                              |
|----------------------|------------------------------------------------------|
| **Urgency**          | None. Review at convenience.                        |
| **User Impact**      | None or negligible.                                  |
| **Revenue Impact**   | None.                                                |
| **Data Impact**      | None. Data is flowing correctly.                     |
| **Response Time**    | Next business day or via weekly digest.              |
| **Notification**     | Dashboard annotation or daily/weekly digest email.   |
| **Escalation**       | None required.                                       |

**Examples:**
- A metric is 1.5 standard deviations from normal (notable but not alarming).
- A new event type appeared in the stream for the first time.
- A scheduled report completed successfully but took 2x longer than usual.
- A cohort's retention is slightly above historical average.

**Expected action:** Read and acknowledge. No investigation unless it recurs or worsens.

---

### Level 2: Warning

**Definition:** A metric is approaching a threshold or showing early signs of a problem. Requires investigation but not emergency response.

| Attribute            | Details                                              |
|----------------------|------------------------------------------------------|
| **Urgency**          | Moderate. Investigate within the working day.       |
| **User Impact**      | Potential. A subset of users may be affected.        |
| **Revenue Impact**   | Potential. Estimated < $10K or < 1% of daily revenue.|
| **Data Impact**      | Minor. Some data may be delayed or partially incorrect.|
| **Response Time**    | Within 4 business hours.                             |
| **Notification**     | Slack channel message (#alerts-data or team channel). |
| **Escalation**       | If not acknowledged within 4 hours, escalate to team lead. |

**Examples:**
- A metric is trending toward its critical threshold (80% of the way there).
- Null rate on a column increased from 0.1% to 2% (above normal, below critical).
- A data pipeline is running but 1 hour behind its SLA (SLA is 2 hours).
- An A/B test's sample ratio is slightly off (1% deviation).
- A trailing metric has been below target for 3 consecutive periods.

**Expected action:**
1. Acknowledge the alert within 1 hour.
2. Investigate root cause within 4 hours.
3. Determine if it is a transient issue or a developing problem.
4. If developing: create a ticket and begin remediation.
5. If transient: document and close.

---

### Level 3: Critical

**Definition:** A metric has breached a threshold, data is incorrect, or users are actively impacted. Requires immediate attention during business hours and prompt attention outside business hours.

| Attribute            | Details                                              |
|----------------------|------------------------------------------------------|
| **Urgency**          | High. Drop current work and respond.                |
| **User Impact**      | Active. A significant portion of users is affected.  |
| **Revenue Impact**   | Active. Estimated $10K-$100K or 1-5% of daily revenue.|
| **Data Impact**      | Significant. Key metrics are incorrect or unavailable.|
| **Response Time**    | Within 30 minutes during business hours. Within 1 hour off-hours. |
| **Notification**     | Slack channel + PagerDuty alert to on-call.          |
| **Escalation**       | If not acknowledged within 30 minutes, auto-escalate to team lead. If not resolved within 2 hours, escalate to director. |

**Examples:**
- Checkout error rate exceeds 2% threshold.
- A primary data pipeline has failed and a key dashboard is stale.
- Revenue metric shows a 10%+ drop that is not explained by known events.
- An experiment's guardrail metric has been breached.
- Null rate on user_id in the events table exceeds 5%.
- A production table has duplicate primary keys affecting downstream joins.

**Expected action:**
1. Acknowledge immediately.
2. Begin investigation. Follow the runbook if one exists.
3. Post a status update in the incident channel within 15 minutes.
4. Determine scope: how many users/metrics/dashboards are affected.
5. Mitigate: rollback, pause, or apply a temporary fix.
6. Communicate status updates every 30 minutes until resolved.
7. After resolution: file a post-mortem within 5 business days.

---

### Level 4: Emergency

**Definition:** A severe, wide-impact event affecting core business operations, revenue, or data integrity at scale. All-hands response required.

| Attribute            | Details                                              |
|----------------------|------------------------------------------------------|
| **Urgency**          | Maximum. War-room level response.                   |
| **User Impact**      | Severe. All or most users are affected.              |
| **Revenue Impact**   | Severe. Estimated > $100K or > 5% of daily revenue.  |
| **Data Impact**      | Severe. Core data infrastructure is down or corrupted.|
| **Response Time**    | Immediate. Within 15 minutes, 24/7.                 |
| **Notification**     | PagerDuty (phone call) + Slack + Email to leadership.|
| **Escalation**       | Immediately escalate to VP/Director. Auto-page backup on-call if primary does not respond in 10 minutes. |

**Examples:**
- Complete data pipeline outage; no data flowing for 30+ minutes.
- Revenue reporting system is producing incorrect numbers that have been shared externally.
- A data breach or PII exposure is detected.
- Core event tracking has stopped firing across all platforms.
- A billing system error is overcharging or undercharging customers.

**Expected action:**
1. Acknowledge within 5 minutes.
2. Open a war-room channel (or bridge call).
3. Designate an incident commander.
4. Post status update within 10 minutes.
5. All hands from relevant teams join the response.
6. Communicate to leadership within 30 minutes.
7. External communication (if users are visibly affected) within 1 hour.
8. Status updates every 15 minutes until resolved.
9. Post-mortem mandatory, initiated within 24 hours of resolution.

---

## Escalation Rules

### Time-Based Escalation

| Condition                                         | Action                                  |
|---------------------------------------------------|-----------------------------------------|
| Warning not acknowledged in 4 hours               | Escalate to team lead                   |
| Critical not acknowledged in 30 minutes           | Auto-page team lead                     |
| Critical not resolved in 2 hours                  | Escalate to director                    |
| Emergency not acknowledged in 10 minutes          | Auto-page backup on-call + director     |
| Emergency not resolved in 1 hour                  | Escalate to VP                          |

### Severity Upgrade Rules

| Condition                                         | Severity Change                         |
|---------------------------------------------------|-----------------------------------------|
| Warning persists for 24+ hours without resolution | Upgrade to Critical                     |
| Critical affects additional systems or metrics     | Upgrade to Emergency                    |
| Any data integrity issue affecting external reports| Minimum Critical, consider Emergency    |
| Any PII or security concern                        | Immediately Emergency                   |

---

## Notification Channel Summary

| Severity   | Dashboard | Digest Email | Slack Channel | PagerDuty | Phone Call | Leadership Email |
|------------|-----------|-------------|---------------|-----------|------------|-----------------|
| Info       | Yes       | Yes         | No            | No        | No         | No              |
| Warning    | Yes       | Yes         | Yes           | No        | No         | No              |
| Critical   | Yes       | Yes         | Yes           | Yes       | No         | No              |
| Emergency  | Yes       | Yes         | Yes           | Yes       | Yes        | Yes             |

---

## Severity Assignment Guidelines

When creating a new alert, use this decision tree:

1. **Can it wait until next week?** Yes -> Info.
2. **Should someone investigate today?** Yes -> Warning.
3. **Are users or revenue actively impacted right now?** Yes -> Critical.
4. **Is this a widespread, severe impact requiring all-hands response?** Yes -> Emergency.

When in doubt, assign one level higher. It is better to over-alert once and downgrade than to under-alert and miss a real problem.
