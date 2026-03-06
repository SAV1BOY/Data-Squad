# Value-Based Segmentation (Fader)

> Source: Peter Fader (Customer Centricity, Wharton)

---

## Overview

Value-based segmentation, as advocated by Peter Fader, rejects the notion that all
customers are equally important. Instead, it uses Customer Lifetime Value (CLV) as the
primary axis for segmenting the customer base, then tailors acquisition, retention, and
development strategies to each value tier. The approach is rooted in the empirical
observation that customer value distributions are heavily skewed: a small fraction of
customers generates a disproportionate share of total value.

---

## When to Use

- When the organization treats all customers identically despite wide value variation.
- When marketing budgets are spread uniformly rather than allocated by expected value.
- When customer acquisition ignores the quality (future value) of acquired customers.
- When building a customer-centric strategy and need a rigorous segmentation foundation.
- When leadership asks "who are our best customers and how do we get more of them?"

---

## Core Concept

### The Value Distribution

In most businesses, customer value follows a highly skewed distribution (often
Pareto-like):
- Top 20% of customers may generate 80%+ of total CLV.
- A significant portion of customers are marginally profitable or unprofitable.
- The "whale curve" (cumulative profit curve) reveals this concentration starkly.

### CLV-Driven Tiers

| Tier           | Definition                                     | Strategy                              |
|----------------|------------------------------------------------|---------------------------------------|
| **High-value** | Top 10-20% by predicted CLV                    | Retain aggressively, personalize      |
| **Mid-value**  | Next 30-40% by predicted CLV                   | Develop: move toward high-value       |
| **Low-value**  | Bottom 40-50% by predicted CLV                 | Serve efficiently, do not over-invest |

### Key Fader Principles

1. **Not all customers deserve equal investment.** Differentiated treatment based on
   value is not unfair; it is rational resource allocation.

2. **Acquisition should target high-value lookalikes.** Use the profile of existing
   high-value customers to guide acquisition targeting.

3. **CLV is forward-looking.** Historical spend is a signal, not the answer. Use
   predictive models to estimate future value.

4. **Heterogeneity is the feature, not the bug.** The variation in customer value is
   the strategic insight. Do not average it away.

---

## Steps / Process

### Step 1: Build or Estimate CLV
- Use a probabilistic model (BG/NBD for transaction frequency, Gamma-Gamma for
  monetary value) or a simpler historical model.
- See [CLV Modeling](clv-modeling.md) for methodology details.

### Step 2: Rank and Tier Customers
- Sort all customers by predicted CLV (descending).
- Define tier boundaries. Options:
  - Fixed percentiles (top 20%, next 30%, bottom 50%).
  - Natural breaks in the CLV distribution (Jenks, elbow method).
  - Business-defined thresholds (e.g., CLV > $10K = high-value).

### Step 3: Profile Each Tier
- For each tier, compute:
  - Demographic and firmographic summaries.
  - Acquisition channel mix (where did they come from?).
  - Behavioral patterns (purchase frequency, product mix, engagement).
  - Service cost (support tickets, returns, discounts used).

### Step 4: Design Tier-Specific Strategies

| Activity        | High-Value                | Mid-Value               | Low-Value              |
|-----------------|---------------------------|-------------------------|------------------------|
| Retention       | Dedicated CSM, proactive  | Automated nurture       | Self-serve only        |
| Cross-sell      | Personalized offers       | Segment-level campaigns | Batch promotions       |
| Support         | Priority queue            | Standard SLA            | Community / self-help  |
| Acquisition     | Lookalike targeting       | Broad targeting         | Organic / low-cost     |

### Step 5: Measure Tier Migration
- Track quarterly: how many customers moved up or down tiers?
- Upward migration = successful development. Downward = risk signal.

### Step 6: Close the Loop to Acquisition
- Analyze which acquisition channels produce the highest concentration of high-value
  customers.
- Shift acquisition budget toward those channels, even if CPL is higher.

---

## Inputs / Outputs

### Inputs
| Input                          | Source                          |
|--------------------------------|---------------------------------|
| Transaction history            | Data warehouse / billing        |
| CLV model outputs              | Analytics / data science        |
| Customer attributes            | CRM, marketing automation       |
| Acquisition channel data       | Attribution system              |

### Outputs
| Output                         | Consumer                        |
|--------------------------------|---------------------------------|
| Value-tier customer segments   | Marketing, CS, product          |
| Tier profiles                  | Strategy, marketing             |
| Tier-specific action plans     | Marketing ops, CS ops           |
| Acquisition channel ROI by tier| Growth, marketing leadership    |
| Tier migration dashboard       | Leadership, analytics           |

---

## Pitfalls

1. **Using historical spend as CLV.** Past spend does not equal future value. A recent
   big spender may churn tomorrow. Use predictive models.

2. **Ignoring cost-to-serve.** A high-revenue customer with massive support costs may
   be less profitable than a moderate-revenue, low-maintenance customer.

3. **Static segmentation.** Customer value changes. Recalculate and re-tier at least
   quarterly.

4. **Treating low-value customers badly.** "Low-value" does not mean "mistreat." It
   means "serve efficiently." Poor experiences create detractors regardless of tier.

5. **Insufficient data for new customers.** Predictive CLV models need transaction
   history. For new customers, use acquisition-channel priors or early behavioral
   signals until enough data accumulates.

6. **Over-indexing on the whale curve.** The concentration of value is real, but
   mid-value customers in aggregate often contribute significant total value. Do not
   neglect the middle.

7. **Privacy and ethics.** Differentiated treatment must comply with regulations and
   ethical norms. Avoid discriminatory proxies.

---

## Cross-References

- [CLV Modeling](clv-modeling.md) -- The quantitative engine behind value-based
  segmentation.
- [RFM Segmentation](rfm-segmentation.md) -- A simpler heuristic that approximates
  value tiers.
- [Fader Customer Centricity](fader-customer-centricity-framework.md) -- The broader
  philosophy that motivates this approach.
- [Fader Whale Curve](fader-whale-curve-framework.md) -- Visualizing value
  concentration.
- [NRR/GRR Expansion](nrr-grr-expansion.md) -- Revenue retention metrics that connect
  to tier-level analysis.
