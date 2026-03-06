# Spinks Orbit Model Audit

## Purpose

Audit the application of the Orbit Model framework to community measurement. The Orbit Model, championed by Spinks, uses the metaphor of gravitational pull: the most engaged members orbit closest to the center, while casual participants orbit at the edges. This checklist ensures the model is properly implemented and operationally useful.

---

## Checklist Items

### 1. Orbit Levels Are Defined
- **Pass:** Members are classified into at least 3-4 orbit levels based on engagement intensity (e.g., Orbit 1 = ambassadors/leaders, Orbit 2 = active contributors, Orbit 3 = participants, Orbit 4 = observers). Each level has a clear definition.
- **Fail:** Members are undifferentiated, or levels exist but lack clear definitions of what qualifies a member for each level.

### 2. Gravity (Engagement Weight) Is Configured
- **Pass:** Different types of engagement are weighted to reflect their value: creating content weighs more than reacting, answering questions weighs more than asking, attending events weighs more than viewing a page. Weights are documented.
- **Fail:** All engagement types are weighted equally, making a "like" as valuable as a detailed tutorial contribution.

### 3. Reach Is Measured per Member
- **Pass:** Each member's reach -- the breadth of their influence (connections, followers, audience, mentions) -- is tracked alongside their engagement depth. Reach identifies amplifiers.
- **Fail:** Only engagement depth is tracked, missing members who are less active in the community but influential in the broader ecosystem.

### 4. Impact Is Assessed
- **Pass:** Member impact is evaluated: did their contributions lead to others joining, contributing, or reaching outcomes? Impact is the third dimension alongside engagement and reach.
- **Fail:** Impact is not measured. A member who writes a post that inspires 20 new contributions is scored the same as a member who writes a post nobody reads.

### 5. Orbit Migration Is Tracked
- **Pass:** Movement between orbits is monitored over time: how many members moved from Orbit 3 to Orbit 2 this month? How many moved outward? Migration rates are key health indicators.
- **Fail:** Orbit levels are assigned but not tracked dynamically. Nobody knows whether members are moving closer or drifting away.

### 6. Inward Migration Is a Growth Target
- **Pass:** The community team has explicit targets for inward migration (pulling more members toward the center) and tracks progress against these targets.
- **Fail:** There are no targets for deepening engagement. Growth is measured only by adding new outer-orbit members.

### 7. Orbit Data Informs Community Programs
- **Pass:** Orbit classification directly informs community programs: Orbit 1 members are invited to advisory roles, Orbit 2 members receive contributor recognition, Orbit 3 members get activation nudges.
- **Fail:** Orbit data is computed but does not influence how members are treated or what programs they receive.

### 8. The Model Accounts for Activity Decay
- **Pass:** Engagement scores decay over time so that a member who was active 6 months ago but silent since does not remain classified as Orbit 1. Recency weighting is applied.
- **Fail:** Orbit classification is based on all-time activity, keeping long-inactive members in inner orbits.

### 9. Orbit Data Is Integrated with Business Data
- **Pass:** Orbit classifications are available in CRM or CS platforms, enabling business teams to see which customers are community-engaged and at what level.
- **Fail:** Orbit data lives only in the community platform with no integration to business systems.

### 10. The Orbit Model Is Calibrated Periodically
- **Pass:** Engagement weights, level thresholds, and decay rates are reviewed at least semi-annually. The team checks whether the model's classifications feel accurate to people who know the community.
- **Fail:** The model was configured at setup and has not been recalibrated despite changes in the community and engagement patterns.

---

## Cross-References

- [Contribution Ladder Audit](contribution-ladder-audit.md) -- orbit levels map to contribution ladder stages
- [Engagement Signal Quality](engagement-signal-quality.md) -- orbit model depends on quality engagement signals
- [Community Impact Attribution](community-impact-attribution.md) -- orbit data enriches attribution analysis
- [Community Loop Design](community-loop-design.md) -- the loop drives members through orbit levels
