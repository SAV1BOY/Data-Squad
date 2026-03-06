# Fader Whale Curve Audit

## Purpose

Audit the whale curve analysis: the cumulative profitability curve that typically shows the top 20% of customers generating 150-300% of profits, while the bottom 20% destroy value. This is Fader's signature visualization for demonstrating customer heterogeneity and the case for differential treatment.

---

## Checklist Items

### 1. A Whale Curve Has Been Produced
- **Pass:** The organization has a current (within last 6 months) whale curve plotting cumulative profit by customer, ranked from most profitable to least profitable.
- **Fail:** No whale curve exists, or it has not been updated in over a year.

### 2. Profit Is Used, Not Just Revenue
- **Pass:** The curve uses customer-level profit (revenue minus cost to serve, including allocated support, onboarding, and infrastructure costs) rather than revenue alone.
- **Fail:** The curve uses revenue, which hides the fact that some high-revenue customers are unprofitable after cost-to-serve.

### 3. The Peak and Tail Are Quantified
- **Pass:** The analysis documents: (a) what percentage of customers generate the peak cumulative profit, (b) what the peak percentage of profit is, and (c) how much value the tail destroys.
- **Fail:** The curve is shown as a picture but the key numbers are not extracted or communicated.

### 4. Value Concentration Is Compared to Prior Periods
- **Pass:** The current whale curve is compared to at least one prior period to identify whether value concentration is increasing, stable, or decreasing.
- **Fail:** The curve is a one-time snapshot with no trend analysis.

### 5. The "Value Destroyers" Are Identified
- **Pass:** Customers in the tail (negative profit contribution) are identified and profiled. Common characteristics are documented (e.g., heavy support users, discount-driven buyers).
- **Fail:** The tail is acknowledged visually but nobody has examined who these customers are.

### 6. Strategy Exists for Each Zone of the Curve
- **Pass:** Distinct strategies are documented for at least three zones: top (protect and grow), middle (develop), and tail (reduce cost-to-serve, reprice, or exit).
- **Fail:** The whale curve is presented as an interesting chart but no differential strategy follows.

### 7. Acquisition Channels Are Mapped to Curve Position
- **Pass:** Analysis shows which acquisition channels produce customers that end up in the top vs. the tail, informing acquisition investment decisions.
- **Fail:** Acquisition channels are evaluated by volume or first-purchase value, with no link to long-term curve position.

### 8. The Curve Is Shared with Leadership
- **Pass:** The whale curve is a regular feature in executive reviews, driving strategic conversation about customer portfolio management.
- **Fail:** The curve lives in an analyst's notebook and has never been presented to decision-makers.

### 9. Cost-to-Serve Allocation Is Defensible
- **Pass:** The method for allocating costs to customers is documented and reviewed. Activity-based costing or a reasonable proxy is used.
- **Fail:** Costs are allocated equally per customer (peanut-butter spread) or not allocated at all, distorting the curve.

### 10. Whale Curve Informs Customer Portfolio Decisions
- **Pass:** The whale curve has directly influenced at least one strategic decision in the last 12 months (pricing change, service tier redesign, channel deprioritization).
- **Fail:** The analysis is intellectually interesting but has never changed a decision.

---

## Cross-References

- [CLV Modeling Audit](clv-modeling-audit.md) -- CLV feeds the profit axis of the whale curve
- [Value Segmentation Audit](value-segmentation-audit.md) -- whale curve zones map to value segments
- [Retention vs. Acquisition Balance](retention-vs-acquisition-balance.md) -- whale curve shows where retention investment pays off
- [Fader Heterogeneity Audit](fader-heterogeneity-audit.md) -- the whale curve is the visual proof of heterogeneity
