# Framework Selection Guide

## Purpose

The Data Squad uses multiple analytical frameworks depending on the question being asked. This guide helps analysts choose the right framework for a task, avoiding the trap of using a favorite tool for every problem.

## Decision Tree

Start here. Answer these questions in order to identify the right framework.

**Question 1: What type of answer do you need?**
- "What happened?" -> Descriptive Analysis
- "Why did it happen?" -> Diagnostic Analysis
- "What will happen?" -> Predictive Analysis
- "What should we do?" -> Prescriptive Analysis

**Question 2: Do you need to prove causation?**
- Yes -> Experiment (A/B test, quasi-experiment)
- No, correlation is sufficient -> Observational Analysis

**Question 3: How complex is the question?**
- Single metric movement -> Metric Deep-Dive
- Multi-factor investigation -> Structured Framework (see below)

## Frameworks

### 1. Cohort Analysis
**Use when:** You need to understand how groups of users behave over time, especially for retention, activation, or lifecycle questions.

**How it works:** Group users by a shared characteristic (signup date, acquisition channel, plan type) and track a metric over time for each group.

**Strengths:** Reveals trends hidden in aggregate data, controls for time effects, shows whether improvements are real or compositional.

**Limitations:** Requires sufficient sample size per cohort, can be confounded by other changes happening simultaneously.

**Example:** "Is retention improving for recent cohorts?" Group users by signup month, plot D30 retention for each cohort.

### 2. Funnel Analysis
**Use when:** You need to understand conversion through a sequential process (signup, onboarding, activation, purchase).

**How it works:** Define the ordered steps, count users at each step, compute conversion rates between steps, identify the biggest drop-offs.

**Strengths:** Pinpoints where users are lost, easy to communicate, directly actionable.

**Limitations:** Assumes a linear path (users may skip steps or go backward), does not explain why users drop off.

**Example:** "Where do users drop off during onboarding?" Define steps, measure conversion, focus optimization on the largest drop.

### 3. Segmentation Analysis
**Use when:** You suspect that an aggregate metric hides meaningful differences between groups.

**How it works:** Split the population by relevant dimensions (demographics, behavior, plan type) and compare the metric across segments.

**Strengths:** Reveals Simpson's Paradox, identifies high-value segments, enables targeted actions.

**Limitations:** Requires choosing dimensions thoughtfully (too many dimensions = noise), multiple comparisons increase false positive risk.

**Example:** "Does our NPS vary by customer size?" Segment by company size, compare NPS scores, and investigate the driver for low-NPS segments.

### 4. Root Cause Analysis (5 Whys)
**Use when:** A metric moved unexpectedly and you need to find the underlying cause.

**How it works:** Start with the observation, ask "why" iteratively, and drill down until you reach a cause that is actionable and specific.

**Strengths:** Simple, structured, prevents superficial explanations.

**Limitations:** Can be subjective, may miss systemic issues, depends on asking the right "why" at each level.

**Example:** "Why did activation drop this week?" -> "Because fewer users completed onboarding" -> "Because the third step had a bug" -> root cause identified.

### 5. Impact Sizing
**Use when:** You need to estimate the potential value of an initiative to prioritize work.

**How it works:** Estimate the addressable population, the expected effect size (from benchmarks, similar experiments, or educated assumptions), and the metric impact.

**Strengths:** Enables rational prioritization, forces explicit assumptions, makes trade-offs visible.

**Limitations:** Estimates are uncertain by definition, garbage assumptions in = garbage estimates out.

**Example:** "How much retention improvement could we expect from fixing the onboarding bug?" Estimate affected users, expected conversion lift, and downstream retention impact.

### 6. Survival Analysis
**Use when:** You need to understand time-to-event data, especially churn, activation timing, or feature adoption timing.

**How it works:** Model the probability of an event occurring over time, accounting for censored data (users who have not yet experienced the event).

**Strengths:** Handles censored data correctly, provides time-based insights, enables comparison between groups.

**Limitations:** Assumes certain statistical properties (proportional hazards), requires larger sample sizes.

**Example:** "How long does it take users to activate, and does it differ by acquisition channel?" Use Kaplan-Meier curves to compare time-to-activation across channels.

## Choosing Between Frameworks

| Situation | Recommended Framework |
|-----------|----------------------|
| Retention trend question | Cohort Analysis |
| Conversion optimization | Funnel Analysis |
| Metric moved unexpectedly | Root Cause Analysis (5 Whys) |
| Prioritizing initiatives | Impact Sizing |
| Understanding customer differences | Segmentation Analysis |
| Time-to-event question | Survival Analysis |
| Proving a change works | Experiment (see experimentation-handbook) |

## Common Mistakes

- Using funnel analysis for non-sequential processes.
- Using segmentation without correcting for multiple comparisons.
- Using impact sizing with assumptions that have never been validated.
- Skipping cohort analysis and drawing conclusions from aggregate trends.
- Using survival analysis when simple retention curves would suffice.

When in doubt, start with the simplest framework that can answer the question. Add complexity only if the simple approach fails to provide a clear answer.
