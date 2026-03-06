# Tracking Implementation Workflow

## Purpose
End-to-end process for implementing new analytics tracking, from specification through production monitoring, ensuring every event is accurate, documented, and validated before reaching stakeholders.

## Trigger
- New feature requires analytics instrumentation
- Product manager requests tracking for a new initiative
- Audit reveals missing or broken tracking
- Experiment requires new event data

## Agents Involved
- **Analytics Architect**: Defines tracking specification and approves design
- **Tracking Implementer**: Writes and deploys instrumentation code
- **Data Quality Sentinel**: Validates data in staging and production
- **Experiment Strategist**: Consults when tracking supports an experiment

## Steps

### Phase 1: Specification (Days 1-3)
1. **Analytics Architect** meets with the requesting team to understand what decisions the tracking will support.
2. **Analytics Architect** drafts the tracking spec: event names, properties, types, expected volumes, and taxonomy alignment.
3. **Analytics Architect** validates naming against the naming-conventions guide and checks for duplicates in the registry.
4. **Analytics Architect** publishes the spec for review and obtains sign-off from the requesting PM and one engineer.

### Phase 2: Implementation (Days 4-7)
5. **Tracking Implementer** reviews the spec and identifies all code surfaces (client, server, hybrid) requiring changes.
6. **Tracking Implementer** implements events following the SDK standards for each platform (web, iOS, Android, backend).
7. **Tracking Implementer** writes unit tests that assert event payloads match the spec exactly.
8. **Tracking Implementer** opens a pull request with the spec linked and requests review from Analytics Architect.

### Phase 3: QA and Validation (Days 8-10)
9. **Data Quality Sentinel** deploys the branch to staging and triggers each event manually.
10. **Data Quality Sentinel** compares captured payloads against the spec: correct names, property types, required fields present.
11. **Data Quality Sentinel** checks for edge cases: missing properties on error paths, duplicate events on re-renders, null values.
12. **Data Quality Sentinel** runs volume estimation: simulates expected traffic and verifies no sampling or throttling issues.
13. **Analytics Architect** reviews the QA report and approves or requests changes.

### Phase 4: Release (Days 11-12)
14. **Tracking Implementer** merges the PR after all approvals and QA pass.
15. **Tracking Implementer** deploys to production using the standard release pipeline.
16. **Analytics Architect** updates the tracking plan registry with the new events, properties, and ownership.
17. **Analytics Architect** notifies downstream consumers (dashboard owners, experiment configs) of the new data availability.

### Phase 5: Monitor (Days 13-20)
18. **Data Quality Sentinel** sets up automated monitors: volume alerts, schema validation, freshness checks.
19. **Data Quality Sentinel** reviews production data daily for the first 7 days post-launch.
20. **Data Quality Sentinel** produces a final validation report comparing production data against spec expectations.
21. **Analytics Architect** closes the tracking request and archives the spec with the validation report.

## Inputs
- Feature requirements or product brief
- Current tracking plan and event taxonomy
- Platform SDK documentation
- Naming conventions guide

## Outputs
- Approved tracking specification document
- Implemented and tested instrumentation code
- QA validation report
- Updated tracking plan in registry
- Automated monitoring configuration

## Quality Gates

| Gate | Criteria | Owner |
|------|----------|-------|
| G1: Spec Approved | Spec follows naming conventions, no duplicates, signed off by PM + engineer | Analytics Architect |
| G2: Tests Pass | Unit tests cover all events and assert payload structure | Tracking Implementer |
| G3: QA Validated | All events fire correctly in staging with correct payloads | Data Quality Sentinel |
| G4: Volume Check | Expected volume within 20% of estimation, no anomalies | Data Quality Sentinel |
| G5: Registry Complete | All new events documented in tracking plan with ownership | Analytics Architect |

## Registry Updates
- **Tracking Plan**: Add new events with full schema, ownership, and platform coverage.
- **Metric Registry**: Link new events to any metrics they feed into.
- **Change Log**: Record implementation date, spec version, and deploying engineer.
- **Monitor Registry**: Register new automated checks with thresholds and alert recipients.

## Common Failure Modes
- Spec ambiguity leading to implementation divergence: always require explicit property types and example values.
- Events firing on page load instead of user action: QA must test trigger conditions explicitly.
- Missing server-side events when client tracking is blocked: always implement critical events server-side.
- Property name inconsistency across platforms: enforce SDK-level schema validation.
