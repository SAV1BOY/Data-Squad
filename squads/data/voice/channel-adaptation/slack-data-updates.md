# Slack Data Updates Guide

## Purpose

This guide defines how the data team shares updates, findings, and alerts in Slack. Slack is async, scannable, and high-volume. Data updates must cut through the noise, be self-contained, and make the next step obvious.

## Core Principles

1. **Scannable in 5 seconds**: The reader should understand the key point without opening a thread
2. **Self-contained**: Include enough context that the reader does not need to ask follow-up questions
3. **Action-clear**: State whether action is needed and by whom
4. **Thread-friendly**: Put the headline in the main message, detail in the thread
5. **Channel-appropriate**: Use the right channel for the right audience

## Message Templates

### Metric Update
```
[Metric] Update — [Period]

Result: [value] ([direction] [amount] vs [comparison])
Driver: [primary cause]
Action: [None needed / Specific action / Decision required by date]

Detail in thread.
```

### Experiment Result
```
Experiment: [Name] — [Verdict: Ship / Kill / Extend]

Primary metric: [metric] [direction] [amount] (p=[value], n=[sample])
Duration: [days] days
Recommendation: [specific recommendation]

Full results in thread.
```

### Data Alert
```
[Urgency level]: [What happened]

Impact: [who/what is affected]
Cause: [known/investigating]
Action: [what the reader should do]
ETA: [when it will be resolved / when we will have more info]
```

### Weekly Summary
```
Data Squad Weekly — [Date range]

Top findings:
1. [Finding 1]: [one-line summary with key metric]
2. [Finding 2]: [one-line summary with key metric]
3. [Finding 3]: [one-line summary with key metric]

Needs attention: [item requiring decision or action]
Full report: [link]
```

### Dashboard/Report Launch
```
New: [Dashboard/Report name]

What it shows: [one sentence]
Who it is for: [audience]
Where: [link]
How to use: [one sentence or link to guide]

Questions? Thread or DM.
```

## Formatting Rules

- Use line breaks generously. Walls of text are invisible in Slack.
- Bold the single most important number or finding.
- Use bullet points for lists of 3+ items.
- Limit the main message to 6-8 lines. Everything else goes in the thread.
- Use code blocks for metric values when precision matters.
- Include links to dashboards, documents, or threads for context.
- Tag specific people only when they need to act, not for FYI.

## Channel Strategy

- **#data-updates**: General findings, weekly summaries, new dashboards
- **#data-alerts**: Pipeline issues, data quality problems, metric anomalies
- **#experiments**: Experiment launches, results, and decisions
- **Squad-specific channels**: Findings relevant to a specific squad, translated to their context
- **DMs**: Urgent items requiring individual action, sensitive findings

## Timing Guidelines

- Post weekly summaries on Monday morning
- Post experiment results within 24 hours of reaching significance
- Post alerts immediately, regardless of time
- Avoid posting non-urgent updates after 4 PM on Fridays
- Batch minor updates rather than posting multiple small messages throughout the day

## Common Mistakes

- Posting a chart without any text context
- Tagging @channel for Level 1-2 urgency items
- Writing a Slack message that requires opening 3 links to understand
- Not threading — putting all detail in the main channel message
- Sharing raw data without interpretation
- Posting the same update in multiple channels without adapting to each audience

## Cross-References

- **Urgency Scale**: See `voice/calibration/urgency-scale.md`
- **Alert Message Phrases**: See `phrases/alert-message-phrases.md`
- **Pragmatic Analyst Tone**: See `voice/tone-profiles/pragmatic-analyst.md`
- **Weekly Report Writing**: See `voice/channel-adaptation/weekly-report-writing.md`
