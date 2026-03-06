# Campbell's Law Framework

## Overview

"The more any quantitative social indicator is used for social decision-making, the more subject it will be to corruption pressures and the more apt it will be to distort and corrupt the social processes it is intended to monitor." Donald T. Campbell's 1979 formulation is more specific and more alarming than Goodhart's Law. While Goodhart describes metrics losing their informational value, Campbell warns that targeted metrics actively corrupt the systems they measure.

For data squads, Campbell's Law is a warning about second-order effects. It is not enough to ask "will people game this metric?" You must ask "will targeting this metric cause people to behave in ways that damage the organization, its customers, or its culture?"

## Origin

Donald T. Campbell was a social psychologist and methodologist who studied the use of quantitative indicators in public policy. His 1979 paper "Assessing the Impact of Planned Social Change" articulated the law in the context of education reform, crime statistics, and government program evaluation.

Campbell's insight came from observing how well-intentioned accountability programs in government consistently produced perverse outcomes. Schools that were evaluated on test scores narrowed their curriculum. Police departments that were evaluated on crime rates reclassified crimes or discouraged reporting. Hospitals that reported mortality rates began refusing high-risk patients.

The pattern was consistent: whenever a metric was used to evaluate and control human behavior, the humans adapted in ways that improved the metric while degrading the underlying reality.

## Key Concepts

### Corruption, Not Just Gaming

Campbell's contribution beyond Goodhart is the emphasis on corruption. Gaming implies clever exploitation of measurement loopholes. Corruption implies damage to the system being measured. When teachers teach to the test, students may actually learn less, not just test differently. When sales teams are evaluated on close rate, they may actually damage customer relationships, not just cherry-pick easy deals.

The data squad must evaluate metric targets not just for gaming potential but for corruption potential -- the risk that targeting the metric will actively harm the outcomes the organization cares about.

### The Accountability Paradox

Organizations adopt metrics for accountability. But the very act of using metrics for accountability triggers Campbell's Law, making those metrics less trustworthy. This creates a paradox: the more important a metric is for accountability, the less reliable it becomes.

The resolution is not to abandon accountability but to design accountability systems that are aware of this dynamic. Multi-dimensional evaluation, qualitative review, and rotating metrics all help.

### Indicator vs. Target Distinction

Campbell's Law applies when an indicator is used as a target. The same metric can be informative when used for understanding and destructive when used for evaluation. A metric used to diagnose problems (where is retention weakest?) behaves differently than the same metric used to judge performance (your team's retention is below target).

Data squads should clearly label whether a metric is an indicator (for understanding) or a target (for evaluation) and apply different governance to each.

### Displacement of Goals

When a metric becomes a target, the organization's actual goal (customer satisfaction, learning, public safety) is displaced by the metric goal (score, number, rate). People begin to genuinely believe that improving the metric is the goal, losing sight of why the metric was chosen in the first place. This displacement happens gradually and is difficult to detect from inside the system.

### Multi-Metric Accountability

Campbell suggested that using multiple imperfect indicators is better than using one metric as a target. When people must optimize across several metrics simultaneously, gaming any single metric becomes less effective. This is the quantitative equivalent of triangulation -- approaching the truth from multiple angles.

### The Role of Trust

Campbell's Law is most severe in low-trust environments where people feel the metric will be used against them. In high-trust cultures where metrics are used for learning and improvement, corruption pressure is lower. The data squad's role in fostering a learning-oriented metric culture directly mitigates Campbell's Law.

## Application to Data Squad

### Corruption Risk Assessment

For every metric that will be used for evaluation or accountability, conduct a corruption risk assessment:

1. Who is evaluated by this metric? (Individuals, teams, departments)
2. What actions could improve the metric without improving the underlying outcome?
3. Which of those actions would actively damage the underlying outcome?
4. How detectable is each form of corruption?
5. What is the severity of damage from each corruption pathway?

Document the assessment and use it to inform target-setting and monitoring design.

### Indicator vs. Target Labeling

In the metric taxonomy, explicitly label each metric as one of:
- **Diagnostic indicator** -- Used for understanding and exploration. Not tied to evaluation.
- **Performance target** -- Used for accountability and goal-setting. Subject to Campbell's Law dynamics.
- **Guardrail** -- Must stay within bounds but is not directly targeted for improvement.

Apply different governance standards to each category.

### Multi-Metric Scorecards

When designing evaluation frameworks, use balanced scorecards with 3-5 metrics rather than single KPIs. Ensure the metrics are partially independent (not all measuring the same underlying construct) so that gaming one metric does not automatically improve the others.

### Qualitative Overlay

Pair quantitative metric reviews with qualitative assessments. If the retention metric is hitting target, also ask: are customers genuinely satisfied? Is the team achieving retention through value delivery or through lock-in and switching costs? The qualitative layer detects corruption that the quantitative layer misses.

### Metric Rotation

For high-stakes evaluations, rotate which specific metrics are targeted each quarter or year. This prevents long-term gaming strategies and forces teams to maintain broad capability rather than optimizing a narrow target.

### Trust-Building Practices

Actively build trust in how metrics are used:
- Share metrics transparently, including with the people being measured
- Use metrics to start conversations, not to end them
- When metrics reveal problems, focus on solving problems rather than assigning blame
- Celebrate honest reporting of bad numbers as a cultural value

## Pitfalls

### Cynicism About Measurement

Campbell's Law can be used to argue against all measurement. This is a misreading. Campbell himself advocated for measurement -- his point was that measurement for accountability needs careful design, not that measurement should be abandoned.

### Assuming Good Actors

It is tempting to believe that "our people would not game metrics." Campbell's Law operates even among well-intentioned actors. The incentive structure shapes behavior regardless of individual character. Design for the system, not for the best-case individual.

### Over-Engineering Solutions

Building extremely complex metric systems to prevent gaming can create its own problems: confusion, inability to act on unclear signals, and analytical overhead that consumes the data team's capacity. Simple, transparent metrics with qualitative checks often outperform complex anti-gaming systems.

### Ignoring Power Dynamics

Campbell's Law is strongest when there is a power imbalance between the measurer and the measured. When executives set targets for teams that have no input into metric design, corruption pressure is highest. Involve the measured parties in metric design to reduce adversarial dynamics.

### Conflating Campbell's Law with Bad Metrics

Not all metric failures are Campbell's Law. Sometimes the metric was poorly defined, the data is wrong, or the target was unrealistic. Campbell's Law specifically describes the corruption that arises from targeting, not all possible metric failures.

## Cross-References

- **goodhart-law-framework.md** -- Goodhart's Law is the closely related principle focusing on the informational degradation of targeted metrics; Campbell adds the corruption dimension
- **kahneman-noise-framework.md** -- Campbell's Law introduces systematic bias (beyond noise) when metrics are used for control
- **governance-layer.md** -- Governance processes must account for Campbell's Law in metric lifecycle management
- **definition-layer.md** -- The indicator-vs-target distinction should be codified in metric definitions
- **cagan-inspired-metrics.md** -- Cagan's advocacy for outcome metrics is partly a defense against Campbell's Law applied to output metrics
- **data-literacy-program-framework.md** -- Organizational understanding of Campbell's Law is a data literacy objective
- **support-analytics-framework.md** -- Support metrics (CSAT, resolution time) are highly vulnerable to Campbell's Law dynamics
