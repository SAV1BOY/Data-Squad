# Platform Changes

This subdirectory tracks changes to external platforms, APIs, browsers, and regulations that affect data collection, analysis, or reporting.

## Purpose

The data team operates within an ecosystem of third-party platforms and regulatory environments that change frequently. Tracking these changes proactively prevents data quality surprises and ensures the team adapts collection and analysis methods before disruptions occur.

## What Goes Here

- Browser privacy updates (e.g., cookie deprecation timelines, tracking prevention changes)
- App store policy changes affecting event tracking or attribution
- Third-party API changes for data sources the team depends on (analytics platforms, payment processors, CRM)
- Regulatory changes affecting data collection, storage, or processing (GDPR updates, CCPA amendments)
- Platform SDK updates that may change event payloads or behavior

## Conventions

- Name files with the platform and change: `2026-03-safari-itp-update.md`
- Include the effective date, what changed, and the expected impact on our data
- Assess whether any current metrics, events, or models are affected
- Propose mitigation actions and link to any data debt items or quality issues created
- Review this directory monthly to ensure no upcoming changes are being missed
- Subscribe to relevant platform changelogs and regulatory newsletters to stay current
