# North Star Metric / One Metric That Matters (OMTM)

> Sources: Sean Ellis (Hacking Growth), Lean Analytics (Croll & Yoskovitz)

---

## Overview

The North Star Metric (NSM) -- sometimes called the One Metric That Matters (OMTM) --
is a single metric that best captures the core value your product delivers to
customers. It serves as a company-wide alignment device: every team's work should
ultimately move this number. The NSM is not the *only* metric; it is the *primary*
metric around which a constellation of supporting metrics, guardrails, and driver
metrics orbit.

---

## When to Use

- When teams are optimizing different metrics that conflict with each other.
- When leadership needs a single health signal for the business.
- When onboarding new team members who need to understand "what matters most."
- When prioritizing initiatives and needing a common yardstick.
- When transitioning from vanity metrics (signups, page views) to value metrics.

---

## Core Concept

### Criteria for a Good North Star Metric

A valid NSM satisfies all of the following:

1. **Reflects customer value delivered.** It measures value *received*, not just value
   *offered*. "Monthly active users" can work; "registered accounts" usually cannot.

2. **Correlates with revenue over the long term.** If the NSM goes up sustainably,
   revenue should follow -- even if not immediately.

3. **Is measurable.** The team can instrument, collect, and report it reliably at the
   desired cadence.

4. **Is actionable.** Teams can identify levers that move it. If nobody knows how to
   influence the metric, it cannot serve as a North Star.

5. **Is understandable.** A new employee should grasp it in under 60 seconds.

6. **Is leading, not lagging.** It should signal future health, not just confirm past
   performance.

### Guardrail Metrics

A NSM alone is dangerous. Guardrails prevent pathological optimization:

| NSM Example           | Guardrail Examples                                |
|-----------------------|---------------------------------------------------|
| Weekly active users   | Revenue per user, churn rate, NPS                 |
| Messages sent/week    | DAU/MAU ratio, spam rate, recipient engagement    |
| Nights booked         | Host satisfaction, cancellation rate, LTV          |
| Revenue               | Gross margin, NPS, employee satisfaction           |

Guardrails are metrics that must *not degrade* while the NSM improves.

### Examples by Business Type

| Business Type         | Typical North Star Metric                          |
|-----------------------|----------------------------------------------------|
| SaaS (B2B)           | Weekly active teams / accounts using core feature  |
| Marketplace           | Transactions completed per week                    |
| E-commerce            | Weekly purchases by repeat customers               |
| Subscription media    | Weekly reading/viewing hours per subscriber        |
| Fintech               | Monthly $ managed or transacted                    |
| Consumer social       | DAU/MAU ratio or content interactions per user     |
| Developer tools       | Weekly API calls / builds triggered                |
| Health/fitness        | Weekly active workout sessions                     |

---

## Steps / Process

### Step 1: Articulate the Core Value Proposition
- What is the "aha moment" for your customer?
- What action signals that a customer received value?

### Step 2: Generate Candidate Metrics
- Brainstorm 5-10 metrics that could represent value delivery.
- Include both usage metrics and outcome metrics.

### Step 3: Evaluate Against Criteria
- Score each candidate on the six criteria above (1-5 scale).
- Eliminate any metric scoring below 3 on "reflects customer value."

### Step 4: Test Correlation with Business Outcomes
- Run historical correlation analysis: does the candidate metric predict retention
  and revenue growth?
- Check for confounders (seasonality, marketing spend spikes).

### Step 5: Select and Socialize
- Choose one metric. Resist the temptation to pick two or three.
- Present the rationale to leadership. Get explicit buy-in.
- Define guardrail metrics simultaneously.

### Step 6: Decompose into a KPI Tree
- Break the NSM into its driver metrics and input metrics.
- Assign each driver to a team or squad.
- See [KPI Tree](kpi-tree.md) for the decomposition method.

### Step 7: Review Cadence
- Weekly: team-level review of driver metrics.
- Monthly: leadership review of NSM + guardrails.
- Quarterly: assess whether the NSM is still the right metric for the current stage.

---

## Inputs / Outputs

### Inputs
| Input                        | Source                          |
|------------------------------|---------------------------------|
| Product value proposition    | Product / strategy team         |
| Historical metric data       | Data warehouse                  |
| Revenue and retention data   | Finance / analytics             |
| Customer feedback            | Support, NPS surveys, interviews|

### Outputs
| Output                       | Consumer                        |
|------------------------------|---------------------------------|
| Selected North Star Metric   | Entire organization             |
| Guardrail metric set         | Leadership, analytics           |
| KPI tree decomposition       | Squad / team leads              |
| Review cadence calendar      | Analytics ops                   |

---

## Pitfalls

1. **Choosing a vanity metric.** "Total signups" only goes up. A good NSM can go down,
   which is what makes it useful.

2. **No guardrails.** Optimizing a single metric without constraints leads to
   Goodhart's Law in action. Always pair the NSM with guardrails.

3. **Changing the NSM too frequently.** If you switch every quarter, nobody builds
   intuition. Change only when the business model or stage fundamentally shifts.

4. **NSM as a target rather than a compass.** The NSM guides direction. When it becomes
   a quota, teams game it.

5. **Ignoring stage of company.** A pre-PMF startup may need an OMTM focused on
   activation; a mature company may need one focused on retention or expansion.

6. **Metric without a decomposition.** A NSM that nobody can influence is useless. The
   KPI tree is essential.

7. **Conflating NSM with OKR key results.** The NSM is persistent; OKRs are
   time-boxed. They should connect but are not the same thing.

---

## Cross-References

- [KPI Tree](kpi-tree.md) -- Decomposing the North Star into drivers and inputs.
- [DMMM (Kaushik)](dmmm-kaushik.md) -- A broader measurement model where the NSM sits
  at the top of the objective hierarchy.
- [AARRR Pirate Metrics](aarrr-pirate-metrics.md) -- The NSM often maps to one stage
  of the pirate funnel.
- [OKR-to-Metrics Alignment](okr-to-metrics-alignment.md) -- Connecting the NSM to
  quarterly objectives.
- [Metric Lifecycle](metric-lifecycle-framework.md) -- Understanding when to promote
  or retire a North Star.
- [Goodhart's Law](goodhart-law-framework.md) -- The risk of over-indexing on any
  single metric.
