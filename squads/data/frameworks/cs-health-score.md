# Customer Success Health Score Framework

## Overview

A Customer Success health score is a composite metric that estimates the likelihood a customer
will renew, expand, or churn. It compresses dozens of signals into a single actionable
indicator that CSMs and leadership can use to prioritize effort and allocate resources.

Building a health score is deceptively simple on the surface -- pick some inputs, assign
weights, produce a number. In practice, most health scores fail because they are not
validated against actual outcomes, drift over time without recalibration, or conflate
activity with health. This framework provides a rigorous approach to designing, validating,
calibrating, and maintaining health scores that actually predict customer outcomes.

## When to Use

- When the Customer Success team needs to prioritize their book of business and cannot
  rely on intuition alone (typically when the team manages more than 50 accounts per CSM).
- When leadership wants a portfolio-level view of customer health for board reporting
  or forecasting.
- When building an early warning system for at-risk accounts.
- When transitioning from a reactive CS model ("fight fires") to a proactive model
  ("prevent fires").

Do NOT use this framework for:
- Scoring individual product features or user satisfaction with specific interactions
  (use CSAT or feature-level NPS for that).
- Replacing human judgment entirely -- health scores augment CSM intuition, not replace it.
- Accounts in their first 30 days (insufficient data; use onboarding milestone tracking instead).

## Core Concept

A health score is a **predictive model dressed as a dashboard metric**. It must satisfy
two requirements simultaneously:

1. **Predictive validity**: The score must correlate with actual outcomes. Accounts scored
   as "healthy" should renew at materially higher rates than accounts scored as "at risk."
2. **Actionability**: The score's components must be decomposable so that when an account
   is flagged, the CSM knows *why* and can take specific action.

The tension between these two goals is real. A black-box ML model might predict churn
better, but a CSM cannot act on "the model says 73% churn probability." A simple
weighted score is more interpretable but may miss non-linear interactions.

The solution is a **layered approach**: a transparent weighted score for day-to-day use,
validated and calibrated against a more sophisticated predictive model behind the scenes.

## Steps / Process

### Step 1: Input Selection

Identify candidate inputs across four categories:

#### Product Engagement
- **Login frequency**: Days with at least one login per period (weekly or monthly).
- **Feature breadth**: Number of distinct features used out of total available.
- **Depth of use**: Volume of key actions (e.g., records created, reports run, integrations active).
- **Adoption of sticky features**: Usage of features known to correlate with retention
  (identify these empirically, not by assumption).
- **Trend direction**: Is usage increasing, stable, or declining over the past 30/60/90 days?

#### Relationship Quality
- **NPS or CSAT score**: Most recent survey response.
- **Executive sponsor engagement**: Has the executive sponsor been in contact in the last 90 days?
- **Multi-threading depth**: Number of distinct active users or stakeholder contacts.
- **Support sentiment**: Ratio of positive to negative support interactions.

#### Support and Risk Signals
- **Open critical tickets**: Count of unresolved P1/P2 support tickets.
- **Ticket velocity**: Is the rate of new tickets increasing?
- **Escalation history**: Any escalations in the past 90 days.
- **Overdue implementation milestones**: For newer accounts, are onboarding steps incomplete?

#### Commercial Signals
- **Contract end date proximity**: Accounts within 90 days of renewal need extra attention.
- **Payment history**: Any failed payments or late invoices.
- **Expansion signals**: Has the customer inquired about additional seats, features, or tiers?
- **Contraction signals**: Requests to reduce seats or downgrade.

#### Input Selection Criteria
Not all candidates should be included. Apply these filters:
- **Available and reliable**: The data must actually exist and be accurate (see data-quality-triad.md).
- **Predictive**: The input must correlate with outcomes when tested empirically.
- **Non-redundant**: If two inputs are highly correlated (e.g., login frequency and feature breadth),
  choose the more actionable one.
- **Timely**: The input must update frequently enough to be useful. Annual survey data is too stale
  for a health score that needs to flag issues within weeks.

Aim for 5-10 inputs. Fewer than 5 is usually too thin; more than 10 adds noise without
improving prediction.

### Step 2: Scoring Each Input

Convert each raw input to a normalized score on a consistent scale (e.g., 0-100 or 1-5).

**Approaches to normalization:**
- **Threshold-based**: Define "good," "okay," and "bad" thresholds based on domain knowledge.
  Example: >20 logins/month = 100, 10-20 = 60, <10 = 20.
