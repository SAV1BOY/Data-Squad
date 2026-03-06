# Data Quality Remediation - Monitoring

## Phase Objective

Establish a continuous data quality monitoring system that prevents quality regression, detects new issues as they emerge, alerts the responsible teams before problems reach downstream consumers, and maintains the quality improvements achieved through remediation. Without ongoing monitoring, data quality degrades back to pre-remediation levels within months.

## Prerequisites

- Validation complete from Phase 03 confirming fixes are effective
- Data contracts established for all remediated data sources
- Quality rules and thresholds defined for all monitored dimensions
- Infrastructure available for running scheduled quality checks (dbt tests, Great Expectations, custom scripts)
- Alert routing defined with data source owners and escalation paths identified

## Steps

1. **Select and Configure the Monitoring Framework**: Choose a data quality monitoring tool or framework that fits the existing data infrastructure. Options include dbt tests for warehouse-centric pipelines, Great Expectations for Python-based pipelines, Monte Carlo or Bigeye for automated anomaly detection, or custom SQL-based checks orchestrated by Airflow or similar schedulers. Configure the framework to connect to all monitored data sources and store check results for trend analysis.

2. **Implement Schema Monitoring**: Configure checks that detect schema changes before they cause downstream failures. Monitor for added or removed columns, data type changes, table or view renames, and permission changes. Schema changes are one of the most common causes of silent data quality degradation: an upstream system renames a column, the ETL continues running without error, but the affected field is now null in all downstream tables.

3. **Implement Freshness Monitoring**: For every data source with a defined freshness SLA, create a check that verifies data arrived within the expected window. Freshness checks should examine the maximum timestamp in the table and compare it against the current time. Alert if the data is stale beyond the defined threshold. Include checks for partial freshness: some partitions or segments may be fresh while others are stale, and table-level freshness checks miss this pattern.

4. **Implement Volume Monitoring**: Track the row count of each table over time and detect anomalies. Establish expected volume ranges based on historical patterns (accounting for day-of-week, seasonality, and growth trends). Alert when volume falls below the expected range (suggesting data loss or collection failure) or exceeds it (suggesting duplication or an upstream system change). Use statistical methods rather than static thresholds so that monitoring adapts as the business grows.

5. **Implement Distribution Monitoring**: Track the statistical distribution of key columns over time. Monitor null rates, distinct value counts, mean and median values, and percentile distributions. Detect when distributions shift beyond expected bounds. This catches subtle quality degradation that schema, freshness, and volume checks miss: a column might be present, fresh, and at expected volume, but its value distribution has changed in ways that indicate a data quality problem.

6. **Implement Cross-Source Consistency Monitoring**: Schedule regular reconciliation checks between data sources that should agree. Compare warehouse revenue totals against the billing system, user counts against the authentication service, and event counts between the raw and transformed layers. Track reconciliation gaps over time and alert when gaps exceed acceptable thresholds. Trend the gap to distinguish one-time discrepancies from growing divergence.

7. **Build the Quality Monitoring Dashboard**: Create a centralized dashboard that displays the current quality status of every monitored data source. Use a traffic light system (green for passing all checks, yellow for warnings, red for critical failures) for quick triage. Include a timeline view showing quality check history, a drill-down for each source showing individual check results, and an aggregate quality index that summarizes organization-wide data health.

8. **Configure Alert Routing and Escalation**: Set up alerts that reach the right people when quality checks fail. Route alerts to the data source owner first. If the issue is not acknowledged within 4 hours, escalate to the data team lead. If the issue is not resolved within 24 hours, escalate to the affected downstream stakeholder. Include enough context in each alert for the recipient to begin investigation: which check failed, what the expected and actual values were, which downstream consumers are affected, and a link to the relevant data source documentation.

9. **Establish Governance Cadence**: Define recurring governance activities that keep the monitoring system effective. Weekly: review the quality monitoring dashboard and triage any open alerts. Monthly: analyze quality trends, identify emerging patterns, and update monitoring rules to cover new data sources or changed business requirements. Quarterly: review the overall data quality index, assess whether the organization's quality posture is improving or declining, and adjust remediation priorities for the next quarter.

10. **Plan for Monitoring System Maintenance**: The monitoring system itself requires maintenance. Data sources change, new tables are added, old tables are deprecated, and business rules evolve. Assign ownership for maintaining the monitoring configuration. Schedule quarterly reviews of all quality rules to retire obsolete checks and add coverage for new data assets. Track monitoring coverage (what percentage of critical data sources have active quality checks) as a meta-metric.

## Deliverables

- Configured quality monitoring framework with all checks operational
- Schema monitoring for all critical data sources detecting structural changes
- Freshness monitoring with SLA-based alerting for every data source with timeliness requirements
- Volume monitoring with statistical anomaly detection adapted to historical patterns
- Distribution monitoring tracking key column statistics over time
- Cross-source consistency checks running on a defined schedule
- Quality monitoring dashboard with traffic light status and drill-down capability
- Alert routing configuration with escalation paths and context-rich notifications
- Governance cadence document with weekly, monthly, and quarterly review procedures
- Monitoring maintenance plan with ownership and quarterly review schedule

## Quality Gate

Monitoring is complete when all of the following conditions are met:

- Quality checks are operational for at least 90% of critical data sources identified in the audit
- Schema, freshness, volume, and distribution checks are implemented for all monitored sources
- Cross-source consistency checks run on schedule and alert on threshold violations
- The quality monitoring dashboard is live and accessible to all data team members
- Alert routing has been tested end-to-end including escalation paths
- The governance cadence is documented, scheduled, and accepted by responsible parties
- At least one month of monitoring data has been accumulated showing system reliability
- A named individual or team owns ongoing monitoring maintenance and rule updates
- The organization-wide data quality index is tracked and reported to leadership quarterly

## Next Phase

This is the final phase of the Data Quality Remediation project. The data quality monitoring system now runs continuously, preventing regression and catching new issues. Ongoing activities include weekly dashboard reviews, monthly trend analysis, quarterly governance reviews, and monitoring system maintenance. Future remediation waves follow the same audit-prioritize-fix-validate cycle, informed by issues surfaced through the monitoring system.
