# Experiment Communication Phrases

## Purpose

Standardized phrases for communicating about experiments at every stage: design, launch, monitoring, results, and decision.

## Hypothesis Framing

- "We hypothesize that [change] will [improve/increase/decrease] [metric] by [expected magnitude] for [population]."
- "The assumption we are testing is: [stated assumption]."
- "If this hypothesis is correct, we expect to see [observable outcome] within [time frame]."
- "This experiment addresses the question: does [intervention] cause [outcome]?"
- "Our null hypothesis is that there is no difference between control and variant on [primary metric]."

## Launch Communication

- "This experiment is now live. Traffic allocation: [X]% control, [Y]% variant."
- "The test population includes [definition]. Excluded: [exclusions and reasons]."
- "We expect to reach statistical significance in approximately [X] days, based on current traffic."
- "The primary metric is [metric]. Guardrail metrics are [list]."
- "During the experiment window, please do not modify [specific elements] as this would contaminate results."
- "The experiment owner is [name]. Questions and concerns should be directed to them."

## Monitoring and Midpoint

- "The experiment is on day [X] of an expected [Y]-day run."
- "Early signals are directional only and should not be used for decisions."
- "Sample size is currently [X] of the [Y] needed for significance."
- "No guardrail metric violations have been detected so far."
- "We are extending the experiment by [X] days because [reason: insufficient sample / external event / technical issue]."

## Positive Results

- "The variant outperformed control on the primary metric by [X]% (95% CI: [lower, upper], p=[value])."
- "This result is statistically significant and practically meaningful."
- "The improvement translates to approximately [business impact] per [time period]."
- "All guardrail metrics remained stable, confirming no negative side effects."
- "Based on these results, we recommend shipping the variant to 100% of users."

## Negative Results

- "The variant did not outperform control. Observed difference: [X]% (p=[value], not significant)."
- "This experiment did not produce the expected outcome, which is a valid and useful result."
- "The variant performed worse than control on [metric] by [X]%. We recommend reverting."
- "While the primary metric was flat, we observed an unexpected improvement in [secondary metric], which is worth investigating."

## Inconclusive Results

- "After [X] days, the experiment has not reached statistical significance."
- "The observed effect size ([X]%) is smaller than our minimum detectable effect ([Y]%)."
- "We cannot confidently say whether the variant is better or worse than control."
- "Options: extend the test for [X] more days, increase traffic allocation, or close as inconclusive."
- "The result is inconclusive, not negative. We learned that the effect, if any, is smaller than [X]%."

## Decision Communication

- "Decision: SHIP. The variant will be rolled out to all users by [date]."
- "Decision: KILL. The variant will be removed and traffic returned to control."
- "Decision: ITERATE. We will modify the variant based on [specific learning] and retest."
- "This decision was made by [name/team] on [date], based on [evidence summary]."

## Learnings and Retrospective

- "The key learning from this experiment is [specific insight]."
- "This result changes our understanding of [topic] in the following way: [explanation]."
- "Based on this experiment, our next test will focus on [next hypothesis]."
- "We added this finding to our experiment knowledge base for future reference."
