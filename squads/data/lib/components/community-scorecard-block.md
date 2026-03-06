# Community Scorecard Block

A reusable component for measuring and reporting on community health, engagement, and contribution patterns.

---

## Template

### Scorecard Header

| Field              | Value                                  |
|--------------------|----------------------------------------|
| **Community Name** | _e.g., Developer Community Forum_      |
| **Reporting Period**| _e.g., February 2026_                 |
| **Owner**          | _e.g., Community Team_                |
| **Data Sources**   | _e.g., Discourse API, GitHub API_      |

### Engagement Metrics

| Metric                    | Current | Prior Period | Change  | Target | Status    |
|---------------------------|---------|-------------|---------|--------|-----------|
| Monthly Active Members    | 3,420   | 3,180       | +7.5%   | 3,500  | On Track  |
| Posts Created              | 1,890   | 1,720       | +9.9%   | 2,000  | At Risk   |
| Replies per Post (avg)    | 3.4     | 3.1         | +9.7%   | 3.0    | On Track  |
| Median Response Time (hrs)| 2.1     | 2.8         | -25.0%  | 3.0    | On Track  |
| Resolved Rate             | 78%     | 72%         | +6pp    | 80%    | At Risk   |
| New Member Signups        | 480     | 410         | +17.1%  | 400    | On Track  |

### Contribution Signals

Track the depth and breadth of member contributions:

| Signal                    | Current | Trend (3mo) | Interpretation                          |
|---------------------------|---------|-------------|-----------------------------------------|
| Unique Contributors       | 620     | Increasing  | More members moving from lurking to contributing |
| Contribution Gini Coefficient | 0.72 | Stable     | Contribution is concentrated; top 10% produce ~60% of content |
| Power Contributors (10+ posts/mo) | 45 | Increasing | Core contributor base is growing      |
| First-Time Contributors   | 112     | Increasing  | Healthy onboarding of new voices       |
| Repeat Contributors (2+ months) | 340 | Stable    | Retention of contributors is flat       |

### Contribution Rate Breakdown

| Member Segment       | Size  | % of Members | Contributions | % of Contributions |
|----------------------|-------|-------------|---------------|---------------------|
| Power (10+ posts)    | 45    | 1.3%        | 890           | 47.1%               |
| Regular (3-9 posts)  | 210   | 6.1%        | 620           | 32.8%               |
| Occasional (1-2 posts)| 365  | 10.7%       | 380           | 20.1%               |
| Lurkers (0 posts)    | 2,800 | 81.9%       | 0             | 0%                  |

### Sentiment and Quality Signals

| Signal                    | Current | Prior Period | Method                        |
|---------------------------|---------|-------------|-------------------------------|
| Positive Sentiment Rate   | 68%     | 65%         | Keyword/ML classification     |
| Flagged/Moderated Content | 23      | 31          | Moderation queue count        |
| Upvote-to-Downvote Ratio  | 8.2:1   | 7.5:1       | Reaction data                 |
| Reported Spam/Abuse        | 5       | 8           | Report queue count            |
| Helpful Answer Rate       | 62%     | 58%         | "Marked as solution" / total  |

### Trend Summary

Summarize 3-month trends across key dimensions:

| Dimension        | 3-Month Trend | Assessment                                          |
|------------------|--------------|------------------------------------------------------|
| Growth           | Increasing   | New signups are up; driven by blog integration       |
| Engagement Depth | Stable       | Posts per member is flat; need activation campaigns   |
| Contribution Breadth | Increasing | More unique contributors, but Gini still high     |
| Content Quality  | Improving    | Higher resolution rate, better sentiment             |
| Retention        | Flat         | Repeat contributor rate not growing                  |

### Key Findings and Actions

1. **Finding:** First-time contributors are up 17% but repeat contribution is flat.
   **Action:** Launch a "second post" nudge campaign targeting members who posted once in the last 30 days.

2. **Finding:** Median response time improved from 2.8h to 2.1h after introducing community champions program.
   **Action:** Expand champions program; recognize top responders publicly each month.

3. **Finding:** 82% of members are lurkers, which is within industry norms (80-90%) but leaves room for improvement.
   **Action:** Introduce low-friction contribution paths (polls, reactions, one-click answers).

---

## Usage Notes

- Update this scorecard at the same cadence as your community review (monthly recommended).
- Compare against industry benchmarks when available; community health varies significantly by type.
- Pair quantitative metrics with qualitative member feedback (surveys, interviews) at least quarterly.
