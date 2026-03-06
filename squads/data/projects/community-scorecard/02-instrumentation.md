# Community Scorecard - Instrumentation

## Phase Objective

Implement the data collection, integration, and transformation pipelines needed to calculate every metric defined in the scorecard. This phase bridges the gap between metric definitions on paper and actual computable numbers by connecting to community platform APIs, configuring event tracking, setting up survey instruments, and building the data transformations that produce scorecard-ready metrics.

## Prerequisites

- Complete metric definitions from Phase 01 with formulas, data sources, and frequencies
- API access to the community platform with appropriate authentication and rate limits
- Data warehouse or analytics database for storing and transforming community data
- Survey tool access for belonging metrics (Typeform, SurveyMonkey, in-platform surveys)
- Engineering support for API integration and pipeline construction

## Steps

1. **Map Each Metric to Its Data Pipeline**: For every metric in the data dictionary, trace the exact data path from raw source to calculated value. Identify which metrics can be computed directly from community platform API exports, which require joining community data with product or business data, which need survey collection, and which require custom event tracking not currently available. This mapping becomes the instrumentation work plan.

2. **Configure Community Platform API Integration**: Set up automated data extraction from the community platform. Most platforms (Discourse, Slack, Discord, Circle, Khoros) provide APIs for pulling member data, activity data, content data, and moderation data. Configure scheduled API pulls at the required frequency. Implement pagination handling for large datasets, rate limit management, and error handling for API failures. Store raw data in the warehouse before transformation.

3. **Implement Custom Event Tracking**: For metrics that require tracking beyond what the platform API provides, implement custom instrumentation. This may include tracking content views (to calculate lurker-to-contributor ratio), tracking search queries (to understand information-seeking behavior), tracking cross-platform journeys (community to product, community to support), and tracking content referral chains. Use the same tracking infrastructure established for product analytics where possible.

4. **Set Up Survey Collection**: For belonging metrics and qualitative health signals, configure recurring survey instruments. Design a brief community health survey (5-7 questions, under 2 minutes to complete) covering belonging, satisfaction, and NPS. Set up distribution through in-community prompts, email, or both. Target a 15-25% response rate to ensure statistical validity. Schedule surveys monthly or quarterly depending on community size and the sensitivity of the belonging dimension.

5. **Build Data Joining Logic**: Several scorecard metrics require joining community data with product or business data. Community member retention versus non-member retention requires matching community identities to product user accounts. Support deflection requires comparing community topic data with support ticket data. Revenue impact requires linking community membership to subscription or transaction records. Build and validate the identity matching logic, handling cases where community usernames differ from product accounts.

6. **Create Metric Calculation Transformations**: Build the SQL queries, scripts, or data models that transform raw data into calculated metrics. For each metric, implement the exact formula from the data dictionary. Include data quality checks within each transformation: null handling, outlier capping, and boundary validation (no percentages above 100%, no negative counts). Schedule transformations to run after data extraction completes and before dashboards refresh.

7. **Implement the Composite Index Calculation**: Build the calculation that combines individual dimension scores into the composite scorecard index. Normalize each dimension to the 0-100 scale using the defined methodology (percentile ranking, min-max scaling, or target-based scoring). Apply the dimension weights from the metrics definition phase. Store both the composite index and the individual dimension scores for each calculation period.

8. **Validate Data Accuracy**: For each metric, perform accuracy validation by comparing calculated values against manually verified samples. Select 5-10 members and manually count their posts, replies, reactions, and other activities. Compare manual counts against the pipeline-calculated values. Investigate any discrepancies (common causes include timezone handling, deleted content inclusion, and bot activity contamination). Repeat validation for aggregate metrics by checking against platform-reported analytics where available.

9. **Document the Instrumentation**: Create comprehensive documentation of every data pipeline component. Include API endpoints and authentication, extraction schedules and error handling procedures, transformation logic with SQL or code references, data quality checks and their thresholds, and the dependencies between pipeline stages. This documentation ensures that the instrumentation can be maintained by someone who did not build it.

## Deliverables

- Data pipeline map tracing each metric from raw source to calculated value
- Community platform API integration configured with automated extraction
- Custom event tracking implementation for metrics requiring additional instrumentation
- Survey instrument configured with distribution schedule and response collection
- Identity matching logic joining community members to product and business records
- Metric calculation transformations (SQL/code) for all scorecard metrics
- Composite index calculation with normalization and weighting
- Data accuracy validation report comparing pipeline output against manual verification
- Instrumentation documentation covering all pipeline components

## Quality Gate

Instrumentation is complete when all of the following conditions are met:

- Every metric in the data dictionary has a functional data pipeline producing calculated values
- API extraction runs automatically at the required frequency without manual intervention
- Survey collection is operational with at least one completed survey cycle
- Identity matching covers at least 80% of community members with product account links
- Data accuracy validation shows less than 5% discrepancy between pipeline and manual counts
- The composite index calculation produces valid scores for at least 90% of measurement periods
- All pipelines have error handling and alerting for extraction or transformation failures
- Documentation is complete enough for a new team member to troubleshoot pipeline issues

## Next Phase

Proceed to **03-dashboard.md** (Dashboard) to build the community scorecard visualization that presents the metrics to all stakeholder audiences.