- **Percentile-based**: Score relative to the customer population. Top quartile = 100,
  bottom quartile = 25. Advantage: auto-adjusts as the population changes. Disadvantage:
  a score of 50 might mean something different over time.
- **Outcome-based**: Bin accounts by the input value and calculate the actual renewal rate
  for each bin. Use the renewal rate as the score. This is the most rigorous but requires
  sufficient historical data.

Document the scoring logic for every input. The CSM must be able to understand why an
input received its score.

### Step 3: Weighting

Assign weights to each scored input. Weights should reflect predictive importance, not
assumed importance.

**Methods for determining weights:**
- **Expert judgment** (starting point): Have CS leadership assign initial weights based on
  experience. This gets you a v1 quickly but is prone to bias.
- **Correlation analysis**: Calculate the correlation between each input and churn/renewal
  outcomes. Use correlations to inform relative weights.
- **Regression coefficients**: Fit a logistic regression predicting churn from the normalized
  inputs. Use the coefficients as weights. This is the most statistically rigorous approach.
- **Hybrid**: Start with expert judgment, then adjust toward regression-derived weights
  over time as data accumulates.

Weights must sum to 100% (or be normalized to do so).

Example weighting:

| Input | Weight |
|-------|--------|
| Product engagement trend | 25% |
| Feature breadth | 15% |
| NPS score | 15% |
| Support ticket velocity | 15% |
| Multi-threading depth | 10% |
| Contract proximity risk | 10% |
| Payment history | 10% |

### Step 4: Composite Score Calculation

```
Health Score = SUM(input_score_i * weight_i) for i in all inputs
```

Classify into bands:
- **Healthy** (e.g., 75-100): High confidence in renewal. Standard touch cadence.
- **Neutral** (e.g., 50-74): Some risk signals. Increase engagement frequency.
- **At Risk** (e.g., 25-49): Material risk. Escalate to CS leadership. Develop save plan.
- **Critical** (e.g., 0-24): Likely to churn without immediate intervention. Executive engagement.

The band thresholds should be set so that the distribution of accounts across bands is
actionable. If 90% of accounts are "Healthy," the score is not discriminating enough.
Aim for roughly 60% Healthy, 25% Neutral, 10% At Risk, 5% Critical as a starting
distribution (adjust based on your actual churn rate).

### Step 5: Validation Against Actual Outcomes

This is the step most teams skip, and it is the most important.

**Validation protocol:**
1. Calculate health scores for all accounts as of 6-12 months ago (backtest).
2. Compare scores to actual outcomes (renewed, churned, expanded, contracted).
3. Calculate validation metrics:
   - **Discrimination**: Do lower scores correspond to higher churn rates? Plot churn rate
     by health score decile. The curve should be monotonically decreasing.
   - **Calibration**: If the score implies a 20% churn risk, do approximately 20% of accounts
     at that score level actually churn? Plot predicted vs. actual churn rates.
   - **Separation**: Calculate the AUC (Area Under the ROC Curve). A random score gives 0.5;
     a useful score should achieve at least 0.65; a good score exceeds 0.75.
   - **Lift**: Compare the churn rate in the bottom decile of scores to the overall churn rate.
     A useful score should show at least 2x lift (bottom decile churns at 2x the base rate).

4. If validation fails, revisit input selection and weighting. Common fixes:
   - Add usage trend inputs (direction of change matters more than absolute level).
   - Remove inputs that do not correlate with outcomes.
   - Adjust weights toward regression-derived values.

### Step 6: Calibration

Even a validated score needs periodic recalibration:

- **Quarterly review**: Rerun validation metrics. If discrimination or calibration has degraded,
  investigate why (product changes, market shifts, customer mix changes).
- **Annual rebuild**: Re-derive weights from the most recent 12 months of data. Update
  scoring thresholds based on current usage distributions.
- **Trigger-based recalibration**: If a major product launch changes usage patterns, recalibrate
  immediately rather than waiting for the quarterly cycle.

### Step 7: Drift Detection

Health scores degrade over time. Implement automated drift detection:

- **Score distribution monitoring**: Track the mean, median, and standard deviation of scores
  monthly. A sudden shift (e.g., mean drops 10 points) suggests a data issue or a real
  change in customer health.
- **Prediction accuracy tracking**: Each month, compare the score's predictions from 3-6 months
  ago to actual outcomes. Track accuracy over time. A downward trend signals drift.
