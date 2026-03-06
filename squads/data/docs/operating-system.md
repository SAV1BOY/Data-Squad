# Data Squad Operating System

## Overview

The operating system defines the cadence of the Data Squad: which meetings happen, when decisions are made, and how work flows through the system. Consistency in cadence creates predictability for the squad and for stakeholders.

## Weekly Cadence

### Monday: Planning and Prioritization
- **Data Quality Check (async, 15 min):** Data Quality Sentinel reviews the weekend data quality scorecard and flags any issues in #data-squad Slack. If a critical issue exists, a sync is called within 2 hours.
- **Backlog Grooming (30 min, squad lead + relevant agents):** Review incoming requests, score by priority, assign to the current or future sprint. Reject requests that do not meet the intake criteria.

### Tuesday: Squad Sync
- **Weekly Sync (45 min, all agents):** The core meeting of the week.
  - Each agent gives a 3-minute update: what was completed, what is in progress, what is blocked.
  - Review active workflows and quality gate status.
  - Discuss one "learning of the week": something the squad learned from data, an experiment, or a process improvement.
  - Decide on any priority changes for the week.

### Wednesday-Thursday: Execution
- No recurring squad meetings. Protected time for deep work.
- Agents execute on assigned workflows, analyses, and experiments.
- Quality reviews happen asynchronously: submit work, receive feedback within 1 business day.

### Friday: Review and Communicate
- **Stakeholder Updates (async):** Insight Narrator publishes the weekly update to stakeholders: deliverables completed, insights shared, and next week's plan.
- **Experiment Check (15 min, Experiment Strategist + Analytics Architect):** Review running experiments for SRM, data quality, and progress toward sample size targets.
- **Personal Reflection (individual, 15 min):** Each agent reviews their own week: what went well, what could be improved, any blockers to raise Monday.

## Monthly Cadence

### First Week: Data Quality Review
- **Data Quality Monthly (60 min, Data Quality Sentinel + Analytics Architect):** Review the full data quality scorecard, SLA adherence, issues resolved, and persistent problems. Set quality priorities for the month.
- **Output:** Updated data quality targets and improvement backlog.

### Second Week: Experiment Portfolio Review
- **Experiment Review (60 min, Experiment Strategist + all agents):** Review completed experiments, extract learnings, assess win rate, and rebalance the experiment backlog. Follows the experiment-portfolio-review-workflow.
- **Output:** Updated experiment backlog with top 5 experiments for next cycle.

### Third Week: Stakeholder Feedback
- **Feedback Collection (async, Insight Narrator):** Send a brief survey to key stakeholders: Are you getting what you need? What is missing? What would you change?
- **Feedback Review (30 min, Retention Strategist + Insight Narrator):** Review feedback, identify themes, and decide on adjustments.
- **Output:** Action items for improving stakeholder satisfaction.

### Fourth Week: Metric Health Check
- **Metric Review (45 min, Analytics Architect + Retention Strategist):** Review the North Star and key input metrics. Are they trending as expected? Are definitions still accurate? Any metrics to deprecate?
- **Output:** Metric health report and any deprecation or redefinition actions.

## Quarterly Cadence

### Quarter Start (Week 1-2): Planning
- **Quarterly Data Review (half-day, all agents):** Follows the quarterly-data-review-workflow. Review last quarter's performance, extract insights, set priorities, and build the plan for the new quarter.
- **Output:** Quarterly plan with priorities, owners, milestones, and success criteria.

### Mid-Quarter (Week 6-7): Check-In
- **Mid-Quarter Review (60 min, all agents):** Are we on track? Do priorities need adjustment? Any emerging risks?
- **Output:** Priority adjustments and updated milestone timeline.

### Quarter End (Week 12-13): Retrospective
- **Squad Retrospective (90 min, all agents):** What worked this quarter? What did not? What should we change for next quarter? Distinct from the quarterly data review: this focuses on how the squad operates, not on business metrics.
- **Output:** Process improvement actions for next quarter.

## Decision-Making Framework

Decisions in the Data Squad follow a clear hierarchy:

1. **Individual decisions:** If a decision falls entirely within one agent's domain and does not affect others, the agent decides and documents.
2. **Collaborative decisions:** If a decision affects multiple agents or workflows, discuss in the weekly sync or a dedicated 30-minute session.
3. **Strategic decisions:** Priority changes, resource allocation, and scope changes are decided by the Retention Strategist with input from affected agents.
4. **Escalation decisions:** If the squad cannot resolve a dispute internally, escalate to the VP of Product or Data.

## Artifacts and Where They Live

| Artifact | Location | Owner | Update Frequency |
|----------|----------|-------|-----------------|
| Metric Registry | Squad repository | Analytics Architect | Continuous |
| Data Quality Scorecard | BI tool | Data Quality Sentinel | Weekly |
| Experiment Registry | Squad repository | Experiment Strategist | Continuous |
| Weekly Update | Slack + email | Insight Narrator | Weekly |
| Quarterly Plan | Squad repository | Retention Strategist | Quarterly |
| Change Log | Squad repository | All agents | Continuous |
