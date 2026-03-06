# RFM Segmentation Framework

> Classic direct marketing segmentation technique

---

## Overview

RFM segments customers based on three behavioral dimensions: Recency (how recently
they transacted), Frequency (how often they transact), and Monetary (how much they
spend). By scoring customers on each dimension and combining the scores, RFM creates
actionable segments that predict future behavior -- particularly repeat purchase
likelihood and customer lifetime value -- without requiring complex predictive models.

---

## When to Use

- When you need a quick, interpretable customer segmentation without ML infrastructure.
- When prioritizing marketing spend across customer segments.
- When identifying at-risk customers for retention campaigns.
- When building a foundation for more sophisticated CLV models.
- When communicating customer value distribution to non-technical stakeholders.

---

## Core Concept

### The Three Dimensions

| Dimension     | Measures                          | Why It Matters                          |
|---------------|-----------------------------------|-----------------------------------------|
| **Recency**   | Days since last transaction       | Recent buyers are more likely to buy again|
| **Frequency** | Number of transactions in period  | Frequent buyers are more loyal           |
| **Monetary**  | Total or average spend in period  | High spenders contribute more value      |

### Scoring Method

1. Rank all customers on each dimension.
2. Divide into quantiles (typically 5 quintiles, scored 1-5).
3. Assign each customer a three-digit RFM score (e.g., 5-5-5, 1-3-2).

### Common RFM Segments

| Segment Name      | RFM Pattern | Description                              |
|-------------------|-------------|------------------------------------------|
| Champions         | 5-5-5       | Best customers: recent, frequent, high $  |
| Loyal Customers   | X-4/5-X     | Frequent buyers regardless of recency     |
| Potential Loyalists| 4/5-2/3-X  | Recent buyers with moderate frequency     |
| New Customers     | 5-1-X       | Recent first-time buyers                  |
| At Risk           | 2/3-3/4-3/4 | Previously good customers going quiet     |
| Hibernating       | 1-1/2-X     | Long-inactive, low-frequency customers    |
| Can't Lose Them   | 1/2-4/5-4/5 | High-value customers who stopped buying   |

---

## Steps / Process

### Step 1: Define the Observation Window
- Choose the time period for Frequency and Monetary (e.g., last 12 months).
- For Recency, use the full history (days since most recent transaction).

### Step 2: Extract the Data
- For each customer: last transaction date, count of transactions, total spend.
- Exclude returns, refunds, and non-revenue transactions.

### Step 3: Score Each Dimension
- Sort customers by Recency (ascending -- fewer days = higher score).
- Sort by Frequency (descending -- more transactions = higher score).
- Sort by Monetary (descending -- more spend = higher score).
- Assign quintile scores (1-5) for each dimension.

### Step 4: Create Segments
- Combine scores into an RFM triplet (e.g., 5-4-3).
- Map triplets to named segments using a predefined lookup table.
- Alternatively, use clustering (k-means) on the three dimensions for data-driven
  segments.

### Step 5: Profile the Segments
- Calculate segment sizes, average CLV, average order value, preferred channels.
- Identify which segments are growing or shrinking over time.

### Step 6: Design Segment-Specific Actions
| Segment            | Action                                        |
|--------------------|-----------------------------------------------|
| Champions          | VIP treatment, early access, referral programs|
| At Risk            | Win-back campaigns, satisfaction surveys       |
| New Customers      | Onboarding sequences, second-purchase nudges  |
| Can't Lose Them    | High-touch outreach, special offers           |
| Hibernating        | Low-cost reactivation or suppress from spend  |

### Step 7: Monitor Segment Migration
- Track how customers move between segments over time.
- A healthy business shows upward migration (New -> Loyal -> Champion).

---

## Inputs / Outputs

### Inputs
| Input                          | Source                          |
|--------------------------------|---------------------------------|
| Transaction-level data         | POS / e-commerce / billing      |
| Customer identifiers           | CRM / data warehouse            |
| Observation window definition  | Business decision               |

### Outputs
| Output                         | Consumer                        |
|--------------------------------|---------------------------------|
| RFM-scored customer table      | Marketing, CRM, analytics       |
| Segment profiles               | Marketing strategy, leadership  |
| Segment migration report       | Growth, retention teams         |
| Campaign targeting lists       | Marketing ops / CRM             |

---

## Pitfalls

1. **Equal weighting assumption.** RFM treats all three dimensions equally, but in
   some businesses Frequency is far more predictive than Monetary. Consider weighting.

2. **Quintile boundaries are arbitrary.** The difference between a 3 and a 4 may be
   trivial. Use the scores as guidance, not gospel.

3. **Ignoring product category.** A customer who bought one high-ticket item (R=5,
   F=1, M=5) looks different from a frequent small-basket shopper. Context matters.

4. **Static snapshots.** RFM is most valuable when tracked over time (segment
   migration). A single snapshot misses the trajectory.

5. **Conflating RFM with CLV.** RFM is a heuristic. For precise value predictions,
   use probabilistic CLV models (BG/NBD, Pareto/NBD).

6. **Over-segmentation.** 5x5x5 = 125 cells. Most teams cannot action 125 segments.
   Collapse into 6-10 named segments.

7. **Excluding non-monetary signals.** For freemium or ad-supported models, replace
   Monetary with engagement depth or content consumption.

---

## Cross-References

- [CLV Modeling](clv-modeling.md) -- Probabilistic models that extend RFM into
  predictive value estimation.
- [Value-Based Segmentation (Fader)](value-based-segmentation-fader.md) -- A more
  rigorous CLV-driven approach to segmentation.
- [Cohort Analysis](cohort-analysis.md) -- Temporal lens that complements the
  behavioral lens of RFM.
- [AARRR Pirate Metrics](aarrr-pirate-metrics.md) -- RFM maps to the Retention and
  Revenue stages.
- [Fader Customer Base Audit](fader-customer-base-audit.md) -- Audit methodology
  that uses RFM-like dimensions.
