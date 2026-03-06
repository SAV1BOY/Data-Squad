# LTV / CLV Model Quality Checklist

## Purpose

This checklist ensures that Customer Lifetime Value models are methodologically
sound, transparent in their assumptions, validated against reality, and actually
useful for business decisions. A bad CLV model is worse than no model — it gives
false precision to decisions about acquisition spend, pricing, and resource
allocation. Use this before relying on any CLV estimate for strategic decisions.

## When to Use

- Before using CLV to set CAC targets or acquisition budgets
- When building or updating a CLV model
- During annual planning that depends on LTV:CAC ratios
- Before presenting CLV segmentation to stakeholders
- When evaluating vendor-provided CLV estimates

---

## Checklist Items

### 1. Method Choice Is Justified for the Business Context
- **Pass:** The chosen method (contractual BG/NBD, Pareto/NBD, simple heuristic, ML-based) is explicitly justified based on business model (contractual vs. non-contractual), data availability, and required precision.
- **Fail:** A method is used because it was found in a blog post, with no discussion of why it fits this specific business.

### 2. All Assumptions Are Explicitly Listed
- **Pass:** Discount rate, time horizon, margin assumptions, churn model, and growth assumptions are documented and justified.
- **Fail:** Assumptions are buried in code or spreadsheets, or default values are used without examination.

### 3. Historical Validation Is Performed
- **Pass:** The model is backtested — predictions made N months ago are compared to actual realized value, and prediction error is quantified.
- **Fail:** The model has never been compared to actual outcomes, or backtesting uses the same data used to build the model.

### 4. Confidence Intervals Are Provided
- **Pass:** CLV estimates include uncertainty ranges (e.g., "CLV is $340, 80% CI: $280-$420") rather than point estimates only.
- **Fail:** A single number is presented as "the CLV" with no indication of uncertainty.

### 5. Segmentation Is Meaningful and Actionable
- **Pass:** CLV segments correspond to identifiable, reachable groups that can be acted upon (e.g., by acquisition channel, plan type, use case).
- **Fail:** Segments are defined by unobservable or non-actionable criteria, or a single average CLV is used for all customers.

### 6. CLV:CAC Ratio Accounts for Payback Period
- **Pass:** The analysis includes not just the ratio but also the time to payback, accounting for cash flow timing and capital constraints.
- **Fail:** A favorable CLV:CAC ratio (e.g., 5:1) is celebrated without noting that payback takes 36 months and the company has 18 months of runway.

### 7. Margin Assumptions Are Realistic
- **Pass:** Gross margins used in CLV calculation reflect actual variable costs, including support, infrastructure, and payment processing.
- **Fail:** Revenue is used instead of contribution margin, or a flat margin is assumed that doesn't hold across segments.

### 8. Model Degrades Gracefully with Limited Data
- **Pass:** For early-stage companies or new segments, the model falls back to simpler heuristics with wider confidence intervals rather than producing false precision.
- **Fail:** The same complex model is applied regardless of data maturity, producing unreliable estimates for new segments.

### 9. Decision Utility Is Demonstrated
- **Pass:** The CLV model is shown to produce different (better) decisions than simpler alternatives. The added complexity is justified by improved outcomes.
- **Fail:** An elaborate model produces the same decisions as "average revenue x average lifespan," adding complexity without value.

### 10. Model Is Refreshed on a Defined Schedule
- **Pass:** There is a documented refresh cadence (monthly, quarterly) with triggers for ad-hoc updates (pricing changes, market shifts).
- **Fail:** The model was built once and is referenced indefinitely without updates.

### 11. Expansion and Contraction Revenue Are Modeled
- **Pass:** Upsell, cross-sell, and downgrade patterns are incorporated, not just initial purchase and churn.
- **Fail:** CLV assumes a flat revenue per period until churn, ignoring expansion revenue that may be the primary growth driver.

---

## Cross-References

- **Retention Quality Checklist** (`retention-quality.md`) — Retention curves are a core input; validate them first.
- **Attribution Quality Checklist** (`attribution-quality.md`) — CLV by channel requires reliable attribution.
- **Metric Change Request Template** (`templates/operational/metric-change-request.md`) — Use when changing CLV methodology.
- **Base Rate Neglect** (`reference/psychology/base-rate-neglect.md`) — Avoid ignoring base rates when segmenting CLV.
- **SaaS Data Playbook** (`reference/industries/saas-data-playbook.md`) — SaaS-specific CLV considerations.
- **E-commerce Data Playbook** (`reference/industries/ecommerce-data-playbook.md`) — Non-contractual CLV modeling context.

---

*Version: 1.0 | Last updated: 2026-03-06*
