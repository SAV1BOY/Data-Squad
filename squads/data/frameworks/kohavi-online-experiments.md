# Kohavi: Online Experiments Framework

## Overview

Ron Kohavi, Diane Tang, and Ya Xu's "Trustworthy Online Controlled Experiments" (2020) -- often called the "A/B testing bible" -- codifies decades of experimentation practice from Microsoft, Google, and LinkedIn into a comprehensive framework. The book addresses not just the statistics of experimentation but the organizational, technical, and cultural challenges of building a trustworthy experimentation program.

For data squads, this framework is the authoritative reference for designing, running, and interpreting experiments correctly. It covers the pitfalls that cause most organizations' experiments to produce misleading results, and provides practical solutions for each.

## Origin

Ron Kohavi built and led Microsoft's experimentation platform, which ran tens of thousands of controlled experiments annually. Diane Tang led Google's experimentation infrastructure, and Ya Xu led LinkedIn's. Their combined experience covers billions of experimental subjects and thousands of organizational lessons.

The book emerged from the recognition that while A/B testing had become mainstream, most organizations were doing it poorly -- using insufficient sample sizes, misinterpreting results, ignoring multiple comparison problems, and failing to build trustworthy experimental infrastructure. The authors aimed to codify best practices so that organizations could avoid reinventing (and re-breaking) the wheel.

## Key Concepts

### The Overall Evaluation Criterion (OEC)

Every experiment needs a clearly defined OEC -- the primary metric that determines success or failure. The OEC should:

- Align with long-term business value (not just short-term engagement)
- Be measurable within the experiment's duration
- Be sensitive enough to detect meaningful changes
- Be difficult to game or misinterpret

Choosing the OEC is the most important decision in experiment design. A bad OEC leads to correct execution of the wrong experiment.

### Statistical Foundations

**Power analysis** -- Before running an experiment, calculate the required sample size to detect the minimum effect size that matters. Underpowered experiments waste resources by being unable to detect real effects.

**Statistical significance** -- The probability that the observed difference is not due to chance. The industry standard is p < 0.05 (95% confidence), but this should be adjusted based on the cost of false positives and false negatives.

**Practical significance** -- A result can be statistically significant but too small to matter. Define the minimum detectable effect (MDE) before the experiment based on business value, not after based on the data.

**Confidence intervals** -- Always report confidence intervals, not just p-values. A confidence interval of [+0.1%, +3.2%] tells a much richer story than "p = 0.03."

### Threats to Validity

**Selection bias** -- Non-random assignment corrupts the experiment. Proper randomization and assignment verification are essential.

**Novelty and primacy effects** -- Users may react to the novelty of a change rather than its inherent value. Extend experiment duration to let effects stabilize.

**Survivorship bias** -- If the treatment causes users to leave, the remaining users may appear healthier, masking harm.

**Sample Ratio Mismatch (SRM)** -- When the actual split between control and treatment deviates from the intended split. SRM is an almost-certain indicator of a bug in the experimental setup. Always check for SRM before interpreting results.

**Instrumentation effects** -- The treatment may change what gets tracked (e.g., a new feature fires different events), creating measurement artifacts that look like real differences.

### Guardrail Metrics

Beyond the OEC, every experiment should monitor guardrail metrics -- metrics that must not degrade even if the OEC improves. Common guardrails:

- Page load time (do not degrade performance)
- Revenue per user (do not accidentally reduce monetization)
- Error rate (do not introduce bugs)
- User satisfaction proxies (do not annoy users for short-term gains)

A winning OEC with degraded guardrails should not be shipped.

### Iteration and Learning

Experiments are not binary pass/fail events. They are learning tools. Even "failed" experiments teach something valuable if the experiment was well-designed. The experimentation program should:

- Document learnings from every experiment, not just winners
- Build institutional knowledge about what affects key metrics
- Use experiment results to refine the team's mental models of user behavior

### Experimentation Maturity Model

Kohavi describes four stages of experimentation maturity:

1. **Crawl** -- Run a few experiments per quarter. Manual setup, limited infrastructure. Focus on learning the process.
2. **Walk** -- Run experiments regularly. Semi-automated assignment and analysis. Dedicated experimentation support.
3. **Run** -- Experimentation is the default for all product changes. Automated platform, self-service for product teams.
4. **Fly** -- Advanced techniques (multi-armed bandits, sequential testing, heterogeneous treatment effects). Experimentation culture is deeply embedded.

### Twyman's Law

"Any figure that looks interesting or different is usually wrong." Named by Kohavi after an advertising researcher, this principle reminds experimenters to verify surprising results rather than celebrating them. Check for bugs, SRM, and instrumentation errors before interpreting unexpected findings.

## Application to Data Squad

### Experiment Design Review

Establish a mandatory design review before every experiment launches. The review should cover: hypothesis, OEC, guardrails, sample size calculation, expected duration, and decision criteria (what will you do if the OEC improves? Degrades? Shows no effect?).

### SRM Checks as Automated Guardrails

Build automated Sample Ratio Mismatch detection into the experimentation pipeline. If SRM is detected, automatically flag the experiment and require human review before results are interpreted.

### Experiment Registry

Maintain a searchable registry of all experiments with their hypotheses, results, and learnings. This prevents re-running experiments that have already been done and builds institutional knowledge.

### Power Calculator Availability

Provide a self-service power calculator that product teams can use to estimate experiment duration. This prevents the common failure of stopping experiments too early ("we have enough data after two days" -- almost certainly not).

### Results Communication Template

Standardize how experiment results are communicated:
- State the hypothesis and OEC
- Report the result with confidence interval, not just p-value
- Show guardrail metric impacts
- State the decision (ship, iterate, or kill) and rationale
- Document learnings for future experiments

### Sequential Testing Where Appropriate

For high-velocity teams that need faster decisions, implement sequential testing methods that allow valid early stopping while controlling error rates. This is an advanced capability but high-value.

## Pitfalls

### Peeking Problem

Looking at experiment results before the planned sample size is reached inflates false positive rates dramatically. If you check results after 100 users, then 500, then 1000, your effective significance level is far worse than 5%. Use sequential testing if early looks are operationally necessary.

### Multiple Comparisons

Testing 20 metrics in one experiment guarantees that at least one will be "significant" by chance. Adjust for multiple comparisons using Bonferroni correction or false discovery rate control, or pre-designate a single OEC.

### HiPPO Override

The Highest Paid Person's Opinion overriding experimental evidence. The data squad must build organizational commitment to trusting experimental results, even when they contradict leadership intuition.

### Experiment Duration Too Short

Many effects take time to stabilize. Day-of-week effects, novelty effects, and learning effects mean that most experiments need at least one full week, often two or more. Stopping after three days because "the numbers look good" is a recipe for false conclusions.

### Confusing Correlation Studies with Experiments

Observational analysis ("users who use feature X retain better") is not an experiment. Correlation does not imply causation. Only randomized controlled experiments can establish causation. Data squads must clearly label which analyses are causal and which are correlational.

## Cross-References

- **experimentation-layer.md** -- The operational layer that implements Kohavi's principles
- **ries-lean-startup-metrics.md** -- Lean startup's Build-Measure-Learn loop requires trustworthy experiments
- **cagan-inspired-metrics.md** -- Product discovery experiments as described by Cagan need Kohavi's rigor
- **goodhart-law-framework.md** -- Poorly chosen OECs are vulnerable to Goodhart's Law
- **kahneman-noise-framework.md** -- Experiments reduce noise by replacing human judgment with randomized evidence
- **simpson-paradox-awareness.md** -- Experiments can exhibit Simpson's Paradox when subgroups have different treatment effects
