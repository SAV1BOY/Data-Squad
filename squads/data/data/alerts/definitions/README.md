# Alert Definitions

This subdirectory contains the detailed specifications and runbooks for each configured alert.

## Purpose

Every alert needs a clear definition of what it monitors, when it fires, and what to do when it triggers. This directory holds the comprehensive documentation that the alert registry summarizes.

## What Goes Here

- One file per alert with the full specification: condition, threshold, severity, and notification routing
- Detailed runbooks with step-by-step response procedures
- Threshold justification explaining why specific values were chosen
- Historical tuning notes documenting threshold adjustments and the reasons behind them
- Dependencies and prerequisites (what data sources must be healthy for the alert to be meaningful)

## Conventions

- Name files after the alert: `mau-drop-alert.md`, `pipeline-freshness-alert.md`
- Every alert file must include a runbook section with numbered response steps
- Document who to escalate to and under what conditions
- Review and update runbooks after every incident that reveals gaps
- Include expected false positive scenarios so on-call responders can triage quickly
- Track the alert's signal-to-noise ratio and adjust thresholds if false positives exceed 20%
