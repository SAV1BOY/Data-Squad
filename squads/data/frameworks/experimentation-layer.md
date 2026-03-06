# Experimentation Layer Framework

## Overview

The Experimentation Layer governs how the organization designs, executes, analyzes, and learns from controlled experiments. Experiments -- primarily A/B tests and their variants -- are the gold standard for establishing causal relationships between changes and outcomes. This layer transforms experimentation from an ad hoc practice into a systematic organizational capability.

For data squads, the experimentation layer is where the team provides its most defensible value. While dashboards and reports inform, experiments prove. An organization with a mature experimentation practice makes fewer bad decisions, learns faster, and builds compound knowledge about what works and why.

## Origin

Online experimentation at scale was pioneered by companies like Amazon, Google, Microsoft, and Netflix in the 2000s, where every product change could be tested against a control group with millions of users. The academic foundations draw from clinical trial methodology (randomization, control groups, blinding) and industrial quality control (Deming, Shewhart).

The modern experimentation layer synthesizes these traditions with the practical realities of software products: rapid iteration, multiple simultaneous experiments, network effects, and the need for automated statistical analysis at scale.

## Key Concepts

### Experiment Lifecycle

1. **Hypothesis formation** -- Every experiment starts with a clear hypothesis: "If we change X, metric Y will improve by at least Z because [reasoning]." The hypothesis must be falsifiable and specific.

2. **Design** -- Determine the OEC (Overall Evaluation Criterion), guardrail metrics, sample size, duration, randomization unit, and decision criteria before the experiment starts.

3. **Implementation** -- Build the treatment variant and the randomization mechanism. Verify that assignment is random (check for Sample Ratio Mismatch).

4. **Execution** -- Run the experiment for the planned duration. Resist the temptation to stop early based on preliminary results unless using sequential testing methods.

5. **Analysis** -- Analyze results using pre-specified methods. Check guardrails. Check for heterogeneous treatment effects across segments.

6. **Decision** -- Ship, iterate, or kill based on pre-defined criteria. Document the decision and its rationale.

7. **Learning** -- Record the hypothesis, result, and learnings in the experiment registry. Share findings broadly.

### Randomization and Assignment

Proper randomization is the foundation of valid experiments. Key considerations:

- **Randomization unit** -- Usually user_id. Sometimes session, device, or account. The unit determines what is compared: treatment users vs. control users.
- **Stratification** -- Ensure balanced assignment across important dimensions (platform, geography, user tenure) to reduce variance.
- **Exclusion criteria** -- Define who is eligible for the experiment. Employees, bot accounts, and users in other conflicting experiments may need exclusion.
- **Persistence** -- A user assigned to treatment must stay in treatment for the experiment's duration. Reassignment corrupts the experiment.

### Statistical Methods

**Frequentist approach** -- The default for most organizations. Tests whether the observed difference is statistically significant at a pre-defined threshold (usually p < 0.05). Uses t-tests, z-tests, or chi-squared tests depending on the metric type.

**Bayesian approach** -- Computes the probability that the treatment is better than control. More intuitive for stakeholders ("there is an 87% chance the treatment is better") but requires specifying priors.

**Sequential testing** -- Allows valid early stopping by adjusting significance thresholds over time. Useful for organizations that need faster decisions without inflating false positive rates.

**CUPED (Controlled-experiment Using Pre-Experiment Data)** -- Reduces variance by using pre-experiment data as a covariate, increasing statistical power without increasing sample size. Widely used at Microsoft, Netflix, and other platforms.

### Experiment Types

**A/B test** -- Compare one treatment against one control. The simplest and most common design.

**A/B/n test** -- Compare multiple treatments against one control. Useful when testing several variants but requires larger sample sizes and careful multiple comparison correction.

**Multi-armed bandit** -- Dynamically allocate traffic to better-performing variants during the experiment. Optimizes for the best outcome but provides weaker causal evidence than fixed-allocation experiments.

**Switchback experiments** -- Alternate between treatment and control over time periods. Used when user-level randomization is not feasible (e.g., marketplace experiments affecting supply and demand).

**Holdout experiments** -- A long-running experiment where a small percentage of users do not receive any new changes, providing a cumulative impact measure over time.

### Guardrails and Governance

