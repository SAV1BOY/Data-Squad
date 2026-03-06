# Words to Avoid in Data Communication

## Purpose

A reference list of words and phrases that mislead, overstate, or obscure meaning in data communication. Each entry explains why the word is problematic and provides a better alternative.

## Absolute Certainty Words

| Avoid | Why | Use Instead |
|---|---|---|
| "Always" | Nothing in data is always true. Implies 100% with no exceptions. | "In all observed cases" or "consistently across [X] periods" |
| "Never" | Creates a false absolute. One counterexample invalidates the claim. | "In no observed instances during [period]" or "has not occurred in [X] observations" |
| "Proves" | Data does not prove; it supports or provides evidence for. Proof is a mathematical concept. | "The evidence strongly supports" or "the data is consistent with" |
| "Impossible" | Almost nothing in behavioral data is truly impossible. | "Highly unlikely given current data" or "not observed in any measured period" |
| "Guarantees" | Data cannot guarantee future outcomes. | "Strongly predicts" or "is associated with [X]% probability" |
| "Certainly" | Overstates confidence. Even high-confidence findings have uncertainty. | "With [X]% confidence" or "the data strongly indicates" |

## Vague Quantifiers

| Avoid | Why | Use Instead |
|---|---|---|
| "Significant" (without context) | Ambiguous: statistically significant? Practically significant? Personally significant? | "Statistically significant at p<0.05" or "a [X]% change, which is [meaningful/material] because [reason]" |
| "A lot" | Unmeasurable. What counts as "a lot" varies by person. | The actual number: "[X] users" or "[Y]% of the population" |
| "Most" | Vague. Could mean 51% or 99%. | The actual percentage: "[X]% of users" |
| "Some" | Could mean 2 or 2,000. Provides no useful information. | The actual count or range: "[X] to [Y] users" |
| "Many" | Same problem as "a lot." Subjective and imprecise. | The actual number with context: "[X] users, representing [Y]% of the segment" |
| "Few" | Relative to what? Few for one audience is many for another. | The actual number: "[X] instances" |

## Causal Language Without Evidence

| Avoid | Why | Use Instead |
|---|---|---|
| "Caused" (without experiment) | Implies causation from observational data. | "Is correlated with" or "is associated with" |
| "Because" (asserting mechanism) | Implies a known causal chain that may not be validated. | "Coincided with" or "the most likely explanation is" |
| "Led to" | Implies a direct causal pathway. | "Was followed by" or "preceded" |
| "Due to" (asserting single cause) | Oversimplifies multi-factor situations. | "Likely driven by" or "the primary contributing factor appears to be" |
| "Made users" | Implies deterministic control over user behavior. | "Users who encountered [X] were [Y]% more likely to [action]" |

## Emotional and Subjective Words

| Avoid | Why | Use Instead |
|---|---|---|
| "Amazing" / "Incredible" | Editorializing. Let the numbers speak. | State the number and its context: "[X]% improvement, the largest in [Y] periods" |
| "Disappointing" | Subjective judgment that biases interpretation. | "Below the target of [X] by [Y]%" |
| "Terrible" / "Awful" | Emotional language that undermines credibility. | "Performance declined [X]% and is now [Y]% below the acceptable threshold" |
| "Obviously" | Condescending. If it were obvious, you would not need to say it. | Remove the word entirely. State the fact. |
| "Clearly" | Often used to mask a weak argument. | Present the evidence and let the audience assess clarity. |
| "Interesting" | Filler word. Everything should be interesting or it should not be in the report. | Replace with what makes it notable: "Unusually, [finding]" or "Counter to expectations, [finding]" |

## Precision-Undermining Words

| Avoid | Why | Use Instead |
|---|---|---|
| "Roughly" / "About" / "Around" | If you have the number, use it. If you do not, say so. | The exact number, or "estimated at [X], with a margin of [Y]" |
| "Recently" | When? Last week? Last quarter? This is meaningless without a date. | The specific date or date range |
| "Trending" (without direction or magnitude) | Trending how? Up? Down? By how much? | "[Metric] has [increased/decreased] by [X]% over [Y] [weeks/months]" |
| "Basically" | Signals you are about to oversimplify. Either simplify properly or do not. | Remove the word. State the simplified version directly. |
| "Just" (minimizing) | Minimizes the finding or the effort. | Remove the word. |

## Hedging That Obscures

| Avoid | Why | Use Instead |
|---|---|---|
| "It seems like" | Too tentative when you have data. Use the certainty scale. | "The data indicates" (Level 3) or "we believe" (Level 2) |
| "One could argue" | Evasive. If the data supports it, state it. If it does not, do not raise it. | "The data supports the interpretation that" or omit |
| "It is worth noting that" | Filler. If it is worth noting, just note it. | State the point directly |
| "To be fair" | Implies you are about to undermine your own finding. | Present the counterevidence directly as a caveat |
