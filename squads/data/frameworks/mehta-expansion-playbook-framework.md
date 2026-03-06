# Mehta Expansion Playbook Framework

## Overview

The Expansion Playbook Framework provides a structured approach to growing revenue from existing
customers through upsells, cross-sells, and usage-based expansion. Expansion is the highest-margin
revenue source in subscription businesses because it carries no acquisition cost and typically has
higher conversion rates than new business. However, poorly executed expansion -- pushing products
on customers who are not realizing value -- damages trust and accelerates churn. The framework
balances revenue optimization with customer relationship integrity through data-driven trigger
identification, appropriate timing, propensity scoring, ROI measurement, and ethical guardrails.

## Origin

Developed by **Nick Mehta** through Gainsight's work with thousands of SaaS companies navigating
the tension between expansion targets and customer satisfaction. Mehta emphasizes that expansion is
a natural consequence of value delivery, not a sales tactic applied to captive customers. The
framework operationalizes this principle by connecting expansion motions to customer health and
outcome achievement data.

## Core Model

### Expansion Types

**Upsell:** Customer moves to a higher tier of the same product. Driven by usage growth, feature
need, or organizational expansion.

**Cross-sell:** Customer adopts an additional product from the same vendor. Driven by adjacent
needs discovered through the primary product relationship.

**Usage-based growth:** Customer's usage naturally increases, driving higher billing in usage-based
pricing models. Driven by adoption depth and organizational rollout.

**Seat expansion:** Customer adds more users to the platform. Driven by organizational growth or
broader departmental adoption.

### Expansion Triggers

Data signals that indicate a customer may be ready for or benefit from expansion:

**Usage-based triggers:**
- Approaching or exceeding current plan limits (storage, API calls, seats)
- Consistent high utilization of current tier features
- Usage growth rate accelerating month-over-month
- New use cases emerging in usage data (different features, new workflows)

**Organizational triggers:**
- Customer company headcount growth (via enrichment data)
- New department or team adopting the product
- Executive sponsor promotion or expansion of responsibility
- M&A activity at the customer

**Engagement triggers:**
- Customer inquiring about features not in their current plan
- Attendance at advanced feature webinars or training
- Browsing pricing or upgrade pages
- Champion advocating for expanded use in QBR conversations

**Outcome triggers:**
- Customer achieving measurable ROI from current investment
- Customer exceeding their own success criteria
- Customer willing to serve as reference or case study (indicates high satisfaction)

### Expansion Timing

When to expand is as important as whether to expand.

**Ideal timing indicators:**
- Health score is green (stable or improving)
- Time-to-value has been achieved
- Customer has expressed satisfaction (CSAT, NPS)
- Current product is well-adopted (not underutilized)
- An expansion trigger has fired recently

**Anti-patterns (when NOT to expand):**
- Health score is declining
- Open support escalations or unresolved issues
- Customer has not achieved initial value milestones
- Recent negative interaction or complaint
- Contract renewal is contentious or at risk

**The Value-First Sequence:**
1. Deliver value on current commitment
2. Measure and validate value delivery
3. Identify expansion opportunity through data triggers
4. Propose expansion connected to additional value
5. Measure value of expanded commitment

Never skip steps 1 and 2. Proposing expansion before value delivery is a trust violation.

### Propensity Scoring

A propensity model predicts which customers are most likely to expand and by how much.

**Input features:**
- Current plan tier and usage vs. limits
- Usage growth trajectory
- Feature adoption breadth and depth
- Health score and trend
- Engagement intensity (login frequency, feature diversity)
- Customer company growth indicators
- Historical expansion behavior of similar customers
- Time since last expansion or contract change
- Support ticket sentiment

**Model output:**
- Probability of expansion in next 90 days
- Predicted expansion amount
- Recommended expansion type (upsell, cross-sell, seats)

**Validation:**
- Compare predicted expansions to actual over trailing quarters
- Measure precision and recall of the model
- A/B test expansion outreach to high-propensity vs. control groups

### ROI Measurement

Expansion ROI must account for costs and risks:

**Expansion revenue:** Net new MRR from expanded contracts.

**Cost of expansion:** CSM time, sales involvement, implementation costs for new products,
and any discounting applied.

**Retention impact:** Measure whether expanded customers retain at different rates than
non-expanded. Expansion should correlate with higher retention; if it correlates with higher
churn, the expansion motion is damaging relationships.

