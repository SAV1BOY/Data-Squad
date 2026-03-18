# Fader Customer Base Audit

## Overview

The Customer Base Audit is Peter Fader's systematic diagnostic framework for assessing the health,
composition, and dynamics of a company's customer base. It goes far beyond counting customers or
tracking aggregate revenue to examine the underlying patterns that determine whether the customer
base is growing healthily, stagnating, or deteriorating. The audit examines five dimensions:
customer count integrity, revenue concentration, acquisition dynamics, retention dynamics, and
behavioral heterogeneity. Together, these dimensions reveal the true state of the business in ways
that top-line metrics obscure.

## Origin

Developed by **Peter Fader** and refined through his work at the Wharton School, Theta Equity
Partners, and in collaboration with various companies seeking to understand their customer bases at
a deeper level. The audit framework synthesizes Fader's decades of research on customer behavior
into a practical diagnostic tool. It operationalizes the principle that the customer base is the
most important asset a company has and therefore deserves rigorous, regular assessment.

## Core Model

### Dimension 1: Customer Count Integrity

**What to examine:**
- Total active customer count and the definition of "active"
- How "active" is defined (purchased in last 12 months? Logged in? Subscribed?)
- Whether the active definition is consistent over time
- Customer count trends by cohort

**Why it matters:**
Customer count is the most basic metric and the most commonly misunderstood. A company claiming
5 million customers may have 500,000 active ones, depending on definition. Inflated customer counts
mask deterioration.

**Key questions:**
- What is the operational definition of an active customer?
- How many customers have transacted in the last 3, 6, 12, and 24 months?
- Is the active count growing because of acquisition or retention improvement?
- What percentage of "active" customers have not transacted in the last purchase cycle?

**Red flags:**
- Growing total customer count with flat or declining active customer count
- Ambiguous or changing definitions of "active"
- Customer count inflated by dormant accounts
- No distinction between first-time and repeat customers

### Dimension 2: Revenue Concentration

**What to examine:**
- Distribution of revenue across customers (whale curve analysis)
- Revenue contribution of top 1%, 5%, 10%, 20% of customers
- Revenue from bottom 20% and whether it covers cost to serve
- Changes in concentration over time

**Why it matters:**
Revenue concentration determines strategic vulnerability and the relevance of a customer-centric
approach. High concentration means high dependency risk but clear opportunity for differential
investment. Low concentration may indicate commodity dynamics.

**Key questions:**
- What percentage of revenue comes from the top 10% of customers?
- How many customers are below cost to serve (unprofitable)?
- Is concentration increasing or decreasing over time?
- How stable is the composition of the top tier? (Same customers year over year, or rotation?)

**Red flags:**
- Top 5% of customers responsible for more than 50% of revenue with no retention strategy
- Growing number of unprofitable customers
- Increasing concentration indicating whale dependency
- Top tier instability (different customers each year suggests inability to retain best customers)

### Dimension 3: Acquisition Dynamics

**What to examine:**
- New customer acquisition volume by period
- Quality of acquired customers (first-purchase value, predicted CLV)
- Acquisition channel mix and its impact on customer quality
- Cost of acquisition by channel and customer quality
- Cohort performance: How do newer cohorts compare to older ones?

**Why it matters:**
Not all acquired customers are equally valuable. Acquisition strategies that optimize for volume
can flood the customer base with low-value or one-time buyers, degrading overall quality.

**Key questions:**
- Are we acquiring more or fewer customers than last year?
- What is the average first-purchase value by acquisition cohort?
- How does predicted CLV of recent cohorts compare to older cohorts?
- Which acquisition channels produce the highest-quality customers?
- What is the ratio of new customers to lapsed customers?

**Red flags:**
- Acquisition volume increasing while cohort quality decreasing
- Increasing reliance on discounted or promotional acquisition
- No measurement of acquisition quality beyond volume and cost
- Cohort revenue curves declining faster for newer cohorts

### Dimension 4: Retention Dynamics

**What to examine:**
- Retention rates by cohort, tenure, and value tier
- Repeat purchase rates (for non-contractual businesses)
- Churn patterns and their timing
- Retention trend over time: Is it improving, stable, or degrading?
- Retention by acquisition source

**Why it matters:**
Retention is the primary driver of customer equity growth. Small improvements in retention of
high-value customers compound into large value gains. Retention patterns also reveal whether the
product and experience are improving or degrading.

**Key questions:**
- What is the 12-month retention rate for each annual cohort?
- How does retention vary by customer value tier?
- Is retention improving or declining over time?
- What is the relationship between acquisition source and retention?
- At what point in the customer lifecycle does the highest churn risk occur?

**Red flags:**
- Declining retention rates across cohorts
- High-value customer retention significantly below average
- No differentiated retention strategy by value tier
- Retention unmeasured or measured only in aggregate

### Dimension 5: Heterogeneity Assessment

**What to examine:**
- Variance in purchase frequency, monetary value, and recency
- Segment stability (do customers stay in their segments?)
- Behavioral clustering and the number of distinct behavioral patterns
- Migration between value tiers over time

