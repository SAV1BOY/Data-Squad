# Alert Incidents

This subdirectory contains records of past alert firings, investigations, and resolutions.

## Purpose

Incident records create institutional memory. By documenting what happened, what was found, and how it was resolved, the team builds a knowledge base that accelerates future incident response and reveals systemic patterns.

## What Goes Here

- Incident reports for each alert firing that required investigation
- Root cause analyses for significant incidents
- Post-incident review summaries with action items
- False positive records documenting alerts that fired without a real issue
- Trend analyses identifying recurring incident patterns

## Conventions

- Name files with the date and alert name: `2026-02-18-mau-drop-alert.md`
- Structure each incident report with: trigger time, alert details, investigation steps, root cause, resolution, and follow-up actions
- Record the time-to-detection, time-to-response, and time-to-resolution
- Flag any runbook gaps discovered during the incident
- Link to any data debt items, quality issues, or process changes that resulted from the incident
- Review incident history quarterly to identify patterns and prioritize systemic fixes