**Net impact formula:**
Expansion ROI = (Expansion Revenue - Cost of Expansion - Revenue Lost to Expansion-Related Churn)
/ Cost of Expansion

### Ethical Expansion

Expansion is ethical when:
- The customer will genuinely benefit from the additional product or capacity
- The expansion recommendation is informed by data, not quota pressure
- The customer is achieving value from their current commitment
- The customer is informed and consents freely
- The expansion strengthens the relationship, not strains it

Expansion is unethical when:
- The customer is pressured to expand during renewal negotiations
- The expansion is recommended to meet internal targets regardless of customer need
- The customer has unresolved issues with the current product
- The expansion locks the customer into commitments they may not need

## Application Steps

### Step 1: Define Expansion Types
Identify which expansion types are available in your product and pricing structure. Not all
products support all expansion types. Clarify the paths.

### Step 2: Instrument Expansion Triggers
Implement data collection for each trigger category (usage, organizational, engagement, outcome).
Build dashboards that surface triggered accounts.

### Step 3: Establish Timing Guardrails
Define the minimum health and value delivery criteria that must be met before expansion is
proposed. Encode these as requirements in the expansion workflow.

### Step 4: Build Propensity Model
Using historical expansion data, build a predictive model that scores accounts by expansion
likelihood and potential size. Start simple (rules-based) and evolve to ML as data accumulates.

### Step 5: Design Expansion Motions
Create playbooks for each expansion type: who initiates, what the conversation includes, how value
is framed, and how the proposal connects to the customer's outcomes.

### Step 6: Measure Holistically
Track expansion revenue, but also track retention of expanded customers, CSAT after expansion, and
health score trajectory post-expansion. Expansion that damages health is net negative.

### Step 7: Iterate on Ethics
Regularly review expansion outcomes from the customer's perspective. Are expanded customers
achieving more value? Or are they over-committed? Adjust the framework accordingly.

## Key Distinctions

- **Expansion is earned, not extracted.** It follows from value delivery, not from sales pressure.
  The framework enforces this through timing guardrails.
- **Propensity is not entitlement.** A high propensity score means the customer is likely to expand,
  not that they should be aggressively pursued.
- **ROI includes retention impact.** Expansion that increases short-term revenue but causes long-
  term churn has negative ROI. The measurement must span the full relationship.
- **Ethical expansion builds trust.** Customers who expand and receive value become stronger
  advocates. Customers who feel pushed become detractors.
- **CS and sales must coordinate.** Expansion often sits at the boundary of CS and sales. Clear
  rules of engagement prevent conflicting outreach and confusion.

## Pitfalls

1. **Expanding unhealthy customers.** Proposing expansion to a customer who is not realizing value
   from their current commitment is the fastest way to trigger churn.
2. **Quota-driven expansion.** When CSMs have expansion quotas, the incentive to expand can override
   the judgment about whether expansion is appropriate.
3. **Ignoring expansion-related churn.** If expanded customers churn at higher rates, the expansion
   motion needs examination, not acceleration.
4. **No propensity scoring.** Relying on CSM intuition alone for expansion identification misses
   data-driven opportunities and introduces inconsistency.
5. **One-size-fits-all expansion.** Different customer segments have different expansion patterns.
   Enterprise expansion differs from SMB expansion in motion, timing, and messaging.
6. **Neglecting post-expansion onboarding.** An expanded customer needs onboarding to the new
   product or capability. Without it, the expansion becomes shelfware.
7. **Measuring expansion in isolation.** Expansion metrics must be reported alongside health, NRR,
   and retention to provide a complete picture.

## Cross-References

- **Mehta Customer Success Metrics** -- Expansion rate is one of the seven core CS metrics. NRR
  depends directly on expansion offsetting churn.
- **Mehta Customer Health Score Design** -- Health score is the primary guardrail for expansion
  timing. Expansion should only be proposed to healthy customers.
- **Mehta Outcome-Based CS** -- Outcome achievement is the precondition for ethical expansion. If
  the customer has not achieved outcomes, expansion is premature.
- **Mehta Digital CS** -- Digital CS enables expansion at scale through automated trigger detection
  and expansion journey orchestration.
- **Fader Whale Curve** -- The whale curve identifies which customers have the most expansion
  potential based on their current position on the value curve.
- **Fader CLV as North Star** -- Expansion directly increases CLV, making it the primary lever for
  growing customer equity.
