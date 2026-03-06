# Community Metrics Workflow

## Purpose
Measure community health through engagement loops, identify meaningful signals in community behavior, maintain a community scorecard, and translate findings into actionable improvements.

## Trigger
- Monthly community health review cadence
- Community engagement drops below baseline for two consecutive weeks
- New community feature or program launches
- Community-related OKR planning cycle

## Agents Involved
- **Retention Strategist**: Leads community health analysis and action design
- **Analytics Architect**: Builds community data models and instrumentation
- **Insight Narrator**: Creates the community scorecard and communicates findings
- **Data Quality Sentinel**: Ensures community data integrity

## Steps

### Phase 1: Loop Mapping (Initial setup, then quarterly refresh)
1. **Retention Strategist** maps the community engagement loops: content creation -> consumption -> reaction -> discussion -> creation.
2. **Analytics Architect** instruments each loop stage with events: posts created, views, reactions, comments, shares, follows.
3. **Retention Strategist** identifies the key transitions that indicate deepening engagement (lurker -> reactor -> contributor -> champion).
4. **Analytics Architect** builds a community funnel model tracking user progression through engagement stages.

### Phase 2: Signal Identification (Weekly)
5. **Analytics Architect** computes weekly community metrics: DAU/MAU ratio, content velocity, reply rate, time-to-first-response, champion activity.
6. **Retention Strategist** reviews metrics against baselines and flags anomalies: sudden drops, unusual spikes, engagement pattern shifts.
7. **Retention Strategist** segments community members by engagement stage and tracks migration between stages.
8. **Data Quality Sentinel** validates data completeness: checks for missing events, duplicate counts, or bot-generated noise.
9. **Retention Strategist** identifies leading indicators: which behaviors this week predict engagement changes next week?

### Phase 3: Scorecard Maintenance (Monthly)
10. **Insight Narrator** updates the community health scorecard with current metrics, trends, and comparisons to targets.
11. **Insight Narrator** adds qualitative context: notable community moments, emerging topics, sentiment shifts.
12. **Insight Narrator** highlights the top 3 signals from the month: what changed, why it matters, what it predicts.
13. **Retention Strategist** reviews the scorecard for accuracy and adds strategic interpretation.

### Phase 4: Action Design (Monthly)
14. **Retention Strategist** proposes actions based on scorecard findings: feature requests, moderation changes, content programs, recognition initiatives.
15. **Retention Strategist** prioritizes actions by expected impact on the weakest community loop stage.
16. **Insight Narrator** documents each proposed action with rationale, expected outcome, and measurement plan.
17. **Retention Strategist** assigns owners and timelines for each action.

### Phase 5: Measure and Iterate (Ongoing)
18. **Analytics Architect** tracks the impact of each action on community metrics.
19. **Retention Strategist** evaluates action effectiveness after one full cycle (typically 4-6 weeks).
20. **Insight Narrator** publishes the monthly community metrics report to stakeholders.
21. **Retention Strategist** updates the loop map and engagement stage definitions based on learnings.

## Inputs
- Community platform event data (posts, comments, reactions, follows)
- User profile data (join date, engagement stage, roles)
- Content metadata (topics, categories, formats)
- Historical community metrics for baseline comparison

## Outputs
- Community engagement loop map with instrumented metrics
- Weekly signal reports with anomaly flags
- Monthly community health scorecard
- Action proposals with measurement plans
- Quarterly loop model refresh

## Quality Gates

| Gate | Criteria | Owner |
|------|----------|-------|
| G1: Loops Instrumented | Every loop stage has at least one tracked event with validated data | Analytics Architect |
| G2: Signals Validated | Anomalies confirmed against at least 2 data points before escalation | Retention Strategist |
| G3: Scorecard Current | Scorecard updated within 5 business days of month-end | Insight Narrator |
| G4: Actions Measurable | Every proposed action has a defined metric and measurement period | Retention Strategist |
| G5: Bot Noise Filtered | Community metrics exclude known bot activity and spam | Data Quality Sentinel |

## Registry Updates
- **Metric Registry**: Register community metrics with definitions, owners, and calculation methods.
- **Scorecard Registry**: Document scorecard structure, metrics included, and distribution list.
- **Action Log**: Record all community actions, expected outcomes, and actual results.
- **Engagement Stage Definitions**: Update stage thresholds and transition criteria quarterly.
