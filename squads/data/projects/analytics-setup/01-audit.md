# Analytics Setup - Current State Audit

## Phase Objective

Conduct a thorough audit of all existing tracking, data collection, and reporting infrastructure. Identify what is working, what is broken, what is missing, and what is duplicated. This audit prevents building on a flawed foundation and ensures the measurement plan addresses real gaps.

## Prerequisites

- Approved project brief from Phase 00
- Access to all analytics tools currently in use (Google Analytics, Mixpanel, Amplitude, Segment, etc.)
- Access to the tag manager configuration and any hardcoded tracking in the codebase
- Access to existing dashboards, reports, and data warehouses
- Contact information for engineers who implemented current tracking

## Steps

1. **Inventory Existing Tools**: Catalog every analytics tool, tag manager, CDP, and data pipeline currently in use. For each tool, document its purpose, who manages it, how data flows in and out, and what it costs. Note any tools that overlap in functionality.

2. **Map Current Events**: Extract a complete list of events currently being tracked. For each event, document the event name, properties captured, where it fires (client vs. server), which tool receives it, and whether it is actively used in any report or dashboard.

3. **Audit Event Quality**: For each tracked event, verify that it fires correctly. Check for common issues: events firing multiple times per action, missing properties, inconsistent naming conventions, events that never fire, and events with null or malformed data. Use a combination of browser developer tools, network inspectors, and backend logs.

4. **Identify Tracking Gaps**: Compare the current event inventory against the business objectives from the project brief. List every question the business needs to answer that cannot be answered with current tracking. Categorize gaps as critical (blocks key decisions), important (limits analysis depth), or nice-to-have.

5. **Assess Data Quality**: Pull sample data from each source and check for completeness, accuracy, consistency, and timeliness. Look for issues like bot traffic contamination, cross-domain tracking failures, missing user identifiers, timezone mismatches, and sampling artifacts.

6. **Review Naming Conventions**: Evaluate whether existing events follow a consistent naming convention. Document the current pattern (or lack thereof) and note any events that deviate. Inconsistent naming is one of the most common sources of analytics debt.

7. **Evaluate Consent and Privacy**: Review how tracking consent is managed. Check whether consent state properly gates data collection, whether data deletion requests can be fulfilled, and whether tracking complies with relevant regulations (GDPR, CCPA, etc.).

8. **Document Technical Debt**: List all issues that need to be resolved before new tracking can be reliably added. This includes outdated SDK versions, deprecated API endpoints, misconfigured tag manager containers, and hardcoded tracking that should be migrated to the tag manager.

9. **Assess Organizational Readiness**: Evaluate whether the organization has the skills, processes, and culture to maintain analytics quality after the setup is complete. Identify training needs, process gaps, and potential resistance. This assessment informs the handoff plan and prevents the common failure mode where a well-built analytics setup degrades within months due to lack of maintenance capability.

## Deliverables

- Complete tool inventory with ownership, cost, and data flow documentation
- Event catalog spreadsheet with firing status, quality assessment, and usage notes
- Gap analysis document mapping business questions to missing tracking
- Data quality scorecard rating each data source on completeness, accuracy, consistency, and timeliness
- Technical debt backlog with estimated effort for each remediation item
- Privacy compliance checklist with pass/fail status for each requirement
- Organizational readiness assessment with training needs and process gaps identified

## Quality Gate

The audit is complete when all of the following conditions are met:

- Every analytics tool in the stack has been inventoried and its data flow documented
- At least 90% of existing events have been verified for correct firing behavior
- All tracking gaps have been categorized by severity and mapped to business objectives
- Data quality issues are documented with specific examples and affected metrics
- Technical debt items have been estimated and prioritized
- Privacy compliance status is confirmed with legal or compliance team
- Organizational readiness findings inform the training and handoff plan for later phases
- Naming convention assessment is complete with specific recommendations for standardization

## Next Phase

Proceed to **02-measurement-plan.md** (Measurement Plan) to design the target-state tracking architecture based on audit findings and business objectives. The gap analysis and technical debt inventory from this audit directly inform measurement plan priorities.
