# Urgency Scale

## Purpose

This scale standardizes how the data team communicates urgency. Every data communication should signal whether the audience needs to act now, soon, or is simply being informed. Miscalibrated urgency erodes trust: too many false alarms and people stop listening; too little urgency on real issues and people miss critical windows.

## The Scale

### Level 1: FYI — Informational

**Urgency**: None. No action required. The audience should be aware but does not need to do anything.
**Timeline**: No deadline. Consume when convenient.
**Signal**: Routine updates, context-setting, background information.

**Standard phrases**:
- "For your awareness, no action needed:"
- "FYI — here is the latest on [topic]."
- "Sharing for context ahead of [meeting/review]."
- "No changes needed. This is a routine update."
- "This is background information for the upcoming planning cycle."

**Format**: Can be included in weekly digests, async updates, or appended to existing threads.

### Level 2: Worth Noting — Soft Signal

**Urgency**: Low. Something has changed or a pattern is forming, but it is not yet actionable.
**Timeline**: Review within the week. No immediate action required.
**Signal**: Early trends, emerging patterns, minor anomalies worth watching.

**Standard phrases**:
- "Worth noting: [metric] has shifted [direction] for [duration]."
- "We are seeing early signs of [trend]. Not actionable yet, but worth monitoring."
- "Flagging a pattern we will continue to watch over the next 2 weeks."
- "This is not urgent, but if the trend continues, it will require attention by [date]."
- "Adding this to our watch list for the next data review."

**Format**: Slack message in the relevant channel, or a note in the weekly report.

### Level 3: Needs Attention — Action Required

**Urgency**: Medium. A clear signal that requires a decision or action within days.
**Timeline**: Action needed within 1-5 business days.
**Signal**: Confirmed trends, experiment results ready for decision, metric threshold crossed.

**Standard phrases**:
- "Action needed by [date]: [specific action]."
- "[Metric] has crossed the [threshold] we defined. Decision needed on [specific decision]."
- "This experiment has reached significance. Ready for ship/kill decision."
- "This requires a 15-minute discussion. Proposing we cover it in [meeting] on [date]."
- "The data is clear on this. We need to decide [specific decision] this week."

**Format**: Direct Slack message to the responsible person, with the decision or action clearly stated. Follow up if no response in 48 hours.

### Level 4: Urgent — Needs Immediate Action

**Urgency**: High. Something is actively going wrong or a critical window is closing.
**Timeline**: Action needed within 24 hours.
**Signal**: Significant metric drops, data pipeline failures affecting decisions, time-sensitive findings.

**Standard phrases**:
- "URGENT: [metric] dropped [X]% in the last [time period]. Immediate investigation needed."
- "Data pipeline failure affecting [dashboard/report]. Current numbers are unreliable. Do not make decisions based on today's data."
- "Time-sensitive: the experiment window closes [date]. Decision needed by EOD."
- "This impacts [number] of customers/users. Escalating for immediate review."
- "Flagging to [person]: this needs your attention today."

**Format**: Direct message to the responsible person and their manager. Use thread in the relevant Slack channel. Follow up within 4 hours if no response.

### Level 5: Critical Alert — Escalation Required

**Urgency**: Maximum. Active incident, major data integrity issue, or finding with immediate business impact.
**Timeline**: Action needed within hours.
**Signal**: Revenue-impacting data issues, security-adjacent data concerns, findings that affect live customer commitments.

**Standard phrases**:
- "CRITICAL: [system/metric] is [broken/incorrect/at risk]. Immediate escalation required."
- "Data integrity issue affecting [scope]. All reports from [source] should be treated as unreliable until resolved."
- "This is actively impacting customers. [X] accounts are affected. CS and Engineering have been notified."
- "Revenue impact estimated at $[amount]. Incident channel created: [link]."
- "Escalating to [executive] per our incident response protocol."

**Format**: Incident channel or war room. Direct notification to all stakeholders. Status updates every 30-60 minutes until resolved.

## Quick Reference

| Level | Label | Timeline | Format | Follow-up |
|---|---|---|---|---|
| 1 | FYI | None | Async digest | None |
| 2 | Worth Noting | This week | Slack channel | Next data review |
| 3 | Needs Attention | 1-5 days | Direct message | 48 hours |
| 4 | Urgent | 24 hours | DM + channel | 4 hours |
| 5 | Critical | Hours | Incident channel | 30-60 minutes |

## Calibration Guidelines

- When in doubt, go one level lower and include context for why you chose that level
- If you find yourself at Level 4-5 more than twice a month, the underlying systems need attention
- Never use Level 5 language for Level 3 situations; it trains people to ignore real emergencies
- Match the urgency to the impact, not to your personal reaction to the data

## Cross-References

- **Alert Message Phrases**: See `phrases/alert-message-phrases.md`
- **Slack Data Updates**: See `voice/channel-adaptation/slack-data-updates.md`
- **Pragmatic Analyst Tone**: See `voice/tone-profiles/pragmatic-analyst.md`
- **Exec Tone**: See `voice/language-guides/exec-tone.md`
