# Analytics Audit Workflow

## Purpose
Systematic audit of analytics instrumentation to identify gaps, inaccuracies, and improvement opportunities across the entire tracking surface.

## Trigger
- Quarterly scheduled audit cycle
- Major product release that changes core flows
- Data quality incident affecting key metrics
- New team member onboarding reveals undocumented gaps

## Agents Involved
- **avinash-kaushik**: Leads audit scope and methodology
- **avinash-kaushik**: Executes validation checks and documents findings
- **avinash-kaushik**: Fixes instrumentation issues
- **wes-kao**: Communicates audit results to stakeholders

## Steps

### Phase 1: Scope and Inventory (Days 1-2)
1. **avinash-kaushik** defines audit scope: which products, platforms, and event categories to cover.
2. **avinash-kaushik** pulls the current tracking plan from the registry and compares against the live event stream.
3. **avinash-kaushik** runs automated coverage checks: events firing vs. events documented.
4. **avinash-kaushik** generates an initial gap report listing undocumented events, missing properties, and silent failures.

### Phase 2: Prioritize Findings (Days 3-4)
5. **avinash-kaushik** classifies each finding by severity: Critical (blocks decisions), High (degrades metric accuracy), Medium (incomplete context), Low (cosmetic).
6. **avinash-kaushik** maps each finding to the metric or dashboard it affects, using the metric registry.
7. **wes-kao** prepares a prioritized findings summary for stakeholder review.
8. **avinash-kaushik** holds a 30-minute triage session with product and engineering leads to confirm priorities.

### Phase 3: Fix Instrumentation (Days 5-10)
9. **avinash-kaushik** creates tickets for each fix, grouped by severity and affected surface.
10. **avinash-kaushik** implements Critical and High fixes first, following the tracking-implementation-workflow.
11. **avinash-kaushik** validates each fix in staging by comparing expected vs. actual payloads.
12. **avinash-kaushik** deploys fixes in batches, monitoring for regressions after each batch.

### Phase 4: Validate and Close (Days 11-14)
13. **avinash-kaushik** runs the full validation suite against production data 48 hours post-deploy.
14. **avinash-kaushik** compares pre-audit and post-audit data quality scores.
15. **avinash-kaushik** updates the tracking plan and metric registry with all changes.
16. **wes-kao** publishes the audit report: what was found, what was fixed, what remains.

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
| G1: Scope Approved | Audit scope documented and signed off by avinash-kaushik | avinash-kaushik |
| G2: Findings Classified | Every finding has severity, affected metric, and recommended action | avinash-kaushik |
| G3: Fixes Validated | Each fix passes payload validation in staging before deploy | avinash-kaushik |
| G4: Post-Audit Score | Data quality score improves or justification provided for exceptions | avinash-kaushik |
| G5: Registry Updated | Tracking plan and metric registry reflect post-audit state | avinash-kaushik |

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
- If stakeholders dispute severity classifications: avinash-kaushik has final call, documented in audit log.
