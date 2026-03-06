# Mehta Customer Health Score Design

## Overview

Customer Health Score Design is a detailed framework for building, validating, and maintaining a
composite metric that predicts customer retention, expansion, and churn risk. A health score
synthesizes multiple signals -- product usage, engagement, support interactions, business outcomes,
and relationship quality -- into a single actionable score per customer. Done well, the health
score is the most operationally valuable metric in customer success. Done poorly, it creates false
confidence and misallocated resources. This framework covers the full lifecycle: input selection,
weighting, scoring algorithm, validation protocol, and ongoing drift monitoring.

## Origin

Developed by **Nick Mehta** through Gainsight's extensive work with SaaS companies building health
scoring systems. Mehta observed that most initial health score implementations fail not because of
bad data but because of poor design: too many inputs, wrong weights, no validation, and no
maintenance. This framework codifies the lessons from hundreds of health score implementations
into a repeatable methodology that avoids common failure modes.

## Core Model

### Input Selection

**Category 1: Product Usage**
The behavioral foundation of health scoring. What is the customer doing with the product?

Candidate inputs:
- Login frequency (daily, weekly, monthly)
- Feature adoption breadth (percentage of available features used)
- Feature adoption depth (usage intensity of key features)
- Usage trend (increasing, stable, declining)
- Key action completion (the actions most correlated with retention)
- Data volume or throughput (for data-intensive products)

Selection criteria: Choose usage inputs that correlate with retention. Not all features matter
equally. A customer using 3 core features deeply is healthier than one touching 10 features
superficially.

**Category 2: Engagement Quality**
How is the customer interacting with your team and resources?

Candidate inputs:
- CSM meeting attendance and responsiveness
- QBR participation and stakeholder attendance
- Training or certification completion
- Community participation
- Webinar or event attendance
- NPS or CSAT survey responses

Selection criteria: Engagement inputs should reflect genuine interest, not just compliance. A
customer who sends their intern to QBRs is less healthy than one who sends their VP.

**Category 3: Support Health**
What does the support interaction pattern reveal?

Candidate inputs:
- Open ticket count and severity
- Time to ticket resolution
- Escalation frequency
- Sentiment in support interactions
- Self-serve resolution rate
- Repeat issues on the same topic

Selection criteria: Support data is a lagging indicator of product experience. High ticket volume
can indicate either frustration (bad) or deep engagement (less bad). Context matters.

**Category 4: Business Outcomes**
Is the customer achieving their objectives?

Candidate inputs:
- ROI metrics (if measurable)
- Milestone achievement rate
- Time-to-value metrics
- Customer-reported outcome attainment
- Expansion history (expanding customers are healthy)

Selection criteria: Outcome inputs are the most predictive but hardest to collect. Even approximate
measures are valuable.

**Category 5: Relationship and Contract**
What is the state of the commercial relationship?

Candidate inputs:
- Contract renewal proximity
- Executive sponsor stability (departure is a risk)
- Payment timeliness
- Legal or procurement engagement (can indicate risk)
- Competitive evaluation signals

Selection criteria: These inputs capture risk factors that usage data misses. A customer with
great usage but a departing champion is at real risk.

### Input Quantity Discipline

**Rule:** Start with 4-6 inputs. Never exceed 10-12.

Rationale: More inputs do not produce a better score. They produce a noisier score that is harder
to interpret and maintain. Each input adds noise and maintenance cost. Start minimal and add only
when validation shows a gap.

### Weighting Methodology

**Approach 1: Expert judgment**
Gather CS leaders and assign weights based on experience. Simple, fast, and good enough for V1.

Example:
- Product usage: 40%
- Support health: 20%
- Engagement quality: 15%
- Business outcomes: 15%
- Relationship/contract: 10%

**Approach 2: Statistical weighting**
Use logistic regression or similar methods with churn/renewal as the outcome variable. Let the
data determine which inputs are most predictive.

Advantages: More accurate, less biased by assumptions.
Requirements: Sufficient historical data (100+ churned customers), clean input data.

**Approach 3: Hybrid**
Start with expert judgment (V1), then refine with statistical analysis as data accumulates (V2+).
This is the recommended path for most organizations.

### Scoring Algorithm

**Step 1: Normalize each input**
Convert each input to a 0-100 scale using percentile ranking, z-scores, or defined thresholds.
This ensures inputs are comparable regardless of their natural units.

**Step 2: Apply weights**
Multiply each normalized input by its weight. Sum the weighted inputs.

**Step 3: Map to categories**
Define thresholds that map the composite score to actionable categories:
- Green: 70-100 (healthy, maintain current engagement)
- Yellow: 40-69 (at risk, investigate and intervene)
- Red: 0-39 (critical, immediate action required)

**Step 4: Apply override rules**
Certain conditions should override the composite score:
- Open P1 support ticket: Force Yellow minimum regardless of composite
- Executive sponsor departure: Force Yellow minimum
- Contract expiring within 60 days with no renewal signal: Force Yellow minimum
- Payment 30+ days overdue: Force Red

### Validation Protocol

Health scores must be validated against actual outcomes. An unvalidated health score is a guess
with a number attached.

