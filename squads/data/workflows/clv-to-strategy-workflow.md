# CLV-to-Strategy Workflow

## Purpose
Translate Customer Lifetime Value analysis into actionable business strategy: segment customers by value, allocate budgets efficiently, and build segment-specific playbooks that maximize long-term revenue.

## Trigger
- Quarterly strategic planning cycle
- CAC/LTV ratio falls below target threshold
- New monetization model or pricing change requires re-segmentation
- Board or executive request for CLV-driven strategy update

## Agents Involved
- **Retention Strategist**: Leads CLV modeling and segment strategy
- **Analytics Architect**: Builds CLV models and data pipelines
- **Experiment Strategist**: Designs tests to validate segment-specific playbooks
- **Insight Narrator**: Communicates CLV insights and strategy recommendations

## Steps

### Phase 1: CLV Computation (Days 1-5)
1. **Analytics Architect** selects the CLV model appropriate for the business: probabilistic (BG/NBD + Gamma-Gamma), contractual, or cohort-based.
2. **Analytics Architect** prepares the input data: transaction history, subscription events, revenue streams, and cost allocations.
3. **Analytics Architect** computes CLV at the individual customer level with confidence intervals.
4. **Retention Strategist** validates the model output against known business heuristics (e.g., top 20% of customers should drive ~60-80% of value).
5. **Retention Strategist** identifies model limitations and documents assumptions (discount rate, time horizon, churn definition).

### Phase 2: Segmentation (Days 6-8)
6. **Retention Strategist** defines CLV-based segments: Champions (high CLV, high frequency), Growth Potential (medium CLV, increasing), At-Risk (declining CLV), and Low-Value (low CLV, stable or declining).
7. **Analytics Architect** enriches segments with behavioral data: feature usage, support interactions, NPS scores, acquisition channel.
8. **Retention Strategist** profiles each segment: size, average CLV, growth trend, key behaviors, and primary needs.
9. **Retention Strategist** identifies the highest-leverage segment: which segment, if improved, would have the largest total CLV impact?

### Phase 3: Budget Allocation (Days 9-11)
10. **Retention Strategist** calculates the allowable acquisition cost per segment based on CLV and target payback period.
11. **Retention Strategist** recommends budget reallocation: shift spend from low-ROI segments toward high-potential segments.
12. **Insight Narrator** builds a financial model showing projected ROI under current vs. recommended allocation.
13. **Retention Strategist** defines guardrails: minimum spend per segment to maintain coverage, maximum CAC ratios.

### Phase 4: Segment Playbooks (Days 12-16)
14. **Retention Strategist** designs a playbook for each segment: acquisition tactics, onboarding flow, engagement strategy, and retention interventions.
15. **Experiment Strategist** identifies the top testable hypothesis in each playbook and designs an experiment.
16. **Retention Strategist** defines success metrics per segment playbook: target CLV lift, retention improvement, or expansion revenue.
17. **Insight Narrator** documents each playbook with clear owners, timelines, and measurement plans.

### Phase 5: Communicate and Activate (Days 17-20)
18. **Insight Narrator** presents the CLV-to-strategy package to leadership: model, segments, allocation, and playbooks.
19. **Retention Strategist** works with marketing and product to activate segment playbooks.
20. **Analytics Architect** sets up automated CLV dashboards and segment tracking.
21. **Retention Strategist** establishes a monthly cadence to review segment migration and CLV trends.

## Inputs
- Transaction and revenue data (minimum 12 months)
- Customer behavioral data (feature usage, engagement)
- Acquisition cost data by channel
- Current budget allocation
- NPS and qualitative feedback by segment

## Outputs
- Individual-level CLV estimates with confidence intervals
- Customer segment profiles with behavioral enrichment
- Budget allocation recommendation with financial model
- Segment-specific playbooks with owners and metrics
- Automated CLV dashboard and monitoring

## Quality Gates

| Gate | Criteria | Owner |
|------|----------|-------|
| G1: Model Validated | CLV distribution matches business heuristics, backtested on historical data | Analytics Architect |
| G2: Segments Actionable | Each segment has distinct characteristics and a differentiated strategy | Retention Strategist |
| G3: Budget Justified | Allocation changes supported by financial model with sensitivity analysis | Retention Strategist |
| G4: Playbooks Testable | Each playbook has at least one testable hypothesis with experiment design | Experiment Strategist |
| G5: Leadership Aligned | Strategy presented and approved by leadership team | Insight Narrator |

## Registry Updates
- **Metric Registry**: Register CLV as an official metric with model version, update frequency, and owner.
- **Segment Registry**: Document segment definitions, thresholds, and refresh cadence.
- **Experiment Registry**: Log experiments associated with segment playbooks.
- **Strategy Log**: Record allocation decisions, rationale, and expected outcomes for future review.
