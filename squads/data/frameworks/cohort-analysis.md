# Cohort Analysis Framework

> Foundational technique in product analytics and customer analytics

---

## Overview

Cohort analysis groups users by a shared characteristic (typically their signup or
acquisition date) and tracks their behavior over subsequent time periods. It is the
most important technique for understanding retention, engagement decay, and the true
impact of product changes -- because it separates the behavior of different user
vintages rather than mixing them together in aggregate metrics.

---

## When to Use

- When diagnosing whether retention is improving or degrading over time.
- When measuring the impact of a product change on new user behavior.
- When forecasting lifetime value or long-term engagement patterns.
- When aggregate metrics (e.g., DAU) are flat but you suspect compositional shifts.
- When comparing the quality of users acquired from different channels or campaigns.

---

## Core Concept

### What is a Cohort?

A cohort is a group of users who share a defining event within a time window.

| Cohort Type         | Defining Event                                     |
|---------------------|----------------------------------------------------|
| **Acquisition**     | Date of signup, install, or first visit             |
| **Behavioral**      | Date of first purchase, first feature use, etc.     |
| **Segment-based**   | Users sharing an attribute (plan type, geography)   |

### The Cohort Table (Retention Triangle)

Rows = cohorts (e.g., Jan signups, Feb signups).
Columns = periods since cohort entry (Week 0, Week 1, ... Week N).
Cells = metric value (e.g., % of cohort still active).

```
              Week 0   Week 1   Week 2   Week 3   Week 4
Jan cohort    100%     45%      30%      25%      22%
Feb cohort    100%     48%      33%      28%      --
Mar cohort    100%     52%      36%      --       --
Apr cohort    100%     55%      --       --       --
```

### Reading the Table

- **Across a row:** How a single cohort ages. Shows the retention curve shape.
- **Down a column:** How the same maturity point changes across cohorts. Shows whether
  the product is improving for new users.
- **Diagonals:** Users active in the same calendar period but from different cohorts.
  Diagonals sum to your aggregate active user count.

---

## Steps / Process

### Step 1: Define the Cohort Type and Granularity
- Choose the cohort-defining event (signup, first purchase, etc.).
- Choose time granularity: daily (high-frequency products), weekly (most SaaS),
  monthly (low-frequency products).

### Step 2: Define the Metric
- Retention rate (% returning), revenue per user, feature adoption rate, etc.
- Be precise: "returning" means what? Any login? Core action? Define explicitly.

### Step 3: Build the Cohort Table
- Query your data warehouse to produce the retention triangle.
- Ensure each user is assigned to exactly one cohort.

### Step 4: Visualize
- **Heatmap:** Color-code cells (green = good, red = bad). Quickly reveals patterns.
- **Retention curves:** Plot each cohort as a line on the same axes. Compare shapes.
- **Stacked area:** Shows how cohorts contribute to aggregate metrics over time.

### Step 5: Interpret Patterns
- **Flattening curves:** Retention stabilizes after a period -- you have a retained
  core. Good sign.
- **Curves that never flatten:** Users keep leaving -- product-market fit concern.
- **Improving columns:** Newer cohorts retain better at the same maturity -- product
  improvements are working.
- **Degrading columns:** Newer cohorts retain worse -- possible quality regression or
  channel mix shift.

### Step 6: Diagnose Root Causes
- If columns degrade: check acquisition channel mix (lower-quality channels scaling?).
- If a single cohort is anomalous: check for one-time events (outage, viral spike).
- Cross-reference with behavioral cohorts to test hypotheses.

### Step 7: Act
- Feed findings into the experiment backlog.
- Adjust channel spend if acquisition-cohort quality varies.
- Update CLV models with the latest retention curves.

---

## Inputs / Outputs

### Inputs
| Input                          | Source                          |
|--------------------------------|---------------------------------|
| User event data with timestamps| Data warehouse                  |
| User acquisition metadata      | Marketing / attribution system  |
| Product change changelog       | Product team                    |

### Outputs
| Output                         | Consumer                        |
|--------------------------------|---------------------------------|
| Cohort retention table         | Product, growth, leadership     |
| Retention curve visualizations | Dashboards, board decks         |
| Cohort quality comparisons     | Marketing, growth               |
| CLV model inputs               | Finance, analytics              |

---

## Pitfalls

1. **Survivorship bias.** Only analyzing users who are still around ignores the shape
   of churn. Always start cohorts at 100% and show the full decay.

2. **Incomplete cohorts.** Recent cohorts have fewer data points. Do not compare a
   4-week-old cohort's Week 12 retention to a mature cohort's. Compare at the same
   maturity.

3. **Cohort size variation.** A viral spike may create an unusually large (and
   potentially low-quality) cohort. Note cohort sizes alongside retention rates.

4. **Ignoring reactivation.** Standard retention counts only users who were active in
   period N. Some analyses should also track resurrection (users who returned after
   a gap).

5. **Aggregation bias (Simpson's Paradox).** Aggregate retention can improve even if
   every cohort's retention is declining -- because the mix of cohorts shifted. Always
   look at individual cohorts.

6. **Wrong time granularity.** Weekly cohorts for a product used monthly will show
   artificially low D7 retention. Match granularity to product usage frequency.

7. **Confusing calendar time with cohort age.** A holiday in December affects all
   cohorts at different ages. Seasonal effects should be controlled for.

---

## Cross-References

- [AARRR Pirate Metrics](aarrr-pirate-metrics.md) -- Retention is the "R" that cohort
  analysis illuminates best.
- [CLV Modeling](clv-modeling.md) -- Retention curves are a primary input to CLV
  models.
- [RFM Segmentation](rfm-segmentation.md) -- Behavioral segmentation that complements
  cohort analysis.
- [North Star Metric](north-star-metric.md) -- Cohort views of the NSM reveal whether
  the product is truly improving.
- [Simpson's Paradox Awareness](simpson-paradox-awareness.md) -- The statistical trap
  that cohort analysis helps avoid.

---

## Used By

| Task | Agents | Path |
|------|--------|------|
| run-cohort-analysis | peter-fader, data-chief | `tasks/analysis/run-cohort-analysis.md` |
| retention-diagnostics | peter-fader, nick-mehta, data-chief | `tasks/retention-clv/retention-diagnostics.md` |

**Workflows:** cohort-analysis, retention-diagnostics
