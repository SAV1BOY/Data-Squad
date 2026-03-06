# Alert Message Phrases

## Purpose

Standardized phrases for data alerts. Every alert must communicate three things: what happened, how severe it is, and what the reader should do. Organized by severity level.

## Alert Structure

Every alert follows this pattern:
1. **What**: The specific metric or system affected
2. **Severity**: How urgent this is (see urgency scale)
3. **Impact**: Who or what is affected and by how much
4. **Cause**: Known root cause or "investigating"
5. **Action**: What the reader needs to do right now

## Informational Alerts (Low Severity)

- "FYI: [Metric] is [X]% [above/below] its typical range for this day of week. No action needed; monitoring."
- "Note: [Dashboard/pipeline] will be unavailable for maintenance from [time] to [time] on [date]."
- "Heads up: [Metric] has been trending [direction] for [X] consecutive days. Within normal range but worth watching."
- "Data refresh for [source] completed [X] hours later than usual. All current values are accurate."
- "Planned change: [Metric] definition will be updated on [date]. See [link] for details."

## Warning Alerts (Medium Severity)

- "WARNING: [Metric] dropped [X]% in the last [time period], crossing our monitoring threshold of [value]."
- "ATTENTION: [Experiment] guardrail metric [name] shows a [X]% degradation. Review recommended before next decision point."
- "[Metric] has been below target for [X] consecutive [days/weeks]. Current value: [value] vs target: [value]."
- "Data quality issue detected: [description]. Affected reports: [list]. Workaround: [suggestion]."
- "Pipeline delay: [source] data is [X] hours stale. Reports relying on this source may show incomplete numbers."

## Urgent Alerts (High Severity)

- "URGENT: [Metric] dropped [X]% in the last [time period]. This is outside normal variation. Investigation initiated."
- "URGENT: [Pipeline/system] failure affecting [scope]. Current data is unreliable. Do not use [dashboard/report] for decisions until resolved."
- "URGENT: [Experiment] showing significant negative impact on [guardrail metric]. Recommend pausing immediately."
- "ACTION REQUIRED: [Metric] has hit the critical threshold of [value]. [Specific person/team] needs to [specific action] by [deadline]."
- "URGENT: Unexpected [X]% increase in [negative metric: errors/churn/complaints]. Likely cause: [hypothesis]. Investigating now."

## Critical Alerts (Maximum Severity)

- "CRITICAL: [System] is down. All data from [source] is unavailable. Impact: [scope]. Incident channel: [link]."
- "CRITICAL: Revenue data discrepancy of $[amount] identified. Billing and finance notified. Do not reference revenue dashboards until resolved."
- "CRITICAL: Data breach or exposure risk detected in [system]. Security team engaged. All access to [resource] suspended."
- "CRITICAL: [X] customer accounts showing incorrect data. CS is being notified. Customer communication plan in progress."

## Resolution Phrases

- "RESOLVED: [Alert description] has been resolved as of [timestamp]. Root cause: [explanation]."
- "UPDATE: [Alert description] is partially resolved. [What is fixed] and [what remains]. ETA for full resolution: [time]."
- "ALL CLEAR: [Metric/system] has returned to normal levels. No lasting impact. Post-mortem scheduled for [date]."
- "CLOSED: The data quality issue reported on [date] has been corrected. Affected reports have been refreshed."
- "POST-MORTEM: Root cause analysis for [incident] is available at [link]. Key finding: [one sentence summary]."

## Follow-Up Phrases

- "Status update in [X] hours or when there is new information, whichever comes first."
- "Next check: [timestamp]. If no update by then, assume the situation is stable."
- "Monitoring will continue for [X] hours after resolution to confirm stability."
- "If you notice anything unusual related to this, reply in thread or DM [contact]."
