# Customer Lifetime Value (CLV) Modeling Framework

> Sources: Peter Fader (Probability Models), Daniel McCarthy, various

---

## Overview

Customer Lifetime Value (CLV) estimates the total net value a customer will generate
over their entire relationship with the business. CLV modeling ranges from simple
historical calculations to sophisticated probabilistic models. The choice of approach
depends on data availability, business model (contractual vs. non-contractual), and
the decision the CLV estimate will inform.

---

## When to Use

- When allocating acquisition budgets (CLV must exceed CAC).
- When building value-based customer segmentation.
- When forecasting revenue from the existing customer base.
- When evaluating the long-term impact of retention improvements.
- When making strategic decisions about which customer segments to invest in.

---

## Core Concept

### Historical vs. Predictive CLV

| Approach          | Definition                                      | Limitation                              |
|-------------------|-------------------------------------------------|-----------------------------------------|
| **Historical**    | Sum of past revenue (or profit) from a customer | Only looks backward; silent on future   |
| **Predictive**    | Modeled estimate of future value                | Requires modeling assumptions           |

### Business Model Taxonomy

| Dimension          | Contractual                    | Non-Contractual                      |
|--------------------|--------------------------------|--------------------------------------|
| **Churn signal**   | Observable (cancellation)      | Unobservable (customer just stops)   |
| **Examples**       | SaaS, insurance, telecom       | E-commerce, retail, marketplaces     |
| **Key challenge**  | Predicting when they cancel    | Determining if they are still "alive"|

### Probabilistic Models (Non-Contractual)

1. **BG/NBD (Beta-Geometric / Negative Binomial Distribution):**
   - Models transaction frequency and "death" (permanent churn).
   - Inputs: recency, frequency, T (customer age).
   - Output: P(alive), expected transactions in next period.

2. **Pareto/NBD:**
   - Similar to BG/NBD but with a different dropout process (continuous rather than
     discrete). More computationally expensive.

3. **Gamma-Gamma Model:**
   - Models monetary value conditional on transaction count.
   - Pairs with BG/NBD or Pareto/NBD to produce full CLV estimates.

### Contractual CLV Models

1. **Survival models:** Cox proportional hazards, accelerated failure time models.
2. **Discrete-time hazard models:** Logistic regression on monthly/annual renewal.
3. **Simple formula:** CLV = ARPU x (1 / churn rate) x Gross Margin %.

### The Simple CLV Formula (Contractual)

```
CLV = (ARPU x Gross Margin %) / Monthly Churn Rate
```

This assumes constant churn and no expansion. Useful as a rough baseline.

---

## Steps / Process

### Step 1: Classify Your Business Model
- Contractual or non-contractual?
- Continuous or discrete transaction timing?
- This determines which model family to use.

### Step 2: Prepare the Data
- Transaction-level data: customer ID, transaction date, transaction value.
- For contractual: subscription start date, end date, plan changes.
- Clean: remove duplicates, refunds, internal test accounts.

### Step 3: Choose the Model
| Context                        | Recommended Model              |
|--------------------------------|--------------------------------|
| Non-contractual, quick start   | BG/NBD + Gamma-Gamma           |
| Non-contractual, high accuracy | Pareto/NBD + Gamma-Gamma       |
| Contractual, simple            | ARPU / churn rate formula       |
| Contractual, sophisticated     | Survival model (Cox, discrete)  |
| Any, ML approach               | Gradient boosted model on features|

### Step 4: Fit the Model
- Split data into calibration and holdout periods.
- Fit on calibration data.
- Predict on holdout period.

### Step 5: Validate
- Compare predicted vs. actual transactions and revenue in the holdout period.
- Metrics: MAE, RMSE, calibration plots, cumulative transaction plots.
- Check at both individual and aggregate level.

### Step 6: Generate CLV Estimates
- Produce per-customer CLV estimates for a defined horizon (e.g., 12 months, 36
  months, "lifetime").
- Include P(alive) from BG/NBD for non-contractual models.
- Apply a discount rate for long horizons if doing DCF-style CLV.

### Step 7: Operationalize
- Load CLV scores into CRM, marketing automation, and analytics tools.
- Refresh on a regular cadence (monthly or quarterly).
- Feed into segmentation, acquisition targeting, and retention prioritization.

---

## Inputs / Outputs

### Inputs
| Input                          | Source                          |
|--------------------------------|---------------------------------|
| Transaction-level data         | Data warehouse / billing        |
| Customer metadata              | CRM                             |
| Subscription lifecycle data    | Billing system (contractual)    |
| Discount rate                  | Finance team                    |

### Outputs
| Output                         | Consumer                        |
|--------------------------------|---------------------------------|
| Per-customer CLV estimate      | Marketing, CS, analytics        |
| P(alive) scores                | Retention / lifecycle marketing |
| Value-tier segments            | Marketing strategy              |
| Revenue forecasts from base    | Finance, leadership             |

---

## Pitfalls

1. **Confusing historical and predictive CLV.** Reporting past spend as "CLV" misleads
   decision-makers about future value.

2. **Ignoring costs.** CLV should be profit-based, not revenue-based. Include COGS,
   support costs, and variable costs.

3. **Over-engineering for small datasets.** BG/NBD needs sufficient repeat-purchase
   data. For very new businesses, simple heuristics may be more appropriate.

4. **Not validating.** A CLV model that has never been tested against holdout data is
   a guess, not a model.

5. **Static CLV in a dynamic business.** Product changes, pricing shifts, and market
   conditions alter CLV. Refresh models regularly.

6. **Ignoring heterogeneity.** Average CLV is misleading. The distribution matters --
   see value-based segmentation.

7. **Discount rate confusion.** Long-horizon CLV without discounting overstates present
   value. Agree on a discount rate with finance.

8. **Circular reasoning with CAC.** CLV > CAC is necessary but not sufficient. Ensure
   CLV estimates are independent of acquisition cost.

---

## Cross-References

- [Value-Based Segmentation (Fader)](value-based-segmentation-fader.md) -- Uses CLV as
  the segmentation axis.
- [RFM Segmentation](rfm-segmentation.md) -- RFM dimensions are inputs to CLV models.
- [Fader Probability Models](fader-probability-models.md) -- Deep dive into BG/NBD
  and Pareto/NBD.
- [Cohort Analysis](cohort-analysis.md) -- Retention curves feed CLV estimation.
- [NRR/GRR Expansion](nrr-grr-expansion.md) -- Revenue retention metrics that relate
  to contractual CLV.
