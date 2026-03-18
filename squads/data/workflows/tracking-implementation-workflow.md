# Tracking Implementation Workflow

## Purpose
End-to-end process for implementing new analytics tracking, from specification through production monitoring, ensuring every event is accurate, documented, and validated before reaching stakeholders.

## Trigger
- New feature requires analytics instrumentation
- Product manager requests tracking for a new initiative
- Audit reveals missing or broken tracking
- Experiment requires new event data

## Agents Involved
- **avinash-kaushik**: Defines tracking specification and approves design
- **avinash-kaushik**: Writes and deploys instrumentation code
- **avinash-kaushik**: Validates data in staging and production
- **sean-ellis**: Consults when tracking supports an experiment

## Steps

### Phase 1: Specification (Days 1-3)
1. **avinash-kaushik** meets with the requesting team to understand what decisions the tracking will support.
2. **avinash-kaushik** drafts the tracking spec: event names, properties, types, expected volumes, and taxonomy alignment.
3. **avinash-kaushik** validates naming against the naming-conventions guide and checks for duplicates in the registry.
4. **avinash-kaushik** publishes the spec for review and obtains sign-off from the requesting PM and one engineer.

### Phase 2: Implementation (Days 4-7)
5. **avinash-kaushik** reviews the spec and identifies all code surfaces (client, server, hybrid) requiring changes.
6. **avinash-kaushik** implements events following the SDK standards for each platform (web, iOS, Android, backend).
7. **avinash-kaushik** writes unit tests that assert event payloads match the spec exactly.
8. **avinash-kaushik** opens a pull request with the spec linked and requests review from avinash-kaushik.

### Phase 3: QA and Validation (Days 8-10)
9. **avinash-kaushik** deploys the branch to staging and triggers each event manually.
10. **avinash-kaushik** compares captured payloads against the spec: correct names, property types, required fields present.
11. **avinash-kaushik** checks for edge cases: missing properties on error paths, duplicate events on re-renders, null values.
12. **avinash-kaushik** runs volume estimation: simulates expected traffic and verifies no sampling or throttling issues.
13. **avinash-kaushik** reviews the QA report and approves or requests changes.

### Phase 4: Release (Days 11-12)
14. **avinash-kaushik** merges the PR after all approvals and QA pass.
15. **avinash-kaushik** deploys to production using the standard release pipeline.
16. **avinash-kaushik** updates the tracking plan registry with the new events, properties, and ownership.
17. **avinash-kaushik** notifies downstream consumers (dashboard owners, experiment configs) of the new data availability.

### Phase 5: Monitor (Days 13-20)
18. **avinash-kaushik** sets up automated monitors: volume alerts, schema validation, freshness checks.
19. **avinash-kaushik** reviews production data daily for the first 7 days post-launch.
20. **avinash-kaushik** produces a final validation report comparing production data against spec expectations.
21. **avinash-kaushik** closes the tracking request and archives the spec with the validation report.

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
| G1: Spec Approved | Spec follows naming conventions, no duplicates, signed off by PM + engineer | avinash-kaushik |
| G2: Tests Pass | Unit tests cover all events and assert payload structure | avinash-kaushik |
| G3: QA Validated | All events fire correctly in staging with correct payloads | avinash-kaushik |
| G4: Volume Check | Expected volume within 20% of estimation, no anomalies | avinash-kaushik |
| G5: Registry Complete | All new events documented in tracking plan with ownership | avinash-kaushik |

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