- **Input drift**: Monitor the distribution of each input independently. If an input's
  distribution shifts (e.g., average logins drop due to a product change), the scoring
  thresholds for that input may need adjustment.
- **Alert thresholds**: Set alerts for when any drift metric exceeds a defined tolerance
  (e.g., AUC drops below 0.65, or score distribution shifts by more than 1 standard deviation).

## Inputs / Outputs

### Inputs
- Product telemetry data (usage events, login records, feature adoption).
- CRM data (contacts, executive sponsors, relationship mapping).
- Support system data (tickets, resolution times, escalations, CSAT).
- Survey data (NPS, CSAT at relationship level).
- Billing data (payment status, contract terms, renewal dates).
- Historical outcome data (renewals, churn events, expansions) for validation.

### Outputs
- Per-account health score (numeric, e.g., 0-100) with band classification.
- Per-account input-level breakdown showing which inputs are driving the score up or down.
- Portfolio-level health distribution (count and ARR by band).
- Validation report (discrimination, calibration, AUC, lift metrics).
- Drift detection alerts and dashboards.
- Quarterly calibration reports.

## Pitfalls

1. **Building without validating.** A score that has never been tested against real outcomes
   is just an opinion with a number attached. Always validate before deploying.

2. **Over-weighting survey data.** NPS responses are sparse (low response rates) and lagging.
   They should be one input, not the dominant one.

3. **Ignoring usage trends.** An account with declining usage is at higher risk than one with
   low-but-stable usage. Trend matters more than absolute level.

4. **Equal weighting by default.** Equal weights feel fair but are almost never optimal.
   Invest the effort to derive empirical weights.

5. **Score gaming.** If CSMs are measured on health scores, they may manipulate inputs
   (e.g., logging unnecessary touchpoints). Measure CSMs on outcomes (renewal rate),
   not on the score itself.

6. **Set and forget.** Health scores degrade. Without drift detection and periodic
   recalibration, a score becomes misleading within 6-12 months.

7. **Too many inputs.** Adding marginal inputs adds noise and makes the score harder to
   interpret. Prefer fewer, stronger signals over comprehensive but weak ones.

8. **Confusing health with satisfaction.** A customer can be satisfied but still churn
   (budget cuts, strategic shift). Health scores should include commercial and external
   risk signals, not just engagement and sentiment.

## Examples

### Example 1: Initial Score Design

A SaaS company with 500 accounts selects 7 inputs based on correlation analysis against
12 months of outcome data. They use regression-derived weights. Backtesting shows an AUC
of 0.72 and 2.8x lift in the bottom decile. They deploy with quarterly recalibration
scheduled. After two quarters, AUC improves to 0.76 as they replace a weak input
(support ticket count) with a stronger one (support ticket velocity trend).

### Example 2: Drift Detection in Action

After a major product redesign, the health score distribution shifts upward -- average
score increases by 12 points. Drift detection flags this. Investigation reveals that the
"feature breadth" input is now inflated because the redesign consolidated features,
making it easier to touch more feature areas with less effort. The team recalibrates
the feature breadth thresholds and restores score distribution to actionable levels.

### Example 3: Score Decomposition Driving Action

A CSM reviews an account scored at 38 (At Risk). The breakdown shows: product engagement
trend = 15/100 (steep decline), NPS = 30/100 (detractor), multi-threading = 20/100
(single point of contact). The CSM designs a targeted plan: schedule an executive
business review to re-engage stakeholders, identify new champions, and understand the
value gap driving declining usage.

## Cross-References

- **retention-churn-diagnostics.md** -- Health scores operationalize the predictive signals
  identified through churn diagnostics. The causal analysis from churn diagnostics should
  inform which inputs to include in the health score.
- **data-quality-triad.md** -- Health scores are only as reliable as their inputs. Ensure
  each input data source meets completeness, accuracy, and freshness SLAs.
- **metric-lifecycle-framework.md** -- Health scores are metrics with a lifecycle. Plan for
  versioning (v1, v2) and communicate changes to stakeholders.
- **okr-to-metrics-alignment.md** -- Health score distribution targets (e.g., "reduce At Risk
  accounts from 15% to 10%") should align with company-level retention OKRs.
- **bayesian-vs-frequentist-testing.md** -- When testing whether a health score improvement
  (new inputs, new weights) outperforms the prior version, use appropriate statistical methods.
