# Dashboard Build Workflow

## Purpose
Build dashboards that drive decisions, not just display data. Every dashboard must answer a specific question and connect to an action the viewer can take.

## Trigger
- Stakeholder requests a new dashboard or major revision
- New metric defined that requires ongoing visibility
- Quarterly review identifies a decision gap not served by existing dashboards
- Cross-squad initiative requires shared visibility

## Agents Involved
- **Insight Narrator**: Leads dashboard design and storytelling
- **Analytics Architect**: Ensures metric definitions and data sources are correct
- **Data Quality Sentinel**: Validates data accuracy and freshness
- **Retention Strategist**: Consults on retention and engagement dashboards specifically

## Steps

### Phase 1: Question Definition (Days 1-2)
1. **Insight Narrator** interviews the requesting stakeholder to identify the core question the dashboard must answer.
2. **Insight Narrator** documents the decision the dashboard enables: "When I see X, I will do Y."
3. **Analytics Architect** confirms the required metrics exist, are defined, and have reliable data sources.
4. **Insight Narrator** writes the dashboard brief: audience, question, decisions, update frequency, and success criteria.

### Phase 2: Data Preparation (Days 3-5)
5. **Analytics Architect** identifies and documents all data sources, joins, and transformations needed.
6. **Analytics Architect** builds or updates the data models (views, materialized tables) to support the dashboard.
7. **Data Quality Sentinel** validates data freshness and accuracy for each source: runs reconciliation checks.
8. **Analytics Architect** creates a semantic layer or curated dataset that the dashboard will query.

### Phase 3: Visual Design (Days 6-8)
9. **Insight Narrator** creates a wireframe showing layout, chart types, and interaction patterns.
10. **Insight Narrator** selects visualizations that match the data type: trends for time series, bars for comparison, tables for detail.
11. **Insight Narrator** adds context elements: benchmarks, targets, annotations for known events, and drill-down paths.
12. **Analytics Architect** reviews the wireframe to ensure metrics are correctly represented and not misleading.

### Phase 4: Action Layer (Days 9-10)
13. **Insight Narrator** adds recommended actions to each section: what to do when the metric is above/below threshold.
14. **Insight Narrator** includes alert configurations: who gets notified when key metrics cross thresholds.
15. **Insight Narrator** documents the "so what" for each chart: the interpretation guide for non-analysts.

### Phase 5: QA and Release (Days 11-14)
16. **Data Quality Sentinel** validates every number on the dashboard against the source of truth (warehouse query).
17. **Data Quality Sentinel** tests all filters, date ranges, and drill-downs for correctness.
18. **Insight Narrator** conducts a walkthrough with the requesting stakeholder to confirm it answers their question.
19. **Analytics Architect** registers the dashboard in the registry: name, owner, data sources, refresh schedule.
20. **Insight Narrator** publishes the dashboard with an accompanying one-page interpretation guide.

## Inputs
- Stakeholder request with business context
- Metric definitions from the registry
- Data source documentation
- Dashboard design principles (from dashboard-philosophy.md)

## Outputs
- Dashboard brief documenting question, audience, and decisions enabled
- Live dashboard with action recommendations
- Interpretation guide for non-analyst users
- Registry entry with ownership and refresh schedule

## Quality Gates

| Gate | Criteria | Owner |
|------|----------|-------|
| G1: Question Clear | Dashboard brief states the decision it enables, approved by stakeholder | Insight Narrator |
| G2: Data Validated | All data sources pass freshness and accuracy checks | Data Quality Sentinel |
| G3: No Vanity Metrics | Every metric on the dashboard connects to a documented action | Insight Narrator |
| G4: Numbers Match | Dashboard values match warehouse queries within 1% tolerance | Data Quality Sentinel |
| G5: Stakeholder Accepts | Requesting stakeholder confirms the dashboard answers their question | Insight Narrator |

## Registry Updates
- **Dashboard Registry**: Name, owner, question answered, data sources, refresh schedule, creation date.
- **Metric Registry**: Link metrics to their dashboard appearances.
- **Change Log**: Record dashboard creation with version, stakeholder, and linked brief.

## Anti-Patterns to Avoid
- Building a dashboard before defining the question it answers.
- Including metrics that no one will act on ("vanity metrics").
- Using pie charts for more than 3-4 categories.
- Defaulting to "last 30 days" without considering the natural decision cadence.
- Skipping the interpretation guide and assuming the dashboard is self-explanatory.
