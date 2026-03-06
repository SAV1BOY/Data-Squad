# Definitions

This directory contains the detailed, authoritative definitions for metrics, events, and dashboards that go beyond the summary entries in the registries.

## Purpose

The registries provide a structured, machine-readable overview of every metric, event, and dashboard. This directory complements them with human-readable, detailed definition documents that explain nuances, edge cases, historical changes, and interpretation guidance.

## What Goes Here

- Expanded metric definition documents with calculation examples, known caveats, and stakeholder context
- Event definition documents with payload schemas, sample payloads, and integration notes
- Dashboard specification documents describing layout, intended audience, and refresh logic
- Definition change proposals and approval records

## Subdirectories

- `metric-definitions/` - One file per metric with full specification and context
- `event-definitions/` - One file per tracked event with schema, examples, and integration details
- `dashboards/` - Dashboard specifications including layout, filters, and access control

## Conventions

- Name files after the entity they define: `monthly-active-users.md`, `user-signup-event.md`
- Include a version number and last-updated date at the top of each definition
- When updating a definition, add a changelog entry at the bottom of the file
- Cross-reference the registry entry and any related decisions from the decision registry
- Definitions are the source of truth for any ambiguity in how a metric or event should be interpreted
