# Metric Deprecation Workflow

## Purpose
Safely deprecate metrics that are no longer useful, misleading, or redundant by assessing impact, migrating consumers, removing the metric, and documenting the decision for institutional knowledge.

## Trigger
- Quarterly metric review identifies redundant or unused metrics
- Metric definition changes make an existing metric obsolete
- Data source for a metric is being decommissioned
- Audit reveals a metric is misleading or incorrectly calculated

## Agents Involved
- **Analytics Architect**: Leads the deprecation process and handles technical migration
- **Data Quality Sentinel**: Validates that deprecation does not break downstream systems
- **Insight Narrator**: Communicates deprecation to stakeholders and manages the transition
- **Retention Strategist**: Approves deprecation from a strategic perspective

## Steps

### Phase 1: Identify and Justify (Days 1-3)
1. **Analytics Architect** identifies the metric candidate for deprecation and documents the reason: redundancy, inaccuracy, source decommission, or lack of use.
2. **Analytics Architect** checks the metric registry for the metric's definition, owner, creation date, and stated purpose.
3. **Analytics Architect** determines when the metric was last accessed or referenced in a decision.
4. **Retention Strategist** reviews the deprecation justification and confirms the metric is not strategically important.

### Phase 2: Impact Assessment (Days 4-7)
5. **Analytics Architect** maps all downstream consumers: dashboards, reports, alerts, automated pipelines, and external integrations that reference this metric.
6. **Data Quality Sentinel** queries access logs to identify all users who viewed or queried this metric in the last 90 days.
7. **Analytics Architect** identifies replacement metrics: what should consumers use instead, and is the replacement already available?
8. **Insight Narrator** contacts the top 5 consumers to assess impact: would deprecation affect their workflows or decisions?
9. **Analytics Architect** produces the impact assessment: consumers affected, replacement plan, and estimated migration effort.

### Phase 3: Migration (Days 8-15)
10. **Analytics Architect** updates dashboards to replace the deprecated metric with the recommended replacement.
11. **Analytics Architect** updates any automated pipelines or reports that reference the metric.
12. **Insight Narrator** notifies all identified consumers of the deprecation timeline and replacement metric.
13. **Analytics Architect** adds a deprecation warning to any remaining references: "This metric will be removed on [date]. Use [replacement] instead."
14. **Data Quality Sentinel** validates that the replacement metric produces equivalent or better decision support.

### Phase 4: Deprecation (Day 16+)
15. **Analytics Architect** sets the metric status to "Deprecated" in the registry but keeps the data available for historical reference.
16. **Analytics Architect** removes the metric from active dashboards, reports, and alert configurations.
17. **Data Quality Sentinel** confirms no active systems still reference the deprecated metric.
18. **Analytics Architect** archives the metric's computation pipeline (retains code but stops execution).

### Phase 5: Documentation (Days 17-19)
19. **Analytics Architect** updates the metric registry: status changed to "Deprecated," replacement noted, deprecation date recorded.
20. **Insight Narrator** publishes a deprecation notice to the data squad and affected stakeholders.
21. **Analytics Architect** documents the full deprecation decision in the change log: reason, impact assessment, migration actions, and replacement.
22. **Analytics Architect** adds the deprecation to the quarterly review as a completed action.

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
| G1: Justified | Deprecation reason documented and strategically approved | Retention Strategist |
| G2: Impact Assessed | All downstream consumers identified and contacted | Analytics Architect |
| G3: Replacement Ready | Replacement metric available and validated as equivalent or better | Data Quality Sentinel |
| G4: Consumers Migrated | All active dashboards, reports, and pipelines updated | Analytics Architect |
| G5: Documented | Registry updated, change log complete, stakeholders notified | Analytics Architect |

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
