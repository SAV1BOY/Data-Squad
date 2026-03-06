# Getting Started with the Data Squad

## Your First 7 Days

This guide takes you from zero to productive in one week. Follow it sequentially; each day builds on the previous one.

## Day 1: Orientation and Access

Get your bearings and your tools working.

**Tools to set up:**
- Data warehouse access (BigQuery/Snowflake): request via IT ticket, approved by Analytics Architect. Test by running `SELECT 1` to confirm connectivity.
- BI tool (Looker/Metabase): self-service signup, then request workspace access from your buddy.
- Experimentation platform: read-only access granted automatically, write access after completing Day 3.
- Version control (GitHub): clone the Data Squad repository at `squads/data/`. This is your single source of truth.
- Communication: join the #data-squad Slack channel and the weekly sync calendar invite.

**Checkpoint:** You can connect to the warehouse, open the BI tool, and see the squad repository.

## Day 2: Understand the Squad

Read these documents in order. Spend roughly 30 minutes on each.

1. **squad-overview.md** - What the Data Squad does, its philosophy, and boundaries.
2. **agent-roles-guide.md** - The 7 agent roles and how they collaborate. Identify which role(s) you will play.
3. **operating-system.md** - The weekly, monthly, and quarterly cadence. Know when meetings happen and what each produces.
4. **naming-conventions.md** - How we name things. Non-negotiable; wrong names cause real confusion.

**Checkpoint:** You can explain the squad's mission, your role, and the weekly rhythm to a colleague.

## Day 3: Learn the Data

Get hands-on with the data models.

- Explore the core data models in the warehouse: users, events, transactions, and metrics tables.
- Run 5 exploratory queries to familiarize yourself with table structures, key fields, and common joins.
- Review the metric registry: find the North Star metric, understand its definition and how it is computed.
- Read the **definitions-guide.md** to understand how metrics are formally defined and maintained.

**Checkpoint:** You can write a query that computes the North Star metric from raw tables.

## Day 4: Understand Quality Standards

The squad ships accurate work. Learn how we ensure that.

- Read **data-quality-guide.md** and understand the 5 quality dimensions: completeness, accuracy, consistency, timeliness, uniqueness.
- Read the **ralphloop-quality-workflow.md** to understand the 5 gates every deliverable passes through.
- Review the data quality dashboard to see current scores and SLA status.
- Read **dashboard-philosophy.md** to understand how we think about visualization.

**Checkpoint:** You can describe each quality gate and explain why a number must be validated before it reaches a stakeholder.

## Day 5: Shadow a Workflow

Observe the squad in action.

- Your buddy will invite you to shadow an active workflow. Watch, take notes, ask questions afterward.
- Pay attention to: how agents hand off work, where quality gates happen, and how decisions are communicated.
- Review the workflow documentation for the workflow you shadowed to see how documentation maps to practice.

**Checkpoint:** You can follow a workflow from trigger to completion and identify each agent's contribution.

## Day 6: Your First Task

Time to contribute.

- Your manager assigns a starter task: a well-scoped analysis with a clear question and known data sources.
- Use what you learned this week: correct naming, validated data, clear communication.
- Submit your work for a lightweight quality review. Expect feedback; that is the point.
- Do not aim for perfection. Aim for a complete, honest attempt that demonstrates understanding of the process.

**Checkpoint:** You submit a completed analysis that passes the first quality review.

## Day 7: Reflect and Plan

Close the loop on your first week.

- Meet with your buddy for a 30-minute debrief: what made sense, what was confusing, what do you need more of?
- Review the **faq.md** for common questions from past new analysts.
- Write down 3 things you want to learn in the next 3 weeks. Share them with your manager.
- Update the onboarding guide with anything you wish had been included (seriously, we rely on this feedback).

**Checkpoint:** You have a clear plan for weeks 2-4 and have contributed feedback to improve onboarding.

## Key Resources

| Resource | Purpose | Location |
|----------|---------|----------|
| Squad Repository | All workflows, docs, and registries | `squads/data/` |
| Metric Registry | Official metric definitions | Registry folder in the repository |
| Data Quality Dashboard | Current quality scores and SLA status | BI tool, "Data Quality" space |
| #data-squad Slack | Daily communication and quick questions | Slack |
| Weekly Sync | Squad coordination and priority review | Calendar, Tuesdays 10am |

## Who to Ask

- **Tool issues:** Your technical buddy (assigned on Day 1)
- **Process questions:** Insight Narrator
- **Data model questions:** Analytics Architect
- **Quality questions:** Data Quality Sentinel
- **Priority and strategy questions:** Retention Strategist
