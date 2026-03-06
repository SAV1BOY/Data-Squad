# Growth Tone Language Guide

## Purpose

This guide defines how the data team communicates about experiments, growth metrics, and optimization initiatives. The audience includes growth PMs, marketing leads, and cross-functional partners running experiments. The tone balances scientific rigor with the speed and decisiveness growth teams need.

## Core Principles

1. **Experiment-native**: Speak in the language of hypotheses, variants, and outcomes
2. **Speed-aware**: Growth moves fast; communicate results as soon as they are reliable, not perfect
3. **Outcome-honest**: Report wins and losses with equal clarity and professionalism
4. **Lever-focused**: Connect every finding to a specific growth lever (acquisition, activation, retention, revenue, referral)
5. **Iterative**: Frame results as steps in a learning loop, not final verdicts

## Communication Contexts

### Experiment Results
- State the hypothesis, the test design, and the outcome in that order
- Include the primary metric, sample size, confidence level, and duration
- Give a clear verdict: ship, iterate, or kill
- Note secondary metrics and any unexpected effects

### Growth Metrics Updates
- Report against the growth model: which lever moved and by how much
- Compare to forecast and prior period
- Highlight the top contributor and the biggest gap
- Tie back to the active experiments or initiatives driving the numbers

### Opportunity Sizing
- State the addressable population and the expected impact range
- Show the assumptions behind the estimate
- Rank opportunities by expected impact and effort

## Language Patterns

| Instead of | Use |
|---|---|
| "The experiment did well" | "Variant B increased activation by 8.3% (p=0.01, n=12,000) over 14 days" |
| "We should try something new" | "The current lever is saturating. Here are three hypotheses for the next test cycle, ranked by expected impact." |
| "It did not work" | "The experiment did not reach significance after 21 days. The observed lift of 1.2% is within the noise range. Recommendation: kill and reallocate." |
| "Growth is good" | "WoW new user activation increased from 34% to 37%, driven by the onboarding flow experiment shipped Feb 20" |
| "We think this will help" | "Based on funnel analysis, reducing form fields from 6 to 3 could improve conversion by 10-15%, affecting approximately 8,000 users per month" |

## Experiment Communication Cadence

- **Launch**: Announce the hypothesis, primary metric, expected duration, and what not to touch
- **Midpoint**: Share early directional signals with clear caveat that results are not final
- **Conclusion**: Deliver the verdict with full statistical context
- **Retro**: Document learnings regardless of outcome

## Formatting Standards

- Use tables for variant comparisons
- Bold the primary metric result
- Include a one-line verdict at the top: "Ship / Kill / Iterate"
- Link to the experiment tracking document
- Tag the relevant growth PM and engineering lead

## Common Mistakes

- Calling an experiment early because the graph looks good
- Reporting only the winning metric while ignoring guardrail metrics
- Not communicating experiment kills with the same rigor as wins
- Confusing directional results with statistically significant ones
- Failing to document what was learned from failed experiments
- Using growth jargon without defining the specific lever being discussed

## Cross-References

- **Experiment Communication Phrases**: See `phrases/experiment-communication-phrases.md`
- **Experiment Kill Phrases**: See `phrases/experiment-kill-phrases.md`
- **Growth Lever Phrases**: See `phrases/growth-lever-phrases.md`
- **Experiment Announcement**: See `voice/channel-adaptation/experiment-announcement.md`
- **Skeptical Scientist Tone**: See `voice/tone-profiles/skeptical-scientist.md` for rigor in results
- **Certainty Scale**: See `voice/calibration/certainty-scale.md`
