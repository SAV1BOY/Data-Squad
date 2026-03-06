# Simpson's Paradox Awareness Framework

## Overview

Simpson's Paradox occurs when a trend that appears in several groups of data reverses when the groups are combined. It is not a statistical error -- it is a real phenomenon that reveals how aggregation can fundamentally mislead. For data squads, Simpson's Paradox is one of the most dangerous analytical traps because it produces conclusions that are not just wrong but confidently wrong and directionally opposite to reality.

Every analyst who has ever said "the data clearly shows..." based on aggregated data without checking subgroups has been vulnerable to Simpson's Paradox. This framework ensures the data squad recognizes when aggregation is dangerous and applies appropriate subgroup analysis as standard practice.

## Origin

The paradox is named after Edward Simpson, who described it in a 1951 technical paper. However, the phenomenon was known earlier -- Karl Pearson, Udny Yule, and others had identified examples in the early 1900s. The most famous real-world example involves UC Berkeley's 1973 graduate admissions data, where aggregate data appeared to show discrimination against women, but department-level analysis showed the opposite.

The paradox has been studied extensively in statistics, epidemiology, economics, and social science. It is not a rare curiosity -- it arises naturally whenever a confounding variable affects both the composition of groups and the outcome being measured.

## Key Concepts

### How the Paradox Works

Consider a simplified example:

**Treatment A vs. Treatment B for recovery rates:**

| Group | Treatment A | Treatment B |
|-------|-----------|-----------|
| Mild cases | 80/100 (80%) | 160/200 (80%) |
| Severe cases | 30/100 (30%) | 15/50 (30%) |
| **Combined** | **110/200 (55%)** | **175/250 (70%)** |

Both treatments have identical recovery rates within each group (80% for mild, 30% for severe). But in aggregate, Treatment B appears superior (70% vs 55%) because it was disproportionately used on mild cases.

The aggregated comparison is misleading because the groups have different compositions. Treatment A was used more on severe cases, dragging its aggregate rate down.

### The Confounding Variable

Simpson's Paradox always involves a confounding variable -- a factor that influences both group membership and the outcome. In the example above, case severity is the confounder. It affects which treatment is administered (more severe cases get Treatment A) and the outcome (severe cases have lower recovery rates regardless of treatment).

Identifying the confounder is the key to resolving the paradox. Once you know it exists and adjust for it, the paradox disappears and the correct conclusion emerges.

### When to Trust the Aggregate vs. the Subgroups

This is the critical question, and the answer depends on the causal structure:

**Trust subgroups when** the confounding variable is a genuine cause of both group assignment and outcome. In medical studies, if disease severity determines both treatment choice and recovery, adjust for severity.

**Trust the aggregate when** the subgroup division introduces bias. This is rarer but possible. For example, if you segment by a post-treatment variable (something that happened after the intervention), the subgroup analysis can be more misleading than the aggregate.

**General guidance:** When in doubt, present both the aggregate and subgroup results and explicitly discuss the discrepancy. Let the business context determine which is the more relevant framing.

### Real-World Examples in Analytics

**Conversion rate by marketing channel:** Aggregate conversion rate increases, but conversion within every channel decreases. The cause: the mix shifted toward higher-converting channels while every channel individually degraded.

**Employee performance ratings:** Department A rates employees lower than Department B overall. But within every job level, Department A rates higher. The cause: Department A has more senior employees, and senior employees are rated more critically.

**Feature adoption and retention:** Users who adopt Feature X have worse retention overall. But within each user segment (power users, casual users), Feature X adopters retain better. The cause: Feature X is more popular among casual users, who have lower baseline retention.

**A/B test results:** Treatment wins in aggregate but loses in every user segment. The cause: the treatment was disproportionately shown to segments with naturally higher baseline metrics.

### Lord's Paradox

A related phenomenon where the same data can lead to opposite conclusions depending on whether you use a change score or an analysis of covariance. This frequently arises in before/after comparisons and is another case where aggregation decisions change the conclusion.

