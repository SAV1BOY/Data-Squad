# Experiment Kill Phrases

## Purpose

Standardized phrases for communicating the decision to kill an experiment. Killing an experiment is a normal, healthy part of the experimentation process. These phrases frame kills as valuable learnings, not failures.

## Announcing the Kill Decision

- "Decision: KILL. The experiment will be rolled back by [date]. Here are the details."
- "We are closing this experiment without shipping the variant. The data does not support the hypothesis."
- "After [X] days and [n] users, we are ending this experiment. The variant did not outperform control."
- "This experiment has been concluded. Outcome: the variant is not being shipped. Here is what we learned."
- "We are stopping this experiment based on the results. This is a clear, data-backed decision."

## Presenting the Evidence

- "The variant [underperformed / showed no improvement over] control on the primary metric: [metric] was [value] vs [value] (p=[value])."
- "After [X] days, the experiment did not reach statistical significance. The observed difference of [X]% is within the noise range."
- "The primary metric was flat, and the guardrail metric [name] degraded by [X]%, making this a net negative."
- "Power analysis indicated we would need [X] more days to detect an effect this small, and the potential impact does not justify the extended timeline."
- "The hypothesis was that [hypothesis]. The data shows [what actually happened]. The hypothesis was not supported."

## Framing the Learning

- "This experiment taught us that [specific learning]. This narrows our focus for the next iteration."
- "The result tells us that [assumption] does not hold for [segment/context]. This is useful information."
- "By ruling out [approach], we now know to focus on [alternative approaches]."
- "Key takeaway: [specific insight]. This updates our understanding of [area]."
- "The experiment produced an unexpected secondary finding: [finding]. This is worth investigating separately."
- "Not every experiment will produce a win. The value of this experiment is in [specific knowledge gained]."

## Addressing Stakeholder Concerns

- "We invested [X] days and [resources] in this experiment. The return on that investment is the knowledge that [learning], which saves us from scaling a change that would not have worked."
- "Killing this experiment is the right decision. Shipping a neutral or negative variant would have [specific negative consequence]."
- "The team that proposed this experiment did strong work. The hypothesis was reasonable; the data simply did not support it."
- "This does not mean the underlying problem is solved. It means this particular approach is not the solution. We have [X] alternative hypotheses to test."

## Communicating Next Steps

- "Next: we will test [next hypothesis], informed by what we learned here."
- "The experiment backlog has been updated. The next priority experiment is [name], launching [date]."
- "We are archiving this experiment in our knowledge base with full documentation for future reference."
- "No further action is needed on this experiment. The variant code will be removed by [engineer] by [date]."
- "If you have questions about this decision, reply in thread or bring it to the next experiment review."

## Tone Guidelines

- Do not apologize for the result. Killing experiments is the system working correctly.
- Do not blame the hypothesis owner. Experimentation is a team effort.
- Do not minimize the investment. Acknowledge the work and highlight the learning.
- Do not leave the door open if the data is clear. A clean kill is better than an ambiguous extension.
- Do celebrate the discipline of making data-driven decisions, even when the answer is no.
