# Dashboard Definitions

This subdirectory contains the detailed specification for each official dashboard including layout, metrics, filters, and access control.

## Purpose

Dashboard definitions serve as the blueprint for what each dashboard should contain and how it should behave. They enable consistent rebuilding, review, and evolution of dashboards over time.

## What Goes Here

- One file per dashboard with layout specifications and metric placements
- Filter and interactivity descriptions
- Access control and audience definitions
- Refresh cadence and data source dependencies
- Design rationale explaining why specific metrics and layouts were chosen
- Stakeholder feedback and requested changes

## Conventions

- Name files after the dashboard: `exec-overview.md`, `growth-dashboard.md`
- Reference the dashboard registry entry and the Metabase URL
- Include the intended audience and their key questions the dashboard answers
- Document any calculated fields or custom SQL used within the dashboard
- Track change requests and their resolution status
- Review specifications against the live dashboard quarterly to ensure they remain in sync
