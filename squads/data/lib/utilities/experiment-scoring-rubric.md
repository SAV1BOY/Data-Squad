# Experiment Scoring Rubric

A rubric for evaluating experiment quality across three phases: design, execution, and analysis. Use this to review experiments before launch, assess rigor during execution, and evaluate the quality of conclusions.

---

## Phase 1: Design Quality

### 1.1 Hypothesis Quality

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | No hypothesis stated, or hypothesis is not falsifiable.                 |
| 2     | Hypothesis exists but is vague ("we think this will help").             |
| 3     | Hypothesis follows if/then format with a directional prediction.        |
| 4     | Hypothesis follows if/then/because format with reasoning grounded in data or research. |
| 5     | Hypothesis is specific, falsifiable, grounded in prior evidence, and clearly states the expected magnitude of effect. |

### 1.2 Metric Selection

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | No primary metric defined, or metric is not relevant to the hypothesis. |
| 2     | Primary metric is defined but MDE is not calculated.                    |
| 3     | Primary metric with MDE. No secondary metrics or guardrails.            |
| 4     | Primary metric with MDE, 2+ secondary metrics, and at least 1 guardrail.|
| 5     | Well-chosen primary metric with MDE, secondary metrics that test the mechanism, guardrails with auto-pause triggers, and multiple comparison correction specified. |

### 1.3 Sample Design

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | No sample size calculation. Audience is not defined.                    |
| 2     | Audience is defined but sample size is arbitrary or not calculated.      |
| 3     | Sample size is calculated with stated power and significance level.      |
| 4     | Sample size is calculated, randomization unit is appropriate, exclusions are documented, and experiment interaction is checked. |
| 5     | All of the above, plus duration accounts for weekly cycles and seasonality, and a pre-experiment A/A test or SRM check is planned. |

### 1.4 Success Criteria

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | No success criteria defined. Decision will be made "by feel."           |
| 2     | Success criteria exist but are ambiguous ("if it looks good, we ship"). |
| 3     | Ship/no-ship criteria are defined based on statistical significance.     |
| 4     | Ship/iterate/kill criteria are defined with specific thresholds for each decision. |
| 5     | All of the above, plus criteria address edge cases (e.g., significant but very small effect, significant secondary harm, borderline results). |

---

## Phase 2: Execution Quality

### 2.1 Instrumentation Verification

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | No verification that tracking is working before launch.                 |
| 2     | Tracking is assumed to work based on prior experiments.                  |
| 3     | Tracking is verified in staging/QA before launch.                       |
| 4     | Tracking is verified in staging and in production during the first hour via a live data check. |
| 5     | Automated pre-launch checks verify event firing, variant assignment, and metric calculation correctness. SRM is monitored continuously. |

### 2.2 Runtime Monitoring

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | Experiment is launched and forgotten until the planned end date.         |
| 2     | Owner checks results once during the experiment.                        |
| 3     | Owner monitors guardrails weekly during the experiment.                  |
| 4     | Guardrails are monitored daily with alerts for breaches. SRM is checked weekly. |
| 5     | Automated monitoring of guardrails, SRM, and metric trends with alerts. Owner reviews at least twice per week. Early stopping rules are defined and followed. |

### 2.3 Contamination Control

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | No awareness of potential contamination sources.                        |
| 2     | Known contamination risks are identified but not mitigated.              |
| 3     | Users in conflicting experiments are excluded. No other contamination controls. |
| 4     | Experiment interaction is controlled, and major confounding events during runtime are documented. |
| 5     | Full contamination control: experiment isolation, confound documentation, spillover analysis planned, and holdout group maintained. |

---

## Phase 3: Analysis Quality

### 3.1 Statistical Rigor

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | Results are reported as "up" or "down" with no statistical testing.     |
| 2     | p-value is calculated but no confidence interval or effect size.         |
| 3     | p-value, confidence interval, and effect size are reported.              |
| 4     | All of the above, plus multiple comparison correction, SRM check, and segment-level analysis. |
| 5     | Comprehensive analysis: point estimate, CI, effect size, power achieved, SRM check, segment analysis, time-trend analysis (novelty effect check), and sensitivity analysis. |

### 3.2 Interpretation Quality

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | Results are stated without interpretation or business context.           |
| 2     | Basic interpretation: "the treatment improved conversion by X%."        |
| 3     | Interpretation includes business impact (e.g., projected revenue change).|
| 4     | Interpretation includes business impact, mechanism analysis (why it worked), and limitations. |
| 5     | All of the above, plus comparison to prior experiments, discussion of generalizability, and clear recommendation with trade-offs articulated. |

### 3.3 Documentation and Sharing

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | Results are communicated verbally with no written record.               |
| 2     | Results are shared in a Slack message or brief email.                    |
| 3     | A results document exists with methodology, results, and decision.       |
| 4     | Results document is thorough and added to the experiment archive. Stakeholders are notified. |
| 5     | All of the above, plus learnings are extracted and added to a knowledge base, shared in a team review, and influence future experiment design. |

---

## Scoring Summary

| Dimension                  | Score (1-5) |
|----------------------------|-------------|
| **Design**                 |             |
| 1.1 Hypothesis Quality     |             |
| 1.2 Metric Selection       |             |
| 1.3 Sample Design          |             |
| 1.4 Success Criteria       |             |
| **Execution**              |             |
| 2.1 Instrumentation        |             |
| 2.2 Runtime Monitoring      |             |
| 2.3 Contamination Control   |             |
| **Analysis**               |             |
| 3.1 Statistical Rigor       |             |
| 3.2 Interpretation          |             |
| 3.3 Documentation           |             |
| **Overall Average**        | **/5.00**   |

### Minimum Standards

- Experiments must score at least 3 on all Design dimensions before launch approval.
- Experiments scoring below 3 on any Analysis dimension should not be used for ship decisions without peer review.
- Track overall scores over time to measure team experimentation maturity.
