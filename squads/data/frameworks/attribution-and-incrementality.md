# Attribution Models & Incrementality Testing

> Sources: various (Google, Meta, academic marketing science)

---

## Overview

Attribution answers "which touchpoints get credit for a conversion?" Incrementality
answers "did this marketing activity cause conversions that would not have happened
otherwise?" Attribution is an allocation exercise; incrementality is a causal inference
exercise. Both are needed: attribution for day-to-day optimization, incrementality for
strategic budget allocation. This framework covers the main attribution models, their
biases, and how incrementality testing corrects for those biases.

---

## When to Use

- When allocating marketing budget across channels and need to know which channels
  drive value.
- When last-click attribution is the default and stakeholders suspect it is wrong.
- When preparing to increase or cut spend on a channel and want causal evidence.
- When building a measurement strategy for a multi-channel marketing program.
- When evaluating vendor claims about channel performance.

---

## Core Concept

### Attribution Models

| Model               | Credit Allocation                                    | Bias                              |
|---------------------|------------------------------------------------------|-----------------------------------|
| **Last Click**      | 100% to final touchpoint before conversion           | Over-credits bottom-funnel        |
| **First Click**     | 100% to first touchpoint                             | Over-credits top-funnel           |
| **Linear**          | Equal credit to all touchpoints                      | Ignores relative influence         |
| **Time Decay**      | More credit to recent touchpoints                    | Still over-credits bottom-funnel  |
| **Position-Based**  | 40% first, 40% last, 20% split among middle          | Arbitrary weights                 |
| **Algorithmic/DDA** | ML model assigns credit based on path data            | Data-hungry, opaque               |
| **Media Mix Model** | Regression on aggregate spend and outcomes             | Low granularity, requires history |

### The Fundamental Problem

All attribution models share a flaw: they allocate credit among observed touchpoints
but cannot determine **what would have happened without the touchpoint.** This is the
counterfactual question -- and only incrementality testing can answer it.

### Incrementality Testing Methods

| Method                   | How It Works                                          | Best For                 |
|--------------------------|-------------------------------------------------------|--------------------------|
| **Geo-lift experiments** | Randomly increase/decrease spend in geographic regions| Display, TV, OOH         |
| **Ghost ads / PSA test** | Show a PSA to control group, real ad to treatment     | Display, social ads       |
| **Holdout test**         | Suppress a channel for a random group                 | Email, retargeting        |
| **Matched market test**  | Compare similar markets with different spend levels   | Offline, regional         |
| **Conversion lift study**| Platform-run (Meta, Google) randomized test           | Platform-specific ads     |

---

## Steps / Process

### Step 1: Audit Current Attribution
- What model is in use today? (Usually last-click by default.)
- What data is collected? (UTMs, cookies, device IDs, CRM linkage.)
- What decisions are being made with current attribution data?

### Step 2: Identify High-Stakes Channels
- Which channels receive the largest budget?
- Which channels have the most uncertain ROI?
- Prioritize incrementality testing on these channels first.

### Step 3: Design an Incrementality Test
- Choose the method based on channel type and feasibility.
- Define the test and control groups.
- Calculate required sample size / test duration for the expected effect size.
- Pre-register the analysis plan.

### Step 4: Run the Test
- Maintain test/control separation for the full duration.
- Monitor for contamination (control group exposed to treatment).
- Collect conversion data for both groups.

### Step 5: Analyze Results
- Compute the incremental lift: (Treatment conversion rate - Control conversion rate)
  / Control conversion rate.
- Calculate incremental CPA: Spend / Incremental Conversions.
- Report confidence intervals, not just point estimates.

### Step 6: Reconcile Attribution and Incrementality
- Compare attributed conversions to incremental conversions for the tested channel.
- The ratio reveals the attribution model's bias for that channel.
- Adjust future budget allocation accordingly.

### Step 7: Build a Measurement Stack
- Use attribution models for daily/weekly tactical optimization.
- Run incrementality tests quarterly on high-spend channels.
- Use media mix models annually for strategic budget planning.
- Triangulate across all three for the most robust view.

---

## Inputs / Outputs

### Inputs
| Input                          | Source                          |
|--------------------------------|---------------------------------|
| Touchpoint / event-level data  | Analytics, ad platforms, CRM    |
| Conversion data                | Data warehouse, billing         |
| Channel spend data             | Finance, ad platforms           |
| Geographic / segment metadata  | CRM, data warehouse             |

### Outputs
| Output                         | Consumer                        |
|--------------------------------|---------------------------------|
| Attribution reports by channel | Marketing, leadership           |
| Incrementality test results    | Marketing strategy, finance     |
| Incremental CPA by channel     | Budget planning                 |
| Attribution bias estimates     | Analytics, marketing            |
| Budget reallocation guidance   | Marketing leadership            |

---

## Pitfalls

1. **Treating attribution as truth.** Attribution models are conventions, not causal
   estimates. They should inform, not dictate.

2. **Never testing incrementality.** Without incrementality tests, you cannot know if
   attributed conversions are truly caused by the channel.

3. **Cookie / tracking degradation.** Privacy regulations and browser changes (ITP,
   cookie deprecation) make user-level attribution increasingly unreliable.

4. **Platform self-attribution.** Ad platforms (Google, Meta) attribute conversions
   generously to themselves. Use independent measurement.

5. **Short test windows.** Incrementality tests need sufficient duration to capture
   the full conversion cycle. Cutting tests short produces unreliable results.

6. **Ignoring long-term effects.** Incrementality tests measure short-term lift.
   Brand-building channels may have effects that manifest over months.

7. **Contamination.** If the control group is exposed to the treatment channel through
   other means, the test understates true incrementality.

---

## Cross-References

- [DMMM (Kaushik)](dmmm-kaushik.md) -- Attribution informs the KPI and segment layers.
- [STDC (Kaushik)](stdc-kaushik.md) -- Different STDC stages require different
  attribution approaches.
- [Experiment Framework](experiment-framework.md) -- Incrementality tests follow the
  experiment lifecycle.
- [Bayesian vs Frequentist Testing](bayesian-vs-frequentist-testing.md) -- Statistical
  approaches for analyzing incrementality tests.
- [Community-Led Growth Metrics](community-led-growth-metrics.md) -- Attribution
  challenges for community channels.
