# Goodhart's Law Framework

## Overview

"When a measure becomes a target, it ceases to be a good measure." This formulation, attributed to economist Charles Goodhart and popularized by anthropologist Marilyn Strathern, captures one of the most pervasive and damaging dynamics in organizational measurement. For data squads, Goodhart's Law is not an abstract principle -- it is a daily operational hazard. Every metric the team creates, every KPI dashboard it builds, every target it helps set is vulnerable to the distortions Goodhart described.

Understanding Goodhart's Law transforms the data squad from a naive metric factory into a sophisticated measurement architect that designs metrics for durability, pairs quantitative targets with qualitative checks, and builds early warning systems for metric gaming.

## Origin

Charles Goodhart articulated his observation in a 1975 paper on monetary policy in the United Kingdom. His original formulation was narrower: "Any observed statistical regularity will tend to collapse once pressure is placed upon it for control purposes." He was describing how the Bank of England's attempts to control money supply through targeting specific monetary aggregates caused those aggregates to lose their predictive relationship with the economy.

Marilyn Strathern later generalized the principle in her 1997 paper: "When a measure becomes a target, it ceases to be a good measure." This broader formulation applies to any domain where measurement is used for control -- education, healthcare, policing, and, critically, product and business analytics.

The phenomenon is related to but distinct from Campbell's Law, the Lucas Critique in economics, and the observer effect in physics. All describe how the act of measurement or targeting changes the system being measured.

## Key Concepts

### The Mechanism of Corruption

Goodhart's Law operates through a predictable sequence:

1. **Observation** -- A metric is identified as a useful indicator of an outcome you care about. Website visits correlate with revenue. Employee satisfaction correlates with retention.

2. **Targeting** -- The metric is promoted to a target. "Increase website visits by 30%." "Raise satisfaction scores to 4.5/5."

3. **Optimization** -- People optimize for the target, including through behaviors that improve the metric without improving the underlying outcome. Buying low-quality traffic. Pressuring employees to give high survey scores.

4. **Decoupling** -- The metric and the outcome it was supposed to represent diverge. Website visits are up 30% but revenue is flat. Satisfaction scores are 4.5 but turnover is increasing.

5. **Blindness** -- Because the metric is now the primary signal, the organization cannot see the degradation of the actual outcome. The dashboard says everything is fine.

### Four Types of Goodhart Effects

Researchers have identified four distinct mechanisms through which Goodhart's Law operates:

**Regressional Goodhart** -- The metric was never a perfect proxy for the outcome; it was correlated with some noise. Targeting the metric amplifies the noise component.

**Extremal Goodhart** -- The metric-outcome relationship that holds in normal ranges breaks down when the metric is pushed to extreme values. Moderate increases in ad spend improve revenue; massive increases hit diminishing returns and cannibalization.

**Causal Goodhart** -- The metric was correlated with the outcome because both were caused by a third factor. Targeting the metric does not move the third factor, so the outcome does not improve.

**Adversarial Goodhart** -- Agents actively manipulate the metric because they are incentivized to do so. This is the most visible and damaging form -- outright gaming.

### Real-World Examples

**Lines of code** -- When developer productivity is measured by lines of code, developers write verbose code, copy-paste, and avoid refactoring.

**Call resolution time** -- When support agents are targeted on average resolution time, they hang up on complex calls or transfer difficult cases to reset their timer.

**NPS scores** -- When managers are bonused on Net Promoter Score, they coach customers to give high scores or selectively survey satisfied customers.

**Test scores in education** -- Teaching to the test improves scores but may reduce actual learning, critical thinking, and curiosity.

**Click-through rate** -- Optimizing for clicks produces clickbait headlines that get clicks but not engagement, trust, or conversion.

**Monthly active users** -- When MAU is the target, product teams add notifications and dark patterns that drive logins without genuine engagement.

### Mitigation Strategies

