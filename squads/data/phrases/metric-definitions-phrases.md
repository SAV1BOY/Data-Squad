# Metric Definitions Phrases

## Purpose

Standardized phrases for defining metrics. Use these to eliminate ambiguity when referencing metrics in reports, dashboards, and communications.

## Defining a Metric

- "[Metric name] measures [what it counts or calculates] over [time period], for [population]."
- "[Metric name] is defined as [numerator] divided by [denominator], expressed as a [percentage/ratio/count]."
- "We calculate [metric] by [method], using data from [source table/system]."
- "This metric includes [what is in scope] and excludes [what is out of scope]."
- "[Metric] is measured at the [user/account/session/event] level."

## Specifying Scope and Filters

- "This metric applies to [segment], defined as [criteria]."
- "Filtered to users who [specific condition], excluding [exclusion criteria]."
- "The population for this metric is [definition], representing approximately [count] [users/accounts]."
- "Active user is defined as any user with at least [X] [sessions/events/actions] in the past [time period]."
- "New users are those whose account creation date falls within the reporting period."
- "Churned accounts are those with no activity for [X] consecutive days and no active subscription."

## Specifying Time

- "Measured over a [rolling/calendar] [day/week/month] period."
- "The reporting period is [start date] to [end date], inclusive."
- "This is a trailing [X]-day metric, recalculated daily."
- "Cohort date is based on [signup date/first activity date/subscription start date]."
- "Week is defined as Monday through Sunday, aligned to UTC."

## Clarifying Calculations

- "Retention is calculated as: (users active in period N who were also active in period N-1) / (users active in period N-1)."
- "MRR includes recurring subscription revenue only. One-time charges, usage overages, and credits are excluded."
- "Conversion rate = (users who completed [target action]) / (users who entered [funnel stage]), measured within [time window]."
- "NPS is calculated as (% Promoters) minus (% Detractors), on a scale of -100 to +100."
- "LTV is calculated as average revenue per account multiplied by average account lifespan in months."
- "Activation rate = users who completed [specific milestone] within [X] days of signup / total signups."

## Noting Changes and Versioning

- "This metric definition was updated on [date]. Prior values are not directly comparable."
- "Previously, [metric] included [old scope]. As of [date], it now includes [new scope]."
- "Historical values have been backfilled using the updated definition for consistency."
- "This metric replaces [old metric name], which was deprecated on [date]."

## Handling Edge Cases

- "Users with zero activity are included in the denominator but not the numerator."
- "If a user has multiple accounts, each account is counted separately."
- "Free trial users are excluded unless they convert to a paid plan within the trial period."
- "Bot and internal test accounts are excluded using the [filter/flag] in the [table]."
- "Duplicate events are deduplicated based on [user_id + event_type + timestamp] within a [X]-minute window."

## Comparing Metrics

- "[Metric A] differs from [Metric B] in that it [key difference]."
- "While both metrics measure [concept], [Metric A] uses [method A] and [Metric B] uses [method B]."
- "Do not confuse [Metric A] with [Metric B]. The former measures [X], the latter measures [Y]."