### The Ecological Fallacy

The broader category that Simpson's Paradox belongs to. The ecological fallacy is the error of inferring individual-level relationships from group-level data. "States with higher ice cream sales have higher crime rates" does not mean ice cream causes crime (temperature is the confounder). Simpson's Paradox is the most dramatic form of this fallacy.

## Application to Data Squad

### Subgroup Analysis as Default Practice

For any important aggregate metric, routinely check whether the trend holds across key subgroups. Build this into the analytical workflow:

- When reporting conversion rate, check by user segment, channel, geography, and cohort
- When reporting retention, check by acquisition source, user type, and product plan
- When reporting revenue trends, check by product line, customer segment, and region

If the subgroup trend contradicts the aggregate, investigate the confounding variable before presenting conclusions.

### Composition Monitoring

Build dashboards that track group composition over time alongside aggregate metrics. If the mix of users, channels, or products is changing, aggregate metrics become unreliable. A "mix shift" alert can warn analysts before they draw wrong conclusions.

### Experiment Subgroup Analysis

For A/B tests, always check results within pre-defined subgroups (user segments, platforms, geographies). If the treatment effect reverses in a subgroup, it may indicate that the treatment works differently for different users, which is actionable information.

### Weighted and Stratified Reporting

When comparing metrics across time periods or groups with different compositions, use standardized or stratified metrics. Instead of raw conversion rate, report conversion rate standardized to a fixed user mix. This removes the composition effect and reveals the genuine trend.

### Simpson's Paradox Checklist for Analysis

Before publishing any analysis based on aggregated data:
1. Have I identified the key subgroups?
2. Does the trend hold within each subgroup?
3. Has the composition of subgroups changed over the analysis period?
4. Is there a known confounding variable that affects both group membership and the outcome?
5. If the subgroup and aggregate trends conflict, which is the more appropriate basis for the decision at hand?

### Communication Protocol

When Simpson's Paradox is detected, communicate it explicitly to stakeholders. Use a simple visual: show the aggregate chart, then the subgroup charts, then explain why they differ. This builds analytical credibility and prevents bad decisions.

## Pitfalls

### Subgroup Fishing

Looking at too many subgroups guarantees finding one where the trend reverses, even by chance. Focus on pre-defined, substantively meaningful subgroups, not on data-dredging through every possible split.

### Over-Adjusting

Adjusting for every possible confounder can introduce bias if some of the "confounders" are actually mediators (variables on the causal pathway from the intervention to the outcome). Adjust for causes, not consequences.

### Paralysis

The existence of Simpson's Paradox does not mean all aggregate data is wrong. Most of the time, aggregate trends reflect reality. The paradox is the exception, not the rule. But for high-stakes decisions, checking subgroups is a low-cost insurance policy.

### Ignoring the Paradox Because It Is Inconvenient

Sometimes the subgroup analysis reveals an uncomfortable truth that contradicts the narrative leadership wants to tell. The data squad must present the full picture regardless of organizational preferences.

### Assuming Subgroups Are Always Right

In some causal structures, the subgroup analysis is the misleading one and the aggregate is correct. This happens when the subgrouping variable is itself affected by the treatment. Always think about the causal structure before deciding which level of analysis to trust.

## Cross-References

- **kohavi-online-experiments.md** -- Experiments can exhibit Simpson's Paradox when subgroups have different treatment effects; Kohavi discusses heterogeneous treatment effects
- **kahneman-noise-framework.md** -- Failure to check for Simpson's Paradox is a systematic source of error in data interpretation
- **analysis-layer.md** -- Subgroup analysis and stratification are core analytical practices defined there
- **provost-data-science-for-business.md** -- Data-analytic thinking requires understanding when aggregation deceives
- **tufte-data-visualization-principles.md** -- Honest visualization requires showing subgroup breakdowns when aggregation is misleading
- **governance-layer.md** -- The Simpson's Paradox checklist should be part of analysis review governance
