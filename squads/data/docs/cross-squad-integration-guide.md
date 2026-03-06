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

### Product Squad
- **We provide:** Metric definitions, experiment design and analysis, feature impact measurement, activation and retention analysis.
- **They provide:** Feature context, product roadmap, user research insights, experiment implementation.
- **Handoff format:** Analysis deliverables follow the data-storytelling-workflow. Experiment results follow the experiment-cycle-workflow format.
- **Sync cadence:** Weekly async update, monthly sync for roadmap alignment.

### Engineering Squad
- **We provide:** Tracking specifications, data quality bug reports, instrumentation requirements, pipeline issue reports.
- **They provide:** Instrumentation implementation, pipeline infrastructure, data source access, schema change notifications.
- **Handoff format:** Tracking specs use the standardized template with event names, properties, types, and example payloads. Bug reports include reproduction steps and expected vs. actual data.
- **Sync cadence:** As-needed for tracking implementation, weekly async for pipeline health.

### Marketing Squad
- **We provide:** Campaign attribution analysis, channel performance metrics, CLV by acquisition channel, audience segment definitions.
- **They provide:** Campaign calendar, creative variants, channel spend data, attribution requirements.
- **Handoff format:** Reports follow standard templates with methodology documentation. Segment definitions include SQL-level criteria.
- **Sync cadence:** Monthly sync for campaign performance review.

### Customer Success Squad
- **We provide:** Customer health scores, usage reports, churn risk flags, expansion opportunity signals.
- **They provide:** Qualitative customer feedback, renewal outcomes, intervention results, feature requests.
- **Handoff format:** Health scores delivered via automated dashboard. Alerts follow the cs-health-early-warning-workflow format.
- **Sync cadence:** Weekly automated health score delivery, monthly sync for model review.

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
