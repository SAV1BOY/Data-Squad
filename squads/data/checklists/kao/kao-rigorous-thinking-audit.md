# Kao Rigorous Thinking Audit

## Purpose

Audit the rigor of causal reasoning in growth decisions. Kao emphasizes that growth teams must not confuse correlation with causation, anecdote with evidence, or activity with progress. This checklist tests whether the team's thinking is disciplined enough to avoid common reasoning traps.

---

## Checklist Items

### 1. Correlation vs. Causation Is Distinguished
- **Pass:** When the team claims "X causes Y," there is evidence beyond correlation: a controlled experiment, a natural experiment, or a strong theoretical mechanism. The team explicitly states the level of causal evidence.
- **Fail:** Observational correlations are presented as causal claims without qualification (e.g., "Users who do X retain better, so we should make everyone do X").

### 2. Confounding Variables Are Considered
- **Pass:** Before drawing conclusions, the team asks, "What else could explain this result?" At least two alternative explanations are considered and addressed.
- **Fail:** The first plausible explanation is accepted without considering alternatives.

### 3. Sample Selection Bias Is Identified
- **Pass:** Analysis accounts for selection bias (e.g., users who do X may be inherently different from those who do not, independent of X's effect). Survivorship bias is checked.
- **Fail:** The team compares groups without considering that membership in those groups is not random.

### 4. Base Rates Are Used
- **Pass:** Claims include base rate context (e.g., "Feature X users retain at 60% vs. a base rate of 45% for all activated users"). Absolute numbers are contextualized.
- **Fail:** Impressive-sounding numbers are presented without the base rate, making it impossible to judge significance.

### 5. Anecdotes Are Not Treated as Data
- **Pass:** Customer stories and individual cases are used for inspiration and hypothesis generation, but decisions are based on quantitative evidence or systematic qualitative research.
- **Fail:** A single customer complaint or a vivid anecdote drives a product change without verifying it represents a pattern.

### 6. Statistical Significance Is Required for Claims
- **Pass:** Quantitative claims from experiments include confidence levels or significance measures. The team does not declare a winner based on "directional" results from insufficient samples.
- **Fail:** Experiments are called based on small samples or eyeballing charts, leading to false positives.

### 7. The Null Hypothesis Is Given Fair Treatment
- **Pass:** The team genuinely considers the possibility that a proposed change will have no effect. Null results are accepted rather than explained away.
- **Fail:** The team is psychologically committed to the hypothesis and will reframe any result as support.

### 8. Metrics Are Not Cherry-Picked
- **Pass:** The primary metric is defined before the analysis. If secondary metrics tell a different story, the discrepancy is investigated rather than selectively reported.
- **Fail:** The team reports whichever metric moved in the desired direction, ignoring metrics that did not.

### 9. Time-Series Reasoning Is Sound
- **Pass:** When evaluating changes over time, the team controls for seasonality, trend, and external events (product launches, holidays, news cycles) before attributing causation.
- **Fail:** A post-launch metric improvement is attributed to the launch without checking whether the trend was already in motion.

### 10. Disagreement Is Encouraged and Structured
- **Pass:** The team has a norm of constructive challenge. Conclusions must survive questioning. A devil's advocate role (formal or informal) exists for major decisions.
- **Fail:** Conclusions are accepted without challenge because of hierarchy, groupthink, or time pressure.

---

## Cross-References

- [Learning Loop Integrity](learning-loop-integrity.md) -- rigorous thinking prevents false learnings
- [Growth Strategy Clarity](growth-strategy-clarity.md) -- strategy choices need causal backing
- [Constraint-Led Prioritization](constraint-led-prioritization.md) -- constraint identification requires rigorous analysis
- [Messaging to Metric Alignment](messaging-to-metric-alignment.md) -- claims in messaging need rigorous validation
