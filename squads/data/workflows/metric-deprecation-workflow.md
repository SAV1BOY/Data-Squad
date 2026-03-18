# Metric Deprecation Workflow

## Purpose
Safely deprecate metrics that are no longer useful, misleading, or redundant by assessing impact, migrating consumers, removing the metric, and documenting the decision for institutional knowledge.

## Trigger
- Quarterly metric review identifies redundant or unused metrics
- Metric definition changes make an existing metric obsolete
- Data source for a metric is being decommissioned
- Audit reveals a metric is misleading or incorrectly calculated

## Agents Involved
- **avinash-kaushik**: Leads the deprecation process and handles technical migration
- **avinash-kaushik**: Validates that deprecation does not break downstream systems
- **wes-kao**: Communicates deprecation to stakeholders and manages the transition
- **data-chief**: Approves deprecation from a strategic perspective

## Steps

### Phase 1: Identify and Justify (Days 1-3)
1. **avinash-kaushik** identifies the metric candidate for deprecation and documents the reason: redundancy, inaccuracy, source decommission, or lack of use.
2. **avinash-kaushik** checks the metric registry for the metric's definition, owner, creation date, and stated purpose.
3. **avinash-kaushik** determines when the metric was last accessed or referenced in a decision.
4. **data-chief** reviews the deprecation justification and confirms the metric is not strategically important.

### Phase 2: Impact Assessment (Days 4-7)
5. **avinash-kaushik** maps all downstream consumers: dashboards, reports, alerts, automated pipelines, and external integrations that reference this metric.
6. **avinash-kaushik** queries access logs to identify all users who viewed or queried this metric in the last 90 days.
7. **avinash-kaushik** identifies replacement metrics: what should consumers use instead, and is the replacement already available?
8. **wes-kao** contacts the top 5 consumers to assess impact: would deprecation affect their workflows or decisions?
9. **avinash-kaushik** produces the impact assessment: consumers affected, replacement plan, and estimated migration effort.

### Phase 3: Migration (Days 8-15)
10. **avinash-kaushik** updates dashboards to replace the deprecated metric with the recommended replacement.
11. **avinash-kaushik** updates any automated pipelines or reports that reference the metric.
12. **wes-kao** notifies all identified consumers of the deprecation timeline and replacement metric.
13. **avinash-kaushik** adds a deprecation warning to any remaining references: "This metric will be removed on [date]. Use [replacement] instead."
14. **avinash-kaushik** validates that the replacement metric produces equivalent or better decision support.

### Phase 4: Deprecation (Day 16+)
15. **avinash-kaushik** sets the metric status to "Deprecated" in the registry but keeps the data available for historical reference.
16. **avinash-kaushik** removes the metric from active dashboards, reports, and alert configurations.
17. **avinash-kaushik** confirms no active systems still reference the deprecated metric.
18. **avinash-kaushik** archives the metric's computation pipeline (retains code but stops execution).

### Phase 5: Documentation (Days 17-19)
19. **avinash-kaushik** updates the metric registry: status changed to "Deprecated," replacement noted, deprecation date recorded.
20. **wes-kao** publishes a deprecation notice to the data squad and affected stakeholders.
21. **avinash-kaushik** documents the full deprecation decision in the change log: reason, impact assessment, migration actions, and replacement.
22. **avinash-kaushik** adds the deprecation to the quarterly review as a completed action.

## Inputs
- Metric registry entry for the candidate metric
- Access logs and consumer mapping
- Replacement metric documentation
- Stakeholder contact list

## Outputs
- Deprecation justification document
- Impact assessment with consumer list and migration plan
- Updated dashboards, reports, and pipelines
- Registry updates with deprecated status
- Change log entry with full decision documentation

## Quality Gates

| Gate | Criteria | Owner |
|------|----------|-------|
| G1: Justified | Deprecation reason documented and strategically approved | data-chief |
| G2: Impact Assessed | All downstream consumers identified and contacted | avinash-kaushik |
| G3: Replacement Ready | Replacement metric available and validated as equivalent or better | avinash-kaushik |
| G4: Consumers Migrated | All active dashboards, reports, and pipelines updated | avinash-kaushik |
| G5: Documented | Registry updated, change log complete, stakeholders notified | avinash-kaushik |

## Registry Updates
- **Metric Registry**: Status changed to "Deprecated," replacement metric linked, deprecation date and reason recorded.
- **Dashboard Registry**: Updated to reflect metric replacement in all affected dashboards.
- **Change Log**: Full deprecation record with justification, impact, migration, and timeline.
- **Knowledge Base**: Document the lesson learned: why the metric existed, why it was deprecated, and how to avoid similar situations.

## Rollback Plan
If deprecation causes unforeseen issues within 30 days:
- Reactivate the metric computation pipeline from the archive.
- Restore the metric in affected dashboards.
- Re-investigate the replacement strategy before attempting deprecation again.
