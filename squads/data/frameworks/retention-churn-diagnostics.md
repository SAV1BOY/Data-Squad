# Retention and Churn Diagnostics Framework

## Overview

Churn is not a single problem -- it is a category of problems, each with distinct root causes,
warning signals, and interventions. This framework provides a structured diagnostic approach
to decompose churn into actionable segments, identify causal mechanisms, design interventions,
and measure their return on investment. The goal is to move teams from "our churn rate is X%"
to "we lose Y customers per quarter due to reason Z, and here is what we are doing about it."

Retention work is inherently cross-functional. Product, Customer Success, Marketing, and
Finance all own pieces of the puzzle. This framework gives the data team a shared language
and methodology to coordinate that work.

## When to Use

- Monthly or quarterly churn reviews where leadership asks "why are we losing customers?"
- When churn rate changes materially (up or down) and the team needs to understand why.
- Before designing a retention campaign or intervention -- to ensure the right problem is targeted.
- During annual planning to size the retention opportunity and prioritize investment.
- When onboarding a new analyst to the retention domain and they need a mental model.

Do NOT use this framework for:
- One-off customer complaints (use support escalation processes instead).
- Pricing strategy design (use pricing elasticity analysis instead, though churn data feeds in).
- Product roadmap prioritization broadly (churn is one input among many).

## Core Concept

Churn diagnostics follow a **Segment -> Diagnose -> Intervene -> Measure** loop:

1. **Segment** the churn population along multiple dimensions.
2. **Diagnose** causal mechanisms within each segment.
3. **Intervene** with targeted actions matched to the diagnosed cause.
4. **Measure** the impact of interventions rigorously to close the learning loop.

### Churn Taxonomy

#### By Voluntariness
- **Voluntary churn**: Customer actively decides to leave. They cancel, do not renew, or switch
  to a competitor. This is the churn type most amenable to product and experience improvements.
- **Involuntary churn**: Customer did not intend to leave but churned due to payment failure,
  expired credit card, administrative error, or similar. Often 20-40% of total churn in
  subscription businesses. Fix with dunning sequences, payment retry logic, and card updaters.

#### By Lifecycle Stage
- **Early churn** (first 90 days / first renewal): Signals onboarding failure, mismatched
  expectations from sales, or poor initial time-to-value. High leverage -- fixing early churn
  often has the highest ROI because these customers never reached the "sticky" phase.
- **Mid-lifecycle churn** (2nd through 4th renewal): Often driven by unmet feature needs,
  poor support experiences, or a champion leaving the account.
- **Late churn** (mature customers): Frequently driven by strategic shifts at the customer,
  competitive displacement, or price sensitivity after a renewal increase. Lower volume but
  often higher revenue impact per account.

#### By Revenue Impact
- **Logo churn**: Count of customers lost, regardless of size. Useful for product health signals.
- **Revenue churn (gross)**: Dollar value of lost recurring revenue. Useful for financial planning.
- **Net revenue churn**: Gross churn offset by expansion from surviving customers. Can mask
  underlying problems if expansion is strong.

#### By Predictability
- **Predictable churn**: Preceded by observable behavioral signals (declining usage, support
  tickets, NPS detractors). Amenable to early warning systems.
- **Sudden churn**: No observable warning -- customer leaves abruptly. Often caused by
  external events (acquisition, bankruptcy, leadership change) or competitor poaching.

## Steps / Process

### Step 1: Build the Churn Event Table

Define churn precisely. A churn event table should contain:

| Field | Description |
|-------|-------------|
| `account_id` | Unique customer identifier |
| `churn_date` | Date the churn became effective |
| `churn_type` | Voluntary / Involuntary |
| `churn_reason_primary` | Standardized reason code (e.g., "competitor", "budget cut", "payment failure") |
| `churn_reason_detail` | Free-text or secondary code from CS or support |
| `arr_at_churn` | Annual recurring revenue at the time of churn |
| `tenure_days` | Days from first subscription start to churn |
| `last_usage_date` | Last date of meaningful product engagement |
| `lifecycle_stage` | Early / Mid / Late based on tenure thresholds |
| `csm_owner` | Assigned Customer Success Manager |
| `health_score_at_churn` | Last known health score before churn |

Ensure the table is append-only and historically complete. Never overwrite churn records.

### Step 2: Segment the Churn Population

Run the segmentation along each taxonomy dimension above. Produce a matrix:

```
Voluntary + Early + High ARR   -> Segment A (onboarding failure, high-value)
Voluntary + Late + Low ARR     -> Segment B (price sensitivity, small accounts)
Involuntary + Any + Any        -> Segment C (payment recovery opportunity)
...
```

Rank segments by total ARR lost and by count. The top 3-5 segments typically represent
70-80% of the problem.

### Step 3: Causal Analysis Within Segments

For each priority segment, investigate causes:

- **Quantitative signals**: Correlate churn with usage patterns, support tickets, NPS scores,
  feature adoption, onboarding completion rates. Use survival analysis or logistic regression
  to identify statistically significant predictors.
- **Qualitative signals**: Read cancellation surveys, interview churned customers (aim for
  5-10 per segment), review CS notes. Look for repeated themes.
- **Cohort comparison**: For each churned cohort, find a matched cohort of retained customers
  with similar characteristics. Compare their behavior trajectories. The divergence points
  reveal causal candidates.

Beware of confounding. Customers who submit support tickets may churn more, but that does
not mean support caused the churn -- it may mean the product failed and support was a symptom.

### Step 4: Design Interventions

