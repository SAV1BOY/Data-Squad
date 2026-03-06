# Learning Loop Integrity

## Purpose

Audit the integrity of the learning loop: Hypothesis -> Test -> Evidence -> Decision -> Registry. Kao emphasizes that growth teams must learn systematically. Every cycle should produce durable knowledge, not just a test result. This checklist ensures the loop is complete, honest, and cumulative.

---

## Checklist Items

### 1. Every Test Starts with a Written Hypothesis
- **Pass:** Before any test launches, a hypothesis is documented: "We believe [change] will cause [effect] on [metric] because [reasoning]." The hypothesis is specific and falsifiable.
- **Fail:** Tests launch without a hypothesis, making it impossible to determine what was learned regardless of the outcome.

### 2. The Hypothesis Includes Causal Reasoning
- **Pass:** The "because" clause in the hypothesis cites a specific mechanism (user behavior model, friction point, psychological principle) rather than a vague hope.
- **Fail:** The reasoning is "because we think it will work" or "because a competitor does it."

### 3. The Test Design Can Actually Prove or Disprove the Hypothesis
- **Pass:** The test measures the metric specified in the hypothesis, runs long enough to reach significance, and controls for confounds.
- **Fail:** The test measures a different metric, runs for an arbitrary period, or has no control, making the hypothesis untestable.

### 4. Evidence Is Evaluated Honestly
- **Pass:** Results are accepted as-is, including null results and results that contradict the hypothesis. The team does not cherry-pick metrics or time windows to find a win.
- **Fail:** Inconvenient results are rationalized away, p-values are hacked, or the team declares victory based on a non-primary metric.

### 5. Decisions Follow Evidence, Not Politics
- **Pass:** Ship/no-ship decisions are made based on the pre-defined success criteria. If the test did not meet the bar, the change is not shipped regardless of who proposed it.
- **Fail:** HiPPO overrides test results. Losing experiments are shipped because "we already built it" or "the VP wants it."

### 6. Learnings Are Extracted from Every Test
- **Pass:** Win, lose, or inconclusive, the team documents what was learned. A "null result" that eliminates a hypothesis is valued as learning.
- **Fail:** Only wins are celebrated and documented. Losses produce no written learning.

### 7. A Learning Registry Exists and Is Maintained
- **Pass:** All learnings are stored in a searchable, persistent registry (not Slack). The registry includes hypothesis, result, learning, and implications for future tests.
- **Fail:** Learnings are scattered across meeting notes, Slack threads, and individual memories. No institutional knowledge accumulates.

### 8. The Registry Is Consulted Before New Hypotheses
- **Pass:** Before forming a new hypothesis, the team checks the registry to avoid re-testing things already learned and to build on prior findings.
- **Fail:** The team re-runs variations of tests that have already been conclusively answered, wasting cycles.

### 9. Learning Velocity Is Measured
- **Pass:** The team tracks a "learnings per sprint" or "learnings per week" metric as a first-class indicator of team health. The number is trended.
- **Fail:** The team tracks only experiment count or win rate, not the learning output.

### 10. Meta-Learning Is Practiced
- **Pass:** Periodically (quarterly), the team reviews its learning registry for patterns: "What have we learned about our users, our product, and our growth model?" These meta-learnings inform strategy.
- **Fail:** Individual learnings are logged but never synthesized into higher-order understanding.

---

## Cross-References

- [Growth Strategy Clarity](growth-strategy-clarity.md) -- learnings should reshape strategy
- [Kao Rigorous Thinking Audit](kao-rigorous-thinking-audit.md) -- rigor prevents false learnings
- [Onboarding Activation QA](onboarding-activation-qa.md) -- onboarding changes are prime learning loop candidates
- [Constraint-Led Prioritization](constraint-led-prioritization.md) -- learnings reveal or eliminate constraints
