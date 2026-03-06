# Task: Whale Curve Analysis
> Agent(s): Data Analyst, Finance Analyst
> Frameworks: Whale Curve (Profit Concentration), Pareto Analysis
> Checklists: analysis-rigor-checklist, profitability-checklist
> Template: whale-curve-template
> Registry: analysis-registry, metric-registry

## Objective
Build a whale curve (cumulative profit curve) to reveal how profit is concentrated across
the customer base, identifying the most profitable customers, break-even customers, and
customers who erode profitability.

## Prerequisites
- Revenue data at the customer level (minimum 12 months).
- Cost-to-serve data or reasonable estimates by customer.
- Finance team alignment on cost allocation methodology.
- Minimum 100 customers for meaningful analysis.

## Steps
1. **Define profitability** -- Specify how customer profitability is calculated:
   Profit = Revenue - Cost to Serve.
   Document what is included in Cost to Serve:
   - Direct costs: hosting, infrastructure per customer.
   - Support costs: tickets, calls, account management time.
   - Acquisition cost: marketing spend attributed to the customer.
   - Implementation/onboarding costs.
2. **Gather revenue data** -- Pull 12-month revenue per customer. Include all revenue
   streams: subscriptions, add-ons, professional services, overages.
3. **Estimate cost to serve** -- For each customer, estimate or calculate cost to serve.
   If per-customer costs are not available, use proxies:
   - Support cost = (customer tickets / total tickets) x total support spend.
   - Infrastructure cost = (customer usage / total usage) x total infra spend.
4. **Calculate customer profit** -- For each customer: Profit = Revenue - Cost to Serve.
   Identify which customers are profitable and which are unprofitable.
5. **Rank and sort** -- Sort customers from most profitable to least profitable.
6. **Build the whale curve** -- Plot cumulative profit on the Y-axis against cumulative
   customers (ranked by profitability) on the X-axis:
   - The curve rises as profitable customers are added.
   - The curve peaks at the point of maximum cumulative profit.
   - The curve declines as unprofitable customers are added.
   - The endpoint shows total actual profit.
7. **Analyze the peak** -- At the peak of the whale curve:
   - What % of customers generate maximum cumulative profit?
   - What is the peak cumulative profit vs. actual total profit?
   - The gap = profit erosion from unprofitable customers.
8. **Segment by profitability** -- Create three groups:
   - Profit generators: customers contributing to the rising curve.
   - Profit neutral: customers near the peak (break-even).
   - Profit eroders: customers on the declining portion.
9. **Profile each group** -- For each profitability segment:
   - Average revenue and cost to serve.
   - Plan type, company size, tenure.
   - Support intensity (tickets per month).
   - Feature usage patterns.
10. **Identify root causes of unprofitability** -- For profit eroders, investigate:
    - Are they on discounted or legacy pricing?
    - Do they consume disproportionate support?
    - Are their infrastructure costs unusually high?
    - Were acquisition costs too high relative to revenue?
11. **Recommend actions** -- For each profitability segment:
    - Profit generators: protect and expand.
    - Profit neutral: reduce cost to serve or increase revenue.
    - Profit eroders: renegotiate pricing, reduce support intensity,
      or accept as strategic investment (with justification).
12. **Document and present** -- Create the whale curve report. Present to finance,
    customer success, and leadership.

## Deliverable
A whale curve analysis report containing:
- Whale curve visualization.
- Peak analysis (% of customers, peak vs. actual profit).
- Profitability segment profiles.
- Root cause analysis for unprofitable customers.
- Revenue and cost breakdown by segment.
- Recommendations per segment.

## Quality Gate
- [ ] Profitability calculation is documented and finance-approved.
- [ ] All major cost categories are included in cost to serve.
- [ ] Whale curve is plotted with clear peak identification.
- [ ] Profit erosion gap is quantified.
- [ ] Three profitability segments are defined and profiled.
- [ ] Root causes of unprofitability are investigated.
- [ ] Recommendations are specific and costed.
- [ ] Report reviewed by finance team.

## Registry Update
- Add profitability metrics to `metric-registry` (customer profit, cost to serve).
- Add profitability segments to `segment-registry`.
- Log analysis in `analysis-registry`.
- Log task completion in `task-log`.
