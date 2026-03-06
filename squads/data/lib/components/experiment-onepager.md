# Experiment One-Pager Component

A single-page template that captures everything needed to review, approve, and run an experiment.

---

## Template

### Overview

| Field              | Value                                     |
|--------------------|-------------------------------------------|
| **Experiment Name** | _Short, descriptive name_                |
| **Owner**          | _Person responsible for execution_        |
| **Status**         | Draft / Approved / Running / Concluded    |
| **Created**        | _Date_                                    |
| **Target Launch**  | _Date_                                    |

### Hypothesis

State the hypothesis in the format:

> **If** we [change/intervention], **then** [expected outcome] **because** [reasoning based on data or insight].

**Supporting evidence:** Reference prior data, user research, or analogous experiments that support this hypothesis. Include links to dashboards or analysis documents.

### Primary Metric

| Field                 | Value                                   |
|-----------------------|-----------------------------------------|
| **Metric Name**       | _e.g., Checkout Conversion Rate_        |
| **Current Baseline**  | _e.g., 12.4%_                           |
| **Minimum Detectable Effect (MDE)** | _e.g., +1.5pp (relative +12%)_ |
| **Direction**         | Higher is better / Lower is better      |

### Secondary Metrics

| Metric                  | Baseline | Expected Direction | Purpose           |
|-------------------------|----------|--------------------|-------------------|
| Revenue per Session     | $3.20    | Increase           | Validate revenue impact |
| Cart Abandonment Rate   | 68%      | Decrease           | Mechanism check   |
| Page Load Time          | 2.1s     | No change          | Guardrail         |

### Audience

| Field                   | Value                                  |
|-------------------------|----------------------------------------|
| **Eligible Population** | _e.g., All logged-in users on web_     |
| **Exclusions**          | _e.g., Internal users, users in other active experiments on checkout_ |
| **Sample Size per Arm** | _e.g., 25,000_                         |
| **Allocation**          | _e.g., 50/50 control/treatment_        |
| **Randomization Unit**  | _e.g., User ID_                        |

### Duration and Power

| Field                        | Value            |
|------------------------------|-----------------|
| **Estimated Duration**       | _e.g., 14 days_ |
| **Statistical Power**        | _e.g., 80%_     |
| **Significance Level**       | _e.g., 0.05_    |
| **Multiple Comparison Correction** | _e.g., Bonferroni for 3 secondary metrics_ |

**Duration rationale:** Include at least one full business cycle. If weekly patterns exist, run for full weeks. Account for holidays or promotional periods.

### Success Criteria

Define upfront what "ship," "iterate," or "kill" means:

| Decision      | Criteria                                                    |
|---------------|-------------------------------------------------------------|
| **Ship**      | Primary metric is statistically significant and positive. No guardrail violations. |
| **Iterate**   | Primary metric is directionally positive but not significant. No guardrails violated. Increase sample or refine treatment. |
| **Kill**      | Primary metric is negative or flat. Or any guardrail is violated. |

### Guardrails

Guardrails are metrics that must NOT degrade beyond a threshold. If any guardrail is breached, the experiment must be paused and reviewed.

| Guardrail Metric     | Threshold          | Action if Breached           |
|----------------------|--------------------|------------------------------|
| Error Rate           | Must stay < 1%     | Auto-pause experiment        |
| P95 Latency          | Must stay < 3s     | Notify on-call + review      |
| Revenue per User     | Must not drop > 2% | Escalate to product lead     |

### Risks and Mitigations

| Risk                            | Likelihood | Mitigation                          |
|---------------------------------|-----------|--------------------------------------|
| Novelty effect inflates results | Medium    | Run for 3+ weeks; check time trends |
| Interaction with pricing test   | Low       | Exclude users in pricing experiment  |
| Seasonal confound               | Medium    | Compare weekday vs weekend separately|

---

## Approval Checklist

- [ ] Hypothesis is falsifiable and specific.
- [ ] Sample size calculation is documented.
- [ ] Guardrails are defined with automatic pause triggers.
- [ ] No overlap with conflicting experiments.
- [ ] Tracking instrumentation is verified in staging.
- [ ] Rollback plan is documented.
- [ ] Stakeholders are notified of experiment scope and timeline.
