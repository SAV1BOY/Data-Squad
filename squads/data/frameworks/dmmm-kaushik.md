# Digital Marketing & Measurement Model (DMMM)

> Source: Avinash Kaushik's "Digital Marketing & Measurement Model"

---

## Overview

The Digital Marketing & Measurement Model (DMMM) is a structured approach to ensuring
that every digital initiative is tied to a clear business objective, measured by the
right KPIs, held to explicit targets, and segmented for actionable insight. It forces
organizations to move from vanity metrics to decision-driving measurement by working
top-down from business purpose to data collection.

The model follows a strict five-step cascade:
**Objective -> Goal -> KPI -> Target -> Segment**

---

## When to Use

- When launching or auditing a digital marketing program and metrics feel scattered.
- When stakeholders ask "what should we measure?" for a new channel or campaign.
- When dashboards exist but nobody acts on the data they show.
- When the analytics team needs a shared vocabulary with marketing and leadership.
- When you need to justify measurement investment by tying it to business outcomes.

---

## Core Concept

### The Five-Step Cascade

1. **Objective** -- The broad business intent (e.g., "Build brand awareness among
   mid-market CFOs"). Objectives are qualitative and strategic. A business typically
   has 3-5 digital objectives at most.

2. **Goal** -- Specific, crisp outcomes that indicate progress toward the objective.
   Goals are still outcome-oriented but more concrete (e.g., "Increase unaided brand
   recall by 15 pp among target segment within 12 months").

3. **KPI** -- The metric that quantifies goal attainment. KPIs should be ratios or
   rates, not raw counts, to enable comparison across time and segments (e.g.,
   "Branded search volume growth rate," "Share of voice in target publications").

4. **Target** -- The numerical threshold that defines success or failure for each KPI
   over a specific time horizon. Targets should be informed by baselines, benchmarks,
   and business context (e.g., "20% YoY increase in branded search queries").

5. **Segment** -- The lens through which you decompose KPI performance to find
   actionable insight. Common segments: traffic source, device, geography, customer
   lifecycle stage, campaign, content type.

### Why the Order Matters

Working top-down prevents the common failure mode of "collect everything and hope
insight emerges." Each layer constrains the next, ensuring measurement serves strategy
rather than the reverse.

---

## Steps / Process

### Step 1: Identify Business Objectives
- Convene leadership and marketing stakeholders.
- Ask: "Why does this digital presence / campaign / channel exist?"
- Aim for 3-5 objectives maximum. Consolidate overlapping intents.
- Express objectives without numbers -- they are directional.

### Step 2: Define Goals per Objective
- For each objective, define 2-4 measurable goals.
- Goals must be SMART-adjacent: specific, time-bound, outcome-oriented.
- Test: "If we achieved this goal, would the objective advance?" If not, revise.

### Step 3: Select KPIs per Goal
- Choose 1-3 KPIs per goal (prefer fewer).
- Favor ratios (conversion rate, engagement rate) over absolutes (page views, clicks).
- Validate: "Can we actually collect this data reliably today?"
- Assign an owner to each KPI.

### Step 4: Set Targets per KPI
- Establish a baseline (current performance over a meaningful period).
- Set targets using one or more of: historical trend, industry benchmark, business
  requirement, statistical forecast.
- Define review cadence (weekly, monthly, quarterly).

### Step 5: Identify Segments per KPI
- For each KPI, list 2-5 segments that would reveal root cause if the KPI moves.
- Prioritize segments that are actionable (you can change strategy based on findings).
- Ensure the data pipeline supports each segmentation dimension.

### Step 6: Build the Measurement Plan Document
- Create a single table mapping Objective -> Goals -> KPIs -> Targets -> Segments.
- Share with all stakeholders for alignment sign-off.
- Revisit quarterly or when strategy shifts.

---

## Inputs / Outputs

### Inputs
| Input                        | Source                              |
|------------------------------|-------------------------------------|
| Business strategy document   | Leadership / strategy team          |
| Current analytics baseline   | Analytics platform (GA, Mixpanel)   |
| Industry benchmarks          | Analyst reports, platform data      |
| Channel/campaign plan        | Marketing team                      |
| Data infrastructure inventory| Data/engineering team               |

### Outputs
| Output                       | Consumer                            |
|------------------------------|-------------------------------------|
| DMMM mapping table           | All stakeholders                    |
| KPI ownership roster         | Analytics & marketing leads         |
| Dashboard requirements       | BI / analytics engineering          |
| Data collection gap list     | Data engineering                    |
| Quarterly review cadence     | Marketing ops                       |

---

## Pitfalls

1. **Starting with KPIs instead of objectives.** This is the most common failure. If
   you begin by asking "what can we measure?" you end up with vanity dashboards.

2. **Too many KPIs.** More than 3 per goal signals lack of clarity. Ruthlessly
   prioritize.

3. **Targets without baselines.** A target of "10% conversion rate" is meaningless if
   you do not know the current rate. Always establish baselines first.

4. **Ignoring segments.** A KPI at the aggregate level often hides divergent stories
   across segments. The DMMM is incomplete without the segmentation layer.

5. **Set-and-forget.** The model must be revisited when strategy, channels, or market
   conditions change. Treat the DMMM as a living document.

6. **Confusing KPIs with diagnostic metrics.** KPIs measure goal attainment.
   Diagnostic metrics help you understand *why* a KPI moved. Keep them separate in
   your reporting hierarchy.

7. **Organizational misalignment.** If the people setting objectives never see the
   KPI results, the loop is broken. Ensure reporting reaches decision-makers.

---

## Cross-References

- [See-Think-Do-Care Framework](stdc-kaushik.md) -- Kaushik's intent-stage model that
  often feeds into DMMM objectives.
- [North Star / OMTM](north-star-metric.md) -- How a single metric relates to the
  broader DMMM hierarchy.
- [KPI Tree](kpi-tree.md) -- A complementary decomposition technique for driver
  analysis beneath KPIs.
- [OKR-to-Metrics Alignment](okr-to-metrics-alignment.md) -- Connecting organizational
  OKRs to the DMMM cascade.
- [Kaushik Web Analytics 2.0](kaushik-web-analytics-2-0-framework.md) -- Broader
  analytics philosophy that underpins the DMMM.

---

## Used By

| Task | Agents | Path |
|------|--------|------|
| create-kpi-tree | data-chief, avinash-kaushik, sean-ellis | `tasks/definition/create-kpi-tree.md` |
| build-measurement-plan | data-chief, avinash-kaushik | `tasks/instrumentation/build-measurement-plan.md` |

**Workflows:** kpi-tree-build, measurement-plan
