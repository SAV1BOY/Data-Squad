# CS Health Score - Alerting

## Phase Objective

Configure a threshold-based alerting system that notifies the appropriate customer success team members when a customer's health score changes in ways that require attention. Alerts must be timely, actionable, and routed to the person best positioned to intervene, without creating alert fatigue from excessive or irrelevant notifications.

## Prerequisites

- Calibrated health score model from Phase 03 with validated thresholds
- Customer success team roster with account assignments and management hierarchy
- Integration access to communication channels (email, Slack, CRM task creation)
- Understanding of CSM workflow and response capacity
- Health score data pipeline producing updated scores at the defined refresh cadence

## Steps

1. **Define Alert Trigger Conditions**: Establish the specific conditions that generate an alert. Simple threshold alerts fire when a score crosses a category boundary (e.g., from healthy to at-risk). Velocity alerts fire when a score drops by more than a defined amount within a time window (e.g., score drops 15 points in one week), even if the score remains in the same category. Signal-specific alerts fire when a single critical signal crosses a threshold (e.g., no product login in 14 days). Define each trigger with a name, condition, and severity level.

2. **Prioritize Alert Severity Levels**: Create a tiered severity system that helps CSMs triage alerts. Critical alerts require same-day response (high-value account entering critical health). High alerts require response within 48 hours (mid-value account with rapid decline). Medium alerts require response within one week (any account crossing from healthy to at-risk). Low alerts are informational (score improvements, positive trend changes). Tie severity to the combination of account value and score change magnitude.

3. **Design Alert Routing Rules**: Define how each alert reaches the right person. Primary routing sends the alert to the assigned CSM. Escalation routing triggers when the assigned CSM has not acknowledged the alert within the defined response window. Manager alerts fire when multiple accounts in a CSM's portfolio trigger simultaneously, indicating a possible systemic issue. Executive alerts fire when high-value strategic accounts enter critical health.

4. **Craft Alert Content**: Each alert must contain enough information for the recipient to act immediately. Include the customer name, current health score and category, previous score and the change that triggered the alert, the top 3 signals driving the score change with their current values and trends, the customer's value tier and contract renewal date, and a direct link to the account in the CRM. Avoid jargon and raw numbers; translate data into plain-language descriptions of what changed and why it matters.

5. **Configure Alert Channels**: Set up alert delivery through the channels CSMs actually use. CRM task creation ensures alerts appear in the CSM's daily workflow and can be tracked to resolution. Email alerts provide detailed context for review. Slack or Teams messages enable rapid awareness for critical alerts. In-product notifications in the CS platform surface alerts where CSMs do their work. Allow CSMs to set channel preferences while requiring at least one persistent channel (CRM task) for audit trail.

6. **Implement Alert Deduplication and Suppression**: Prevent alert fatigue by implementing intelligent deduplication. If a customer's score continues declining, send a single alert at the initial threshold crossing and suppress subsequent alerts for that customer for a defined cooldown period (e.g., 7 days) unless the score drops to a more severe category. Suppress alerts during known planned events (maintenance windows, seasonal business slowdowns) if those events are expected to cause temporary score dips.

7. **Build Alert Acknowledgment and Resolution Tracking**: Create a workflow for tracking alert lifecycle from creation to resolution. CSMs should be able to acknowledge an alert (confirming they have seen it), add notes about their investigation, and resolve the alert with an outcome (risk mitigated, false positive, customer saved, customer lost). This resolution data feeds back into calibration and helps measure the alerting system's effectiveness.

8. **Test the Alert System End-to-End**: Before full deployment, test every alert trigger, routing rule, and channel with test accounts. Verify that alerts fire at the correct thresholds, reach the correct recipients, contain accurate and complete information, and can be acknowledged and resolved through the tracking workflow. Test escalation paths by simulating unacknowledged alerts. Test deduplication by triggering multiple score changes for the same account.

9. **Monitor Alert Volume and Response Rates**: After deployment, track the number of alerts generated per day, the distribution across severity levels, the average time to acknowledgment, the average time to resolution, and the resolution outcomes. If alert volume exceeds CSM capacity (more than 3-5 new alerts per CSM per week), tighten thresholds or adjust severity levels. If acknowledgment rates are low, investigate whether alerts are reaching CSMs through the right channels.

## Deliverables

- Alert trigger condition definitions with names, conditions, and severity levels
- Alert severity framework mapping account value and score change to severity tiers
- Alert routing rules specifying primary, escalation, and executive routing logic
- Alert content templates with all required fields and plain-language formatting
- Channel configuration documentation with CSM preference options
- Deduplication and suppression rules with cooldown periods
- Alert acknowledgment and resolution tracking workflow
- End-to-end test report covering all triggers, routes, and channels
- Alert volume and response rate monitoring dashboard

## Quality Gate

Alerting is complete when all of the following conditions are met:

- All defined alert triggers have been configured and tested end-to-end
- Routing rules correctly deliver alerts to assigned CSMs with functional escalation paths
- Alert content includes all required fields and is confirmed readable and actionable by CSMs
- Deduplication prevents more than one alert per customer per cooldown period for the same condition
- The acknowledgment and resolution workflow is functional in the CRM
- Alert volume during the first two weeks of deployment falls within manageable bounds (under 5 per CSM per week)
- Response rate tracking is operational and baseline metrics are captured
- CS leadership has approved the alert system for full team deployment

## Next Phase

Proceed to **05-playbooks.md** (Playbooks) to define the specific intervention actions that CSMs should take for each health tier and alert type.
