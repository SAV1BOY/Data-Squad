# Dashboards

This directory contains documentation, specifications, and change logs for all official dashboards.

## Purpose

Dashboards are the primary way stakeholders consume data. This directory ensures every official dashboard has clear documentation covering its purpose, audience, metrics displayed, refresh cadence, and maintenance history. The dashboard registry (`registries/dashboard-registry.yaml`) provides the index; this directory holds the details.

## What Goes Here

- Dashboard specification documents (audience, metrics, layout, filters)
- Screenshots or wireframes of dashboard layouts for reference
- Change logs recording when dashboards were modified and why
- Stakeholder feedback and improvement requests
- Decommission notices for retired dashboards

## Subdirectories

- `exec/` - Executive-level dashboards for leadership and board reporting
- `growth/` - Growth and acquisition dashboards for the growth squad
- `retention/` - Retention and engagement dashboards for the product team
- `cs/` - Customer success dashboards for the CS team
- `community/` - Community health and engagement dashboards

## Conventions

- Each dashboard should have a specification file named after the dashboard: `exec-overview.md`
- Include the Metabase URL and access permissions in the specification
- Log all non-trivial changes (metric additions, filter changes, layout overhauls) in a changelog section
- Review each dashboard quarterly with its intended audience to ensure continued relevance
- When retiring a dashboard, move its spec to an `_archived/` subfolder with the retirement date