**Validation method 1: Predictive accuracy**
At regular intervals (quarterly), compare health scores at time T to outcomes at time T+90 days.
Calculate:
- What percentage of Red accounts actually churned?
- What percentage of Green accounts actually renewed?
- What percentage of churned accounts were Red before churning?

**Validation method 2: Calibration curve**
Plot predicted churn probability (from health score) against actual churn rate. A well-calibrated
score shows a monotonic relationship: higher risk scores correspond to higher actual churn.

**Validation method 3: Lift analysis**
Compare the churn rate of bottom-quintile health scores to top-quintile. The ratio should be
significant (3x+). If the health score does not discriminate between healthy and unhealthy
accounts, it is not functioning.

**Target accuracy:**
- 70%+ of churned accounts should have been Yellow or Red before churning
- Red accounts should churn at 3x+ the rate of Green accounts
- False positive rate (Red accounts that actually renew) should be manageable (below 40%)

### Drift Monitoring

Health scores degrade over time as customer behavior patterns change, product evolves, and market
conditions shift.

**Monitoring cadence:**
- Monthly: Track distribution of scores (are too many Green? Too many Red?)
- Quarterly: Run validation metrics (is predictive accuracy holding?)
- Semi-annually: Review input relevance (are the inputs still available and meaningful?)
- Annually: Full review of weighting, inputs, and algorithm

**Drift indicators:**
- Score distribution shifting significantly (e.g., 80% Green when historically 60%)
- Predictive accuracy declining (churned accounts were Green more often)
- New behaviors emerging that the score does not capture
- Product changes that make certain inputs irrelevant

**Recalibration triggers:**
- Predictive accuracy drops below acceptable thresholds
- Score distribution deviates significantly from historical norms
- Major product or pricing changes occur
- Customer base composition changes significantly (new segment, new market)

## Application Steps

### Step 1: Define the Outcome
What should the health score predict? Churn? Renewal? Expansion? NRR? Be specific. Different
outcomes may require different scores.

### Step 2: Inventory Available Data
List all data sources: product analytics, CRM, support system, billing, engagement tracking.
Assess quality and completeness for each. Do not design a health score around data you wish you
had; design it around data you actually have.

### Step 3: Select Initial Inputs (4-6)
Choose the inputs with the strongest theoretical connection to the outcome. One from each category
is a good starting point.

### Step 4: Set Initial Weights
Use expert judgment for V1. Document the rationale for each weight. Plan to refine.

### Step 5: Build and Deploy
Implement the scoring algorithm. Calculate scores for all customers. Review the distribution:
does it match intuition? Are known-healthy accounts Green? Are known-at-risk accounts Red?

### Step 6: Validate After One Cycle
After 90 days, run the validation protocol. Compare predictions to outcomes. Identify where the
score was accurate and where it failed.

### Step 7: Refine and Iterate
Based on validation, adjust inputs, weights, and thresholds. Add override rules for scenarios
the composite misses. Plan for regular recalibration.

## Key Distinctions

- **Health score is a model, not a metric.** It requires design, validation, and maintenance. It
  is not a simple measurement; it is a prediction system.
- **Validation is non-negotiable.** A health score without validation is a random number with
  organizational authority. Always validate before trusting.
- **Fewer inputs produce better scores.** Resist the urge to add every available signal. Each
  input adds noise and maintenance burden. Prioritize ruthlessly.
- **Override rules handle edge cases.** The composite score cannot capture every scenario. Override
  rules handle known patterns that the algorithm misses.
- **Health scores are probabilistic.** A Green account can still churn. A Red account can still
  renew. The score indicates likelihood, not certainty.

## Pitfalls

1. **Too many inputs.** The most common design error. Start with 4-6 inputs, not 20.
2. **No validation.** The second most common error. Without validation, the score is untested.
3. **Static weights.** Weights that never change degrade as the business evolves.
4. **Ignoring data quality.** A health score built on unreliable data produces unreliable
   predictions. Assess data quality before building.
5. **Over-reliance on usage.** Usage is important but not sufficient. A customer with high usage
   and a departing champion is at risk despite the usage signal.
6. **Binary thinking.** Treating health scores as Green = safe and Red = lost oversimplifies.
   The score indicates probability of risk, and actions should be proportional.
7. **No drift monitoring.** Health scores that are built and forgotten degrade silently until
   a cluster of unexpected churns reveals the failure.

## Cross-References

- **Mehta Customer Success Metrics** -- Health score is one of the seven core CS metrics and the
  primary leading indicator.
- **Mehta Outcome-Based CS** -- Outcome indicators should be incorporated as health score inputs
  for outcome-driven CS organizations.
- **Mehta Digital CS** -- Health scoring enables digital CS by automating the detection of
  customers needing intervention.
- **Mehta Expansion Playbook** -- Health score is the primary guardrail for expansion timing.
- **Fader Probability Models** -- Fader's P(alive) in non-contractual settings serves a similar
  function to health scoring in contractual settings.
- **Kao Rigorous Thinking** -- Health score design requires rigorous thinking: questioning input
  assumptions, validating predictions, and updating models when evidence changes.
