# Retention Deep Dive - Segmentation

## Phase Objective

Create actionable user segments that enable differentiated retention strategies. Segments must be based on a combination of value (how much the user is worth), behavior (how they use the product), and risk (how likely they are to churn). The output is a segmentation model that customer success, product, and marketing teams can use to prioritize and personalize their efforts.

## Prerequisites

- Completed churn investigation from Phase 02 with identified churn types and leading indicators
- Cohort retention curves by segment from Phase 01
- User-level data including behavioral metrics, revenue contribution, and lifecycle stage
- Access to clustering algorithms or segmentation tools
- Stakeholder input on what makes a segment actionable for their team

## Steps

1. **Define Segmentation Objectives**: Clarify what the segments will be used for. If the goal is to prioritize customer success outreach, segments need to distinguish high-value at-risk users from low-value stable users. If the goal is to personalize product experience, segments need to distinguish usage patterns that call for different feature presentations. The use case determines which variables matter most.

2. **Build Value-Based Segments**: Segment users by their economic value to the business. For subscription businesses, this means current MRR, expansion potential, and contract length. For transactional businesses, this means purchase frequency, average order value, and recency. Create tiers such as high-value (top 20% of revenue), mid-value (next 30%), and long-tail (bottom 50%). This value framework ensures retention efforts are proportional to business impact.

3. **Build Behavioral Segments**: Segment users by how they use the product. Use feature usage breadth (how many features they use), depth (how intensively they use core features), frequency (how often they engage), and recency (when they last engaged). Apply clustering algorithms (k-means, hierarchical clustering) to identify natural behavioral groupings. Validate clusters by checking that they are distinct, stable over time, and interpretable by stakeholders.

4. **Build Risk-Based Segments**: Using the leading indicators identified in the churn investigation, score each user's churn risk. Combine behavioral signals (declining engagement, narrowing feature usage, increasing support contacts) into a composite risk score. Segment users into risk tiers: healthy (low risk, stable or growing engagement), at-risk (moderate risk, early disengagement signals), and critical (high risk, advanced disengagement or approaching contract renewal with negative signals).

5. **Create the Combined Segmentation Matrix**: Cross value segments with risk segments to create a prioritization matrix. High-value, high-risk users are the top priority for immediate retention intervention. High-value, healthy users should receive proactive engagement to maintain satisfaction. Low-value, high-risk users may not warrant intensive intervention but could benefit from automated retention flows. Low-value, healthy users may be candidates for expansion rather than retention.

6. **Validate Segment Stability**: Test whether the segments are stable over time by running the segmentation model on multiple time periods. If a user's segment assignment changes dramatically from month to month, the model is capturing noise rather than meaningful patterns. Stable segments that predict future behavior are more useful than volatile segments that only describe the past.

7. **Profile Each Segment**: For each segment in the matrix, create a detailed profile. Include the segment's size (number of users and percentage of total), revenue contribution, typical behavioral patterns, common churn type from Phase 02, and the most relevant churn persona. Add qualitative color by selecting representative user examples and describing their journey in narrative form.

8. **Validate with Customer-Facing Teams**: Present the segmentation to customer success managers, account executives, and support leads. Ask them to map their existing accounts to segments and confirm whether the data-driven segments match their intuitive understanding. Refine segment boundaries based on operational feedback. Segments that make sense on paper but confuse the people who need to act on them will not be adopted.

9. **Operationalize Segment Assignment**: Define how each user's segment will be calculated and updated in production systems. Specify the data sources, calculation frequency, and storage location. Determine whether segment assignment will be batch (updated daily or weekly) or real-time (updated on each event). Ensure the segment label is accessible in the CRM, customer success platform, and analytics tools.

## Deliverables

- Value-based segment definitions with tier boundaries and user distribution
- Behavioral segment definitions with clustering methodology and cluster profiles
- Risk-based segment definitions with scoring model and threshold calibration
- Combined segmentation matrix (value x risk) with prioritization framework
- Segment stability analysis across multiple time periods
- Detailed segment profiles with size, revenue, behavior, and churn characteristics
- Operationalization plan for production segment assignment
- Segment validation summary from customer-facing team feedback

## Quality Gate

Segmentation is complete when all of the following conditions are met:

- Value, behavioral, and risk dimensions are each independently validated
- The combined segmentation matrix produces distinct, non-overlapping priority groups
- Segment stability analysis confirms assignments are consistent over at least 3 time periods
- Each segment has a detailed profile that is interpretable by non-technical stakeholders
- Customer-facing teams have validated that segments align with their operational experience
- An operationalization plan exists for making segments available in production systems
- Segments cover at least 95% of the active user base (no large unclassified populations)

## Next Phase

Proceed to **04-interventions.md** (Interventions) to design specific retention tactics tailored to each segment in the prioritization matrix.
