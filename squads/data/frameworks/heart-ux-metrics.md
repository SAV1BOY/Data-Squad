# Google HEART UX Metrics Framework

> Source: Kerry Rodden, Hilary Hutchinson, Xin Fu (Google, 2010)

---

## Overview

HEART is a user-experience metrics framework developed at Google to help product teams
choose meaningful UX metrics at scale. It organizes metrics into five categories:
Happiness, Engagement, Adoption, Retention, and Task Success. HEART is designed to
complement business metrics (like revenue) with user-centered quality signals that
predict long-term product health.

The framework is paired with a Goals-Signals-Metrics (GSM) process for selecting the
right metric within each category.

---

## When to Use

- When a product team needs UX-specific metrics beyond business KPIs.
- When redesigning a feature and needing before/after quality measures.
- When stakeholders conflate usage volume with user satisfaction.
- When building a product quality scorecard alongside business dashboards.
- When evaluating the impact of UX improvements in A/B tests.

---

## Core Concept

### The Five Categories

| Category         | What It Measures                              | Example Metrics                          |
|------------------|-----------------------------------------------|------------------------------------------|
| **Happiness**    | Subjective user satisfaction and sentiment    | NPS, CSAT, SUS score, satisfaction survey|
| **Engagement**   | Depth and frequency of interaction            | Sessions/week, actions/session, DAU/MAU  |
| **Adoption**     | New users or new feature uptake               | New signups, feature adoption rate       |
| **Retention**    | Users returning over time                     | D7/D30 retention, churn rate             |
| **Task Success** | Efficiency and effectiveness of key tasks     | Task completion rate, error rate, time   |

### Goals-Signals-Metrics (GSM) Process

For each HEART category:

1. **Goal:** What is the desired user outcome? (e.g., "Users find the search feature
   easy to use.")
2. **Signal:** What user behavior or attitude would indicate success? (e.g., "Users
   complete searches without reformulating queries.")
3. **Metric:** How do we quantify the signal? (e.g., "% of searches with zero
   reformulations in the first 3 results.")

GSM prevents teams from picking metrics arbitrarily. Every metric must trace back to
a goal through an observable signal.

---

## Steps / Process

### Step 1: Scope the Product or Feature
- Decide whether you are applying HEART at the product level or feature level.
- Feature-level HEART is more actionable; product-level is better for executive
  reporting.

### Step 2: Run a GSM Workshop
- Gather product, design, engineering, and analytics stakeholders.
- For each HEART category, brainstorm Goals, then Signals, then Metrics.
- Use sticky notes or a shared doc; timebox to 90 minutes.

### Step 3: Select 1-2 Metrics per Category
- Not every category needs a metric. Choose categories relevant to your current
  product questions.
- Prefer behavioral metrics over survey metrics where possible (lower cost, higher
  frequency).

### Step 4: Validate Data Availability
- Confirm each selected metric can be instrumented.
- Identify gaps and file instrumentation requests.

### Step 5: Baseline and Set Targets
- Measure current performance for each selected metric.
- Set improvement targets based on historical trends or benchmarks.

### Step 6: Integrate into Experiment Analysis
- Include HEART metrics as secondary metrics in A/B tests.
- Track alongside primary business metrics to detect UX regressions.

---

## Inputs / Outputs

### Inputs
| Input                          | Source                          |
|--------------------------------|---------------------------------|
| Product/feature scope          | Product manager                 |
| User research insights         | UX research team                |
| Event tracking inventory       | Analytics / data engineering    |
| Survey infrastructure          | UX research / analytics         |

### Outputs
| Output                         | Consumer                        |
|--------------------------------|---------------------------------|
| HEART scorecard                | Product team, design team       |
| GSM mapping document           | Analytics, product              |
| Instrumentation requirements   | Data engineering                |
| UX quality trend reports       | Leadership, product reviews     |

---

## Pitfalls

1. **Trying to fill every cell.** Not all five categories are relevant for every
   feature. Forcing metrics into irrelevant categories creates noise.

2. **Over-relying on Happiness surveys.** Surveys have low response rates and
   selection bias. Balance with behavioral metrics.

3. **Confusing Engagement with Addiction.** High engagement driven by dark patterns is
   not a positive signal. Pair Engagement with Happiness.

4. **Ignoring Task Success.** This is often the most actionable category but the least
   measured. Task completion rate and time-on-task reveal concrete UX problems.

5. **No connection to business metrics.** HEART metrics should correlate with business
   outcomes. If Happiness improves but retention does not, investigate the disconnect.

6. **Static scorecard.** As the product evolves, revisit the GSM mapping. Metrics that
   mattered at launch may be irrelevant at maturity.

7. **Aggregation masking segments.** A product-level Happiness score of 4.2/5 may hide
   that power users score 4.8 and new users score 3.1. Segment always.

---

## Cross-References

- [AARRR Pirate Metrics](aarrr-pirate-metrics.md) -- HEART's Adoption and Retention
  overlap with AARRR stages; HEART adds Happiness and Task Success.
- [Experiment Framework](experiment-framework.md) -- Using HEART metrics as experiment
  success criteria.
- [North Star Metric](north-star-metric.md) -- The NSM may draw from HEART's
  Engagement or Retention category.
- [Data Storytelling](data-storytelling-framework.md) -- Presenting HEART insights to
  stakeholders.
- [Cohort Analysis](cohort-analysis.md) -- Essential for the Retention category.