Every experiment must monitor guardrail metrics that should not degrade:
- Performance metrics (page load time, error rate)
- Business metrics (revenue, conversion rate) when not the OEC
- User experience metrics (satisfaction proxies, complaint rate)
- Safety metrics (crash rate, data loss incidents)

An experiment that improves the OEC but degrades a guardrail should not be shipped without careful review.

### Interaction Effects

When multiple experiments run simultaneously on the same users, they can interact in unpredictable ways. Managing interactions requires:
- Experiment isolation layers (each experiment operates in an independent randomization layer)
- Interaction detection (monitoring for unexpected combined effects)
- Exclusion rules (preventing conflicting experiments from running on the same users)

### Minimum Detectable Effect (MDE) and Power

Before running an experiment, determine the MDE -- the smallest effect worth detecting. Then calculate the required sample size and duration to achieve adequate statistical power (typically 80%). Underpowered experiments waste resources by being unable to detect real effects. Overpowered experiments waste time by running longer than necessary.

## Application to Data Squad

### Experiment Platform Requirements

The experimentation platform should provide:
- Random assignment with persistent bucketing
- SRM detection (automated Sample Ratio Mismatch checks)
- Automated statistical analysis with guardrails
- Experiment registry with hypothesis, design, and results
- Self-service experiment creation for product teams
- Monitoring dashboards for active experiments

### Design Review Board

Establish a lightweight design review for experiments that affect significant user populations or critical metrics. Review the hypothesis, OEC selection, power analysis, and decision criteria before launch.

### Results Interpretation Guidelines

Publish guidelines for interpreting experiment results:
- Always check for SRM before interpreting results
- Report confidence intervals, not just p-values
- Distinguish statistical significance from practical significance
- Check heterogeneous effects across key segments
- Apply Twyman's Law: verify surprising results before celebrating

### Negative Result Culture

Build a culture that values negative results (the treatment did not work) as much as positive results. Negative results are genuine learning. An organization that only celebrates winners creates incentive to run weak experiments that are likely to "succeed."

### Experimentation Velocity Tracking

Track the number of experiments completed per quarter, the percentage that reached a clear decision, and the percentage of product changes that were validated by experiments. These meta-metrics indicate the maturity and health of the experimentation program.

### Common Experiment Patterns Library

Maintain a library of proven experiment patterns for common scenarios:
- Feature flag rollout experiments
- Pricing experiments
- Onboarding flow experiments
- Notification and messaging experiments
- Search and recommendation experiments

Each pattern should include standard OECs, typical guardrails, and sample size guidance.

## Pitfalls

### Peeking

Checking results repeatedly before the planned end date inflates false positive rates. Use sequential testing if early looks are operationally necessary, and educate stakeholders about why peeking is harmful.

### The Winner's Curse

When an experiment shows a significant positive result, the true effect size is likely smaller than the observed effect. This is because experiments that happen to overestimate the effect are more likely to reach significance. Discount observed effect sizes slightly when forecasting long-term impact.

### Novelty Effects

Users may react to the novelty of a change rather than its inherent value. Run experiments long enough for novelty to wear off (typically at least two weeks). Compare early and late results to detect novelty effects.

### Survivorship Bias in Experiment Analysis

If the treatment causes some users to leave, the remaining treatment users may appear healthier than control, masking the harm. Monitor user counts alongside behavioral metrics.

### Infrastructure Experiments Untested

Organizations often A/B test UI changes but ship backend changes, pricing changes, and policy changes without experiments. Extend the experimentation culture to all types of changes, not just front-end modifications.

## Cross-References

- **kohavi-online-experiments.md** -- The comprehensive theoretical foundation for this operational layer
- **analysis-layer.md** -- Experiment analysis uses the statistical methods defined in the analysis layer
- **decision-layer.md** -- Experiment results feed into the decision registry
- **ries-lean-startup-metrics.md** -- Innovation accounting depends on disciplined experimentation
- **cagan-inspired-metrics.md** -- Product discovery experiments need this layer's rigor
- **goodhart-law-framework.md** -- Poorly chosen OECs are vulnerable to Goodhart dynamics
- **simpson-paradox-awareness.md** -- Heterogeneous treatment effects can create Simpson's Paradox in experiments
