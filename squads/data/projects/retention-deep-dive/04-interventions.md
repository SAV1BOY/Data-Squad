# Retention Deep Dive - Interventions

## Phase Objective

Design specific, targeted retention tactics for each segment in the prioritization matrix. Each intervention must address the root causes identified in the churn investigation, be tailored to the segment's value and risk profile, and have clear success metrics that enable measurement in the next phase.

## Prerequisites

- Completed segmentation from Phase 03 with the combined value-risk matrix
- Churn personas and root cause analysis from Phase 02
- Leading indicators and pre-churn behavioral patterns identified
- Customer success team capacity assessment
- Engineering capacity for product-based interventions
- Budget allocation for retention initiatives

## Steps

1. **Map Interventions to the Segmentation Matrix**: For each cell in the value-risk matrix, determine the appropriate intervention intensity. High-value, high-risk users warrant high-touch, personalized outreach from senior customer success managers. Mid-value, at-risk users may receive targeted in-product nudges and automated email sequences. Low-value, high-risk users may receive fully automated retention flows. Design interventions that are economically proportional to the segment's revenue contribution.

2. **Design High-Touch Interventions**: For the highest-priority segments, create playbooks for direct human engagement. Specify the trigger (what signal initiates the outreach), the timing (how quickly after the trigger the outreach should happen), the channel (phone call, personalized email, in-person meeting), the message framework (what to say, what to ask, what to offer), and the escalation path if the initial outreach does not resolve the risk. Include scripts and email templates that customer success managers can customize.

3. **Design Product-Based Interventions**: For segments where in-product changes can address retention, design specific product interventions. This includes onboarding improvements for early churners (guided tours, milestone celebrations, setup wizards), re-engagement prompts for disengaging users (usage summaries, new feature highlights, personalized recommendations), and value reinforcement for users approaching renewal (ROI reports, usage stats, success stories from similar companies).

4. **Design Automated Communication Sequences**: For segments where scaled communication is appropriate, design email and messaging sequences. Create lifecycle emails triggered by behavioral signals rather than arbitrary time delays. For example, if a user has not used a core feature in 14 days, send a targeted email explaining the feature's value with a specific use case. Build sequences of 3-5 messages with escalating urgency but decreasing frequency to avoid fatigue.

5. **Design Pricing and Packaging Interventions**: For segments where price sensitivity is a primary churn driver, design pricing interventions. Options include downgrade paths that retain the user at lower revenue rather than losing them entirely, usage-based pricing that aligns cost with perceived value, loyalty discounts for long-tenure users approaching renewal, and win-back offers for recently churned users. Each pricing intervention must be financially modeled to ensure it is net positive.

6. **Define Intervention Success Metrics**: For each intervention, specify the primary success metric, the measurement approach, and the target. A customer success outreach intervention might target a 50% response rate and a 30% risk reduction. A product nudge might target a 15% re-engagement rate within 7 days. An email sequence might target a 5% click-through rate and a 10% feature adoption lift. Clear metrics enable the measurement phase to assess what is working.

7. **Build Intervention Prioritization and Sequencing**: Not all interventions can launch simultaneously. Prioritize by expected impact, implementation effort, and dependency. Quick wins (automated emails, in-product tooltips) can launch in weeks. Medium efforts (customer success playbooks, lifecycle sequences) take 1-2 months. Heavy lifts (product changes, pricing restructures) require quarters. Create a phased rollout plan that delivers early wins while building toward larger structural changes.

8. **Address the Win-Back Opportunity**: Design specific interventions for users who have already churned. Segment recently churned users by churn reason and value tier. For recoverable segments, create win-back campaigns that address the specific reason for departure. Include product updates that address their cited issues, re-engagement offers, and simplified return paths. Win-back campaigns targeting users who left due to resolved issues often achieve 10-20% recovery rates.

9. **Establish Feedback Loops**: Design mechanisms to capture the outcomes and learnings from each intervention. This includes tracking which interventions were delivered to which users, whether users engaged with the intervention, and whether their retention behavior changed. Build these feedback loops before launching interventions so measurement data is available from day one.

## Deliverables

- Intervention map showing specific tactics for each cell in the segmentation matrix
- High-touch playbooks for customer success teams with triggers, scripts, and escalation paths
- Product intervention specifications for engineering implementation
- Automated communication sequences with content, triggers, and cadence
- Pricing intervention proposals with financial models
- Success metric definitions for each intervention
- Phased rollout plan with prioritization and timeline
- Win-back campaign designs for churned user recovery
- Feedback loop design for intervention outcome tracking

## Quality Gate

Intervention design is complete when all of the following conditions are met:

- Every cell in the segmentation matrix has at least one defined intervention
- Each intervention is grounded in the root causes identified in the churn investigation
- High-touch playbooks have been reviewed and accepted by customer success leadership
- Product interventions have been reviewed by engineering for feasibility and scoped for effort
- Every intervention has a defined success metric with a measurement approach
- The phased rollout plan is realistic given available resources and has stakeholder buy-in
- Feedback loops are designed and data collection can begin when interventions launch
- Financial models confirm that intervention costs are justified by expected retention value

## Next Phase

Proceed to **05-measure.md** (Measure) to track the impact of deployed interventions, assess effectiveness, and iterate based on results.
