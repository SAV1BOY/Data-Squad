# CLV Modeling - Strategy

## Phase Objective

Translate CLV segments into concrete business strategies for budget allocation, customer treatment differentiation, acquisition optimization, and retention investment. This phase converts analytical insights into financial decisions that maximize total customer equity.

## Prerequisites

- CLV-based segmentation from Phase 03 with whale curve and tier profiles
- Profitability analysis by tier including fully loaded costs
- Growth potential and value-at-risk segment identification
- Current acquisition cost by channel and customer success cost per tier
- Marketing and customer success budget constraints
- Executive stakeholder availability for strategic decision-making

## Steps

1. **Set CLV-Based Acquisition Ceilings**: For each CLV tier, calculate the maximum acceptable customer acquisition cost (CAC). A common rule is that CAC should not exceed 25-33% of predicted CLV for the median customer in each tier. Work backwards from CLV to determine channel-level CAC ceilings: if a channel predominantly acquires Champion-tier customers, it can sustain a higher CAC than a channel that predominantly acquires Low Value customers. This analysis often reveals that some acquisition channels are unprofitable on a CLV basis despite appearing efficient on a CPA basis.

2. **Optimize Acquisition Channel Mix**: Using channel-level CLV data (which channels produce which tiers), reallocate acquisition spend toward channels that produce higher-CLV customers. This may mean paying more per acquisition from high-CLV channels and reducing spend on channels that produce volume but low lifetime value. Model the impact of reallocation on total customer equity over 12 and 36 months.

3. **Design Tier-Specific Onboarding**: Create differentiated onboarding experiences based on predicted CLV tier at acquisition. High-value prospects should receive white-glove onboarding with dedicated support, personalized setup assistance, and executive sponsor introductions. Mid-value customers receive structured self-serve onboarding with proactive check-ins. Low-value customers receive fully automated onboarding. The investment in onboarding should be proportional to the expected return.

4. **Allocate Customer Success Resources by Tier**: Distribute customer success manager portfolios based on CLV tiers. Champions and High Value customers should have dedicated CSMs with low account-to-CSM ratios (20-50 accounts per CSM). Core customers can be managed in pooled models with higher ratios (100-200 accounts) and tech-touch engagement. Low Value customers should be served through digital-only programs. Calculate the total customer success budget required and compare against available resources.

5. **Design Retention Investment by Tier**: Set retention budgets proportional to the CLV at risk for each tier. For Champions, retention investment might include executive business reviews, custom integrations, dedicated SLAs, and proactive outreach at the first sign of disengagement. For Core customers, retention investment includes automated health monitoring, scaled outreach triggered by risk signals, and standard save offers. For Low Value customers, retention investment is limited to automated win-back emails and simplified downgrade paths.

6. **Build Expansion Strategy by Growth Potential**: For customers identified as having growth potential in the segmentation phase, design expansion motions. This includes upsell recommendations based on usage patterns of higher-tier customers, cross-sell offers aligned with the customer's industry or use case, and usage-based triggers that indicate readiness for plan upgrades. Calculate the expected value of expansion per segment and prioritize the highest-value expansion opportunities.

7. **Address the Unprofitable Customer Problem**: For the bottom tier of customers who may be value-negative, define a strategy. Options include reducing service costs through self-serve migration, adjusting pricing to reflect true cost-to-serve, introducing minimum commitment thresholds, or gracefully transitioning these customers to lower-cost alternatives. This is a sensitive topic that requires careful communication, but ignoring unprofitable customers drags down overall customer equity.

8. **Model Total Customer Equity Impact**: Calculate the expected impact of all strategic changes on total customer equity (the sum of all customers' CLV). Model scenarios: current state, optimized acquisition only, optimized retention only, and fully optimized. Quantify the incremental value of each strategic lever. This total customer equity model becomes the business case for the CLV-informed strategy.

9. **Create the Implementation Roadmap**: Translate the strategy into an actionable implementation plan with phases, milestones, owners, and resource requirements. Prioritize changes that have the highest impact with the lowest implementation complexity. Quick wins might include adjusting acquisition channel budgets and CSM portfolio rebalancing. Longer-term initiatives include tier-specific onboarding redesign and pricing restructuring.

## Deliverables

- CLV-based CAC ceilings by channel with current versus recommended spend allocation
- Acquisition channel optimization model with projected customer equity impact
- Tier-specific onboarding program designs with resource requirements
- Customer success resource allocation model with CSM-to-account ratios by tier
- Retention investment framework with budget allocation by tier and intervention type
- Expansion strategy with opportunity sizing and trigger definitions
- Unprofitable customer strategy with financial analysis and communication plan
- Total customer equity impact model with scenario comparisons
- Implementation roadmap with phases, milestones, and owners

## Quality Gate

Strategy is complete when all of the following conditions are met:

- CAC ceilings are calculated for each tier and acquisition channel with finance approval
- Channel mix optimization has been modeled with projected impact on customer equity
- Tier-specific treatment strategies (onboarding, CS, retention, expansion) are designed and resourced
- The unprofitable customer strategy has been reviewed by legal and executive leadership
- Total customer equity impact has been modeled and the business case is compelling
- The implementation roadmap has been reviewed and accepted by all responsible teams
- Budget requirements are quantified and approved by finance
- Expected ROI of the CLV-informed strategy exceeds the cost of modeling and implementation

## Next Phase

Proceed to **05-monitoring.md** (Monitoring) to establish ongoing tracking of model performance, detect model drift, and schedule recalibration.
