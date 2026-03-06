# Fader Probability Models

## Overview

Peter Fader's probability models are a suite of statistical frameworks for predicting customer
purchasing behavior and lifetime value, particularly in non-contractual settings where customer
departure is unobserved. Unlike contractual businesses (SaaS, subscriptions) where churn is an
observable event, non-contractual businesses (retail, e-commerce, marketplaces) never know with
certainty whether a customer has left or is simply between purchases. These models solve this
fundamental identification problem using probabilistic reasoning.

The three primary models are BG/NBD (Beta-Geometric/Negative Binomial Distribution), Pareto/NBD,
and BG/BB (Beta-Geometric/Beta-Binomial). Each serves a different data context but shares a common
philosophical foundation: customer behavior is heterogeneous, and individual predictions require
modeling that heterogeneity explicitly.

## Origin

Developed by **Peter Fader** (Wharton School) in collaboration with **Bruce Hardie** (London
Business School) across a series of influential academic papers. The Pareto/NBD model was originally
proposed by Schmittlein, Morrison, and Colombo (1987); Fader and Hardie developed the BG/NBD (2005)
as a more tractable alternative and the BG/BB (2010) for discrete-time settings. These models
represent the intersection of marketing science and Bayesian statistics, and they underpin the CLV
calculations used in Fader's customer centricity framework.

## Core Model

### BG/NBD (Beta-Geometric/Negative Binomial Distribution)

**Purpose:** Predict future purchasing behavior and customer lifetime in non-contractual,
continuous-time settings.

**Assumptions:**
1. While active, a customer makes purchases according to a Poisson process with rate lambda.
   (Purchases are randomly distributed over time at a customer-specific rate.)
2. After any purchase, a customer becomes inactive with probability p. (Each purchase is an
   opportunity for the customer to "die" or permanently leave.)
3. Purchase rates (lambda) vary across customers according to a Gamma distribution.
   (Some customers buy frequently, others rarely.)
4. Dropout probabilities (p) vary across customers according to a Beta distribution.
   (Some customers are loyal, others are flighty.)
5. Purchase rate and dropout probability are independent across customers.

**Inputs required:**
- Customer ID
- Number of repeat purchases (frequency, x)
- Time of last purchase (recency, t_x)
- Total observation period length (T)

**Outputs:**
- P(alive): Probability that each customer is still active
- E(X): Expected number of future purchases in a given period
- Individual-level purchase rate estimates

**When to use BG/NBD:**
- Non-contractual settings (retail, e-commerce, marketplace)
- Continuous-time purchasing (customers can buy at any time)
- Sufficient transaction history (at least 6-12 months)
- Need for individual-level predictions

### Pareto/NBD

**Purpose:** Same as BG/NBD but with different assumptions about the dropout process.

**Assumptions:**
1. While active, purchases follow a Poisson process (same as BG/NBD).
2. Customer lifetime follows an exponential distribution. (Dropout can happen at any time, not
   just after a purchase.)
3. Purchase rates follow a Gamma distribution across customers.
4. Dropout rates follow a Gamma distribution across customers.
5. Purchase rate and dropout rate are independent.

**Key difference from BG/NBD:**
In BG/NBD, a customer can only become inactive immediately after a purchase. In Pareto/NBD, a
customer can become inactive at any point in time. This makes Pareto/NBD more general but
computationally more demanding.

**When to use Pareto/NBD:**
- When you believe customers can leave at any time, not just after purchases
- When the "death after purchase" assumption of BG/NBD seems unrealistic
- When computational cost is not a primary concern
- Academic or high-stakes applications requiring maximum generality

**Practical note:** BG/NBD and Pareto/NBD produce very similar results in most empirical
applications. Fader and Hardie have shown that BG/NBD is generally the better practical choice
due to easier estimation with negligible loss of predictive accuracy.

### BG/BB (Beta-Geometric/Beta-Binomial)

**Purpose:** Predict future purchasing behavior in non-contractual, discrete-time settings.

**Assumptions:**
1. In each discrete time period, an active customer makes a purchase with probability pi.
   (Binary: buy or not buy in each period.)
2. After each period, an active customer becomes inactive with probability theta.
3. Purchase probabilities (pi) vary across customers according to a Beta distribution.
4. Dropout probabilities (theta) vary across customers according to a Beta distribution.
5. Purchase probability and dropout probability are independent.

**Key difference from BG/NBD:**
BG/BB is designed for settings where purchasing is naturally periodic and binary -- did the customer
buy this week/month/quarter or not? BG/NBD handles varying numbers of purchases per period.

**When to use BG/BB:**
- Subscription-like but non-contractual settings (weekly food delivery, monthly box services where
  skipping is frictionless)
- Donation behavior (annual giving campaigns)
- Attendance patterns (events, classes)
- Any setting with natural discrete periods and binary participation

### Gamma-Gamma Model (Monetary Value Complement)

**Purpose:** Predict individual-level average transaction value to complement the purchase-frequency
models above.

