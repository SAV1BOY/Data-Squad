# Analysis Layer Framework

## Overview

The Analysis Layer is where data becomes insight. It encompasses the analytical techniques, frameworks, and practices that transform collected data into understanding: cohort analysis, funnel analysis, segmentation, causal inference, and statistical reasoning. The analysis layer sits between the collection infrastructure (which delivers data) and the visualization and decision layers (which communicate and act on findings).

For data squads, the analysis layer is the core value proposition. Infrastructure and dashboards are necessary but not sufficient. The analysis layer is where the team demonstrates the ability to extract insights that stakeholders could not find on their own, identify patterns that change decisions, and challenge assumptions with evidence.

## Origin

Analytical methods in the data squad context draw from multiple disciplines: statistics (hypothesis testing, regression), computer science (machine learning, pattern recognition), economics (causal inference, econometrics), and social science (survey methodology, behavioral analysis). The modern data analytics practice synthesizes these traditions into a pragmatic toolkit focused on business impact.

The evolution from business intelligence (backward-looking reports) to analytics (forward-looking insights) to data science (predictive and prescriptive models) reflects the maturation of the analysis layer over the past two decades.

## Key Concepts

### Cohort Analysis

Cohort analysis groups users by a shared characteristic (typically signup date) and tracks their behavior over time. It is the most important analytical technique for understanding product health because it controls for temporal effects and reveals genuine trends.

Key cohort analyses:
- **Retention cohorts** -- What percentage of each signup cohort is still active after 7, 30, 90 days?
- **Revenue cohorts** -- How does spending evolve over time for each cohort?
- **Feature adoption cohorts** -- Do newer cohorts adopt key features faster than older ones?

Cohort analysis transforms aggregate vanity metrics into actionable trend insights.

### Funnel Analysis

Funnel analysis measures the conversion rate between sequential steps in a user journey. Common funnels:
- Signup funnel: landing page -> registration form -> email verification -> first login
- Purchase funnel: product view -> add to cart -> checkout -> payment -> confirmation
- Feature adoption funnel: feature discovery -> first use -> repeated use -> habitual use

Effective funnel analysis identifies the step with the largest drop-off (the biggest opportunity for improvement) and segments by user characteristics to understand who drops off and why.

### Segmentation

Segmentation divides the user base into meaningful groups based on behavior, demographics, or attributes. Good segments are:
- **Distinct** -- Segments behave differently from each other
- **Actionable** -- You can tailor strategy for each segment
- **Measurable** -- Segment membership can be determined from available data
- **Substantial** -- Segments are large enough to matter

Common segmentation approaches:
- **Behavioral** -- Based on actions (power users vs. casual vs. dormant)
- **Demographic** -- Based on attributes (geography, company size, industry)
- **Value-based** -- Based on revenue contribution (high-value vs. low-value)
- **Needs-based** -- Based on use cases or jobs-to-be-done

### Causal Analysis

Understanding why something happened, not just that it happened. The hierarchy of causal evidence:

1. **Randomized controlled experiments (A/B tests)** -- Gold standard for causation
2. **Quasi-experimental methods** -- Difference-in-differences, regression discontinuity, instrumental variables. Used when experiments are not feasible.
3. **Observational analysis with controls** -- Regression with confounders controlled. Weaker than experiments but practical for many questions.
4. **Correlation analysis** -- Identifies relationships but cannot establish causation. Useful for hypothesis generation.

The data squad must always be clear about which level of causal evidence an analysis provides and resist the temptation to imply causation from correlation.

### Statistical Significance and Practical Significance

Statistical significance indicates that an observed effect is unlikely due to chance. Practical significance indicates that the effect is large enough to matter for the business. Both are necessary:

- A 0.01% increase in conversion rate may be statistically significant with a large enough sample but practically irrelevant.
- A 5% increase in conversion rate may be practically significant but statistically uncertain with a small sample.

Always report both statistical confidence and business impact. Neither alone tells the full story.

### Exploratory vs. Confirmatory Analysis

**Exploratory analysis** looks for patterns, anomalies, and hypotheses in data without a pre-specified question. It is valuable for discovery but prone to false patterns (humans find patterns in noise). Findings from exploratory analysis should be treated as hypotheses, not conclusions.

