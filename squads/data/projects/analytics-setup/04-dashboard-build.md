# Analytics Setup - Dashboard Build

## Phase Objective

Build dashboards that transform raw analytics data into clear, actionable visualizations aligned with stakeholder needs. Each dashboard must answer specific business questions, use reliable data sources, and be designed for the audience that will use it daily.

## Prerequisites

- Tracking implementation complete and verified from Phase 03
- Data flowing reliably to the data warehouse or analytics tool
- Stakeholder interviews completed to understand reporting needs
- Access to the visualization tool (Looker, Tableau, Metabase, etc.)
- Style guide or design standards for the organization's reporting

## Steps

1. **Define Dashboard Questions**: For each stakeholder group identified in the project brief, list the specific questions they need answered on a recurring basis. Product teams need conversion funnels and feature adoption. Marketing needs channel attribution and campaign performance. Executives need revenue trends and growth indicators. Every chart on every dashboard must answer a documented question.

2. **Map Data Sources to Questions**: For each question, identify which tables, events, and metrics provide the answer. Document any required joins, aggregations, or transformations. Flag questions that require data from multiple sources and plan the integration logic. Identify any questions that cannot yet be answered due to data gaps.

3. **Design Dashboard Layouts**: Sketch wireframes for each dashboard before building. Place the most critical metrics at the top left where attention naturally falls. Group related metrics together. Use consistent chart types for similar data (line charts for trends, bar charts for comparisons, tables for detailed breakdowns). Limit each dashboard to 6-8 visualizations to prevent cognitive overload.

4. **Build Metric Definitions Layer**: Before creating individual charts, establish a metrics layer or semantic model that defines each metric once. This includes revenue calculations, active user definitions, conversion rate formulas, and retention calculations. Centralized definitions prevent conflicting numbers across dashboards and enable self-service exploration.

5. **Construct Core Dashboards**: Build the dashboards in priority order. Start with the executive overview dashboard that provides a high-level health check. Follow with departmental dashboards for product, marketing, and customer success. Finally, build operational dashboards for monitoring and debugging. For each dashboard, implement date range filters, segment filters, and comparison periods.

6. **Add Context and Annotations**: Raw numbers without context are misleading. Add comparison periods (week-over-week, month-over-month, year-over-year) to every trend. Include targets and benchmarks where available. Build in annotation capabilities so users can mark events (product launches, marketing campaigns, outages) that explain data shifts.

7. **Implement Alerting**: Configure automated alerts for metrics that deviate significantly from expected ranges. Set thresholds for conversion rate drops, traffic anomalies, revenue shortfalls, and error spikes. Route alerts to the appropriate team via email or messaging integration. Include enough context in each alert for the recipient to begin investigation immediately.

8. **Set Up Refresh Schedules**: Configure data refresh intervals appropriate for each dashboard's use case. Executive dashboards may refresh daily. Operational dashboards may need hourly or near-real-time updates. Document the refresh schedule and any known latency between event occurrence and dashboard availability.

9. **Conduct Stakeholder Review**: Present each dashboard to its intended audience. Walk through every visualization, explain the data source, and confirm it answers the right question. Collect feedback on layout, missing metrics, and usability. Iterate based on feedback before declaring the dashboard complete.

## Deliverables

- Executive overview dashboard with key business health metrics
- Departmental dashboards for product, marketing, and customer success
- Metrics definition document or configured semantic layer
- Dashboard wireframes and design rationale
- Alerting configuration with thresholds and routing rules
- Data refresh schedule documentation

## Quality Gate

Dashboard build is complete when all of the following conditions are met:

- Every question documented in Step 1 is answered by a visualization on a dashboard
- Metric definitions are consistent across all dashboards with no conflicting numbers
- Each dashboard has been reviewed and approved by its primary stakeholder group
- Alerts are configured and have been tested with simulated threshold breaches
- Data refresh schedules are documented and verified to meet stakeholder timeliness needs
- All dashboards load within 10 seconds on standard hardware
- Comparison periods and contextual benchmarks are included on every trend visualization
- A self-service exploration layer exists for analysts who need to go beyond pre-built dashboards
- Dashboard documentation describes each visualization's data source and intended interpretation

## Next Phase

Proceed to **05-qa-validation.md** (QA and Validation) to perform end-to-end testing of the complete data flow from event firing to dashboard display. The dashboards built in this phase will be tested for accuracy and reliability in the validation process.
