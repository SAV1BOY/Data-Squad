# AARRR Pirate Metrics Framework

> Source: Dave McClure's "Startup Metrics for Pirates" (2007)

---

## Overview

AARRR (Pirate Metrics) is a five-stage lifecycle framework for measuring how users
move from first contact to revenue generation and advocacy. The acronym stands for
Acquisition, Activation, Retention, Revenue, and Referral. It provides startups and
growth teams with a simple, actionable structure to identify where the biggest
drop-offs occur and where to focus optimization efforts.

---

## When to Use

- When a startup or product team needs a baseline measurement framework.
- When diagnosing "where in the user journey are we losing people?"
- When building a growth model and need to identify the weakest funnel stage.
- When aligning product, marketing, and engineering around shared lifecycle metrics.
- When creating a data-informed prioritization system for growth experiments.

---

## Core Concept

### The Five Stages

| Stage          | Question Answered                          | Key Metrics                              |
|----------------|--------------------------------------------|------------------------------------------|
| **Acquisition**| How do users find us?                      | Visitors, signups, CAC, channel mix      |
| **Activation** | Do users have a great first experience?    | Onboarding completion, aha-moment rate   |
| **Retention**  | Do users come back?                        | D1/D7/D30 retention, DAU/MAU, churn     |
| **Revenue**    | Do users pay us?                           | Conversion to paid, ARPU, LTV, MRR      |
| **Referral**   | Do users tell others?                      | Viral coefficient, NPS, referral rate    |

### Key Principles

1. **Measure each stage independently.** A healthy acquisition funnel can mask terrible
   retention. Stage-level visibility is essential.

2. **Fix the biggest leak first.** The stage with the worst relative performance is
   usually the highest-leverage place to invest.

3. **Order is flexible.** While AARRR is often presented as linear, in practice
   Retention often matters more than Acquisition (a "leaky bucket" wastes ad spend).

4. **Referral is a growth engine, not an afterthought.** Strong referral loops reduce
   CAC and create compounding growth.

---

## Steps / Process

### Step 1: Define Each Stage for Your Product
- Acquisition: What counts as "acquired"? (Visit? Signup? App install?)
- Activation: What is the "aha moment"? Define the specific action(s).
- Retention: What usage pattern indicates retention? (Daily? Weekly? Monthly?)
- Revenue: What is the monetization event? (Purchase, subscription, upsell?)
- Referral: What constitutes a referral? (Invite sent? Invite accepted?)

### Step 2: Instrument and Measure
- Ensure events are tracked for each stage boundary.
- Build a funnel view showing conversion rates between stages.

### Step 3: Baseline and Benchmark
- Calculate current conversion rates for each stage transition.
- Compare to industry benchmarks where available.
- Identify the stage with the largest absolute drop-off.

### Step 4: Prioritize the Weakest Stage
- Run a sensitivity analysis: which stage improvement would have the largest impact
  on the bottom-line metric (revenue or active users)?
- Allocate experimentation resources to that stage.

### Step 5: Experiment and Iterate
- Design experiments targeting the weakest stage (see Experiment Framework).
- Track stage-level metrics weekly.
- Reassess priorities monthly as the bottleneck shifts.

### Step 6: Build Stage-Specific Dashboards
- Each stage should have its own dashboard with leading and lagging indicators.
- Include cohort views for Retention and Revenue.

---

## Inputs / Outputs

### Inputs
| Input                          | Source                        |
|--------------------------------|-------------------------------|
| User event data                | Analytics / product analytics |
| Revenue and transaction data   | Billing system / data warehouse|
| Channel attribution data       | Marketing / ad platforms      |
| Product definition of "aha"    | Product team                  |

### Outputs
| Output                         | Consumer                      |
|--------------------------------|-------------------------------|
| Stage conversion rates         | Growth team, leadership       |
| Bottleneck identification      | Growth / product team         |
| Experiment prioritization      | Growth team                   |
| Cohort retention curves        | Product, leadership           |
| Referral loop analysis         | Growth / marketing            |

---

## Pitfalls

1. **Over-indexing on Acquisition.** It is the easiest stage to measure and the most
   tempting to optimize, but often not the highest-leverage stage.

2. **Vague Activation definition.** If "activation" is just "signed up," you are not
   measuring value delivery. Define activation as the moment the user gets value.

3. **Ignoring cohort effects in Retention.** Aggregate retention masks cohort-level
   trends. Always look at retention by signup cohort.

4. **Treating stages as independent.** Improving activation often improves retention.
   Understand the dependencies.

5. **Referral as a bolt-on.** Building referral mechanics after the fact is much harder
   than designing for virality from the start.

6. **Revenue without unit economics.** Revenue growth that comes with negative unit
   economics (LTV < CAC) is not sustainable. Always pair with profitability metrics.

7. **One-size-fits-all time windows.** A daily-use app and a monthly-use SaaS tool
   need different retention windows. Calibrate to your product's natural frequency.

---

## Cross-References

- [North Star Metric](north-star-metric.md) -- The NSM often maps to one AARRR stage
  (typically Retention or Revenue).
- [Cohort Analysis](cohort-analysis.md) -- Essential for the Retention stage.
- [CLV Modeling](clv-modeling.md) -- Deep dive into the Revenue stage.
- [Experiment Framework](experiment-framework.md) -- How to run experiments at each
  stage.
- [HEART UX Metrics](heart-ux-metrics.md) -- A complementary product-experience lens.
- [KPI Tree](kpi-tree.md) -- Decomposing each AARRR stage into driver metrics.
- [McClure Pirate Metrics Original](mcclure-pirate-metrics-original.md) -- Extended
  reference on McClure's original formulation.

---

## Used By

| Task | Agents | Path |
|------|--------|------|
| create-kpi-tree | data-chief, avinash-kaushik, sean-ellis | `tasks/definition/create-kpi-tree.md` |
| run-funnel-analysis | sean-ellis, avinash-kaushik | `tasks/analysis/run-funnel-analysis.md` |
| activation-audit | sean-ellis, wes-kao, avinash-kaushik | `tasks/growth/activation-audit.md` |

**Workflows:** activation-audit, funnel-analysis
