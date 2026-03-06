# Experiment Lifecycle Framework

> Sources: Ronny Kohavi (Trustworthy Online Controlled Experiments), Sean Ellis

---

## Overview

The Experiment Lifecycle Framework defines the end-to-end process for running data-
informed experiments (A/B tests, multivariate tests, quasi-experiments). It covers six
phases: Hypothesis, Design, Run, Analyze, Decide, and Document. The framework ensures
that experiments are rigorous, decisions are evidence-based, and organizational learning
compounds over time.

---

## When to Use

- Whenever a team wants to make a product, marketing, or operational change and the
  outcome is uncertain.
- When there is disagreement about whether a proposed change will help or hurt.
- When past changes were shipped without measurement and leadership wants rigor.
- When building or maturing an experimentation program.

---

## Core Concept

### The Six Phases

```
Hypothesis -> Design -> Run -> Analyze -> Decide -> Document
     ^                                                  |
     +--------------------------------------------------+
                    (Learning feeds back)
```

Each phase has specific outputs that gate entry to the next phase.

---

## Steps / Process

### Phase 1: Hypothesis
- State the hypothesis in the format: "If we [change], then [metric] will [move by X]
  because [rationale]."
- Identify the primary metric (what you are trying to move).
- Identify guardrail metrics (what must not degrade).
- Estimate expected effect size based on prior data or analogous experiments.
- **Gate:** Hypothesis is reviewed and approved by the experiment owner and a peer.

### Phase 2: Design
- Choose experiment type: A/B, A/B/n, multivariate, quasi-experiment, switchback.
- Define the randomization unit (user, session, device, region).
- Calculate required sample size given: baseline rate, minimum detectable effect (MDE),
  significance level (alpha, typically 0.05), power (1-beta, typically 0.80).
- Define the experiment duration (account for weekly cycles; minimum 1-2 full cycles).
- Specify segments for heterogeneous treatment effect analysis.
- Document the analysis plan *before* the experiment starts (pre-registration).
- **Gate:** Design review with analytics/stats team.

### Phase 3: Run
- Implement the treatment and control variants.
- Validate instrumentation: run a pre-experiment A/A test or SRM check on day 1.
- Monitor for sample ratio mismatch (SRM) daily.
- Monitor guardrail metrics for severe regressions (set alerting thresholds).
- Do NOT peek at primary metric results during the run (unless using sequential
  testing methods).
- **Gate:** Experiment reaches required sample size and duration.

### Phase 4: Analyze
- Check for SRM -- if present, results are unreliable. Investigate root cause first.
- Compute point estimates and confidence intervals for primary and guardrail metrics.
- Check statistical significance and practical significance (effect size).
- Perform segmentation analysis to detect heterogeneous effects.
- Run sensitivity checks (e.g., excluding bots, winsorizing outliers).
- **Gate:** Analysis is peer-reviewed.

### Phase 5: Decide
- If primary metric improved with no guardrail degradation: **Ship.**
- If primary metric improved but a guardrail degraded: **Investigate trade-off.**
- If primary metric showed no significant effect: **Do not ship** (unless the change
  reduces complexity/cost with neutral user impact).
- If primary metric degraded: **Revert.**
- Document the decision rationale explicitly.

### Phase 6: Document
- Record: hypothesis, design, results, decision, and learnings in the experiment
  repository.
- Tag with relevant metadata (team, feature area, metric, effect size).
- Share key learnings in a team/company-wide format (experiment review, newsletter).
- Feed insights back into the hypothesis backlog for future experiments.
- **Gate:** Documentation is complete and accessible.

---

## Inputs / Outputs

### Inputs
| Input                          | Source                          |
|--------------------------------|---------------------------------|
| Experiment hypothesis          | Product / growth team           |
| Baseline metric data           | Data warehouse / analytics      |
| Sample size calculator inputs  | Statistician / analytics        |
| Feature implementation         | Engineering team                |
| Pre-registration document      | Experiment owner                |

### Outputs
| Output                         | Consumer                        |
|--------------------------------|---------------------------------|
| Experiment results report      | Product team, leadership        |
| Ship/no-ship decision          | Engineering, product            |
| Learning documentation         | Experiment repository, all teams|
| Updated hypothesis backlog     | Growth / product team           |
| Institutional knowledge base   | Future experiment designers     |

---

## Pitfalls

1. **Peeking at results.** Checking results before the planned end date inflates false
   positive rates. Use sequential testing if early stopping is needed.

2. **Ignoring SRM.** Sample Ratio Mismatch invalidates results. Always check.

3. **No pre-registration.** Without a pre-committed analysis plan, it is easy to
   cherry-pick metrics that happen to be significant.

4. **Underpowered experiments.** Running experiments without sufficient sample size
   leads to inconclusive results and wasted effort. Do the power calculation.

5. **HARKing (Hypothesizing After Results are Known).** Presenting post-hoc findings
   as if they were the original hypothesis. Document hypotheses *before* running.

6. **Ignoring practical significance.** A statistically significant 0.01% improvement
   may not be worth the engineering cost to maintain.

7. **No documentation.** Experiments without documentation are wasted learning. The
   Document phase is not optional.

8. **Novelty and primacy effects.** Short experiments may capture novelty (users trying
   something new) rather than steady-state behavior. Run for at least 2 full cycles.

---

## Cross-References

- [ICE/PIE/RICE Prioritization](ice-pie-rice-prioritization.md) -- Prioritizing the
  experiment backlog.
- [Bayesian vs Frequentist Testing](bayesian-vs-frequentist-testing.md) -- Choosing
  the statistical approach.
- [KPI Tree](kpi-tree.md) -- Identifying which input metrics to experiment on.
- [Kohavi Online Experiments](kohavi-online-experiments.md) -- Deep reference on
  controlled experiment methodology.
- [Data Quality Triad](data-quality-triad.md) -- Ensuring experiment data is reliable.
