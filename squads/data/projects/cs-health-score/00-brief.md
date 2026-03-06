# CS Health Score - Brief

## Phase Objective

Define the scope and requirements for a customer health scoring system that predicts which customers are thriving, which are at risk, and which need immediate attention. This brief establishes the customer types being scored, the data available to inform the score, the prediction target, and how customer success teams will use the score in their daily workflows.

## Prerequisites

- Understanding of the customer base composition (segments, tiers, lifecycle stages)
- Access to the customer success team for workflow and requirement interviews
- Inventory of data sources that capture customer signals (product usage, support, billing, engagement)
- Historical churn data with at least 12 months of labeled outcomes
- Executive sponsor who will champion adoption of the health score across the organization

## Steps

1. **Define the Customer Universe**: Specify which customers will receive health scores. Determine whether the score applies to all customers or a subset (enterprise only, post-onboarding only, accounts above a revenue threshold). For B2B products, clarify whether the score is at the account level, the user level, or both. Different customer types may require different scoring models if their usage patterns and churn dynamics differ fundamentally.

2. **Define the Prediction Target**: Specify what the health score is predicting. The most common target is churn within a defined window (e.g., probability of churning within the next 90 days). Alternatives include likelihood of contraction (downgrade), likelihood of expansion (upsell), or a composite health index that combines multiple outcomes. A clear prediction target is essential for model validation. Avoid the temptation to predict everything simultaneously, as this dilutes accuracy.

3. **Interview Customer Success Managers**: Conduct structured interviews with CSMs to understand their current process for assessing account health. Document the signals they use (usage trends, stakeholder engagement, support sentiment, renewal timing), the actions they take when they identify risk, and the pain points in their current approach. CSMs often have strong intuition about leading indicators that data can validate and scale.

4. **Inventory Available Data Sources**: Catalog every data source that could contribute signals to the health score. Product analytics provide usage frequency, feature adoption, and engagement trends. Support systems provide ticket volume, resolution times, and sentiment. Billing systems provide payment history, plan changes, and contract details. CRM data provides stakeholder contacts, meeting notes, and relationship strength. Communication platforms provide email engagement and response patterns.

5. **Assess Data Coverage and Quality**: For each data source, evaluate coverage (what percentage of customers have data), freshness (how frequently the data is updated), and reliability (are there known quality issues). A signal that is available for only 30% of customers cannot be a core component of a universal health score. Map coverage gaps and determine whether they can be closed or must be accepted as limitations.

6. **Define Score Consumption Requirements**: Determine how the health score will be consumed. Will it appear in the CRM alongside account records? Will it drive automated workflows (task creation, alert routing)? Will it feed executive dashboards? Will it be visible to customers themselves? Each consumption method has different requirements for refresh frequency, presentation format, and explainability. A score that CSMs cannot understand or trust will not be adopted.

7. **Establish Success Criteria**: Define how the health score project will be evaluated. Metrics include prediction accuracy (does the score predict actual churn better than current methods), operational adoption (do CSMs use the score in their daily work), and business impact (does acting on health scores reduce churn). Set specific targets for each metric and define the measurement approach.

8. **Plan the Rollout Strategy**: Determine whether the health score will launch to all CSMs simultaneously or in a phased rollout. A phased approach starting with a pilot team allows for iteration before broad deployment. Plan for a calibration period where CSMs compare score-based assessments with their intuitive assessments and provide feedback.

## Deliverables

- Customer universe definition specifying which customers are scored and at what level
- Prediction target specification with outcome definition and time window
- CSM interview synthesis documenting current health assessment practices and signal inventory
- Data source catalog with coverage, freshness, and quality assessments
- Score consumption requirements document specifying integration points and formats
- Success criteria with specific targets for accuracy, adoption, and business impact
- Rollout strategy with phased deployment plan and feedback collection approach

## Quality Gate

The brief is complete when all of the following conditions are met:

- The customer universe is defined and the appropriate scoring level (account vs. user) is determined
- The prediction target is specific with a defined outcome and time window
- CSM interviews have been conducted with at least 5 team members across different segments
- Data source inventory confirms sufficient signal availability for at least 80% of the customer base
- Score consumption requirements are agreed upon with the customer success team lead
- Success criteria are quantified and the measurement approach is defined
- The prediction target is specific with a defined outcome and time window validated by historical churn data
- The rollout strategy has been reviewed and approved by the CS leadership team
- An executive sponsor is identified and committed to championing adoption across the organization
- Historical churn data confirms at least 12 months of labeled outcomes available for model training

## Next Phase

Proceed to **01-inputs-design.md** (Inputs Design) to determine which signals will feed the health score, map them to data sources, and assess their predictive value. The data source inventory and CSM insights from this brief directly inform signal selection.
