# CLV Modeling - Segmentation

## Phase Objective

Use CLV predictions to create actionable customer segments and analyze the distribution of customer value. The whale curve analysis reveals how concentrated value is among top customers, while CLV-based segments enable differentiated treatment strategies that allocate resources in proportion to expected lifetime value.

## Prerequisites

- Validated CLV model from Phase 02 with predictions for all active customers
- Prediction intervals providing uncertainty ranges for each customer
- Feature importance analysis showing the key drivers of CLV
- Access to the customer database for enriching segments with profile data
- Stakeholder clarity on how segments will be used operationally

## Steps

1. **Build the Whale Curve**: Sort all customers by predicted CLV from highest to lowest. Plot the cumulative percentage of total CLV (y-axis) against the cumulative percentage of customers (x-axis). In most businesses, the whale curve reveals extreme concentration: the top 20% of customers often account for 80% or more of total lifetime value. The bottom 20-30% may actually be value-negative when fully loaded costs are included. This visualization is one of the most powerful tools for aligning organizational strategy.

2. **Define CLV Tiers**: Based on the whale curve and natural breakpoints in the CLV distribution, create 4-5 customer tiers. A typical structure includes Champions (top 5-10% by CLV, contributing disproportionate value), High Value (next 15-20%, strong contributors), Core (middle 40-50%, the backbone of the business), Low Value (next 20-25%, marginally profitable), and At-Risk Negative (bottom 5-10%, potentially unprofitable). Set tier boundaries at meaningful CLV thresholds and document the rationale.

3. **Profile Each CLV Tier**: For each tier, calculate summary statistics including customer count, average CLV, total tier value, average revenue per period, average tenure, retention rate, and support cost per customer. Identify the behavioral and demographic characteristics that distinguish each tier. What do Champions do differently from Low Value customers? Which acquisition channels produce the most Champions? What product usage patterns correlate with tier membership?

4. **Analyze Tier Migration Patterns**: Examine how customers move between tiers over time. Calculate the transition matrix showing the probability of a customer in each tier moving to any other tier over a 6-month or 12-month period. Identify the factors that predict upward migration (low-value customers becoming high-value) and downward migration (high-value customers declining). Migration patterns reveal which customers have expansion potential and which are at risk.

5. **Identify Growth Potential Segments**: Within each tier, segment customers by their growth trajectory. Some Core customers have stable but flat CLV, while others show increasing purchase frequency or expanding product usage that suggests future value growth. Flag customers whose behavioral trajectory suggests they are undervalued by their current tier assignment. These are the highest-leverage targets for expansion and upsell.

6. **Identify Value-at-Risk Segments**: Cross-reference CLV tiers with churn risk indicators. High-CLV customers showing early disengagement signals represent the highest value at risk. Calculate the total CLV at risk by tier and segment. This analysis directly informs where customer success and retention resources should be concentrated.

7. **Analyze Profitability by Tier**: If cost data is available, calculate the true profitability of each tier. Allocate costs including acquisition cost (amortized over tenure), onboarding cost, ongoing support cost, infrastructure cost, and cost of goods sold. Some tiers that appear valuable on a revenue basis may be marginally profitable or unprofitable when fully loaded costs are considered. This profitability view shapes the strategy phase.

8. **Validate Segments with Stakeholders**: Present the CLV-based segmentation to sales, customer success, marketing, and finance teams. Verify that the segments match their operational experience. Ask each team how they would use the segments in their daily work. Refine tier boundaries or add sub-segments based on operational feedback.

9. **Operationalize Segment Labels**: Push CLV tier assignments into the CRM, customer success platform, marketing automation tool, and data warehouse. Ensure that segment labels are accessible wherever customer-facing teams interact with accounts. Set up automated refresh schedules to update tier assignments as new CLV predictions are generated.

## Deliverables

- Whale curve visualization with concentration analysis
- CLV tier definitions with boundaries, customer counts, and value contribution
- Tier profile documents with behavioral, demographic, and financial characteristics
- Tier migration matrix with transition probabilities and driver analysis
- Growth potential segment identification with expansion opportunity sizing
- Value-at-risk analysis combining CLV tiers with churn risk indicators
- Profitability analysis by tier including fully loaded cost allocation
- Operationalized segment labels in production systems

## Quality Gate

Segmentation is complete when all of the following conditions are met:

- The whale curve has been built and the degree of value concentration is quantified
- CLV tiers are defined with clear boundaries that are stable across multiple prediction runs
- Each tier has a detailed profile that is interpretable and actionable for business teams
- Migration patterns have been analyzed and key drivers of upward and downward movement identified
- Growth potential and value-at-risk segments are quantified with dollar values
- Stakeholders from sales, customer success, and marketing have validated the segments
- Tier assignments are accessible in production systems used by customer-facing teams
- Tier boundaries account for prediction uncertainty (customers near boundaries are flagged)

## Next Phase

Proceed to **04-strategy.md** (Strategy) to translate CLV segments into differentiated budget allocation, retention strategies, and acquisition targeting approaches.
