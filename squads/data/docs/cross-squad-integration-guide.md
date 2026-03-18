# Cross-Squad Integration Guide

## Purpose

This guide defines how the Data Squad works with other squads: how to request data support, what formats to use for handoffs, and how to maintain productive working relationships without creating dependency bottlenecks.

## How Other Squads Work with Us

### Submitting a Request
All data requests from other squads go through the standard intake form. The form asks for:
- **Requester name and squad**
- **The question you need answered** (not "I need a dashboard" but "I need to understand why conversion dropped last week")
- **The decision this will inform** (what will you do differently based on the answer?)
- **Deadline** (when do you need this by, and why that date?)
- **Context** (what do you already know? what have you already tried?)

Do not submit requests via Slack DM, hallway conversations, or email. These will be redirected to the intake form. This is not bureaucracy; it ensures we understand your need correctly and can prioritize fairly.

### What to Expect
- **Acknowledgment** within 1 business day with estimated delivery timeline.
- **Scoping conversation** if the request is ambiguous or complex.
- **Delivery** per the SLA for the request type (see cross-squad-data-delivery-workflow).
- **Walkthrough** of the results to ensure you can interpret and act on them.
- **Feedback request** within 1 week of delivery.

### Self-Service First
Before submitting a request, check if the answer is available through self-service:
- Dashboard catalog: browse existing dashboards by topic.
- Metric registry: look up official metric definitions and current values.
- FAQ: check if your question has been asked before.

If you can answer your question with existing tools, that is the fastest path.

## How We Work with Other Squads

### Traffic Squad
- **We provide:** Attribution reports showing what actually works, incrementality results identifying what is truly incremental, audience segments for targeting.
- **They provide:** Ad performance data (CAC, ROAS, CPA), campaign tracking data (UTMs, events).
- **Handoff format:** Attribution reports follow the data-storytelling-workflow. Audience segments include SQL-level criteria and are delivered to traffic/tasks/. Incrementality results are delivered to traffic/frameworks/.
- **Shared assets:** utm-taxonomy, attribution-reports.
- **Sync cadence:** Weekly async update, monthly sync for attribution model review.

### Copy Squad
- **We provide:** Conversion metrics showing which copy converts, funnel dropoff insights identifying where copy fails.
- **They provide:** Conversion copy variants with A/B test data.
- **Handoff format:** Experiment results follow the experiment-cycle-workflow format. Conversion metrics are delivered to copy/data/. Funnel dropoff insights are delivered to copy/tasks/.
- **Shared assets:** experiment-results.
- **Sync cadence:** As-needed for experiment analysis, weekly async for conversion metric updates.

### Brand Squad
- **We provide:** Brand health metrics (NPS, sentiment, awareness), brand search trends (share of search).
- **They provide:** Brand awareness data (recall, recognition).
- **Handoff format:** Brand health metrics are delivered to brand/data/ with methodology documentation. Search trend reports are delivered to brand/reference/.
- **Shared assets:** brand-health-dashboard.
- **Sync cadence:** Monthly sync for brand health review.

### Design Squad
- **We provide:** HEART metrics (UX quantified), feature adoption data showing what is used and what is not.
- **They provide:** Usability test data (UX metrics).
- **Handoff format:** HEART metrics are delivered to design/data/metrics/. Feature adoption reports are delivered to design/tasks/ with segmentation by user cohort and device.
- **Shared assets:** heart-metrics, feature-adoption-data.
- **Sync cadence:** As-needed for usability test analysis, monthly sync for HEART metric review.

### Movement Squad
- **We provide:** Movement health score (quantified community health), community ROI (business impact of community activity).
- **They provide:** Community engagement data and signals.
- **Handoff format:** Movement health scores are delivered to movement/data/metrics/. Community ROI reports are delivered to movement/reports/ following the data-storytelling-workflow with attribution methodology documented.
- **Shared assets:** community-scorecard, movement-health-score.
- **Sync cadence:** Weekly automated health score delivery, monthly sync for community ROI review.

### Storytelling Squad
- **We provide:** Data narratives (data as raw material for stories), proof points (evidence for narratives).
- **They provide:** Narrative performance data (narrative engagement metrics).
- **Handoff format:** Data narratives are delivered to storytelling/data/ with context, caveats, and interpretation guides. Proof points are delivered to storytelling/reference/ with source documentation.
- **Shared assets:** data-narratives.
- **Sync cadence:** As-needed for narrative support, monthly async for proof point updates.

## Handoff Standards

### Data Deliverables
Every data deliverable to another squad includes:
1. **Executive summary:** 3 sentences covering the question, the answer, and the recommended action.
2. **Methodology section:** How the analysis was done, including data sources, time ranges, and assumptions.
3. **Limitations section:** What the analysis does not cover, where the data may be incomplete, and what caveats apply.
4. **Next steps:** Specific recommended actions with owners (proposed, not assigned -- the receiving squad assigns).

### Data Feeds
Recurring data feeds to other squads include:
1. **Schema documentation:** Table structure, column descriptions, data types, and update frequency.
2. **SLA:** Freshness commitment and who to contact if the feed is late.
3. **Change notification:** 2 weeks advance notice before any schema or logic changes.

## Boundaries

**We do not:**
- Build dashboards that only one person will use (help them self-serve instead).
- Provide data without context (every delivery includes interpretation).
- Accept "urgent" requests that skip the intake process without VP-level approval.
- Maintain data products for other squads (we build and hand off; they own ongoing maintenance unless the product serves multiple squads).

**We do:**
- Help other squads build self-service capability.
- Provide training on the BI tool and basic data literacy.
- Accept feedback and improve our delivery process continuously.
- Proactively share insights that affect other squads even when not requested.
