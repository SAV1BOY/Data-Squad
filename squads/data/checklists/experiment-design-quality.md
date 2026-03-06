# Experiment Design Quality Checklist

## Purpose

This checklist ensures that experiments (A/B tests, multivariate tests,
holdout tests) are designed to produce trustworthy, actionable results. A
poorly designed experiment is worse than no experiment — it gives false
confidence to decisions that may actively harm the business. Use this before
launching any experiment and again when interpreting results.

## When to Use

- Before launching any A/B or multivariate test
- When reviewing an experiment proposal from another team
- Before making a ship/no-ship decision based on experiment results
- During experiment retrospectives

---

## Checklist Items

### 1. Hypothesis Is Stated Before the Experiment Begins
- **Pass:** A clear, falsifiable hypothesis is written down before any data is collected (e.g., "Reducing signup form fields from 6 to 3 will increase completion rate by at least 10%").
- **Fail:** The experiment is launched to "see what happens" with no pre-stated hypothesis, enabling post-hoc narrative fitting.

### 2. A Single Primary Variable Is Being Tested
- **Pass:** One variable is changed between control and treatment. If multiple changes are necessary, they are bundled as a single coherent treatment with clear rationale.
- **Fail:** Multiple unrelated changes are made simultaneously, making it impossible to attribute results to any specific change.

### 3. Sample Size Is Calculated Before Launch
- **Pass:** A power analysis determines the required sample size based on baseline rate, minimum detectable effect (MDE), significance level (alpha), and power (1-beta). The MDE is justified by business impact.
- **Fail:** The experiment runs until results "look significant," or an arbitrary duration is chosen without power analysis.

### 4. Duration Accounts for Full Business Cycles
- **Pass:** The experiment runs for at least one full business cycle (typically 1-2 weeks minimum) to capture weekday/weekend effects, payroll cycles, etc.
- **Fail:** The experiment is stopped after 3 days because results look promising, without accounting for day-of-week effects.

### 5. Randomization Is Verified
- **Pass:** The randomization unit (user, session, device) is appropriate, and a pre-experiment check confirms that control and treatment groups are balanced on key covariates.
- **Fail:** Randomization is assumed to work without verification, or the randomization unit creates contamination (e.g., session-level randomization for a feature that persists across sessions).

### 6. Decision Criteria Are Pre-Committed
- **Pass:** Before launch, the team documents: what metric improvement constitutes a "win," what constitutes "no meaningful difference," and what will be done in each scenario.
- **Fail:** Decision criteria are determined after seeing results, allowing motivated reasoning to declare any outcome a success.

### 7. Guardrail Metrics Are Defined
- **Pass:** Secondary metrics that must not degrade are identified (e.g., "conversion may improve, but support ticket rate must not increase by more than 5%").
- **Fail:** Only the primary metric is monitored, and the experiment is shipped despite degradation in important secondary metrics.

### 8. Multiple Comparison Correction Is Applied When Needed
- **Pass:** When multiple variants or metrics are tested, appropriate correction (Bonferroni, Benjamini-Hochberg, or sequential testing) is applied to control false discovery rate.
- **Fail:** Five variants are tested, and the one that shows p < 0.05 is declared the winner without correction for multiple comparisons.

### 9. Novelty and Primacy Effects Are Considered
- **Pass:** For UI changes, the analysis accounts for potential novelty effects (short-term curiosity) by examining results stability over time or running the test longer.
- **Fail:** A UI change shows a lift in week 1, is shipped immediately, and the team is surprised when the lift disappears.

### 10. Results Include Practical Significance, Not Just Statistical
- **Pass:** Beyond p-values, the report includes effect size, confidence intervals, and a clear statement of whether the effect is large enough to matter for the business.
- **Fail:** A statistically significant but trivially small effect (e.g., 0.02% conversion lift) is celebrated as a "win."

### 11. The Experiment Can Actually Be Killed
- **Pass:** There is a clear, pre-agreed process and authority to kill the experiment early if guardrail metrics are violated or harm is detected.
- **Fail:** No one has authority to stop the experiment, or stopping is seen as "failure."

---

## Cross-References

- **Experiment Kill Report Template** (`templates/operational/experiment-kill-report.md`) — Use when an experiment is stopped early.
- **Attribution Quality Checklist** (`attribution-quality.md`) — Incrementality tests are experiments; apply this checklist.
- **Sunk Cost in Experiments** (`reference/psychology/sunk-cost-in-experiments.md`) — Bias against killing experiments.
- **Base Rate Neglect** (`reference/psychology/base-rate-neglect.md`) — Ignoring base rates when interpreting experiment results.
- **Narrative Fallacy in Data** (`reference/psychology/narrative-fallacy-in-data.md`) — Post-hoc storytelling around experiment outcomes.

---

*Version: 1.0 | Last updated: 2026-03-06*