**Assumptions:**
1. A customer's transaction values are randomly distributed around their individual average.
2. Average transaction values vary across customers according to a Gamma distribution.
3. Transaction value is independent of purchase frequency.

**Use with:** Combine Gamma-Gamma with any of the above models to get full CLV predictions
(expected future purchases x expected transaction value).

## Application Steps

### Step 1: Prepare Transaction Data
Structure data as: Customer ID, transaction date, transaction amount. Aggregate to the customer
level: frequency (number of repeat purchases), recency (time of last purchase relative to first),
observation period length, and average monetary value.

### Step 2: Select the Appropriate Model
Choose based on your business context:
- Continuous-time, multiple purchases possible per period: BG/NBD (default choice) or Pareto/NBD
- Discrete-time, binary participation: BG/BB
- Need monetary value prediction: Add Gamma-Gamma to any of the above

### Step 3: Estimate Model Parameters
Fit the model to your transaction data using maximum likelihood estimation. Libraries available in
Python (lifetimes, pymc-marketing), R (BTYD, CLVTools), and other platforms.

### Step 4: Validate the Model
Hold out the most recent period of data (e.g., last 3 months). Fit the model on the calibration
period only. Compare predicted aggregate purchasing in the holdout period to actual purchasing.
Good models should predict total transactions within 5-10% and capture the shape of the frequency
distribution.

### Step 5: Generate Individual Predictions
For each customer, calculate:
- P(alive): Is this customer likely still active?
- Expected future purchases over a defined horizon
- Expected future monetary value (with Gamma-Gamma)
- CLV = Expected purchases x Expected value per purchase, discounted

### Step 6: Operationalize Predictions
Feed CLV predictions into business processes:
- Acquisition: Maximum allowable CAC based on predicted CLV of similar prospects
- Retention: Prioritize outreach to high-CLV customers with declining P(alive)
- Segmentation: Group customers by predicted future value, not just past behavior
- Valuation: Calculate total customer equity as the sum of all individual CLVs

### Step 7: Monitor and Recalibrate
Re-estimate models quarterly or as new data accumulates. Track whether the model's predictions
remain calibrated. Model drift indicates changing customer dynamics that may require investigation.

## Key Distinctions

- **These are generative models, not machine learning.** They model the data-generating process
  explicitly, which provides interpretability and works well with limited data. ML approaches can
  complement but not replace them.
- **Non-contractual is fundamentally harder.** In SaaS, you know when a customer churns. In retail,
  you never know -- the models solve this by computing a probability of being active.
- **Heterogeneity is the point.** These models do not assume customers are identical. The Beta and
  Gamma distributions capture the fact that customers differ systematically in both purchase
  propensity and loyalty.
- **Recency and frequency carry most of the signal.** A customer who bought 10 times, most recently
  yesterday, is very different from one who bought 10 times, most recently two years ago. The
  models capture this through P(alive).
- **Simplicity is a feature.** These models require only three data points per customer (frequency,
  recency, tenure). This makes them applicable even in data-sparse environments.

## Pitfalls

1. **Insufficient data.** The models need enough transaction history to estimate population-level
   parameters. Rule of thumb: at least 6 months and 1000+ customers with repeat purchases.
2. **Violating independence assumptions.** If purchase frequency and monetary value are correlated,
   the Gamma-Gamma model's predictions will be biased. Check this assumption before combining.
3. **Ignoring non-stationarity.** These models assume stable parameters over time. Rapid business
   changes (new product launches, market shifts) can invalidate the stationarity assumption.
4. **Over-reliance on point estimates.** CLV predictions are uncertain. Report prediction intervals,
   not just point estimates. A customer with predicted CLV of $5,000 with wide uncertainty should
   be treated differently from one with the same prediction and narrow uncertainty.
5. **Confusing frequency with count.** In these models, "frequency" means repeat purchases (total
   purchases minus one). Including the initial acquisition purchase inflates frequency estimates.
6. **Applying contractual models to non-contractual settings.** Simple retention-rate-based CLV
   models assume you can observe churn. Using them in non-contractual settings produces unreliable
   estimates.
7. **Ignoring covariates when they matter.** The base models are covariate-free. When observable
   customer characteristics strongly predict behavior (e.g., acquisition channel), extended models
   incorporating covariates can improve predictions.

## Cross-References

- **Fader CLV as North Star** -- These probability models are the computational engine that produces
  the CLV estimates central to Fader's strategy framework.
- **Fader Customer Centricity** -- Customer centricity requires knowing which customers are most
  valuable. These models provide that knowledge.
- **Fader Whale Curve** -- The whale curve displays the CLV distribution that these models calculate.
- **Fader Customer Base Audit** -- The audit uses these models to assess the health and dynamics of
  the customer base.
- **Mehta Customer Health Score** -- In SaaS, health scoring serves a similar purpose to P(alive)
  in non-contractual models: identifying customers at risk of disengaging.
- **Kaushik Economic Value Framework** -- Micro conversion economic values can serve as inputs to
  monetary value modeling when direct transaction data is sparse.
