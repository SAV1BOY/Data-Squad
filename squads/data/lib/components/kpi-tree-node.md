# KPI Tree Node Component

A building block for constructing KPI trees that show how metrics relate to each other through driver relationships.

---

## Template

### Node Identity

| Field              | Value                              |
|--------------------|------------------------------------|
| **Metric Name**    | _e.g., Revenue_                    |
| **Node Level**     | L0 (North Star) / L1 / L2 / L3    |
| **Owner**          | _Team or individual_               |
| **Data Source**     | _Table or system_                  |

### Driver Relationship

Each node connects to its parent through a mathematical or logical relationship.

**Parent metric:** _The metric this node feeds into._

**Relationship type:**

| Type            | Description                                | Example                                      |
|-----------------|--------------------------------------------|----------------------------------------------|
| Multiplicative  | Parent = Child_A x Child_B                 | Revenue = Users x ARPU                       |
| Additive        | Parent = Child_A + Child_B + ...           | Total Users = New + Returning                |
| Ratio           | This node is a ratio of two sibling nodes  | Conversion Rate = Purchasers / Visitors      |
| Weighted        | Parent = sum(Child_i x Weight_i)           | Health Score = 0.4*Usage + 0.3*NPS + 0.3*Support |
| Logical         | Qualitative driver, not strictly formulaic  | Brand Awareness drives Organic Traffic       |

**Driver formula:**
```
parent_metric = f(this_metric, sibling_metrics)
```

### Target and Status

| Field               | Value            |
|----------------------|-----------------|
| **Current Value**    | _e.g., $2.4M_  |
| **Target**           | _e.g., $2.6M_  |
| **Target Period**    | _e.g., Q1 2026_|
| **Status**           | On Track / At Risk / Off Track |
| **Confidence**       | High / Medium / Low |

### Child Nodes

List the metrics that drive this node:

| Child Metric       | Relationship | Owner           | Status    |
|--------------------|-------------|-----------------|-----------|
| Paying Users       | Multiplicative | Growth        | On Track  |
| ARPU               | Multiplicative | Monetization  | At Risk   |

### Sensitivity Analysis

How much does a change in this node affect the parent?

| Scenario                  | This Node Change | Parent Impact |
|---------------------------|-----------------|---------------|
| +10% improvement          | +10%            | +4.2%         |
| -10% degradation          | -10%            | -4.2%         |
| Realistic upside (1 quarter) | +5%          | +2.1%         |

---

## Tree Construction Rules

1. **L0 (North Star):** One metric that represents overall business health. Owned by executive team.
2. **L1 (Strategic):** 3-5 metrics that mathematically decompose L0. Owned by VPs.
3. **L2 (Tactical):** Metrics that decompose L1. Owned by team leads. These are what most teams manage day-to-day.
4. **L3 (Operational):** Granular metrics that decompose L2. Owned by individual contributors or squads.

### Validation Checklist

- [ ] Every L1 node can be recombined to produce L0 (the math checks out).
- [ ] Every node has exactly one owner.
- [ ] No metric appears in more than one branch (avoid double-counting).
- [ ] Leaf nodes are directly actionable by the owning team.
- [ ] Targets at child level are consistent with the parent target.

---

## Example: Revenue Tree

```
L0: Monthly Revenue ($2.4M)
    |
    +-- L1: Paying Users (12,000) [Multiplicative]
    |       |
    |       +-- L2: New Paid Users (1,800)
    |       +-- L2: Retained Paid Users (10,200)
    |
    +-- L1: ARPU ($200) [Multiplicative]
            |
            +-- L2: Avg Transactions per User (3.2)
            +-- L2: Avg Transaction Value ($62.50)
```

Each node in this tree uses the KPI Tree Node template above. The tree is reviewed monthly, and node ownership is updated quarterly.
