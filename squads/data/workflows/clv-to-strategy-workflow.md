# CLV-to-Strategy Workflow

## Purpose
Translate Customer Lifetime Value analysis into actionable business strategy: segment customers by value, allocate budgets efficiently, and build segment-specific playbooks that maximize long-term revenue.

## Trigger
- Quarterly strategic planning cycle
- CAC/LTV ratio falls below target threshold
- New monetization model or pricing change requires re-segmentation
- Board or executive request for CLV-driven strategy update

## Agents Involved
- **peter-fader**: Leads CLV modeling and segment strategy
- **data-chief**: Builds CLV models and data pipelines
- **sean-ellis**: Designs tests to validate segment-specific playbooks
- **wes-kao**: Communicates CLV insights and strategy recommendations

## Steps

### Phase 1: CLV Computation (Days 1-5)
1. **data-chief** selects the CLV model appropriate for the business: probabilistic (BG/NBD + Gamma-Gamma), contractual, or cohort-based.
2. **data-chief** prepares the input data: transaction history, subscription events, revenue streams, and cost allocations.
3. **data-chief** computes CLV at the individual customer level with confidence intervals.
4. **peter-fader** validates the model output against known business heuristics (e.g., top 20% of customers should drive ~60-80% of value).
5. **peter-fader** identifies model limitations and documents assumptions (discount rate, time horizon, churn definition).

### Phase 2: Segmentation (Days 6-8)
6. **peter-fader** defines CLV-based segments: Champions (high CLV, high frequency), Growth Potential (medium CLV, increasing), At-Risk (declining CLV), and Low-Value (low CLV, stable or declining).
7. **data-chief** enriches segments with behavioral data: feature usage, support interactions, NPS scores, acquisition channel.
8. **peter-fader** profiles each segment: size, average CLV, growth trend, key behaviors, and primary needs.
9. **peter-fader** identifies the highest-leverage segment: which segment, if improved, would have the largest total CLV impact?

### Phase 3: Budget Allocation (Days 9-11)
10. **peter-fader** calculates the allowable acquisition cost per segment based on CLV and target payback period.
11. **peter-fader** recommends budget reallocation: shift spend from low-ROI segments toward high-potential segments.
12. **wes-kao** builds a financial model showing projected ROI under current vs. recommended allocation.
13. **peter-fader** defines guardrails: minimum spend per segment to maintain coverage, maximum CAC ratios.

### Phase 4: Segment Playbooks (Days 12-16)
14. **peter-fader** designs a playbook for each segment: acquisition tactics, onboarding flow, engagement strategy, and retention interventions.
15. **sean-ellis** identifies the top testable hypothesis in each playbook and designs an experiment.
16. **peter-fader** defines success metrics per segment playbook: target CLV lift, retention improvement, or expansion revenue.
17. **wes-kao** documents each playbook with clear owners, timelines, and measurement plans.

### Phase 5: Communicate and Activate (Days 17-20)
18. **wes-kao** presents the CLV-to-strategy package to leadership: model, segments, allocation, and playbooks.
19. **peter-fader** works with marketing and product to activate segment playbooks.
20. **data-chief** sets up automated CLV dashboards and segment tracking.
21. **peter-fader** establishes a monthly cadence to review segment migration and CLV trends.

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
| G1: Model Validated | CLV distribution matches business heuristics, backtested on historical data | data-chief |
| G2: Segments Actionable | Each segment has distinct characteristics and a differentiated strategy | peter-fader |
| G3: Budget Justified | Allocation changes supported by financial model with sensitivity analysis | peter-fader |
| G4: Playbooks Testable | Each playbook has at least one testable hypothesis with experiment design | sean-ellis |
| G5: Leadership Aligned | Strategy presented and approved by leadership team | wes-kao |

## Registry Updates
- **Metric Registry**: Register CLV as an official metric with model version, update frequency, and owner.
- **Segment Registry**: Document segment definitions, thresholds, and refresh cadence.
- **Experiment Registry**: Log experiments associated with segment playbooks.
- **Strategy Log**: Record allocation decisions, rationale, and expected outcomes for future review.
