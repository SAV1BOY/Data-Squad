# OKR-to-Metrics Alignment Framework

> Ensuring every metric connects to a strategic objective and every OKR has measurable proof.

## Overview

OKRs without metrics are wishes. Metrics without OKRs are noise. This framework connects company OKRs to team KPIs to operational metrics, ensuring bidirectional alignment.

## When to Use

- Quarterly OKR planning and metric selection
- When new metrics are proposed (verify OKR connection)
- When OKR progress reviews show disconnects
- During North Star Metric definition or revision

## The Alignment Cascade

```
Company OKR (Objective + Key Results)
    |
    v
Team KPI (directly supports a Key Result)
    |
    v
Operational Metric (leading indicator for Team KPI)
    |
    v
Input Metric (actionable lever the team controls)
```

### Rules

1. Every Key Result must have at least one KPI that directly measures progress
2. Every Team KPI must trace upward to a company Key Result
3. Leading indicators complement lagging indicators
4. Input metrics must be actionable -- the team must be able to influence them
5. No orphan metrics -- if a metric doesn't connect to an OKR, question why it exists

## Alignment Verification Process

### Step 1: Map Current State
- List all active OKRs (company and team level)
- List all tracked metrics and dashboards
- Draw connections between metrics and OKRs

### Step 2: Identify Gaps
- **OKRs without metrics:** Strategic goals with no measurement (dangerous)
- **Metrics without OKRs:** Measurements that don't connect to strategy (noise)
- **Lagging-only coverage:** OKRs measured only by outcome metrics, no leading indicators

### Step 3: Fill Gaps
- For unmeasured OKRs: define KPIs using metric-definition-quality checklist
- For orphan metrics: connect to an OKR or deprecate
- For lagging-only: add leading indicators that predict the outcome

### Step 4: Validate Causality
- For each leading -> lagging connection: "If we improve X, does Y improve?"
- Use historical data (correlation first, experimentation for causation)
- Flag unproven connections

### Step 5: Document and Review
- Record alignment map in data/registries/metric-registry.yaml
- Review quarterly during OKR planning

## Common Disconnects

| Disconnect | Symptom | Fix |
|-----------|---------|-----|
| Vanity in OKRs | KR is "increase page views" | Replace with outcome metric |
| Lagging only | All KRs are quarterly outcomes | Add weekly leading indicators |
| No input metrics | Team can't influence their KPI | Find upstream levers |
| Over-aggregation | Company metric hides team problems | Decompose into team sub-metrics |
| Gaming risk | Metric easily inflated | Add guardrail metrics |
| Missing guardrails | Optimizing one at expense of others | Define "must not degrade" metrics |

## Alignment Workshop (90 min)

1. **(15 min)** Present company OKRs and current metric landscape
2. **(20 min)** Each team maps their metrics to company Key Results
3. **(15 min)** Identify gaps: unmeasured OKRs, orphan metrics
4. **(20 min)** Propose new metrics or deprecations
5. **(10 min)** Validate: "if we move X, does Y improve?"
6. **(10 min)** Assign owners and update registry

## Inputs / Outputs

**Inputs:** Company OKRs, team metrics, historical data
**Outputs:** Alignment map, gap analysis, updated metric-registry.yaml, deprecation candidates

## Pitfalls

1. **Forcing alignment** -- some metrics are hygiene (data quality, uptime). Label them as such.
2. **Correlation as causation** -- validate causal links with experiments
3. **Over-measuring** -- 2-3 well-chosen metrics beat 20 poorly defined ones
4. **Ignoring counter-metrics** -- always pair with guardrails

## Cross-References

- `frameworks/kpi-tree.md` -- structural representation of alignment
- `frameworks/north-star-metric.md` -- top of the cascade
- `checklists/metric-definition-quality.md` -- quality gate for new metrics
- `data/registries/metric-registry.yaml` -- where alignment is recorded
