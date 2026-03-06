# Goodhart's Law: When Metrics Become Targets

## The Law

"When a measure becomes a target, it ceases to be a good measure."
-- Charles Goodhart, 1975 (paraphrased by Marilyn Strathern)

## What It Means

The moment you tell people they will be evaluated on a specific metric, they optimize for that metric -- often at the expense of the underlying goal the metric was supposed to represent. The metric stops measuring the thing you care about and starts measuring people's ability to game the system.

## Classic Examples Outside Tech

### Soviet Nail Factory

When a nail factory was measured on the number of nails produced, they made millions of tiny, useless nails. When measured on total weight of nails produced, they made a handful of enormous, unusable nails. Neither metric captured "produce useful nails."

### Teaching to the Test

When schools are measured by standardized test scores, teachers optimize for test performance rather than genuine learning. Students learn to pass tests but may not develop critical thinking.

### Hospital Wait Times

When UK hospitals were measured on emergency department wait times, some hospitals reclassified waiting areas so patients were technically not "waiting" in the emergency department. The metric improved; patient experience did not.

## Goodhart's Law in Analytics and Tech

### Growth at All Costs

**Metric as target:** Monthly Active Users (MAU).
**Gaming behavior:** Product teams add aggressive push notifications, dark patterns for re-engagement, and count any trivial interaction as "active."
**Result:** MAU increases. Genuine engagement decreases. Users become annoyed and eventually churn.
**Better approach:** Measure meaningful active usage (specific high-value actions) alongside MAU. Add a "quality of engagement" metric.

### Content Engagement

**Metric as target:** Time spent on page.
**Gaming behavior:** Content becomes deliberately fragmented across multiple pages (slideshows, "next page" buttons). Autoplay videos inflate time metrics.
**Result:** Time on page increases. User satisfaction decreases. Ad impressions go up short-term but user trust erodes.
**Better approach:** Measure completion rate, return visits, and user satisfaction alongside time.

### Customer Support

**Metric as target:** Average ticket resolution time.
**Gaming behavior:** Agents close tickets prematurely, ask customers to open new tickets for follow-ups, or avoid complex issues that take longer.
**Result:** Resolution time decreases. Customer satisfaction decreases. Reopened ticket rate increases.
**Better approach:** Measure resolution time alongside first-contact resolution rate and post-resolution CSAT.

### Sales Teams

**Metric as target:** Number of deals closed.
**Gaming behavior:** Sales reps offer unsustainable discounts, oversell features, or close deals with low-fit customers.
**Result:** Deal count increases. Average deal size drops. Churn increases. Net revenue retention suffers.
**Better approach:** Measure deal count alongside NRR, customer health score at 90 days, and discount rate.

### Developer Productivity

**Metric as target:** Lines of code written.
**Gaming behavior:** Verbose code, unnecessary abstractions, code that creates problems to solve later.
**Result:** More code. Not better software.
**Better approach:** Measure outcomes (deployment frequency, defect rate, customer-reported bugs) not output.

### SEO and Content Marketing

**Metric as target:** Organic traffic.
**Gaming behavior:** Keyword stuffing, low-quality content farms, clickbait titles, thin content targeting long-tail keywords.
**Result:** Traffic increases. Bounce rate increases. Conversion rate drops. Brand perception suffers.
**Better approach:** Measure organic traffic alongside conversion rate from organic, content engagement depth, and brand search volume.

### A/B Testing

**Metric as target:** Experiment win rate (percentage of experiments that show positive results).
**Gaming behavior:** Teams run experiments with overly sensitive metrics, stop experiments early when they look positive, or redefine success criteria after seeing results.
**Result:** Win rate looks great. Actual product improvement is minimal.
**Better approach:** Measure cumulative impact on key business metrics, not individual experiment win rates.

## Why It Happens

### Proxy Metrics

Most metrics are proxies for what we actually care about. We care about "customer value," but we measure "time on site." The proxy and the goal are correlated under normal conditions, but when the proxy becomes a target, people find ways to increase the proxy without increasing the actual goal.

### Incentive Alignment

When compensation, promotions, or public recognition depend on a metric, the incentive to optimize that metric -- by any means -- becomes powerful. Rational actors will game the system if gaming is easier than genuinely improving.

### Metric Monoculture

When a single metric dominates decision-making, all effort focuses on that metric. Other important aspects of the system (quality, sustainability, customer experience) degrade because they are not measured and therefore not managed.

## Mitigation Strategies

### Use Metric Pairs (Input + Output)

For every metric you target, pair it with a counter-metric that would degrade if the primary metric is gamed:

| Primary Metric | Counter-Metric |
|---------------|----------------|
| MAU | Retention rate, NPS |
| New user signups | Activation rate, 7-day retention |
| Ticket resolution time | CSAT, reopen rate |
| Revenue | Gross margin, NRR |
| Experiment velocity | Cumulative impact on North Star |
| Content production volume | Content engagement rate |
| Feature adoption | Task completion rate |

### Use Guardrail Metrics

Define metrics that must not degrade when pursuing a target. If they degrade, the optimization is causing harm.

### Rotate Metrics

Change the focal metric periodically to prevent over-optimization. Q1 focus on acquisition. Q2 focus on activation. Q3 focus on retention. The rotation prevents any single metric from becoming permanently gamed.

### Measure Outcomes, Not Outputs

| Output (Gameable) | Outcome (Harder to Game) |
|-------------------|--------------------------|
| Features shipped | Customer problems solved |
| Experiments run | Revenue impact of experiments |
| Tickets closed | Customer effort score |
| Blog posts published | Pipeline generated from content |
| Users acquired | Qualified users retained at 30 days |

### Qualitative Checks

Numbers tell you what happened. They rarely tell you why. Supplement metrics with qualitative research:

- User interviews
- Customer support conversation reviews
- Session recordings
- Sales call analysis

### Make Gaming Visible

Track the relationship between the target metric and its counter-metrics over time. If the target metric improves but the counter-metric degrades, gaming is likely occurring.

## When Goodhart's Law Is Unavoidable

Some degree of metric optimization is desirable. The goal is not to eliminate optimization but to ensure it is aligned with genuine value creation.

**Acceptable:** A team optimizes onboarding completion rate by making the flow clearer and faster. The metric improves because the experience genuinely improved.

**Problematic:** A team optimizes onboarding completion rate by removing steps. The metric improves, but users are less prepared and churn more.

The difference is whether the metric improvement corresponds to genuine value improvement. This requires looking beyond the single metric.

## Application to Your Work

When defining metrics, OKRs, or KPIs, always ask:

1. If someone optimized for this metric above all else, what would they do?
2. Would those behaviors create genuine value or just move the number?
3. What counter-metric would reveal gaming?
4. Can we measure the outcome we actually care about, or are we stuck with a proxy?
5. Have we paired this metric with guardrails?

The best metrics are hard to game because they are close to the actual outcome you care about. "Net revenue retention" is harder to game than "deals closed." "30-day qualified retention" is harder to game than "signups."
