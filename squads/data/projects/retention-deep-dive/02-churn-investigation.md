# Retention Deep Dive - Churn Investigation

## Phase Objective

Investigate churned users in depth to understand the different types of churn, their root causes, and the behavioral patterns that precede churn. While cohort analysis reveals when and how much churn happens, this phase answers why it happens and what signals predict it.

## Prerequisites

- Completed cohort analysis from Phase 01 identifying key churn points and segments
- Access to user-level behavioral data for churned users
- Access to cancellation reasons, support tickets, and survey responses from churned users
- Churn definition operationalized (e.g., no login for 30 days, subscription canceled, account deleted)
- Sample of churned users available for qualitative outreach if needed

## Steps

1. **Classify Churn Types**: Not all churn is the same. Categorize churned users into distinct types based on their lifecycle stage at churn. Early churn occurs when users leave before completing activation (they never experienced the core value). Mid-lifecycle churn occurs when previously active users disengage gradually. Sudden churn occurs when active users disappear abruptly. Contractual churn occurs at renewal decision points. Each type has different causes and requires different interventions.

2. **Quantify Churn Type Distribution**: Calculate what percentage of total churn falls into each type. Often, organizations focus on preventing mid-lifecycle churn when the largest volume is actually early churn from users who never activated. This distribution directly informs where retention investment will have the greatest impact.

3. **Analyze Pre-Churn Behavioral Patterns**: For each churn type, examine user behavior in the 14, 30, and 60 days before churn. Look for declining engagement signals: decreasing login frequency, fewer key actions per session, reduced feature breadth, and increasing time between sessions. Build a composite disengagement trajectory that shows the typical path from active to churned.

4. **Identify Leading Indicators**: Determine which behavioral changes are the earliest reliable predictors of churn. A user who stops using a specific feature might churn 30 days later with 70% probability. A user whose session duration drops below a threshold might churn within 14 days. These leading indicators become the basis for early warning systems and proactive intervention triggers.

5. **Analyze Cancellation and Feedback Data**: For users who explicitly canceled or provided feedback, categorize their stated reasons. Common categories include price sensitivity, missing features, switched to competitor, no longer need the product, poor support experience, and technical issues. Cross-reference stated reasons with actual behavior to determine whether stated reasons align with observed usage patterns. Users often cite price when the real issue is insufficient value perception.

6. **Investigate Competitive Churn**: For users who churned to a competitor, analyze what the competitor offers that your product does not. Use support ticket mentions, exit survey responses, and competitive intelligence to identify the specific features, pricing, or experience elements that drove the switch. Distinguish between competitive losses due to feature gaps versus pricing versus distribution advantages.

7. **Map Churn to Product Events**: Correlate churn spikes with product changes, pricing changes, and external events. If churn increased after a UI redesign, after a price increase, or during a specific season, these correlations reveal structural drivers. Build a timeline overlay showing churn rate against major product and business events.

8. **Build Churn Personas**: Synthesize the quantitative patterns and qualitative feedback into 3-5 churn personas. Each persona represents a distinct churn archetype with a typical profile, journey, trigger, and stated reason. For example: "The Overwhelmed Trialer who signs up, encounters a complex setup process, never reaches the aha moment, and churns within 7 days citing the product is too complicated." Personas make churn patterns tangible and actionable for product and customer success teams.

9. **Estimate Recoverable Churn**: Not all churned users can be recovered. Estimate what percentage of each churn type is potentially addressable. Users who churned due to a missing feature that has since been built are highly recoverable. Users who churned because they no longer have the underlying need are not. This estimate helps prioritize intervention design in later phases.

## Deliverables

- Churn type classification with definitions and distribution percentages
- Pre-churn behavioral pattern analysis with disengagement trajectory charts
- Leading indicator report ranking behavioral predictors by earliness and reliability
- Cancellation reason analysis with behavioral cross-reference
- Competitive churn analysis with feature and pricing gap identification
- Product event correlation timeline
- Churn persona profiles (3-5 archetypes) with journey narratives
- Recoverable churn estimate by type and segment

## Quality Gate

Churn investigation is complete when all of the following conditions are met:

- At least three distinct churn types have been identified and quantified
- Pre-churn behavioral patterns have been analyzed for each churn type
- Leading indicators have been identified with predictive accuracy metrics
- Cancellation reasons have been categorized and cross-referenced with behavior
- Churn personas are documented and validated by customer-facing teams
- Recoverable churn estimates are calculated and reviewed
- Findings clearly distinguish between correlation and likely causation

## Next Phase

Proceed to **03-segmentation.md** (Segmentation) to create actionable user segments based on retention risk, value, and behavioral patterns discovered in this investigation.
