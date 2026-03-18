# Community Metrics Workflow

## Purpose
Measure community health through engagement loops, identify meaningful signals in community behavior, maintain a community scorecard, and translate findings into actionable improvements.

## Trigger
- Monthly community health review cadence
- Community engagement drops below baseline for two consecutive weeks
- New community feature or program launches
- Community-related OKR planning cycle

## Agents Involved
- **david-spinks**: Leads community health analysis and action design
- **avinash-kaushik**: Builds community data models and instrumentation
- **wes-kao**: Creates the community scorecard and communicates findings
- **avinash-kaushik**: Ensures community data integrity

## Steps

### Phase 1: Loop Mapping (Initial setup, then quarterly refresh)
1. **david-spinks** maps the community engagement loops: content creation -> consumption -> reaction -> discussion -> creation.
2. **avinash-kaushik** instruments each loop stage with events: posts created, views, reactions, comments, shares, follows.
3. **david-spinks** identifies the key transitions that indicate deepening engagement (lurker -> reactor -> contributor -> champion).
4. **avinash-kaushik** builds a community funnel model tracking user progression through engagement stages.

### Phase 2: Signal Identification (Weekly)
5. **avinash-kaushik** computes weekly community metrics: DAU/MAU ratio, content velocity, reply rate, time-to-first-response, champion activity.
6. **david-spinks** reviews metrics against baselines and flags anomalies: sudden drops, unusual spikes, engagement pattern shifts.
7. **david-spinks** segments community members by engagement stage and tracks migration between stages.
8. **avinash-kaushik** validates data completeness: checks for missing events, duplicate counts, or bot-generated noise.
9. **david-spinks** identifies leading indicators: which behaviors this week predict engagement changes next week?

### Phase 3: Scorecard Maintenance (Monthly)
10. **wes-kao** updates the community health scorecard with current metrics, trends, and comparisons to targets.
11. **wes-kao** adds qualitative context: notable community moments, emerging topics, sentiment shifts.
12. **wes-kao** highlights the top 3 signals from the month: what changed, why it matters, what it predicts.
13. **david-spinks** reviews the scorecard for accuracy and adds strategic interpretation.

### Phase 4: Action Design (Monthly)
14. **david-spinks** proposes actions based on scorecard findings: feature requests, moderation changes, content programs, recognition initiatives.
15. **david-spinks** prioritizes actions by expected impact on the weakest community loop stage.
16. **wes-kao** documents each proposed action with rationale, expected outcome, and measurement plan.
17. **david-spinks** assigns owners and timelines for each action.

### Phase 5: Measure and Iterate (Ongoing)
18. **avinash-kaushik** tracks the impact of each action on community metrics.
19. **david-spinks** evaluates action effectiveness after one full cycle (typically 4-6 weeks).
20. **wes-kao** publishes the monthly community metrics report to stakeholders.
21. **david-spinks** updates the loop map and engagement stage definitions based on learnings.

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
| G1: Loops Instrumented | Every loop stage has at least one tracked event with validated data | avinash-kaushik |
| G2: Signals Validated | Anomalies confirmed against at least 2 data points before escalation | david-spinks |
| G3: Scorecard Current | Scorecard updated within 5 business days of month-end | wes-kao |
| G4: Actions Measurable | Every proposed action has a defined metric and measurement period | david-spinks |
| G5: Bot Noise Filtered | Community metrics exclude known bot activity and spam | avinash-kaushik |

## Registry Updates
- **Metric Registry**: Register community metrics with definitions, owners, and calculation methods.
- **Scorecard Registry**: Document scorecard structure, metrics included, and distribution list.
- **Action Log**: Record all community actions, expected outcomes, and actual results.
- **Engagement Stage Definitions**: Update stage thresholds and transition criteria quarterly.
