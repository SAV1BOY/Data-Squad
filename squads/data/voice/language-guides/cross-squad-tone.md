# Cross-Squad Tone Language Guide

## Purpose

This guide defines how the data team communicates findings, requests, and deliverables to other squads (engineering, product, design, marketing, sales, CS). Cross-squad communication requires translating data into the language and priorities of the receiving team while maintaining analytical integrity.

## Core Principles

1. **Speak their language**: Adapt terminology to the receiving squad's domain
2. **Lead with their priority**: Frame data in terms of what matters to them, not to the data team
3. **Be self-contained**: Do not assume other squads know our metrics, tools, or conventions
4. **Respect their time**: They have their own priorities; make data easy to consume and act on
5. **Close the loop**: Always follow up on data requests with the result and its interpretation

## Squad-Specific Framing

### To Engineering
- Frame in terms of system performance, reliability, and technical debt
- Include table names, query performance, and data pipeline specifics
- Be precise about data freshness, latency, and known gaps
- Respect their incident response protocols when flagging data issues

### To Product
- Frame in terms of user behavior, feature adoption, and product outcomes
- Connect metrics to the product roadmap and current OKRs
- Present trade-offs with user impact quantified
- Provide segment breakdowns that inform prioritization

### To Design
- Frame in terms of user experience, task completion, and usability patterns
- Show behavioral flows, not just aggregate metrics
- Highlight where users struggle or drop off with visual evidence
- Connect quantitative findings to qualitative research when possible

### To Marketing
- Frame in terms of acquisition, conversion, attribution, and ROI
- Be explicit about attribution methodology and its limitations
- Connect campaign data to downstream metrics (activation, retention)
- Provide lead quality signals alongside volume metrics

### To Sales
- Frame in terms of pipeline, deal velocity, and account signals
- Surface expansion and upsell indicators from product usage data
- Keep language compatible with CRM and sales process terminology
- Deliver account-level insights, not just aggregate trends

## Language Patterns

| Instead of | Use (to Product) |
|---|---|
| "The regression model shows..." | "Users who do X are 3x more likely to retain" |
| "ETL job failed" | "The data behind the feature adoption dashboard is delayed by 6 hours. Here is the last reliable snapshot." |
| "We need instrumentation" | "To answer whether the new feature drives retention, we need event tracking on these 3 actions. Here is the spec." |

| Instead of | Use (to Marketing) |
|---|---|
| "Multi-touch attribution is noisy" | "We can attribute 60% of conversions to a clear source. The remaining 40% involved multiple touchpoints." |
| "CAC is up" | "Cost per acquired customer increased 18% this quarter, driven by rising paid search CPCs in the enterprise segment" |

## Request and Delivery Format

### When Requesting From Another Squad
1. State what you need and why
2. Provide the business context driving the request
3. Specify the timeline and priority level
4. Offer to join a sync if the request is complex

### When Delivering To Another Squad
1. Lead with the answer to their question
2. Translate findings into their domain language
3. Include the recommended action for their context
4. Offer a 15-minute walkthrough for complex deliverables

## Common Mistakes

- Using data team jargon without translation
- Sending raw data instead of interpreted insights
- Making requests without explaining the business context
- Assuming other squads understand our data models
- Delivering findings without recommending what the other squad should do
- Not following up to see if the delivery was useful

## Cross-References

- **Cross-Squad Request Phrases**: See `phrases/cross-squad-request-phrases.md`
- **Technical Depth Scale**: See `voice/calibration/technical-depth-scale.md`
- **Audience Depth Scale**: See `voice/calibration/audience-depth-scale.md`
- **Pragmatic Analyst Tone**: See `voice/tone-profiles/pragmatic-analyst.md`
- **Educator Tone**: See `voice/tone-profiles/educator.md`
