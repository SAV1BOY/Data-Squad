# Gold Standard and State of the Art (SOTA)

## Purpose

This document defines what "Gold Standard" and "State of the Art" mean for the Data Squad. These terms are used to evaluate deliverables, set expectations, and drive continuous improvement. A Gold Standard deliverable is what we always aim for. SOTA is what we aspire to when pushing boundaries.

## Gold Standard Definition

A Gold Standard deliverable is one that meets all of the following criteria simultaneously. It is not exceptional work; it is the expected baseline for everything the Data Squad produces.

### Criteria

**1. Accurate**
Every number is correct. The deliverable has passed all 5 RalphLoop quality gates. Key figures have been independently reproduced by a second analyst. Data sources are documented, and lineage is traceable. There are no known unresolved accuracy issues.

**2. Actionable**
The deliverable answers a specific question and recommends a specific action. The audience knows what to do after consuming it. "Here is what happened" without "here is what to do" does not meet Gold Standard.

**3. Clear**
A non-analyst stakeholder can understand the key findings without additional explanation. Visualizations are correctly labeled. The executive summary captures the entire message in 3 sentences. Technical methodology is available but does not obstruct the main narrative.

**4. Documented**
The methodology, assumptions, limitations, and data sources are explicitly stated. Another analyst could reproduce the work from the documentation alone. The deliverable is registered in the appropriate registry.

**5. Timely**
The deliverable was completed within the agreed timeline. It arrived when the decision needed to be made, not after. If the timeline slipped, the stakeholder was notified proactively with a revised date.

**6. Maintained**
If the deliverable is ongoing (dashboard, recurring report, automated alert), it has a named owner, a review schedule, and a freshness SLA. Abandoned deliverables do not meet Gold Standard.

### Evaluation Rubric

| Criterion | Meets Standard | Below Standard |
|-----------|---------------|----------------|
| Accurate | All numbers verified, quality gates passed | Numbers not independently validated |
| Actionable | Clear recommendation with expected outcome | Findings without recommendation |
| Clear | Non-analyst can understand unaided | Requires analyst to explain |
| Documented | Reproducible from documentation | Missing methodology or assumptions |
| Timely | Delivered on or before agreed date | Late without proactive communication |
| Maintained | Owner assigned, review scheduled | No owner or stale content |

A deliverable meets Gold Standard when all 6 criteria are at "Meets Standard." A single "Below Standard" means the deliverable needs improvement before it can be considered Gold Standard.

## State of the Art (SOTA) Definition

SOTA goes beyond Gold Standard. It represents the best known approach for a given type of work, incorporating the latest techniques, tools, and methodologies. SOTA is aspirational and evolves over time.

### What Makes Something SOTA

**Methodological advancement:** Uses a technique that is demonstrably better than the previous approach. For example, switching from simple retention rate to a probabilistic churn model that accounts for censored data.

**Efficiency improvement:** Achieves the same quality in significantly less time or with fewer resources. Automation of previously manual processes. Self-service tools that eliminate recurring requests.

**Impact amplification:** The deliverable not only answers the question but changes how the organization thinks about the problem. Creates new frameworks, establishes new metrics, or shifts decision-making patterns.

**Cross-domain integration:** Combines data from multiple domains (product + marketing + support) to produce insights that no single domain could generate alone.

### SOTA Examples by Deliverable Type

| Deliverable Type | Gold Standard | SOTA |
|-----------------|--------------|------|
| Retention analysis | Cohort curves with segment breakdown and action recommendations | Predictive churn model with automated intervention triggers and measured save rates |
| Dashboard | Decision-focused dashboard with action layer and interpretation guide | Self-updating dashboard with anomaly detection, automated root cause suggestions, and integrated experiment recommendations |
| Experiment | Pre-registered test with proper power analysis and documented decision | Adaptive experiment with sequential testing, automated SRM detection, and real-time guardrail monitoring |
| Metric definition | Complete definition with formula, sources, and reference query | Metric with automated data quality monitoring, anomaly alerting, and causal relationship mapping to business outcomes |
| Data storytelling | Narrative with clear insight, visualization, and recommendation | Interactive narrative with scenario modeling that lets stakeholders explore trade-offs in real time |

### How to Pursue SOTA

1. **Start with Gold Standard.** Never attempt SOTA without first achieving Gold Standard. Advanced techniques on inaccurate data are worse than simple analysis on correct data.

2. **Learn from the field.** Monitor industry publications, analytics community forums, and conference talks for new approaches. Bring promising ideas to the monthly experiment review for discussion.

3. **Experiment with method.** When trying a new technique, run it alongside the current approach. Compare outputs. If the new approach is better, document why and propose it as the new standard.

4. **Share learnings.** When you achieve SOTA on a deliverable, present the approach to the squad. Document it in the knowledge base so others can adopt it.

5. **Update this document.** When a SOTA approach becomes the new Gold Standard (because everyone has adopted it), update this document to reflect the new baseline and define the new SOTA frontier.

## Continuous Improvement Cycle

Gold Standard and SOTA are not static. They evolve as the squad matures.

- **Quarterly:** Review the Gold Standard criteria. Are they still the right bar? Should any be raised based on squad capability?
- **Semi-annually:** Review the SOTA examples. Have any SOTA approaches become standard practice? If so, update the examples.
- **Annually:** Conduct a comprehensive review of both standards with input from stakeholders. Are our standards producing the outcomes the business needs?
