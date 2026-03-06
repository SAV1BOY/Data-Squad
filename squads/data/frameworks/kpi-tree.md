# KPI Tree Framework

> Also known as: Metric Tree, Driver Tree, Metric Decomposition

---

## Overview

A KPI Tree is a hierarchical decomposition of a top-level metric (typically the North
Star Metric) into its mathematical or logical drivers, and those drivers into their
input metrics. The tree creates a clear line of sight from company-level outcomes down
to team-level actions, ensuring every squad knows *which lever they own* and *how their
work connects to the whole*.

The structure follows:
**North Star -> Driver Metrics -> Input Metrics -> Owners**

---

## When to Use

- When you have selected a North Star Metric and need to operationalize it.
- When multiple teams influence the same top-level outcome and need clear ownership.
- When diagnosing why a top-level metric moved (up or down).
- When prioritizing initiatives -- work on the input with the highest leverage.
- When building a reporting hierarchy for dashboards.

---

## Core Concept

### Tree Structure

```
North Star Metric
|
+-- Driver A (e.g., New Users Activated)
|   +-- Input A1 (e.g., Signups)
|   |   Owner: Growth team
|   +-- Input A2 (e.g., Activation Rate)
|       Owner: Onboarding team
|
+-- Driver B (e.g., Retained Users)
|   +-- Input B1 (e.g., Week-1 Retention)
|   |   Owner: Product core team
|   +-- Input B2 (e.g., Reactivation Rate)
|       Owner: Lifecycle marketing
|
+-- Driver C (e.g., Revenue per User)
    +-- Input C1 (e.g., Conversion to Paid)
    |   Owner: Monetization team
    +-- Input C2 (e.g., Average Order Value)
        Owner: Merchandising team
```

### Mathematical vs Logical Decomposition

- **Mathematical:** NSM = Driver A x Driver B x Driver C. Changes are traceable
  through arithmetic. Preferred when possible.
- **Logical:** Drivers are causally related but not in a strict formula. Useful for
  qualitative relationships (e.g., NPS -> Retention -> Revenue).

### Ownership Rules

1. Every input metric has exactly one owner (a team or individual).
2. Driver metrics may be shared, but accountability for each input must be singular.
3. Owners have authority to run experiments and allocate effort against their input.
4. Owners report on their input at the agreed cadence.

---

## Steps / Process

### Step 1: Start with the North Star
- Write the NSM at the top. Confirm its definition, data source, and cadence.

### Step 2: Identify First-Level Drivers
- Ask: "What are the 2-5 components that mathematically or causally produce the NSM?"
- Example: Weekly Active Users = New Activated Users + Retained Users + Resurrected
  Users - Churned Users.

### Step 3: Decompose Drivers into Inputs
- For each driver, ask: "What levers does a team pull to move this driver?"
- Go 2-3 levels deep. More than 4 levels usually means the tree is over-engineered.

### Step 4: Assign Owners
- For each leaf-level input, assign a single team or person.
- Confirm they accept ownership and understand the metric definition.

### Step 5: Validate the Tree
- Sanity check: if all inputs improve, does the NSM improve? If not, a driver is
  missing.
- Check for double-counting or overlapping inputs.

### Step 6: Instrument and Baseline
- Ensure every metric in the tree is instrumented and has a current baseline.
- Flag gaps for the data engineering team.

### Step 7: Build the Reporting Rhythm
- Weekly: teams review their input metrics.
- Bi-weekly or monthly: cross-team review of driver metrics.
- Monthly/quarterly: leadership reviews NSM + guardrails.

---

## Inputs / Outputs

### Inputs
| Input                          | Source                        |
|--------------------------------|-------------------------------|
| North Star Metric definition   | Strategy / product leadership |
| Organizational structure       | Org chart / squad topology    |
| Historical metric data         | Data warehouse                |
| Instrumentation inventory      | Data engineering              |

### Outputs
| Output                         | Consumer                      |
|--------------------------------|-------------------------------|
| KPI Tree diagram               | All teams                     |
| Metric ownership matrix        | Squad leads, analytics        |
| Instrumentation gap list       | Data engineering              |
| Dashboard hierarchy spec       | BI / analytics engineering    |
| Review cadence calendar        | Analytics ops                 |

---

## Pitfalls

1. **Too many levels.** A 6-level tree is unmanageable. Aim for 2-3 levels below the
   NSM.

2. **Shared ownership at the leaf level.** If two teams own the same input, neither is
   accountable. Split the metric or reassign.

3. **Ignoring cross-metric dependencies.** Improving Input A1 may degrade Input B2.
   The tree should surface these trade-offs, not hide them.

4. **Static tree.** As the product and org evolve, the tree must be updated. Review
   the structure quarterly.

5. **No mathematical validation.** If the tree claims NSM = A + B + C, verify the
   numbers actually add up in your data. Rounding errors and definitional mismatches
   are common.

6. **Confusing inputs with projects.** "Launch feature X" is a project, not an input
   metric. Keep the tree in metric space.

7. **Missing guardrails.** The KPI tree shows what to optimize; guardrail metrics
   (from the NSM framework) show what not to break.

---

## Cross-References

- [North Star Metric](north-star-metric.md) -- The top of the tree.
- [DMMM (Kaushik)](dmmm-kaushik.md) -- A parallel hierarchy for marketing-specific
  measurement.
- [OKR-to-Metrics Alignment](okr-to-metrics-alignment.md) -- Mapping OKR key results
  to nodes in the KPI tree.
- [ICE/PIE/RICE Prioritization](ice-pie-rice-prioritization.md) -- Prioritizing
  experiments against input metrics.
- [Experiment Framework](experiment-framework.md) -- Running experiments on the levers
  identified in the tree.
