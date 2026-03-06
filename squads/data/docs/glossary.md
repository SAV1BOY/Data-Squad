# Glossary

## Purpose

This is the official vocabulary of the Data Squad. When we use these terms, we mean exactly what is defined here. If a term is used differently in conversation, this document is the authority. When communicating with other squads, link to this glossary to prevent misunderstandings.

## Metrics and Measurement

**North Star Metric:** The single metric that best captures the value the company delivers to customers. Defined through the north-star-definition-workflow. There is exactly one North Star at any time.

**Input Metric:** A metric that directly contributes to the North Star. Improving an input metric should improve the North Star. Input metrics form the metric tree beneath the North Star.

**Guardrail Metric:** A metric that must not degrade when optimizing for another metric. Used in experiments to catch negative side effects.

**Vanity Metric:** A metric that looks good but does not inform any decision or action. The Data Squad does not track or report vanity metrics.

**Leading Indicator:** A metric that changes before the outcome it predicts. Used for early warning and proactive action.

**Lagging Indicator:** A metric that reflects outcomes that have already occurred. Revenue and churn rate are lagging indicators.

## Users and Lifecycle

**Activation:** The moment a new user completes the action most predictive of long-term retention (the "aha moment"). Defined through the activation-optimization-workflow.

**Aha Moment:** The specific user action (and threshold) that defines activation. Identified through correlation analysis between early actions and long-term retention.

**Retention:** The percentage of users who return after a defined period. Always specify the period: D1 (day 1), D7 (day 7), D30 (day 30), etc.

**Churn:** A user or account that stops using the product or cancels their subscription. The exact definition (inactivity period or cancellation event) is specified in the metric registry.

**Cohort:** A group of users who share a common characteristic, typically the time period in which they started (signup cohort). Used to compare behavior across groups while controlling for time effects.

**CLV (Customer Lifetime Value):** The predicted total revenue a customer will generate over their entire relationship with the company. Computed through the clv-to-strategy-workflow.

**DAU/MAU Ratio:** Daily Active Users divided by Monthly Active Users. A measure of engagement stickiness. Higher ratio means users return more frequently.

## Experimentation

**A/B Test:** An experiment comparing two variants (control and treatment) with random assignment. The gold standard for causal inference in product development.

**Control Group:** The group that receives the current experience (no change). The baseline against which the treatment is compared.

**Treatment Group:** The group that receives the change being tested.

**SRM (Sample Ratio Mismatch):** When the observed split between control and treatment does not match the expected allocation ratio. SRM invalidates experiment results.

**MDE (Minimum Detectable Effect):** The smallest effect size an experiment is designed to detect with the specified power and significance level.

**Statistical Significance:** The probability that the observed difference is not due to chance. The Data Squad uses a 0.05 significance level by default.

**Practical Significance:** Whether the observed effect is large enough to matter for business decisions. A statistically significant 0.01% improvement may not be practically significant.

**Pre-Registration:** Documenting the experiment design, hypothesis, and analysis plan before launching the experiment. Prevents post-hoc rationalization.

## Data Quality

**Completeness:** The degree to which all expected data is present. Measured as the percentage of non-NULL values in required fields.

**Accuracy:** The degree to which data values correctly represent the real-world events they describe. Validated through reconciliation with source systems.

**Freshness:** The time between when an event occurs and when the data is available for analysis. Measured against SLA targets.

**Schema Drift:** When the structure of incoming data changes (columns added, removed, or changed type) without corresponding documentation updates.

**Data Lineage:** The documented path data takes from its source through transformations to its final form in dashboards and reports.

## Squad Operations

**RalphLoop:** The Data Squad's quality assurance process consisting of 5 mandatory gates that every deliverable must pass before reaching stakeholders.

**Registry:** A structured record of official definitions, configurations, and decisions. The squad maintains registries for metrics, dashboards, experiments, and data quality.

**Intake Form:** The standardized form other squads use to submit data requests. Ensures requests include enough context for proper scoping and prioritization.

**ICE Score:** Impact, Confidence, Ease. A scoring method for prioritizing experiments and initiatives. Each dimension is scored 1-10, and the average determines priority.

**Workflow:** A documented, repeatable process with defined triggers, steps, quality gates, and registry updates. The unit of work execution in the Data Squad.

**Quality Gate:** A mandatory checkpoint in a workflow where specific criteria must be met before proceeding. Gates are owned by specific agent roles.

**Agent:** A specialized role within the Data Squad with defined responsibilities, decision authority, and escalation paths. See agent-roles-guide.md for the full list.