**Why it matters:**
Heterogeneity determines the applicability of customer-centric strategies. If all customers behave
similarly, differential treatment has limited value. If heterogeneity is extreme (typical), treating
customers uniformly wastes resources.

**Key questions:**
- How many distinct behavioral segments exist in the customer base?
- What is the coefficient of variation in purchase frequency and monetary value?
- Do customers migrate between value tiers, or are tiers stable?
- Can we predict which tier a customer will be in next year based on current behavior?

**Red flags:**
- High heterogeneity with uniform treatment strategies
- No segmentation beyond demographics
- Assumption that average customer metrics represent typical behavior
- No modeling of individual-level behavior

## Application Steps

### Step 1: Define Scope and Time Horizon
Determine the audit period (typically 2-5 years of historical data). Define the business unit,
geography, or product line under examination. Establish the "active customer" definition that will
be used consistently.

### Step 2: Extract and Clean Data
Pull transaction-level data: customer ID, date, amount, channel, product. Ensure data quality:
deduplicate customers, handle returns and refunds, exclude internal transactions.

### Step 3: Analyze Each Dimension
Work through the five dimensions systematically. For each, generate the key metrics, build
visualizations, and document findings. Do not skip dimensions -- the audit's value comes from
completeness.

### Step 4: Synthesize Cross-Dimension Findings
Look for patterns across dimensions:
- Is declining retention concentrated in specific acquisition channels?
- Does revenue concentration correlate with retention patterns?
- Are newly acquired customers less heterogeneous than the historical base?

### Step 5: Identify Strategic Implications
Translate findings into strategic questions:
- If acquisition quality is declining, should we change channel mix?
- If whale dependency is high, what is our whale retention strategy?
- If heterogeneity is extreme, are we investing appropriately in our best customers?

### Step 6: Establish Monitoring Cadence
The audit should not be a one-time exercise. Establish quarterly tracking of key indicators and
an annual full audit. Define trigger thresholds that prompt investigation.

## Key Distinctions

- **The audit is about the customer base, not individual customers.** It examines population-level
  patterns and dynamics, not individual accounts.
- **The audit is diagnostic, not prescriptive.** It reveals the current state and trends. Strategy
  follows from diagnosis but is not part of the audit itself.
- **Active customer count matters more than total.** A growing total count with a shrinking active
  count is a business in decline, regardless of what the headline number says.
- **Cohort analysis is non-negotiable.** Aggregate trends can be misleading (Simpson's paradox).
  Always examine acquisition cohorts separately to understand true dynamics.
- **The audit reveals whether CLV-driven strategy is feasible.** If data quality is poor,
  heterogeneity is unmeasured, or retention is undifferentiated, the prerequisites for customer
  centricity are not met.

## Pitfalls

1. **Aggregating when you should segment.** Average customer metrics hide the heterogeneity that
   the audit is designed to reveal. Always look at distributions, not just means.
2. **Using inconsistent definitions.** If the definition of "active" changes between audits,
   trends become meaningless. Lock definitions and document them.
3. **Ignoring cost to serve.** A revenue-only audit misses the profitability dimension. Even rough
   cost allocation is better than ignoring costs entirely.
4. **Performing the audit once.** The value of the audit is in tracking changes over time. A single
   snapshot is informative but limited.
5. **Treating all cohorts as equivalent.** A cohort acquired through deep discounting will behave
   differently from one acquired through organic search. Control for acquisition context.
6. **Audit without action.** The audit is a diagnostic. If findings do not lead to strategic
   changes, the exercise was academic.
7. **Overlooking data quality issues.** Customer deduplication, return handling, and channel
   attribution errors can distort every dimension. Data quality assessment is a prerequisite.

## Cross-References

- **Fader Customer Centricity** -- The audit assesses whether the prerequisites for customer
  centricity are in place and reveals where differential investment is needed.
- **Fader CLV as North Star** -- The audit evaluates whether CLV can be reliably estimated and
  whether the customer base dynamics support CLV-driven strategy.
- **Fader Whale Curve** -- Revenue concentration (Dimension 2) is visualized through the whale
  curve. The audit provides the broader context.
- **Fader Probability Models** -- Heterogeneity assessment (Dimension 5) uses the same distributional
  thinking that underlies BG/NBD and related models.
- **Mehta Customer Success Metrics** -- In SaaS, the audit dimensions map to NRR, GRR, expansion
  rate, and cohort retention analysis.
- **Ellis PMF Framework** -- Acquisition quality and retention dynamics in the audit can signal
  whether product-market fit is strengthening or weakening.

---

## Used By

| Task | Agents | Path |
|------|--------|------|
| run-cohort-analysis | peter-fader, data-chief | `tasks/analysis/run-cohort-analysis.md` |
| segment-refresh | peter-fader, avinash-kaushik | `tasks/analysis/segment-refresh.md` |

**Workflows:** cohort-analysis, segment-refresh
