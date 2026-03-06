# Experiment Announcement Guide

## Purpose

This guide defines how to announce experiments at each stage: launch, midpoint check, conclusion, and retrospective. Clear experiment communication prevents interference, sets expectations, and ensures decisions are made on solid ground.

## Core Principles

1. **Protect the experiment**: Announcements should prevent well-meaning interference
2. **Set expectations**: State when results will be ready so people do not ask prematurely
3. **Be transparent**: Share what we are testing and why, not just the mechanics
4. **Close the loop**: Every launched experiment gets a conclusion announcement

## Announcement Templates

### Launch Announcement

**Subject**: Experiment Launched: [Name]

```
Experiment: [Name]
Status: LIVE as of [date]
Expected duration: [X] days (results target: [date])

Hypothesis: [If we do X, then Y will happen, measured by Z]

What we are testing:
- Control: [current experience]
- Variant: [changed experience]

Primary metric: [metric name and definition]
Guardrail metrics: [metrics that must not degrade]

Traffic split: [X]% control / [Y]% variant
Population: [who is included/excluded]

What NOT to do:
- Do not change [related feature] during the test period
- Do not make pricing or messaging changes to the affected segment
- Do not reference early results — they are not reliable until [date]

Owner: [name]
Questions: Reply in thread or DM [name]
```

### Midpoint Check (Optional, for long-running experiments)

```
Experiment Update: [Name] — Midpoint

Status: Day [X] of [Y]. On track for results by [date].

Early signals (NOT for decision-making):
- Primary metric trending [direction], but confidence is at [X]% (need 95%)
- No guardrail metric violations observed
- Sample size: [current] of [target needed]

Reminder: Do not act on these numbers. Final results on [date].
```

### Results Announcement

```
Experiment Results: [Name] — [SHIP / KILL / ITERATE]

Verdict: [Ship / Kill / Iterate]

Primary metric: [metric] [direction] [amount]
- Control: [value] | Variant: [value]
- Lift: [X]% (95% CI: [lower, upper])
- p-value: [value] | Sample: n=[number]
- Duration: [X] days

Guardrail metrics:
- [Metric 1]: [No change / Changed by X%]
- [Metric 2]: [No change / Changed by X%]

Recommendation: [Specific next step]
Rationale: [1-2 sentences on why this decision]

Decision made by: [name and date]
Full analysis: [link]
```

### Retrospective Summary

```
Experiment Retro: [Name]

What we learned:
- [Key learning 1]
- [Key learning 2]

What surprised us: [unexpected finding]

What this changes: [how this affects our roadmap/model/assumptions]

Next experiment: [what we plan to test next based on this learning]

Retro doc: [link]
```

## Communication Cadence

| Stage | When | Channel | Audience |
|---|---|---|---|
| Launch | Day 0 | #experiments + squad channel | All stakeholders |
| Midpoint | Mid-duration | #experiments thread | Data + PM |
| Results | End of experiment | #experiments + squad channel | All stakeholders |
| Retro | Within 1 week of results | #experiments thread | Data + PM |

## Common Mistakes

- Launching an experiment without telling anyone, leading to accidental interference
- Sharing midpoint results without the "do not act on this" caveat
- Announcing results without a clear ship/kill/iterate verdict
- Skipping the retrospective, losing the organizational learning
- Announcing results in a way that blames the experiment owner for a negative outcome
- Not specifying what should not change during the experiment period

## Cross-References

- **Experiment Communication Phrases**: See `phrases/experiment-communication-phrases.md`
- **Experiment Kill Phrases**: See `phrases/experiment-kill-phrases.md`
- **Growth Tone**: See `voice/language-guides/growth-tone.md`
- **Certainty Scale**: See `voice/calibration/certainty-scale.md`
- **Skeptical Scientist Tone**: See `voice/tone-profiles/skeptical-scientist.md`
