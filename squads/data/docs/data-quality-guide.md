# Data Quality Guide

## Purpose

This guide explains how the Data Squad maintains data quality: what we monitor, how we respond to issues, what SLAs we maintain, and how to use the quality runbooks when things go wrong.

## The Five Quality Dimensions

### 1. Completeness
Are all expected records present? Are required fields populated?

**What we monitor:**
- Row counts compared to expected baselines (daily variance > 20% triggers alert)
- NULL rates on required fields (threshold: < 0.1% for critical fields)
- Missing event types compared to the tracking plan

**Common causes of failure:** Instrumentation bugs, SDK version mismatches, network failures, sampling issues.

### 2. Accuracy
Do the values in the data reflect reality?

**What we monitor:**
- Cross-system reconciliation: do our numbers match the source systems (payment processor, CRM, product backend)?
- Statistical distribution checks: do metrics fall within expected ranges?
- Known-value testing: do test accounts produce expected data points?

**Common causes of failure:** Incorrect transformations, timezone misalignment, currency conversion errors, join logic errors.

### 3. Consistency
Is the same data represented the same way across tables and systems?

**What we monitor:**
- Cross-table consistency: does the user count in the engagement table match the user count in the billing table for the same period?
- Naming consistency: are event names, property names, and dimension values standardized?
- Schema consistency: are data types consistent for the same field across tables?

**Common causes of failure:** Multiple teams instrumenting the same concept differently, schema evolution without migration, inconsistent NULL vs. empty string handling.

### 4. Timeliness
Is data available when decisions need to be made?

**What we monitor:**
- Pipeline completion time vs. SLA (critical tables: within 2 hours of source, standard: within 6 hours)
- Data freshness: timestamp of the most recent record vs. current time
- Pipeline failure alerts: immediate notification on pipeline failure

**Common causes of failure:** Upstream delays, resource contention, query performance degradation, infrastructure outages.

### 5. Uniqueness
Are records unique where they should be?

**What we monitor:**
- Duplicate detection on primary key fields
- Event deduplication: are the same events recorded multiple times?
- User identity resolution: are the same users counted multiple times under different IDs?

**Common causes of failure:** Retry logic without idempotency, client-side event duplication, identity stitching failures.

## SLA Definitions

| Table Category | Freshness SLA | Completeness SLA | Accuracy SLA |
|---------------|---------------|-------------------|--------------|
| Critical (North Star inputs) | 2 hours | 99.9% | 99% reconciliation |
| Standard (operational) | 6 hours | 99.5% | 95% reconciliation |
| Exploratory (ad-hoc) | 24 hours | 95% | Best effort |

## Incident Response Runbook

### Severity 1: Critical metric affected
1. Immediately notify avinash-kaushik and peter-fader via Slack and email.
2. Add a data quality warning banner to affected dashboards within 30 minutes.
3. Investigate root cause. Prioritize over all other work.
4. Provide hourly updates until resolved.
5. Post-incident: document root cause, resolution, and prevention measures.

### Severity 2: Non-critical metric affected
1. Notify avinash-kaushik via Slack.
2. Add to the daily quality check for monitoring.
3. Fix within 2 business days.
4. Document root cause and resolution.

### Severity 3: Cosmetic or non-impactful
1. Log in the data quality backlog.
2. Fix during the next quality improvement cycle.
3. Document the issue.

## Monitoring Stack

- **Automated tests:** Run hourly on critical tables, daily on standard tables. Tests check all 5 dimensions.
- **Anomaly detection:** Statistical alerts for unexpected metric movements (> 2 standard deviations from 28-day rolling average).
- **Schema monitoring:** Automated detection of column additions, removals, or type changes.
- **Freshness monitoring:** Pipeline completion tracking with SLA-based alerting.

## Data Quality Scorecard

The weekly scorecard reports:
- Overall quality score (weighted average of 5 dimensions across all critical tables)
- SLA adherence rate (% of tables meeting their SLA)
- Open issues by severity
- Issues resolved since last scorecard
- Trend over the past 4 weeks

The scorecard is published every Monday by the avinash-kaushik and reviewed in the weekly sync.

## Prevention Practices

- Add quality tests to every new data model before it goes to production.
- Review schema changes before they are deployed to production.
- Include quality validation in the CI/CD pipeline for data transformations.
- Conduct quarterly quality audits using the analytics-audit-workflow.
- Maintain the tracking plan as a living document, not a one-time artifact.
