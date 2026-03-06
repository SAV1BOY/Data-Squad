# Net Revenue Retention / Gross Revenue Retention / Expansion Revenue

> Key SaaS and subscription business health metrics

---

## Overview

Net Revenue Retention (NRR), Gross Revenue Retention (GRR), and Expansion Revenue are
the three interlocking metrics that describe how revenue from an existing customer
cohort evolves over time. Together, they answer: "Is the business growing from its
existing base, or is it dependent on new logos to grow?" NRR above 100% means the
existing base is expanding faster than it is contracting -- a hallmark of efficient,
durable growth.

---

## When to Use

- When evaluating the health of a subscription or recurring-revenue business.
- When comparing retention performance across segments, products, or time periods.
- When diagnosing whether growth is acquisition-driven or expansion-driven.
- When forecasting revenue from the existing customer base.
- When benchmarking against industry standards (especially SaaS).

---

## Core Concept

### Definitions and Formulas

**Gross Revenue Retention (GRR):**
```
GRR = (Beginning MRR - Contraction MRR - Churn MRR) / Beginning MRR
```
- GRR measures revenue kept *before* expansion. It can never exceed 100%.
- It isolates the "floor" of retention -- how much you lose from downgrades and churn.

**Net Revenue Retention (NRR):**
```
NRR = (Beginning MRR - Contraction MRR - Churn MRR + Expansion MRR) / Beginning MRR
```
- NRR includes expansion (upsells, cross-sells, price increases).
- NRR above 100% means the existing base is growing without any new customers.

**Expansion Revenue:**
```
Expansion MRR = Upsell MRR + Cross-sell MRR + Price Increase MRR
```

### Component Breakdown

| Component       | Direction | Includes                                        |
|-----------------|-----------|-------------------------------------------------|
| Beginning MRR   | Baseline  | Starting recurring revenue for the cohort        |
| Churn MRR       | Negative  | Revenue lost from customers who canceled          |
| Contraction MRR | Negative  | Revenue lost from downgrades (still a customer)   |
| Expansion MRR   | Positive  | Revenue gained from existing customer growth      |

### Reconciliation

```
Ending MRR = Beginning MRR - Churn - Contraction + Expansion + New Logo MRR
NRR = Ending MRR (excluding New Logos) / Beginning MRR
```

### Benchmarks (SaaS)

| Metric | Good        | Great       | Elite       |
|--------|-------------|-------------|-------------|
| GRR    | > 85%       | > 90%       | > 95%       |
| NRR    | > 100%      | > 110%      | > 130%      |

---

## Steps / Process

### Step 1: Define MRR Components Precisely
- What counts as "churn"? Full cancellation only, or does non-renewal count?
- What counts as "contraction"? Seat reduction, plan downgrade, discount application?
- What counts as "expansion"? Seat additions, plan upgrades, add-on purchases?
- Document definitions and get finance/analytics alignment.

### Step 2: Choose the Cohort Basis
- **Logo-based:** Each customer is a unit. Simple but ignores revenue size.
- **Dollar-based:** Weight by revenue. This is the standard for NRR/GRR.
- Choose the time window: monthly, quarterly, or annual cohort.

### Step 3: Calculate the Metrics
- Pull Beginning MRR for the cohort at period start.
- Categorize all MRR changes into Churn, Contraction, or Expansion.
- Compute GRR and NRR.

### Step 4: Segment the Analysis
- By customer size tier (SMB, mid-market, enterprise).
- By product line.
- By acquisition cohort vintage.
- By customer tenure (first year vs. year 2+).

### Step 5: Diagnose the Drivers
- If GRR is low: churn or contraction problem. Dig into reasons for cancellation
  and downgrade.
- If NRR is below 100%: expansion is not offsetting losses. Investigate upsell
  and cross-sell motion.
- If NRR is high but GRR is low: expansion is masking a retention problem.
  This is fragile growth.

### Step 6: Set Targets and Track
- Set GRR and NRR targets by segment.
- Report monthly to leadership.
- Include in board-level reporting.

---

## Inputs / Outputs

### Inputs
| Input                          | Source                          |
|--------------------------------|---------------------------------|
| MRR by customer by month       | Billing / subscription system   |
| Customer lifecycle events       | CRM / CS platform               |
| Product/plan metadata           | Product catalog                 |
| Segment attributes              | CRM / data warehouse            |

### Outputs
| Output                         | Consumer                        |
|--------------------------------|---------------------------------|
| GRR / NRR metrics              | Leadership, board, investors    |
| MRR waterfall chart            | Finance, CS, product            |
| Segment-level retention view   | CS leadership, product strategy |
| Revenue forecast from base     | Finance, FP&A                   |

---

## Pitfalls

1. **Inconsistent MRR definitions.** If finance, product, and CS define MRR
   differently, NRR calculations will not reconcile. Agree on one source of truth.

2. **Masking churn with expansion.** A high NRR can hide a GRR problem. Always report
   both metrics together.

3. **Ignoring cohort effects.** Aggregate NRR mixes mature and new customers. Cohort-
   level NRR reveals the true trajectory.

4. **Price increases as "expansion."** If NRR is driven by price hikes rather than
   organic growth, it is less sustainable. Decompose expansion sources.

5. **Monthly vs. annual calculation.** Annual NRR can differ from the product of 12
   monthly NRRs due to compounding and timing. Be explicit about the method.

6. **Logo vs. dollar confusion.** Logo churn rate and dollar churn rate tell different
   stories. Small customers churn more often but contribute less revenue.

7. **Not accounting for multi-product customers.** A customer who cancels Product A
   but expands on Product B nets out differently depending on whether you measure
   at the product or account level.

---

## Cross-References

- [CLV Modeling](clv-modeling.md) -- NRR and GRR are key inputs to contractual CLV
  models.
- [Value-Based Segmentation (Fader)](value-based-segmentation-fader.md) -- Segmenting
  NRR by customer value tier.
- [Retention/Churn Diagnostics](retention-churn-diagnostics.md) -- Deep dive into
  churn analysis.
- [Cohort Analysis](cohort-analysis.md) -- Cohort-level NRR reveals trends hidden in
  aggregates.
- [Mehta Customer Success Metrics](mehta-customer-success-metrics.md) -- CS metrics
  that drive GRR and NRR.
- [KPI Tree](kpi-tree.md) -- NRR as a driver metric in the revenue branch of the tree.
