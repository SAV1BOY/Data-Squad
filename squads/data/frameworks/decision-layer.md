# Decision Layer Framework

## Overview

The Decision Layer is where data transforms into action. It governs the process by which insights from analysis, experimentation, and visualization are translated into organizational decisions, tracked for outcomes, and accumulated into institutional knowledge. Without a decision layer, the data stack produces reports that are read, dashboards that are viewed, and analyses that are presented -- but nothing changes.

For data squads, the decision layer is the ultimate measure of value. The team's contribution is not the number of dashboards built or analyses completed; it is the number of better decisions enabled. A data team with excellent infrastructure but no decision layer is a cost center. A data team with a functioning decision layer is a strategic asset.

## Origin

Decision science as a field draws from operations research (World War II-era optimization), behavioral economics (Kahneman and Tversky), management science (Herbert Simon's bounded rationality), and more recently, the product management discipline's emphasis on data-informed decisions. The formalization of a "decision layer" as a component of the data stack is a newer concept, emerging from organizations that discovered that investing in data infrastructure without investing in decision processes produced disappointing returns.

## Key Concepts

### The Insight-to-Action Gap

The most common failure in data-driven organizations is the gap between insight and action. Data reveals a problem; nothing happens. An experiment proves an approach works; it is not shipped. A cohort analysis shows declining retention; the insight slides into the archive. The insight-to-action gap has multiple causes:

- No clear decision owner for the insight's domain
- No established process for translating insights into initiatives
- Analysis arrives after the decision window has closed
- The insight conflicts with existing plans and is ignored
- No mechanism to track whether insights were acted upon

### Decision Registry

A decision registry is a structured log of significant decisions made with data input:

- **Decision** -- What was decided?
- **Date** -- When was the decision made?
- **Decision maker** -- Who made the decision?
- **Data inputs** -- What analyses, experiments, or metrics informed the decision?
- **Alternatives considered** -- What other options were evaluated?
- **Expected outcome** -- What result was expected, and by when?
- **Actual outcome** -- What actually happened? (Filled in during review)
- **Learnings** -- What was learned from the outcome?

The decision registry serves three purposes: accountability (decisions are recorded and attributable), learning (outcomes are tracked and compared to expectations), and pattern recognition (over time, the registry reveals systematic decision-making strengths and weaknesses).

### Decision Frameworks

Structure how decisions are made based on their characteristics:

**Reversible vs. irreversible** -- Reversible decisions (feature flags, pricing tests) should be made quickly with moderate data. Irreversible decisions (market entry, major architecture changes) warrant extensive analysis and experimentation.

**High-frequency vs. low-frequency** -- High-frequency decisions (ad bidding, content recommendations) should be automated with algorithmic guardrails. Low-frequency decisions (annual strategy, org structure) should involve deep human analysis.

**Consensus vs. authority** -- Some decisions benefit from broad input and consensus. Others need a single decision maker to act quickly. The data team should provide the evidence; the decision structure determines the process.

### Data-Informed, Not Data-Driven

"Data-driven" implies that data makes the decision. "Data-informed" recognizes that data is one input alongside judgment, experience, context, customer intuition, and strategic vision. The distinction matters because:

- Some decisions involve factors that data cannot capture (competitive dynamics, regulatory trends, team morale)
- Insisting on data for every decision creates paralysis
- Overriding data with judgment is sometimes correct and should not be stigmatized -- it should be documented and the outcome tracked

### Decision Quality vs. Decision Outcome

A good decision can have a bad outcome (if the underlying probabilities were unfavorable). A bad decision can have a good outcome (due to luck). The decision layer should evaluate decision quality (was the available evidence used well?) separately from decision outcomes (what happened?). Over time, good decision quality produces better outcomes, but individual results are noisy.

### Closing the Loop

Every analysis and experiment should have a defined endpoint:

1. **Insight generated** -- The analysis produces a finding
2. **Recommendation made** -- The data team proposes an action
3. **Decision taken** -- A decision maker acts (or consciously decides not to act)
4. **Outcome measured** -- The result of the decision is tracked
5. **Learning captured** -- What was learned is documented

If any step is skipped, the loop is broken. The data squad should monitor loop completion as a health metric for the decision layer.

### Automated Decisions

Some decisions can and should be automated: personalized recommendations, dynamic pricing, fraud scoring, alerting thresholds. Automated decisions require:

- Clear rules or models with documented logic
- Guardrails that prevent extreme actions
- Monitoring for drift and degradation
- Human override mechanisms
- Regular review and recalibration

### Decision Rights (RACI for Data Decisions)

Clarify who is:
- **Responsible** -- Does the analytical work
- **Accountable** -- Makes the final decision
- **Consulted** -- Provides input and expertise
- **Informed** -- Needs to know the outcome

Ambiguous decision rights cause insights to languish. If nobody is accountable for acting on an insight, nobody will.

## Application to Data Squad

### Decision Registry Implementation

Build and maintain a decision registry. Start with major product and strategy decisions. Make it easy to log decisions (a simple form, not a complex process). Review the registry quarterly to assess decision quality and track outcomes.

### Analysis-to-Decision Mapping

For every analysis the data team begins, document the intended decision it will inform before starting the work. If no decision is identified, question whether the analysis is necessary. This discipline prevents "analysis for analysis' sake."

### Decision Review Cadence

Establish a regular cadence (monthly or quarterly) for reviewing past decisions against their expected outcomes. This is not about assigning blame; it is about calibrating the organization's decision-making and learning from systematic patterns.

### Insight Expiration

Insights have a shelf life. An analysis completed six months ago may no longer reflect current reality. Mark insights with expiration dates and prompt reviews when insights age beyond their useful life.

### Decision Templates

Provide structured templates for common decision types:
- Feature launch decision (experiment results, guardrail checks, rollout plan)
- Investment decision (ROI analysis, risk assessment, alternative options)
- Strategy decision (market analysis, competitive dynamics, scenario modeling)

Templates ensure that decisions consistently consider the right factors.

### Stakeholder Readiness Assessment

Before presenting an analysis, assess whether the decision maker is ready to act:
- Is the decision window open? (Are they actively considering this question?)
- Do they have the authority and resources to act?
- Are there organizational constraints that prevent action regardless of what the data shows?

Timing and context matter as much as analytical rigor.

## Pitfalls

### Analysis Paralysis

Demanding more data before every decision. The marginal value of additional analysis decreases while the cost of delay increases. Help organizations recognize when they have "enough" data to decide.

### The Data Veto

Using "we need more data" as a veto to avoid uncomfortable decisions. If the data will not change the decision regardless of outcome, the decision should be made now.

### Orphaned Insights

Insights with no decision owner. The data team produces brilliant analysis, but no one in the organization has been designated to act on it. Assign decision owners before starting analysis.

### Outcome Bias

Judging decisions solely by their outcomes rather than their quality at the time they were made. A well-reasoned decision to launch a product that fails due to unforeseeable market changes was still a good decision. The decision registry should capture the reasoning, not just the result.

### Automation Without Oversight

Fully automated decisions that run without human review eventually drift, break, or produce harmful outcomes. Every automated decision system needs monitoring, alerting, and periodic human review.

## Cross-References

- **analysis-layer.md** -- Analysis produces the insights that the decision layer acts upon
- **experimentation-layer.md** -- Experiments produce the strongest evidence for decisions
- **visualization-layer.md** -- Visualizations communicate insights to decision makers
- **governance-layer.md** -- Decision governance, including rights and review processes
- **cagan-inspired-metrics.md** -- Cagan's empowered teams need clear decision processes to convert data into product improvements
- **kahneman-noise-framework.md** -- Decision hygiene practices reduce noise in the decision process
- **hubbard-how-to-measure-anything.md** -- Expected value of information helps decide when more analysis is warranted
