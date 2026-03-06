# CLV Modeling - Brief

## Phase Objective

Define the business context, available data, and intended use cases for the Customer Lifetime Value model. CLV models vary dramatically depending on the business model (subscription vs. transactional), data richness, and how the output will be used. This brief ensures the modeling approach matches the business reality.

## Prerequisites

- Understanding of the business model (subscription, transactional, hybrid, freemium)
- Access to historical transaction or subscription data spanning at least 24 months
- Identified business stakeholders who will consume CLV predictions
- Clarity on how CLV will be used in decision-making (budget allocation, segmentation, acquisition targeting)
- Finance team availability for validation of revenue and cost assumptions

## Steps

1. **Describe the Business Model**: Document how the business generates revenue. For subscription businesses, specify the contract structure (monthly, annual, multi-year), pricing tiers, expansion and contraction mechanics, and cancellation policies. For transactional businesses, describe the purchase cycle, product categories, return policies, and seasonal patterns. Hybrid models that combine subscription and transactional revenue need both perspectives documented.

2. **Define the CLV Use Case**: Specify exactly how CLV predictions will be used. Common use cases include setting acquisition cost ceilings (how much to spend acquiring a customer), prioritizing customer success resources (which accounts deserve more attention), informing pricing strategy (what price maximizes lifetime value), and building marketing audiences (targeting lookalikes of high-CLV customers). Each use case has different accuracy requirements and time horizon needs.

3. **Inventory Available Data**: Catalog all data sources that could feed the CLV model. Transaction history is the core requirement: purchase dates, amounts, products, and customer identifiers. Supplement with behavioral data (product usage, engagement metrics), demographic data (company size, industry, geography), acquisition data (channel, campaign, cost), and support data (ticket volume, satisfaction scores). For each data source, document coverage, quality, and access method.

4. **Assess Data Quality for Modeling**: Evaluate whether the available data meets the minimum requirements for CLV modeling. Check for sufficient history (at least 2 years of transaction data for most methods), adequate customer count (at least 1,000 customers with repeat transactions for statistical modeling), consistent data collection (no major gaps or definition changes), and reliable customer identification (unique, stable customer IDs across transactions).

5. **Select the Modeling Time Horizon**: Determine the prediction window that matches the use case. A 12-month CLV prediction is appropriate for annual budget planning. A 36-month prediction is useful for acquisition ROI analysis. A lifetime prediction (unbounded) is needed for customer equity calculations. Longer horizons require stronger assumptions and produce wider confidence intervals. Be explicit about the trade-off between horizon length and prediction confidence.

6. **Define Revenue Components**: Specify which revenue streams are included in the CLV calculation. Options include subscription revenue, one-time purchases, add-on purchases, professional services, referral value, and cross-sell revenue. Determine whether CLV should be gross revenue, net revenue (after refunds and credits), gross margin, or contribution margin. Align this definition with how finance calculates customer profitability.

7. **Establish Cost Assumptions**: Decide whether the model predicts gross CLV (revenue only) or net CLV (revenue minus costs). If including costs, specify which cost categories: cost of goods sold, customer acquisition cost, onboarding cost, ongoing support cost, and infrastructure cost. Work with finance to determine cost allocation methodology and obtain accurate per-customer or per-segment cost estimates.

8. **Set Model Performance Expectations**: Define what constitutes an acceptable model. Specify accuracy metrics (mean absolute error, mean absolute percentage error), acceptable prediction ranges, and how the model will be evaluated against actuals. Set expectations that CLV models are inherently uncertain forecasts, not precise predictions, and that directional accuracy and segment-level ranking are often more valuable than point estimate precision.

## Deliverables

- Business model description document with revenue mechanics and customer lifecycle
- CLV use case specification with decision-making applications and accuracy requirements
- Data inventory catalog with source descriptions, quality assessments, and access methods
- Data quality assessment report confirming modeling readiness
- CLV definition document specifying time horizon, revenue components, and cost treatment
- Model performance expectations with evaluation criteria and acceptable thresholds
- Stakeholder sign-off on CLV definition and intended use

## Quality Gate

The brief is complete when all of the following conditions are met:

- The business model is documented with enough detail to inform modeling method selection
- At least one specific CLV use case is defined with clear decision-making applications
- Data inventory confirms sufficient history, volume, and quality for statistical modeling
- The CLV definition (time horizon, revenue components, cost treatment) is agreed upon by finance and business stakeholders
- Model performance expectations are realistic given the data available and use case requirements
- Revenue components and cost treatment are documented with approval from finance
- All stakeholders understand that CLV is a probabilistic forecast and have agreed on how uncertainty will be communicated
- The modeling time horizon is explicitly stated and justified by the primary use case
- A named model owner is assigned for ongoing maintenance and recalibration responsibility
- Cost assumptions are validated by the finance team and documented with the allocation methodology

## Next Phase

Proceed to **01-data-prep.md** (Data Preparation) to clean, validate, and engineer features from the raw data for model input. The data inventory and business model description from this brief guide the data preparation approach.