Match interventions to diagnosed causes:

| Cause | Intervention Type | Example |
|-------|------------------|---------|
| Onboarding failure | Process improvement | Guided onboarding with milestones |
| Feature gap | Product investment | Build the missing capability |
| Payment failure | System automation | Smart retry + card updater service |
| Champion departure | Relationship broadening | Multi-threading strategy in CS |
| Price sensitivity | Commercial flexibility | Usage-based or tiered pricing |
| Poor support | Service improvement | Dedicated support for at-risk accounts |
| Competitor displacement | Competitive response | Win-back offers, feature parity |

Each intervention should have:
- A clear hypothesis ("We believe X intervention will reduce Y churn segment by Z%")
- A defined owner and timeline
- A measurement plan (see Step 5)

### Step 5: Measure Intervention ROI

For each intervention, measure:

- **Reach**: How many at-risk accounts were touched by the intervention?
- **Conversion**: Of those touched, how many were retained who would otherwise have churned?
- **Revenue saved**: ARR of retained accounts attributable to the intervention.
- **Cost**: Fully loaded cost of the intervention (people, tools, discounts given).
- **ROI**: (Revenue saved - Cost) / Cost.

Use control groups where possible. If a dunning improvement is rolled out, compare churn
rates before and after with a holdout group. For CS-driven interventions, compare outcomes
of accounts that received the intervention vs. similar accounts that did not.

### Step 6: Iterate and Institutionalize

- Update the churn taxonomy as new patterns emerge.
- Build the top predictive signals into automated health scores (see cs-health-score.md).
- Create dashboards that track churn by segment over time.
- Review quarterly: are the same segments dominating, or has the mix shifted?

## Inputs / Outputs

### Inputs
- Subscription and billing data (start dates, renewal dates, cancellation dates, ARR).
- Product usage data (logins, feature usage, key activation events).
- Support and CS data (tickets, NPS, CSAT, health scores, call notes).
- Cancellation survey responses.
- Sales data (deal source, sales cycle length, discount level, use case).

### Outputs
- Churn event table with standardized taxonomy fields.
- Segmented churn report showing ARR and logo churn by segment.
- Causal analysis document per priority segment.
- Intervention plan with hypotheses, owners, timelines, and measurement plans.
- Quarterly churn review deck with trend analysis and intervention ROI.

## Pitfalls

1. **Treating churn as a single metric.** A blended churn rate hides more than it reveals.
   Always decompose before acting.

2. **Confusing correlation with causation.** Low usage correlates with churn, but forcing
   usage (e.g., mandatory logins) does not fix the underlying value problem.

3. **Ignoring involuntary churn.** It is often the easiest churn to fix (payment retry,
   card updaters) yet gets overlooked because it feels like a "billing problem."

4. **Survivorship bias in analysis.** When analyzing retained customers to find "what works,"
   remember that the retained population is biased toward customers who found value. Their
   behavior may not be replicable for at-risk accounts.

5. **Over-indexing on save offers.** Discounts to retain churning customers can train customers
   to threaten churn for discounts. Use save offers sparingly and track whether saved customers
   churn at the next renewal anyway.

6. **Measuring interventions without controls.** Without a control group, you cannot distinguish
   "we saved this account" from "this account was going to stay anyway."

7. **Neglecting expansion as a retention lever.** Customers who expand are less likely to churn.
   Expansion and retention strategies should be coordinated, not siloed.

## Examples

### Example 1: SaaS Company Discovers Onboarding Gap

A B2B SaaS company sees 8% annual logo churn. Segmentation reveals that 45% of churned
accounts leave within the first 120 days. Causal analysis shows these accounts completed
fewer than 3 of 7 onboarding milestones. A guided onboarding program is introduced with
CSM check-ins at days 7, 30, and 60. After two quarters, early churn drops from 3.6% to
2.1%, saving approximately $1.2M ARR annually against a program cost of $200K.

### Example 2: Involuntary Churn Recovery

A subscription business finds that 30% of churn is involuntary (failed payments). They
implement a smart retry engine that attempts charges at optimal times, sends pre-expiration
card update reminders, and uses a network card updater service. Involuntary churn drops
by 60%, recovering $800K ARR with a one-time implementation cost of $50K.

### Example 3: Cohort Comparison Reveals Support Quality Issue

Cohort comparison between retained and churned mid-lifecycle accounts reveals that churned
accounts had 2.3x more support tickets with resolution times over 48 hours. The team
hypothesizes that slow resolution erodes trust. A dedicated support queue for accounts
with declining health scores is created, reducing resolution time for at-risk accounts
from 52 hours to 14 hours. Mid-lifecycle churn in this segment drops by 25%.

## Cross-References

- **cs-health-score.md** -- Health scores operationalize the predictive signals identified
  in churn diagnostics. Build health scores from the causal analysis in Step 3.
- **nrr-grr-expansion.md** -- Churn directly impacts GRR. Expansion offsets churn in NRR.
  These frameworks should be used together for a complete retention picture.
- **metric-lifecycle-framework.md** -- Churn metrics themselves evolve. Use the lifecycle
  framework to version and deprecate churn definitions as the business changes.
- **okr-to-metrics-alignment.md** -- Retention targets should cascade from company OKRs
  to team-level churn reduction goals.
- **bayesian-vs-frequentist-testing.md** -- When measuring intervention effectiveness,
  choose the right statistical framework for the test design.
- **data-quality-triad.md** -- Churn analysis is only as good as the underlying data.
  Ensure subscription, usage, and support data meet quality SLAs.
