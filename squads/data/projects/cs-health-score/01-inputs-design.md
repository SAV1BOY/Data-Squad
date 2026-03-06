# CS Health Score - Inputs Design

## Phase Objective

Identify, evaluate, and select the specific signals that will feed the customer health score. Each signal must be mapped to a reliable data source, assessed for predictive power against the defined target, and validated for coverage across the customer base. The inputs design determines the score's ceiling of accuracy.

## Prerequisites

- Completed brief from Phase 00 with prediction target and customer universe defined
- Data source catalog with coverage and quality assessments
- CSM interview synthesis identifying intuitive health signals
- Historical outcome data (churn labels) for at least 12 months for signal validation
- SQL access to all relevant data sources for exploratory analysis

## Steps

1. **Generate the Candidate Signal List**: Compile a comprehensive list of potential health score inputs from three sources. First, signals identified by CSMs during interviews (stakeholder engagement, usage trends, support sentiment). Second, signals suggested by literature and industry practice (login frequency, feature adoption breadth, NPS scores, payment reliability). Third, signals discovered through data exploration (unusual patterns in usage data, correlations between behavioral metrics and churn). Cast a wide net at this stage; pruning comes later.

2. **Categorize Signals by Domain**: Organize candidate signals into logical categories that map to different aspects of customer health. Common categories include Product Engagement (login frequency, DAU/MAU ratio, feature usage breadth, session duration trends), Support Health (ticket volume, ticket severity, resolution time, CSAT scores), Commercial Health (payment history, contract value trend, expansion/contraction), Relationship Strength (executive sponsor engagement, number of active users, champion presence), and Outcome Signals (NPS, survey responses, renewal intent stated in meetings).

3. **Calculate Signal Availability**: For each candidate signal, determine what percentage of the scored customer base has reliable data. Signals with less than 60% coverage should be flagged as supplementary rather than core components. Calculate whether missing data is random (customer did not trigger the event) or systematic (data source does not cover certain segments). Systematic gaps may require alternative signals for uncovered segments.

4. **Assess Univariate Predictive Power**: For each candidate signal, calculate its individual correlation with the prediction target. Use appropriate measures: point-biserial correlation for continuous signals against a binary churn outcome, chi-squared test for categorical signals, and time-series analysis for trend signals. Rank signals by predictive power. Eliminate signals that show no meaningful correlation with the target, as they would add noise without improving accuracy.

5. **Analyze Signal Redundancy**: Examine correlations between candidate signals. Highly correlated signals (correlation above 0.8) provide redundant information and including both adds complexity without improving prediction. When two signals are redundant, retain the one with higher coverage, greater predictive power, or better interpretability. Create a correlation matrix and visualize it as a heatmap to identify clusters of redundant signals.

6. **Engineer Derived Signals**: Raw signals often need transformation to maximize predictive power. Convert absolute values to trends (login count this month versus last month). Create ratios that normalize for account size (active users divided by licensed seats). Build composite signals that combine related metrics (a support health composite that combines ticket volume, severity, and resolution satisfaction). Calculate time-since metrics (days since last login, days since last support ticket).

7. **Validate Signal Temporal Behavior**: For each signal, examine how it behaves over time relative to the churn event. Plot the average signal value at 90, 60, 30, and 14 days before churn. Signals that change only in the final days before churn are less useful than signals that shift weeks or months earlier. Early-warning signals are the most valuable because they provide time for intervention.

8. **Select the Final Signal Set**: Based on predictive power, coverage, redundancy analysis, and temporal behavior, select the final set of signals for the health score. A typical health score uses 8-15 signals spanning at least 3-4 categories. Document the rationale for including each signal and for excluding strong candidates that did not make the cut. The final signal set should balance predictive accuracy with operational simplicity.

9. **Define Signal Refresh Requirements**: For each selected signal, specify how frequently it needs to be updated. Product engagement signals may need daily updates. Support signals may be updated when tickets are resolved. Commercial signals update at billing events. Determine whether the overall health score refresh cadence is daily, weekly, or event-triggered, and ensure all signal pipelines can meet this cadence.

## Deliverables

- Candidate signal list with 30-50 potential inputs organized by category
- Signal availability report showing coverage percentage for each candidate
- Univariate predictive power analysis ranking all candidates by correlation with target
- Signal correlation matrix identifying redundant inputs
- Derived signal specifications with calculation formulas and rationale
- Temporal behavior analysis showing when each signal shifts relative to churn
- Final signal set selection (8-15 signals) with inclusion/exclusion rationale
- Signal refresh requirement document with data pipeline specifications

## Quality Gate

Inputs design is complete when all of the following conditions are met:

- At least 30 candidate signals have been evaluated across 4 or more categories
- Each selected signal has demonstrated statistically significant predictive power against the target
- No two selected signals have correlation above 0.8 (redundancy eliminated)
- Selected signals collectively cover at least 80% of the scored customer base
- Temporal analysis confirms that at least 50% of selected signals shift 30+ days before churn
- Signal refresh pipelines are confirmed feasible at the required cadence
- CSMs have reviewed the final signal set and confirmed it aligns with their intuitive assessment
- Each signal has a documented calculation formula and data source mapping

## Next Phase

Proceed to **02-scoring-model.md** (Scoring Model) to combine the selected signals into a composite health score using appropriate weighting and thresholding.
