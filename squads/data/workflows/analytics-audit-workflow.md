# Analytics Audit Workflow

## Purpose
Systematic audit of analytics instrumentation to identify gaps, inaccuracies, and improvement opportunities across the entire tracking surface.

## Trigger
- Quarterly scheduled audit cycle
- Major product release that changes core flows
- Data quality incident affecting key metrics
- New team member onboarding reveals undocumented gaps

## Agents Involved
- **Analytics Architect**: Leads audit scope and methodology
- **Data Quality Sentinel**: Executes validation checks and documents findings
- **Tracking Implementer**: Fixes instrumentation issues
- **Insight Narrator**: Communicates audit results to stakeholders

## Steps

### Phase 1: Scope and Inventory (Days 1-2)
1. **Analytics Architect** defines audit scope: which products, platforms, and event categories to cover.
2. **Analytics Architect** pulls the current tracking plan from the registry and compares against the live event stream.
3. **Data Quality Sentinel** runs automated coverage checks: events firing vs. events documented.
4. **Data Quality Sentinel** generates an initial gap report listing undocumented events, missing properties, and silent failures.

### Phase 2: Prioritize Findings (Days 3-4)
5. **Analytics Architect** classifies each finding by severity: Critical (blocks decisions), High (degrades metric accuracy), Medium (incomplete context), Low (cosmetic).
6. **Analytics Architect** maps each finding to the metric or dashboard it affects, using the metric registry.
7. **Insight Narrator** prepares a prioritized findings summary for stakeholder review.
8. **Analytics Architect** holds a 30-minute triage session with product and engineering leads to confirm priorities.

### Phase 3: Fix Instrumentation (Days 5-10)
9. **Tracking Implementer** creates tickets for each fix, grouped by severity and affected surface.
10. **Tracking Implementer** implements Critical and High fixes first, following the tracking-implementation-workflow.
11. **Data Quality Sentinel** validates each fix in staging by comparing expected vs. actual payloads.
12. **Tracking Implementer** deploys fixes in batches, monitoring for regressions after each batch.

### Phase 4: Validate and Close (Days 11-14)
13. **Data Quality Sentinel** runs the full validation suite against production data 48 hours post-deploy.
14. **Data Quality Sentinel** compares pre-audit and post-audit data quality scores.
15. **Analytics Architect** updates the tracking plan and metric registry with all changes.
16. **Insight Narrator** publishes the audit report: what was found, what was fixed, what remains.

## Inputs
- Current tracking plan (from registry)
- Live event stream access (warehouse + real-time)
- Product feature inventory
- Previous audit report (if exists)

## Outputs
- Prioritized findings report with severity classifications
- Updated tracking plan reflecting current state
- Audit summary with before/after quality scores
- Backlog of deferred items with rationale

## Quality Gates

| Gate | Criteria | Owner |
|------|----------|-------|
| G1: Scope Approved | Audit scope documented and signed off by Analytics Architect | Analytics Architect |
| G2: Findings Classified | Every finding has severity, affected metric, and recommended action | Data Quality Sentinel |
| G3: Fixes Validated | Each fix passes payload validation in staging before deploy | Data Quality Sentinel |
| G4: Post-Audit Score | Data quality score improves or justification provided for exceptions | Analytics Architect |
| G5: Registry Updated | Tracking plan and metric registry reflect post-audit state | Analytics Architect |

## Registry Updates
- **Tracking Plan**: Add newly discovered events, remove deprecated ones, correct property schemas.
- **Metric Registry**: Update data quality scores, add notes on metrics affected by audit findings.
- **Audit Log**: Record audit date, scope, findings count by severity, resolution status.
- **Knowledge Base**: Document any patterns or anti-patterns discovered during the audit for future reference.

## Cadence
- Full audit: quarterly
- Targeted audit (single product area): as triggered by incidents or releases
- Audit backlog review: monthly during data squad sync

## Escalation
- If Critical findings exceed 10: escalate to VP Engineering within 24 hours.
- If a fix introduces a regression: halt deployment, revert, and convene incident review.
- If stakeholders dispute severity classifications: Analytics Architect has final call, documented in audit log.
