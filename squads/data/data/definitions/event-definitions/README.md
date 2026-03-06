# Event Definitions

This subdirectory contains the full specification for each tracked event including schema, sample payloads, and integration details.

## Purpose

The event registry provides a structured overview of each event. This directory holds the detailed documentation needed by engineers implementing tracking, analysts querying event data, and data engineers maintaining pipelines.

## What Goes Here

- One file per event with the complete schema and property descriptions
- Sample payloads showing realistic event data
- Integration notes specifying where and how the event is fired in the codebase
- Validation rules defining what constitutes a valid event
- Known issues or quirks with specific event implementations
- Migration notes when event schemas change

## Conventions

- Name files after the event: `user-signup.md`, `feature-used.md`
- Include a JSON sample payload in each file
- Document required vs. optional properties and their expected value ranges
- Maintain a schema version history to support backward-compatible evolution
- Flag any events with known data quality issues (reference data-quality-registry.yaml)
- Coordinate event definition changes with the engineering team before implementation