**Confirmatory analysis** tests a pre-specified hypothesis with appropriate statistical methods. It provides reliable evidence for decisions. The transition from exploration to confirmation (often via experimentation) is the key discipline.

### Root Cause Analysis

When a metric moves unexpectedly, root cause analysis systematically identifies the cause:

1. **Decompose** -- Break the metric into its components. Revenue = users x conversion rate x average order value. Which component moved?
2. **Segment** -- Check if the change is concentrated in a specific segment (geography, platform, acquisition channel, user type).
3. **Timeline** -- Map the change against known events (product releases, marketing campaigns, external events, incidents).
4. **Eliminate** -- Systematically rule out hypotheses until the root cause is identified or the remaining candidates can be investigated further.

## Application to Data Squad

### Analysis Playbooks

Build playbooks for common analytical patterns:
- "Metric dropped" playbook: decomposition -> segmentation -> timeline mapping -> root cause identification
- "Feature impact" playbook: pre/post comparison -> cohort analysis -> confounding variable check
- "User behavior" playbook: funnel analysis -> segmentation -> journey mapping

Playbooks ensure consistent quality and reduce the time from question to insight.

### Analytical Review Standards

Establish peer review standards for analyses that inform significant decisions:
- Is the methodology appropriate for the question?
- Are confounders identified and addressed?
- Is the causal claim justified by the evidence level?
- Are results robust to reasonable alternative assumptions?
- Is uncertainty communicated clearly?

### Self-Service Analytics vs. Deep Analysis

Distinguish between self-service analytics (stakeholders answer their own questions using dashboards and tools) and deep analysis (data squad conducts rigorous investigation). Self-service handles the high-volume, lower-complexity questions. Deep analysis handles the high-stakes, high-ambiguity questions. Design for both.

### Insight Documentation

Document analytical insights in a searchable repository. Insights lose value if they exist only in Slack threads or presentation decks. A well-maintained insight repository prevents re-analysis of answered questions and builds institutional knowledge.

### Tool Stack for Analysis

Equip the team with appropriate tools:
- SQL for data extraction and basic analysis
- Python/R for statistical analysis and modeling
- BI tools for interactive exploration
- Notebook environments for documented, reproducible analysis
- Statistical packages for rigorous hypothesis testing

### Analysis Request Intake

Establish a structured intake process for analysis requests:
- What is the business question?
- What decision will the analysis inform?
- What is the expected timeline?
- What data is needed?
- What is the desired output (dashboard, report, presentation, model)?

This prevents scope creep and ensures alignment between effort and value.

## Pitfalls

### Analysis Without Action

The most common failure mode: a thorough analysis is completed, presented, acknowledged, and then ignored. Every analysis should have a clear decision owner and a follow-up mechanism. If no one will act on the findings, the analysis should not be done.

### Confusing Correlation with Causation

Repeatedly stating this is necessary because the mistake is so common and so costly. "Users who use Feature X retain better" does not mean Feature X causes retention. Feature X users may be a self-selected group with higher inherent engagement.

### Over-Segmentation

Segmenting data too finely creates small groups where random variation overwhelms signal. If a segment has fewer than 30 observations, treat any pattern as a hypothesis, not a finding.

### Ignoring Base Rates

Interpreting rates without considering the underlying volume. A segment with 100% conversion rate and 2 users is not a strategic insight.

### Cherry-Picking Time Ranges

Selecting a time range that supports a desired conclusion is a subtle form of analytical dishonesty. Establish standard time ranges and require explicit justification when deviating.

## Cross-References

- **collection-layer.md** -- Well-collected data is a prerequisite for meaningful analysis
- **experimentation-layer.md** -- Experiments are the most rigorous form of causal analysis
- **visualization-layer.md** -- Analysis results must be communicated effectively through visualization
- **decision-layer.md** -- Analysis exists to inform decisions; the decision layer closes the loop
- **simpson-paradox-awareness.md** -- A critical analytical trap when working with segmented and aggregated data
- **provost-data-science-for-business.md** -- Analytical thinking frameworks that guide technique selection
- **kohavi-online-experiments.md** -- Rigorous methods for the confirmatory analysis that follows exploration
