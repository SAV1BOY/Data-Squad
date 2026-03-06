# Segment Classification Taxonomy

A classification system for user and customer segments. Provides a shared vocabulary for how segments are defined, categorized, and used across teams.

---

## Segment Types

### 1. Behavioral Segments

Based on what users do in the product.

| Segment                | Definition                                          | Example Criteria                        |
|------------------------|-----------------------------------------------------|-----------------------------------------|
| Power Users            | Users with high engagement frequency and depth       | 5+ sessions/week AND 8+ features used  |
| Casual Users           | Users who engage occasionally                        | 1-2 sessions/week                      |
| Dormant Users          | Users who were active but have stopped               | No activity in 30+ days, was active within prior 90 |
| New Users              | Users in their first N days                          | Signed up within last 14 days          |
| Feature Adopters       | Users who have used a specific feature               | Used feature X at least once           |
| Multi-Platform Users   | Users active on more than one platform               | Sessions on web AND mobile             |
| Content Creators       | Users who generate content (posts, projects, uploads)| 3+ content items created               |
| Searchers              | Users who primarily use search functionality         | 5+ searches per session average        |

### 2. Demographic Segments

Based on who users are. Typically from registration, survey, or enrichment data.

| Segment                | Definition                                          | Example Criteria                        |
|------------------------|-----------------------------------------------------|-----------------------------------------|
| Geography              | User's country, region, or city                      | Country = 'United States'              |
| Company Size           | Size of the user's organization (B2B)                | Employees 1-50 (SMB), 51-500 (Mid), 500+ (Enterprise) |
| Industry               | User's industry vertical                             | SaaS, E-commerce, Healthcare, Finance  |
| Role                   | User's job function                                  | Engineering, Marketing, Executive      |
| Language               | User's language preference                           | Browser language or profile setting    |
| Age Group              | User's age range (if collected)                      | 18-24, 25-34, 35-44, 45+              |

### 3. Value-Based Segments

Based on the economic value a user represents.

| Segment                | Definition                                          | Example Criteria                        |
|------------------------|-----------------------------------------------------|-----------------------------------------|
| High-Value             | Top revenue contributors                             | Top 10% by LTV or trailing 12mo revenue|
| Medium-Value           | Moderate revenue contributors                        | 50th-90th percentile by revenue        |
| Low-Value              | Minimal revenue contributors                         | Bottom 50% by revenue                  |
| Free Users             | Users on free plans or with zero revenue             | Plan = 'free' OR revenue = 0           |
| Expansion Candidates   | Users likely to increase spend                       | Usage approaching plan limits          |
| High-Risk Revenue      | Valuable users showing disengagement                 | Top 25% by revenue AND declining activity |

### 4. Lifecycle Segments

Based on where users are in their journey with the product.

| Segment                | Definition                                          | Example Criteria                        |
|------------------------|-----------------------------------------------------|-----------------------------------------|
| Prospect               | Known contact who has not signed up                  | Email in CRM, no account created       |
| Trial                  | User in a free trial period                          | Account created, trial_end_date > today|
| Activated              | User who completed key activation milestones         | Completed onboarding AND first value action |
| Engaged                | Active user past the activation phase                | Active in 3 of last 4 weeks           |
| Retained               | Long-term engaged user                               | Active for 3+ consecutive months       |
| At-Risk                | Previously engaged user showing disengagement        | Activity dropped 50%+ vs prior month   |
| Churned                | User who has stopped using the product               | No activity for 60+ days (or subscription cancelled) |
| Resurrected            | Previously churned user who returned                 | Was churned, now active in last 14 days|
| Expanded               | User who upgraded or increased spend                 | Plan upgrade or add-on purchase        |

---

## Segment Metadata

Every defined segment should include:

| Field              | Description                                          |
|--------------------|------------------------------------------------------|
| Segment Name       | Human-readable name                                  |
| Segment ID         | Machine-readable identifier (e.g., `SEG-BEH-POWER`) |
| Type               | Behavioral / Demographic / Value / Lifecycle         |
| Definition         | Plain-language description                           |
| Criteria           | SQL or logical criteria for membership               |
| Exclusions         | Who is explicitly excluded                           |
| Owner              | Team responsible for the segment                     |
| Refresh Cadence    | How often membership is recalculated                 |
| Size               | Current member count and % of total                  |
| Use Cases          | Where this segment is used (campaigns, dashboards, experiments) |

---

## Segment Hierarchy

Segments should be organized hierarchically to avoid overlaps and enable drill-down:

```
All Users
  |-- Lifecycle Stage
  |     |-- Prospect
  |     |-- Trial
  |     |-- Active (Activated + Engaged + Retained)
  |     |-- At-Risk
  |     |-- Churned
  |     |-- Resurrected
  |
  |-- Value Tier (within Active)
  |     |-- High-Value
  |     |-- Medium-Value
  |     |-- Low-Value
  |     |-- Free
  |
  |-- Behavioral Pattern (within Active)
        |-- Power Users
        |-- Casual Users
        |-- Feature Adopters
        |-- Content Creators
```

### Rules

1. **Lifecycle segments are mutually exclusive.** A user is in exactly one lifecycle stage at any time.
2. **Value segments are mutually exclusive** within the same value dimension.
3. **Behavioral segments can overlap.** A user can be both a Power User and a Content Creator.
4. **Cross-type segments are common.** "High-Value Power Users" combines Value and Behavioral types.

---

## Naming Convention

Format: `{type_prefix}_{descriptor}`

| Type        | Prefix | Example                    |
|-------------|--------|----------------------------|
| Behavioral  | `beh_` | `beh_power_users`          |
| Demographic | `dem_` | `dem_enterprise`           |
| Value       | `val_` | `val_high_value`           |
| Lifecycle   | `lc_`  | `lc_at_risk`               |
| Custom      | `cust_`| `cust_spring_campaign_target` |

---

## Governance

| Activity                              | Frequency  | Owner              |
|---------------------------------------|------------|---------------------|
| Review segment definitions            | Quarterly  | Segment owner + Data|
| Audit segment sizes for drift         | Monthly    | Data team           |
| Retire unused segments                | Semi-annual| Data team           |
| Review overlap between segments       | Quarterly  | Data team           |
| Update criteria after major product changes | As needed | Segment owner   |
