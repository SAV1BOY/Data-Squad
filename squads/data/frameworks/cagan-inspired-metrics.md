# Cagan-Inspired Metrics Framework

## Overview

Marty Cagan's approach to product management, articulated through "Inspired" and "Empowered," fundamentally reframes how data teams should think about metrics. Rather than measuring output (features shipped, stories completed), Cagan insists on measuring outcomes -- the change in customer behavior that drives business results. This framework translates Cagan's product discovery principles into a disciplined metrics practice for data squads.

The core tension Cagan identifies is that most organizations confuse delivery with discovery. Teams ship features and declare victory based on launch dates, never circling back to ask: "Did the customer's life actually improve?" Data teams inherit this dysfunction when they build dashboards that track activity rather than impact.

## Origin

Marty Cagan spent decades at eBay, Netscape, and HP before founding the Silicon Valley Product Group (SVPG). His books "Inspired" (2008, revised 2018) and "Empowered" (2020) became canonical texts in product management. Cagan's metrics philosophy draws from his observation that the best product teams -- at companies like Google, Amazon, Apple, and Netflix -- share a commitment to evidence-based product decisions while maintaining space for qualitative judgment.

Cagan did not create a formal metrics framework per se. Rather, his principles about outcome-driven teams, empowered engineers, and continuous discovery naturally generate a metrics philosophy that this document codifies for data squad use.

## Key Concepts

### Outcome Over Output

Output metrics track what you build: features shipped, lines of code, tickets closed. Outcome metrics track what changes for the customer: task completion rate, time-to-value, retention improvement. Data squads must resist the organizational gravity that pulls toward output dashboards.

A practical heuristic: if a metric goes up simply because the team worked harder or longer, it is an output metric. If it goes up because customers found more value, it is an outcome metric.

### Product Discovery Metrics

Cagan describes four risks that product discovery must address:

1. **Value risk** -- Will customers choose to use it? Measured through adoption rates, engagement depth, willingness to pay.
2. **Usability risk** -- Can customers figure out how to use it? Measured through task success rate, error frequency, time-on-task.
3. **Feasibility risk** -- Can engineering build it within constraints? Measured through technical debt ratios, performance budgets, incident rates.
4. **Business viability risk** -- Does it work for the business? Measured through unit economics, margin impact, regulatory compliance.

Each risk category demands distinct metrics, and data squads should ensure coverage across all four -- not just the ones that are easiest to instrument.

### Reference Customers vs. Vanity Totals

Cagan emphasizes reference customers: real users who independently choose to use the product, are successful, and would recommend it. A count of reference customers is more meaningful than total signups. Data squads should build metrics that distinguish genuine adoption from superficial usage.

### The Missionary vs. Mercenary Test

Missionary teams believe in the vision and measure progress toward it. Mercenary teams optimize for whatever target is handed down. When a data squad notices that teams are gaming metrics or cherry-picking favorable cuts of data, it is a signal that the organization has mercenary dynamics. The squad's role is to design metrics that are hard to game and easy to learn from.

### OKR Integration

Cagan advocates for OKRs (Objectives and Key Results) as the mechanism connecting company strategy to team outcomes. Key results should be measurable, but the team should have autonomy in how they achieve them. Data squads play a critical role in:

- Helping teams define measurable key results that are truly outcome-based
- Providing the instrumentation to track key results reliably
- Flagging when key results are being gamed or have become stale

## Application to Data Squad

### Designing Metric Hierarchies

Start with the business outcome the company needs (revenue growth, market expansion, efficiency). Decompose into product outcomes (activation rate, engagement depth, retention). Then identify the leading indicators that teams can influence weekly. This three-tier hierarchy -- business outcome, product outcome, leading indicator -- is the backbone of a Cagan-aligned metrics architecture.

### Discovery Dashboards vs. Delivery Dashboards

Build two classes of dashboards. Discovery dashboards track whether customers are getting value: adoption curves, feature engagement over time, cohort retention. Delivery dashboards track whether the team is executing: velocity, cycle time, deployment frequency. Both matter, but discovery dashboards should get top billing in product reviews.

### Qualitative + Quantitative Balance

Cagan is emphatic that data alone is insufficient. Customer interviews, usability tests, and direct observation must complement quantitative metrics. Data squads should build systems that make it easy to connect qualitative findings (tagged interview themes) with quantitative trends (feature usage patterns). The insight is richer at the intersection.

### Empowered Team Metrics

Each empowered team should own a small set of outcome metrics (2-4) that they have the autonomy to move. Data squads help by:

- Ensuring metrics are reliably instrumented
- Providing self-serve tools so teams don't bottleneck on analysts
- Running metric reviews that focus on learning, not judgment

## Pitfalls

### Measuring Everything, Learning Nothing

Cagan warns against the "data-driven" label when it becomes an excuse to avoid judgment. If every decision requires a dashboard, the organization is paralyzed. Data squads should advocate for "data-informed" rather than "data-driven" and protect space for conviction-based decisions.

### Outcome Metrics That Are Too Lagging

Retention is an outcome metric, but if you only measure 90-day retention, you cannot iterate quickly. Data squads must find leading proxies that correlate with long-term outcomes but are observable within the team's sprint cycle.

### The Feature Factory Trap

When product teams are evaluated on shipping cadence, data squads get pulled into measuring throughput. Resist this. Offer impact analysis alongside delivery metrics so leadership can see that shipping more does not automatically mean winning more.

### Ignoring Feasibility and Viability Metrics

It is tempting to focus exclusively on value and usability metrics because they are customer-facing and satisfying. But feasibility metrics (system reliability, performance) and viability metrics (unit economics, compliance) are equally critical. Neglecting them creates blind spots.

## Cross-References

- **ries-lean-startup-metrics.md** -- Ries extends Cagan's outcome focus into the startup context with innovation accounting
- **definition-layer.md** -- The foundational layer where metric definitions are codified, directly enabling Cagan's outcome metrics
- **experimentation-layer.md** -- Product discovery relies on rapid experimentation, covered in detail there
- **product-analytics-framework.md** -- The applied version of Cagan's principles in product analytics practice
- **goodhart-law-framework.md** -- The theoretical basis for why output metrics degrade when targeted, reinforcing Cagan's outcome emphasis
- **decision-layer.md** -- Where Cagan's insight-to-action loop is formalized into a decision registry
