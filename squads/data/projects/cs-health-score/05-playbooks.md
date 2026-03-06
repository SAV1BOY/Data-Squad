# CS Health Score - Playbooks

## Phase Objective

Create structured intervention playbooks that prescribe specific actions for customer success managers based on health score tier, alert type, and driving signals. Playbooks transform health score data into consistent, repeatable actions that reduce CSM guesswork and ensure that at-risk customers receive timely, appropriate intervention.

## Prerequisites

- Alerting system deployed from Phase 04 with alerts flowing to CSMs
- Health score tiers calibrated and validated from Phase 03
- Understanding of available intervention levers (product, pricing, support, relationship)
- CSM team trained on health score interpretation and explanation framework
- Templates and tools for customer outreach accessible to the CS team

## Steps

1. **Map Playbooks to Health Score Tiers**: Create a playbook for each health category that defines the standard operating procedure. The Healthy tier playbook focuses on proactive value reinforcement and expansion opportunity identification. The At-Risk tier playbook focuses on investigation, root cause identification, and corrective action. The Critical tier playbook focuses on urgent escalation, executive engagement, and retention-focused intervention. Each tier's playbook should specify the default cadence of engagement and the intensity of effort.

2. **Create Signal-Specific Response Plays**: Within each tier, define specific response actions based on which signals are driving the score. If the primary driver is declining product usage, the play involves understanding whether the customer's needs have changed, re-training on underutilized features, or connecting them with power users. If the primary driver is increasing support tickets, the play involves a joint escalation meeting with the support team and the customer. If the primary driver is stakeholder disengagement, the play involves re-mapping the customer's organizational chart and identifying new champions.

3. **Define the Investigation Framework**: Before acting on a health score alert, CSMs need a structured approach to understand the situation. Define the investigation steps: review the health score explanation to identify driving signals, check recent support interactions for context, review product usage trends for the past 30 and 90 days, check the CRM for recent meeting notes or stakeholder changes, and assess whether external factors (budget season, organizational changes, market conditions) could explain the score change.

4. **Write Outreach Templates**: For each common intervention scenario, provide CSMs with outreach templates they can customize. Templates should feel personal, not automated. Include email templates for re-engagement outreach (subject lines that reference specific usage patterns), call scripts for risk mitigation conversations (open-ended questions that surface the real issue), and meeting agenda templates for executive business reviews (structured around value delivered and roadmap alignment).

5. **Define Escalation Procedures**: Specify when and how a CSM should escalate beyond their standard toolkit. Triggers for escalation include customer requesting to speak with management, health score remaining critical for more than 30 days despite intervention, customer threatening or initiating cancellation, and technical issues that the CSM cannot resolve through normal channels. Define the escalation path: CSM manager, VP of Customer Success, executive sponsor, and cross-functional crisis team.

6. **Build the Save Offer Framework**: For customers in the Critical tier who are actively considering churn, define the available save offers and the criteria for each. Options include extended contract terms at a discounted rate, additional training or onboarding services at no cost, temporary plan downgrades with upgrade incentives, dedicated technical resources for a defined period, and product roadmap commitments for critical feature gaps. Set approval requirements for each offer type and specify dollar thresholds that require management approval.

7. **Design the Healthy Customer Expansion Playbook**: For customers in the Healthy tier, the focus shifts from risk mitigation to value expansion. Define plays for identifying upsell opportunities (usage approaching plan limits, team growth detected, feature requests indicating advanced needs), cross-sell opportunities (adjacent product interest signals), and advocacy opportunities (high NPS, willing to provide case studies or referrals). Healthy customers are the best source of revenue growth and market credibility.

8. **Create Playbook Measurement Framework**: Define how playbook effectiveness will be measured. Track which plays are executed, the time from alert to action, the customer's health score trajectory after intervention, the resolution outcome (risk mitigated, customer saved, customer lost), and the time and effort invested per play. Use this data to identify which plays are most effective and which need refinement.

9. **Train CSMs on Playbook Execution**: Conduct training sessions that walk CSMs through each playbook using real account examples. Role-play the investigation framework, outreach conversations, and escalation procedures. Address common questions and edge cases. Create a quick-reference guide that CSMs can consult during their daily work. Schedule follow-up sessions after 30 days to share early learnings and address challenges.

## Deliverables

- Tier-specific playbooks defining default engagement cadence and intensity for each health category
- Signal-specific response plays mapping driving signals to appropriate interventions
- Investigation framework checklist for structured situation assessment
- Outreach templates for re-engagement emails, risk mitigation calls, and executive business reviews
- Escalation procedure document with triggers, paths, and authority levels
- Save offer framework with available offers, criteria, and approval requirements
- Healthy customer expansion playbook with upsell, cross-sell, and advocacy plays
- Playbook measurement framework with tracked metrics and reporting cadence
- Training materials and quick-reference guide for CSM daily use

## Quality Gate

Playbooks are complete when all of the following conditions are met:

- Every health tier has a defined playbook with clear engagement expectations
- Signal-specific response plays cover at least the top 5 most common alert-driving signals
- The investigation framework has been tested by CSMs on real accounts and confirmed practical
- Outreach templates have been reviewed by CS leadership for tone and appropriateness
- Escalation procedures are documented with clear triggers and approved authority levels
- Save offers are defined with financial guardrails approved by finance
- All CSMs have completed playbook training and can demonstrate the investigation framework
- The measurement framework is configured and baseline metrics are being captured
- CS leadership has approved all playbooks for full team deployment

## Next Phase

This is the final phase of the CS Health Score project. The health scoring system is now fully operational with scoring, alerting, and playbook-driven intervention. Ongoing activities include calibration reviews per the established schedule, playbook refinement based on measurement data, and signal and model updates as the business evolves.
