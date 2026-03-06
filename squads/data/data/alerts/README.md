# Alerts

This directory contains alert definitions, runbooks, and incident records for data and metric monitoring.

## Purpose

Alerts are the early warning system that detects when metrics, pipelines, or data quality deviate from expected behavior. This directory holds the detailed configuration, response procedures, and historical incident records. The alert registry (`registries/alert-registry.yaml`) provides the index; this directory provides the operational detail.

## What Goes Here

- Detailed alert definitions including thresholds, conditions, and notification routing
- Runbooks with step-by-step response procedures for each alert
- Incident records documenting when alerts fired, what was found, and how it was resolved
- Post-incident reviews and root cause analyses
- Alert tuning proposals (threshold adjustments, new alerts, retired alerts)

## Subdirectories

- `definitions/` - Detailed alert specifications and runbooks
- `incidents/` - Records of past alert firings, investigations, and resolutions

## Conventions

- Name alert definition files after the alert: `mau-drop-alert.md`
- Name incident files with the date and alert: `2026-02-18-mau-drop-alert.md`
- Every alert must have a runbook before it is activated
- Review alert thresholds quarterly to prevent alert fatigue from overly sensitive triggers
- After every incident, update the runbook if the response procedure proved incomplete
- Track false positive rates to identify alerts that need tuning