**Use metric bundles, not single metrics.** Pair every target metric with a counter-metric that detects gaming. Target conversion rate, but monitor quality of conversions. Target support resolution time, but monitor customer satisfaction.

**Rotate metrics.** Periodically change which metrics are targeted, preventing long-term gaming strategies from taking root.

**Maintain separation between measurement and incentives.** The metric used for understanding should not always be the metric used for compensation. Once money is attached, gaming pressure intensifies.

**Use input metrics and output metrics together.** Output metrics (revenue, retention) are harder to game directly. Input metrics (activities, process adherence) are more actionable but more gameable. Use both.

**Qualitative audits.** Regularly audit the behavior behind the metric. Are support agents actually solving problems, or just closing tickets? Are users genuinely engaged, or are push notifications driving hollow logins?

**Metric health checks.** Monitor the correlation between the metric and the outcome it is supposed to represent. If the correlation weakens over time, Goodhart's Law may be at work.

## Application to Data Squad

### Metric Design Principles

When designing any new metric, explicitly document:
- What outcome is this metric intended to represent?
- How could someone improve this metric without improving the outcome?
- What counter-metric would detect gaming?
- Under what conditions should this metric be retired or revised?

### Counter-Metric Dashboard

For every primary KPI, display at least one counter-metric that would reveal gaming. If conversion rate is the primary metric, display return rate or support contact rate alongside it. If DAU is primary, display session quality or feature engagement depth.

### Target-Setting Advisory

When leadership sets metric targets, the data squad should advise on:
- The historical relationship between the metric and the desired outcome
- The range of the metric where the relationship is known to hold
- The gaming risks associated with targeting this metric
- Recommended counter-metrics and qualitative checks

### Metric Health Monitoring

Build automated monitoring for the correlation between targeted metrics and their intended outcomes. Alert when correlations weaken, which may indicate the early stages of Goodhart effects.

### Incentive Impact Assessment

When metrics are tied to compensation or performance reviews, flag the elevated gaming risk. Recommend broader measurement approaches and qualitative reviews to supplement quantitative targets.

## Pitfalls

### Paralysis

Goodhart's Law does not mean metrics are useless or that targets should be avoided. It means targets must be designed carefully, paired with counter-metrics, and monitored for gaming. The response to Goodhart's Law is better measurement design, not measurement avoidance.

### Blaming Individuals

Gaming is a systemic response to incentive design, not a character flaw. When gaming is detected, fix the metric and incentive structure rather than punishing the individuals who responded rationally to the system they were placed in.

### Over-Rotating to Qualitative

Qualitative checks are important but do not scale. The solution is not to replace quantitative metrics with qualitative judgment -- it is to design quantitative systems that are resistant to gaming while using qualitative checks as a verification layer.

### Metric Proliferation

Adding counter-metrics for every metric can lead to metric sprawl. Be selective. Focus counter-metrics on the metrics where gaming risk is highest (those tied to incentives, highly visible targets, or metrics that are easy to manipulate).

### Assuming Stability

A metric that resists gaming today may be vulnerable tomorrow as people discover new gaming strategies. Goodhart mitigation is an ongoing practice, not a one-time design exercise.

## Cross-References

- **campbell-law-framework.md** -- Campbell's Law is the closely related principle focusing on corruption of social indicators
- **ries-lean-startup-metrics.md** -- Ries's vanity metrics are often metrics that have been Goodharted
- **cagan-inspired-metrics.md** -- Cagan's output-vs-outcome distinction maps to the Goodhart proxy-vs-outcome dynamic
- **kahneman-noise-framework.md** -- Gaming introduces systematic bias on top of the noise Kahneman describes
- **governance-layer.md** -- Metric governance processes should include Goodhart risk assessment
- **definition-layer.md** -- Counter-metrics should be defined alongside primary metrics in the metric taxonomy
- **taleb-antifragile-metrics.md** -- Metric fragility under pressure is a specific case of Taleb's fragility concept
