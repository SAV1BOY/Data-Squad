# Task: Analytics Audit
> Agent(s): Data Analyst, Data Strategist
> Frameworks: Analytics Maturity Model, Data Quality Framework
> Checklists: analytics-audit-checklist, data-quality-checklist
> Template: analytics-audit-report-template
> Registry: metric-registry, event-registry

## Objective
Conduct a comprehensive audit of the current analytics setup to identify gaps in tracking,
data quality issues, unused metrics, and opportunities to improve the analytics foundation.

## Prerequisites
- Access to all analytics platforms in use.
- Access to the data warehouse and dashboards.
- Current metric registry and event registry (if they exist).
- Stakeholder list for interview scheduling.

## Steps
1. **Inventory tools** -- List every analytics tool, data warehouse, BI platform, and
   tracking SDK in use. Document ownership, cost, and primary use case for each.
2. **Audit event tracking** -- Export event lists from each analytics platform. Check for:
   - Events with zero volume in the last 30 days (dead events).
   - Events with naming convention violations.
   - Duplicate or overlapping events.
   - Missing critical events (compare against user journeys).
3. **Audit data quality** -- For the top 20 events by volume, check:
   - Property completeness (% of events missing required properties).
   - Property type consistency (strings where numbers expected, etc.).
   - Timestamp accuracy and timezone consistency.
   - User identification accuracy (anonymous vs. identified ratio).
4. **Audit metrics** -- Review all defined metrics:
   - Are definitions documented and unambiguous?
   - Do multiple dashboards show the same metric with different values?
   - Are there orphaned metrics no one uses?
   - Are there critical metrics that are not formally defined?
5. **Audit dashboards** -- Inventory all dashboards:
   - Last viewed date (identify abandoned dashboards).
   - Owner assignment.
   - Data freshness and accuracy.
   - Alignment with the KPI tree.
6. **Interview stakeholders** -- Talk to 5-10 stakeholders across product, engineering,
   marketing, and leadership. Ask:
   - What questions can you not answer today?
   - What data do you not trust?
   - What takes too long to get?
7. **Score analytics maturity** -- Rate the organization on the analytics maturity model
   (1-5) across dimensions: collection, storage, analysis, activation, culture.
8. **Identify quick wins** -- List 5-10 improvements that can be made within 2 weeks
   with high impact.
9. **Create remediation roadmap** -- Prioritize all findings into a phased plan:
   immediate (0-2 weeks), short-term (1 month), medium-term (1 quarter).
10. **Present findings** -- Share the audit report with stakeholders. Get alignment on
    the remediation priorities.

## Deliverable
An analytics audit report containing:
- Tool inventory with cost and ownership.
- Data quality scorecard for top events.
- Metric consistency findings.
- Dashboard inventory with usage data.
- Stakeholder feedback summary.
- Analytics maturity score.
- Quick wins list.
- Prioritized remediation roadmap.

## Quality Gate
- [ ] All analytics tools are inventoried.
- [ ] Top 20 events audited for data quality.
- [ ] At least 5 stakeholders interviewed.
- [ ] Analytics maturity scored across all dimensions.
- [ ] Quick wins identified (minimum 5).
- [ ] Remediation roadmap has clear phases and owners.
- [ ] Report is reviewed with at least 2 senior stakeholders.
- [ ] Findings are actionable (not just observations).

## Registry Update
- Flag dead events in `event-registry` with `status: deprecated`.
- Flag orphaned metrics in `metric-registry` with `status: review`.
- Log audit findings in `task-log` with remediation ticket links.
