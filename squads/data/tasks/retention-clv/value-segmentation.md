# Task: Value Segmentation
> Agent(s): peter-fader, data-chief
> Frameworks: value-based-segmentation-fader, rfm-segmentation, fader-whale-curve-framework
> Checklists: segmentation-quality, fader/value-segmentation-audit
> Templates: outputs/segmentation-report
> Registry: segment-registry

## Objective
Segment customers by their economic value to the business, enabling differentiated strategies
for high-value customer retention, mid-value customer growth, and low-value customer
optimization.

## Prerequisites
- Revenue data at the customer level (minimum 12 months).
- Customer attribute data (plan, tenure, industry, size).
- CLV model or sufficient data to calculate historical value.
- Statistical analysis environment.

## Steps
1. **Define value dimensions** -- Choose the dimensions for segmentation:
   - Revenue: total revenue, MRR/ARR, average order value.
   - Engagement: feature usage breadth and depth, session frequency.
   - Growth potential: expansion revenue, upsell likelihood.
   - Tenure: how long they have been a customer.
   - Strategic value: brand, referral potential, case study candidacy.
2. **Calculate customer value scores** -- For each customer, calculate:
   - Historical revenue (total, last 12 months, last 3 months).
   - Predicted CLV (from CLV model if available).
   - Engagement score (composite of usage metrics).
3. **Apply RFM scoring** -- Score each customer on:
   - Recency: how recently they were active (score 1-5).
   - Frequency: how often they engage or transact (score 1-5).
   - Monetary: how much revenue they generate (score 1-5).
4. **Create value tiers** -- Define 3-5 value segments:
   - Champions: high R, high F, high M (top 5-10%).
   - Loyal customers: high F and M, moderate R (next 15-20%).
   - Potential loyalists: high R, moderate F and M (growth opportunity).
   - At-risk: declining R, historically high F and M (intervention needed).
   - Low value: low across all dimensions (bottom 20%).
5. **Profile each segment** -- For each value tier, calculate:
   - Size (number of customers, % of total).
   - Revenue contribution (% of total revenue).
   - Average metrics (ARPU, retention rate, support tickets).
   - Common attributes (industry, company size, plan type).
6. **Analyze the Pareto distribution** -- Calculate the revenue concentration:
   what % of customers generate 80% of revenue? Plot the Pareto curve.
7. **Map segment journeys** -- Track how customers move between segments over time.
   Identify common upgrade paths (low -> mid -> high) and degradation paths.
8. **Define differentiated strategies** -- For each segment, recommend:
   - Champions: white-glove support, executive relationships, expansion focus.
   - Loyal: upsell opportunities, loyalty programs, feedback loops.
   - Potential loyalists: targeted engagement, onboarding refinement.
   - At-risk: proactive outreach, rescue campaigns, root cause investigation.
   - Low value: self-serve optimization, automated engagement, cost efficiency.
9. **Estimate segment economics** -- For each segment, calculate:
   - Cost to serve.
   - Net margin.
   - CLV:CAC ratio.
10. **Operationalize segments** -- Define how segments will be used:
    - CRM tagging and routing.
    - Support tier assignment.
    - Marketing campaign targeting.
    - Refresh cadence (monthly recalculation recommended).
11. **Document and present** -- Create the value segmentation report.

## Deliverable
A value segmentation report containing:
- Segment definitions with scoring methodology.
- Segment profiles (size, revenue, metrics, attributes).
- Pareto analysis of revenue concentration.
- Segment migration analysis.
- Differentiated strategy recommendations per segment.
- Segment economics (cost to serve, margin, CLV:CAC).
- Operationalization plan.

## Quality Gate
- [ ] Value dimensions are documented with rationale.
- [ ] All customers are assigned to a segment (100% coverage).
- [ ] Revenue concentration (Pareto) is calculated.
- [ ] Each segment has a distinct, actionable strategy.
- [ ] Segment migration patterns are analyzed.
- [ ] Segment economics are calculated.
- [ ] Segments are operationalizable (can be calculated programmatically).
- [ ] Refresh cadence is defined.

## Registry Update
- Add value segments to `segment-registry` with scoring criteria.
- Record segment sizes and revenue shares in `metric-registry`.
- Log analysis in `analysis-registry`.
- Log task completion in `task-log`.
