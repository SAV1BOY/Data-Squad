# Task: Dashboard Deprecation
> Agent(s): avinash-kaushik, data-chief
> Frameworks: visualization-layer, governance-layer, kaushik-10-90-rule
> Checklists: dashboard-quality, governance/data-debt-audit, kaushik/dashboard-storytelling-audit
> Templates: outputs/dashboard-spec
> Registry: dashboard-registry

## Objective
Identify and formally sunset unused, redundant, or misleading dashboards through a structured
deprecation process — reducing maintenance burden and improving trust in the remaining dashboards.

## Prerequisites
- Access to the BI platform's usage analytics (view counts, last accessed dates).
- Dashboard registry listing all active dashboards and their owners.
- Stakeholder contact list for notification purposes.
- Replacement dashboard or data source identified for dashboards still serving valid needs.

## Steps
1. **Pull usage data** -- Export dashboard usage metrics from the BI platform:
   - View count per dashboard for the last 90 days.
   - Unique viewers per dashboard.
   - Last accessed date.
   - Scheduled delivery subscribers (if applicable).
2. **Identify deprecation candidates** -- Flag dashboards that meet any criterion:
   - Zero views in the last 60 days.
   - Fewer than 3 unique viewers in the last 90 days.
   - Data sources are stale or broken.
   - Metrics shown are deprecated in the metric registry.
   - Duplicate of another actively used dashboard.
3. **Categorize candidates** -- For each candidate, assign a category:
   - **Dead:** No usage, no stakeholder need. Safe to archive.
   - **Redundant:** Covered by another dashboard. Merge and redirect.
   - **Stale:** Data source issues make it unreliable. Fix or kill.
   - **Orphaned:** Owner has left the organization. Reassign or archive.
4. **Notify stakeholders** -- For each candidate, contact the owner and known consumers:
   - Explain the deprecation rationale.
   - Provide a 14-day comment period for objections.
   - Offer alternatives (replacement dashboard, self-serve query, etc.).
5. **Resolve objections** -- For dashboards with objections:
   - If the objection is valid, remove from the deprecation list.
   - If the need can be met by another dashboard, document the redirect.
   - If the dashboard needs updating rather than deprecation, create a remediation ticket.
6. **Archive dashboards** -- For approved deprecations:
   - Export a PDF snapshot for historical reference.
   - Move the dashboard to an "Archived" folder (do not delete permanently).
   - Remove scheduled deliveries.
   - Update the dashboard registry with `status: deprecated` and `deprecated_date`.
7. **Update redirects** -- For redundant dashboards:
   - Add a redirect notice pointing to the replacement dashboard.
   - Keep the redirect active for 30 days before final archival.
8. **Clean up data sources** -- Identify data sources that were only used by deprecated dashboards:
   - Flag for potential pipeline deprecation.
   - Coordinate with pipeline owners before removing.
9. **Report results** -- Summarize the deprecation cycle:
   - Number of dashboards reviewed, deprecated, retained.
   - Estimated maintenance cost saved.
   - Remaining dashboard inventory count.
10. **Set next review date** -- Schedule the next deprecation review (recommended quarterly).

## Deliverable
A dashboard deprecation report containing:
- Usage analytics summary for all dashboards.
- List of deprecated dashboards with rationale.
- Stakeholder notification log and objection resolutions.
- Redirect mappings for redundant dashboards.
- Updated dashboard registry.
- Data source cleanup recommendations.

## Quality Gate
- [ ] Usage data covers at least 90 days.
- [ ] All deprecation candidates are categorized (dead, redundant, stale, orphaned).
- [ ] Stakeholders notified with 14-day comment period honored.
- [ ] Objections resolved and documented.
- [ ] Archived dashboards have PDF snapshots.
- [ ] Dashboard registry updated for all deprecated dashboards.
- [ ] Redirects are in place for redundant dashboards.
- [ ] Next review date is scheduled.

## Registry Update
- Update `dashboard-registry` with `status: deprecated` for sunsetted dashboards.
- Log data source cleanup candidates in `data-debt-registry`.
- Log task completion in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** avinash-kaushik owns this task end-to-end.
- **Supporting agents:** data-chief contribute to their domain-specific steps.
- **Review:** data-chief reviews the final deliverable before it exits the squad.
- **Cross-squad delivery:** If the output is requested by another squad, deliver via the cross-squad-data-delivery-workflow with data-chief sign-off.

### Escalation Rules
- **Data blocker:** If required data is unavailable or unreliable, escalate to data-chief within 24 hours.
- **Stakeholder disagreement:** If stakeholders reject the methodology or conclusions, escalate to data-chief for mediation.
- **Deadline risk:** If the task cannot be completed on schedule, notify data-chief at least 48 hours before the deadline.

### Rework Loop
- **Trigger:** Any checklist item marked as fail, or reviewer requests changes.
- **Maximum iterations:** 2 rework cycles. If the deliverable fails after 2 reworks, escalate to data-chief for a scope review.
- **Between iterations:** The reviewing agent provides specific, written feedback on what must change. No vague "needs improvement" — every rework request cites a checklist item or specific deficiency.

### RalphLoop Gate
- **Applicable gate:** G5 -- Decision + Registry
- **Must-pass checklists:** `checklists/dashboard-quality.md`, `checklists/governance/data-debt-audit.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/dashboard-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [visualization-layer](../../frameworks/visualization-layer.md), [governance-layer](../../frameworks/governance-layer.md), [kaushik-10-90-rule](../../frameworks/kaushik-10-90-rule.md)
- **Checklists:** [dashboard-quality](../../checklists/dashboard-quality.md), [governance/data-debt-audit](../../checklists/governance/data-debt-audit.md), [kaushik/dashboard-storytelling-audit](../../checklists/kaushik/dashboard-storytelling-audit.md)
- **Templates:** [outputs/dashboard-spec](../../templates/outputs/dashboard-spec.md)
- **Workflows:** [dashboard-build-workflow](../../workflows/dashboard-build-workflow.md)
