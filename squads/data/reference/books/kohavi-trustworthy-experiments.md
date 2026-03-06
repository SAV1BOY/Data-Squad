# Trustworthy Online Controlled Experiments - Ron Kohavi, Diane Tang, Ya Xu (2020)

## Book Info

- **Title:** Trustworthy Online Controlled Experiments: A Practical Guide to A/B Testing
- **Authors:** Ron Kohavi, Diane Tang, Ya Xu
- **Publisher:** Cambridge University Press
- **Year:** 2020
- **ISBN:** 978-1108724265
- **Pages:** 370
- **Context:** Ron Kohavi led experimentation platforms at Microsoft (ExP) and Airbnb, Diane Tang led Google's experimentation team, and Ya Xu leads LinkedIn's experimentation platform. Together they bring decades of experience running millions of A/B tests at the world's largest experimentation organizations. This is the definitive technical reference on online controlled experiments.

## Core Thesis

Online controlled experiments (A/B tests) are the gold standard for establishing causality in product and business decisions, but only when executed with statistical rigor and organizational discipline. Most A/B tests in industry are run incorrectly -- with wrong metrics, insufficient sample sizes, premature peeking, or flawed analysis -- leading to decisions that are worse than random. Trustworthy experimentation requires correct statistical methodology, robust infrastructure, organizational culture that accepts surprising results, and institutional safeguards against the many pitfalls that invalidate experiments.

## Key Concepts

### 1. The Overall Evaluation Criterion (OEC)
The primary metric an experiment is designed to move. Selecting the right OEC is the most important and most difficult decision in experimentation. The OEC must be: sensitive enough to detect meaningful changes, directionally aligned with long-term business goals, and resistant to short-term gaming. Bad OECs lead to experiments that "win" on the metric but harm the business.

### 2. Statistical Power and Sample Size
Most experiments are underpowered -- they lack sufficient sample size to detect practically meaningful effects. Power calculations should be done before running the experiment. The required sample size depends on: baseline metric value, minimum detectable effect, significance level (alpha), and desired power (1-beta). Running underpowered experiments wastes time and resources.

### 3. The Peeking Problem
Looking at experiment results before the planned sample size is reached and stopping early when results look significant dramatically inflates false positive rates. A test designed for 5% significance that is peeked at daily may have an actual false positive rate of 20-30%. Solutions include: sequential testing methods, always-valid p-values, and organizational discipline not to peek.

### 4. Guardrail Metrics
Beyond the OEC, experiments should monitor guardrail metrics -- metrics that must not degrade. Page load time, error rates, revenue, and user engagement are common guardrails. A treatment that improves the OEC but degrades a guardrail should be investigated and usually rejected. Guardrails prevent optimizing one metric at the expense of overall system health.

### 5. The Twyman Effect
Any metric that shows a surprisingly large change is almost certainly the result of a data quality problem, instrumentation bug, or analysis error rather than a genuine treatment effect. The Twyman effect is a meta-principle: be more skeptical of results that look too good (or too bad) to be true. Investigate surprising results thoroughly before acting on them.

### 6. Novelty and Primacy Effects
New features often show artificially inflated metrics due to novelty (users interact because it is new, not because it is better) or artificially deflated metrics due to primacy (users resist change and prefer the familiar). Both effects fade over time. Short-duration experiments may capture novelty/primacy effects rather than the steady-state treatment effect. Solutions include longer experiment durations and holdout groups.

### 7. Network Effects and Interference
In products with network effects (social networks, marketplaces), standard A/B test assumptions break down because treatment users affect control users. If a messaging feature is tested on 50% of users, the other 50% are affected by changed messaging behavior. Solutions include cluster randomization (randomize at the network cluster level) and careful interference analysis.

### 8. Institutional Experimentation Culture
The organizational requirements for trustworthy experimentation: (a) executive commitment to data-driven decisions, (b) willingness to accept surprising results, (c) investment in experimentation infrastructure, (d) statistical review processes, (e) documentation and knowledge sharing from past experiments, and (f) tolerance for the fact that most experiments will show no significant effect.

## Application to Data Squad

- **Experimentation maturity assessment:** Evaluate clients' experimentation practices against Kohavi's standards. Most companies have significant methodology gaps even if they are "running A/B tests."
- **OEC workshops:** Facilitate OEC selection workshops with client teams. The OEC decision often reveals fundamental disagreements about what the business is optimizing for.
- **Power analysis as standard practice:** Build power analysis into every experiment design. Underpowered experiments are worse than no experiments because they create false confidence.
- **Guardrail metric systems:** Help clients define and monitor guardrail metrics for their experimentation programs to prevent unintended degradation.
- **Sequential testing implementation:** For clients who need to monitor experiments continuously, implement sequential testing methods that control false positive rates under continuous monitoring.
- **Experimentation platforms:** Advise on experimentation infrastructure (feature flags, assignment services, analysis pipelines) that enables trustworthy testing at scale.

## Key Quotes

> "Most A/B tests are not trustworthy. They produce results, but those results are often wrong due to statistical errors that the experimenters are not even aware of."

> "The hardest part of experimentation is not the statistics. It is choosing the right metric to optimize."

> "If a result seems too good to be true, it almost certainly is. Investigate the data pipeline before celebrating."

> "Running an underpowered experiment is not a conservative approach. It is a waste of time that produces noise masquerading as signal."

> "The best experimentation cultures are comfortable with the fact that most experiments will show no significant result. That is not failure; that is the scientific method working."

## Cross-References

- **siroker-ab-testing.md** - A more accessible, practitioner-oriented guide to A/B testing; Kohavi provides the deeper statistical rigor.
- **kaushik-web-analytics-2-0.md** - Experimentation is one of Kaushik's four pillars of the multiplicity model.
- **ellis-hacking-growth.md** - Growth teams' high-tempo testing requires the statistical discipline Kohavi describes to avoid false discoveries.
- **kahneman-thinking-fast-slow.md** - Cognitive biases (confirmation bias, anchoring) explain why experimenters misinterpret results.
- **taleb-fooled-by-randomness.md** - Taleb's warnings about mistaking randomness for signal directly apply to the peeking problem.
- **hubbard-measure-anything.md** - Hubbard's EVPI framework helps determine when experimentation is worth the investment vs. other measurement methods.
