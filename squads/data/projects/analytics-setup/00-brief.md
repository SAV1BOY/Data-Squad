# Analytics Setup - Project Brief

## Phase Objective

Establish a clear, agreed-upon scope for the analytics setup project. Align all stakeholders on what will be measured, why it matters, and how success will be evaluated. This document serves as the single source of truth for the entire project.

## Prerequisites

- Access to the product or service being instrumented
- Identified project sponsor with budget authority
- Initial list of business questions the organization wants to answer with data
- Understanding of the current tech stack (product, marketing, data infrastructure)

## Steps

1. **Identify Stakeholders**: List every team that will consume analytics data. Include product, marketing, engineering, finance, and executive leadership. Document each team's primary data needs and how frequently they require reporting.

2. **Define Business Objectives**: Translate high-level company goals into measurable objectives. For each objective, specify what decisions it supports. Avoid vanity metrics. Every objective should connect to revenue, retention, or operational efficiency.

3. **Determine Scope Boundaries**: Explicitly state what is in scope and out of scope. Cover platforms (web, mobile, backend), environments (production, staging), and data domains (behavioral, transactional, marketing). Document any integrations with third-party tools.

4. **Draft Timeline**: Break the project into phases with realistic deadlines. Account for dependencies on engineering resources, vendor procurement, and stakeholder review cycles. Include buffer time for unexpected technical debt discovery.

5. **Set Success Criteria**: Define what "done" looks like in concrete terms. Specify the number of events to be tracked, dashboard delivery dates, data accuracy thresholds, and adoption targets (e.g., "80% of product managers check dashboards weekly within 30 days of launch").

6. **Assess Risks**: Identify risks such as incomplete data access, lack of engineering bandwidth, stakeholder misalignment, or vendor lock-in. For each risk, document likelihood, impact, and mitigation strategy.

7. **Establish Governance**: Define who owns the analytics implementation long-term. Clarify who approves new tracking requests, who maintains dashboards, and who is responsible for data quality. Document the decision rights for adding, modifying, or deprecating tracked events.

8. **Document Communication Plan**: Specify how progress will be communicated. Include weekly status updates, stakeholder review meetings, and escalation paths for blockers. Assign a single point of contact who consolidates questions from all stakeholders.

9. **Define the Data Access Model**: Specify which teams will have access to which data. Not all stakeholders need access to all analytics data. Map each team to the dashboards, raw data, and self-service tools they require. Document any data access restrictions driven by privacy, compliance, or sensitivity concerns.

## Deliverables

- Signed-off project brief document with stakeholder approval
- Stakeholder registry with roles, data needs, and contact information
- Scoped timeline with milestones and dependencies
- Risk register with mitigation strategies
- RACI matrix for project responsibilities
- Success criteria checklist with measurable targets
- Data access model specifying team-level permissions and restrictions
- Communication plan with cadence, channels, and escalation paths

## Quality Gate

The project brief is approved when all of the following conditions are met:

- Every identified stakeholder has reviewed and signed off on the scope
- Business objectives are specific, measurable, and tied to company strategy
- Timeline is validated by engineering leads for technical feasibility
- Success criteria are quantified with specific thresholds, not qualitative descriptions
- Risk register has been reviewed and accepted by the project sponsor
- No open questions remain about scope boundaries
- The governance model defines clear ownership for ongoing analytics maintenance
- The data access model specifies which teams access which data layers

## Next Phase

Proceed to **01-audit.md** (Current State Audit) to assess existing tracking, identify gaps, and catalog data quality issues before building the measurement plan. The audit will build on the scope and stakeholder context established in this brief.
