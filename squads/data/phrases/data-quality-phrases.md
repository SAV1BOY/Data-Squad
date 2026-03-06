# Data Quality Phrases

## Purpose

Standardized phrases for communicating data quality issues, their impact, and resolution status. Clear data quality communication prevents bad decisions based on unreliable data.

## Reporting Data Quality Issues

- "Data quality issue identified: [description of the issue]."
- "The [table/pipeline/source] has a known issue affecting data from [start date] to [end date/present]."
- "[Metric] values for [period] should be treated as unreliable due to [specific cause]."
- "We detected a discrepancy between [source A] and [source B] of [X]% for [metric] in [period]."
- "The data pipeline for [source] has been delayed by [X] hours. Current reports reflect data as of [timestamp]."

## Describing Impact

- "This issue affects [specific dashboards/reports/metrics]. All other data sources are unaffected."
- "The impact is limited to [segment/date range/geography]. Data outside this scope is reliable."
- "Approximately [X] rows / [Y]% of records are affected."
- "This may cause [metric] to appear [higher/lower] than actual by approximately [X]%."
- "Decisions based on [affected source] from [date range] should be revisited once the correction is applied."
- "No customer-facing data is affected. This is an internal reporting issue only."

## Providing Workarounds

- "Until the issue is resolved, use [alternative source/dashboard/method] for reliable numbers."
- "A manual correction has been applied for [period]. Automated fix is expected by [date]."
- "You can work around this issue by filtering for [condition] to exclude affected records."
- "We have published a corrected version of [report/dashboard] at [link]."
- "For urgent decisions, use the figures from [date], which are the last confirmed reliable snapshot."

## Communicating Root Cause

- "Root cause: [specific technical cause, e.g., 'a schema change in the source system broke the ETL join condition']."
- "The issue originated in [system/team/process] and propagated to [downstream systems]."
- "This was caused by [human error / system failure / external dependency change / undocumented change]."
- "The root cause has been identified and a fix is [in progress / deployed / scheduled for deployment on date]."
- "Root cause is still under investigation. We will update by [time]."

## Resolution Communication

- "RESOLVED: The data quality issue with [description] has been corrected as of [timestamp]."
- "Affected data has been backfilled and corrected for the period [start] to [end]."
- "The fix has been deployed. Dashboards will reflect corrected data after the next refresh at [time]."
- "All previously affected reports have been updated. No further action is needed."
- "The issue is partially resolved: [what is fixed] and [what remains]. Full resolution ETA: [date]."

## Prevention Communication

- "To prevent recurrence, we have added [monitoring / validation / alerting] for [specific check]."
- "A data contract has been established with [upstream team] to ensure [condition] is maintained."
- "We are adding automated quality checks at [stage in pipeline] to catch this type of issue earlier."
- "This incident has been added to our data quality runbook. Detection time goal for similar issues: [X] hours."
- "Post-mortem findings and preventive actions are documented at [link]."

## Ongoing Quality Reporting

- "Data quality score for [period]: [X]% of checks passing, [Y] issues detected, [Z] resolved."
- "Pipeline reliability this [period]: [X]% on-time delivery, [Y] incidents, average resolution time [Z] hours."
- "No active data quality issues. All monitored pipelines are operating within SLA."
- "There are [X] open data quality issues. [Y] are high priority. Details in the data quality tracker at [link]."
