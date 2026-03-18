# Task: Data Pipeline Health Check
> Agent(s): avinash-kaushik, data-chief
> Frameworks: data-quality-triad, ralphloop-data-ops, governance-layer
> Checklists: data-quality-quality, alerting-quality, analytics/anomaly-investigation
> Templates: reports/data-quality-report
> Registry: data-quality-registry

## Objective
Conduct a systematic health check of all active data pipelines to assess freshness, completeness,
schema drift, and latency — producing a scored pipeline health report with actionable remediation items.

## Prerequisites
- Access to the data warehouse and pipeline orchestration tool (Airflow, dbt, Fivetran, etc.).
- Pipeline inventory or manifest listing all scheduled pipelines.
- Alerting system is operational for cross-referencing incident history.
- Data quality registry is accessible for historical baselines.

## Steps
1. **Inventory active pipelines** -- Pull the full list of pipelines from the orchestration tool.
   For each pipeline, record: name, schedule, owner, downstream consumers, and SLA.
2. **Assess freshness** -- For each pipeline, check:
   - Last successful run timestamp vs. expected schedule.
   - Number of late runs in the last 30 days.
   - Longest delay in the last 30 days.
   Flag any pipeline that missed its SLA more than twice.
3. **Assess completeness** -- For each pipeline's output tables, check:
   - Row count trends (compare last 7 days vs. 30-day average).
   - Null rate for required columns (flag if > 5%).
   - Missing partition dates or time windows.
4. **Detect schema drift** -- Compare current schema against the last documented schema:
   - New columns added without documentation.
   - Columns removed or renamed.
   - Data type changes.
   - Changes in enum or categorical value distributions.
5. **Measure latency** -- For each pipeline, calculate:
   - Median execution time over the last 30 days.
   - 95th percentile execution time.
   - Trend direction (improving, stable, degrading).
   Flag pipelines with > 25% latency increase.
6. **Cross-reference incidents** -- Pull incident history from the alert registry:
   - Count of incidents per pipeline in the last 90 days.
   - Mean time to resolution for each incident.
   - Recurrence patterns (same root cause appearing multiple times).
7. **Score pipeline health** -- Assign each pipeline a health score (1-5):
   - 5: All checks green, no incidents.
   - 4: Minor issues, no SLA breaches.
   - 3: Occasional SLA breaches, manageable.
   - 2: Frequent issues, active remediation needed.
   - 1: Critical, blocking downstream consumers.
8. **Identify remediation items** -- For pipelines scoring 3 or below:
   - Diagnose the root cause category (infrastructure, data source, logic, schema).
   - Propose a fix with estimated effort.
   - Assign an owner and target resolution date.
9. **Update monitoring** -- For pipelines missing alerts:
   - Add freshness alerts.
   - Add completeness alerts.
   - Add latency threshold alerts.
10. **Document findings** -- Compile the health report and present to the data team.
    Schedule follow-up review for remediation progress.

## Deliverable
A pipeline health report containing:
- Pipeline inventory with ownership and SLA.
- Freshness, completeness, schema drift, and latency assessments.
- Health score per pipeline (1-5).
- Incident cross-reference summary.
- Remediation backlog with owners and timelines.
- Monitoring gap analysis.

## Quality Gate
- [ ] All active pipelines are inventoried.
- [ ] Freshness assessed for every pipeline with SLA comparison.
- [ ] Completeness checks include null rates and row count trends.
- [ ] Schema drift detection covers all critical pipelines.
- [ ] Latency trends calculated with 30-day baselines.
- [ ] Health scores assigned to every pipeline.
- [ ] Remediation items have owners and target dates.
- [ ] Monitoring gaps are documented and alert tickets created.

## Registry Update
- Update pipeline health scores in `data-quality-registry`.
- Log remediation items in `data-debt-registry`.
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
- **Applicable gate:** G3 -- Quality
- **Must-pass checklists:** `checklists/data-quality-quality.md`, `checklists/alerting-quality.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/data-quality-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [data-quality-triad](../../frameworks/data-quality-triad.md), [ralphloop-data-ops](../../frameworks/ralphloop-data-ops.md), [governance-layer](../../frameworks/governance-layer.md)
- **Checklists:** [data-quality-quality](../../checklists/data-quality-quality.md), [alerting-quality](../../checklists/alerting-quality.md), [analytics/anomaly-investigation](../../checklists/analytics/anomaly-investigation.md)
- **Templates:** [reports/data-quality-report](../../templates/reports/data-quality-report.md)
- **Workflows:** [data-quality-improvement-workflow](../../workflows/data-quality-improvement-workflow.md)
