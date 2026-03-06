# Support Analytics Framework

## Overview

Support analytics measures the effectiveness, efficiency, and quality of customer support operations. It connects support performance to customer satisfaction, retention, and product improvement. For data squads, support analytics is valuable not only for optimizing support operations but also as a rich signal source for product and customer health -- support interactions reveal friction, confusion, and unmet needs that product analytics alone cannot capture.

This framework covers the core support metrics, the analytical practices that extract insight from support data, and the integration patterns that connect support analytics to the broader data ecosystem.

## Origin

Support analytics has roots in call center management (Erlang models for staffing, service level agreements) and evolved through the help desk era (ticket tracking, resolution time) to the modern multi-channel support landscape (chat, email, social, self-service, AI-assisted support). The field has been shaped by the customer experience movement (Fred Reichheld's NPS, the Effortless Experience research from CEB/Gartner) and the emergence of support as a strategic function rather than a cost center.

## Key Concepts

### Customer Satisfaction (CSAT)

CSAT measures satisfaction with a specific support interaction, typically on a 1-5 or 1-7 scale. Reported as the percentage of responses that are "satisfied" or "very satisfied."

**Strengths:** Directly measures the customer's experience. Easy to implement (post-interaction survey).
**Weaknesses:** Response bias (dissatisfied customers may not respond, or may disproportionately respond, depending on context). Susceptible to gaming (agents coaching customers to give high scores).

Best practices:
- Randomize survey delivery to reduce bias
- Track response rate alongside CSAT score
- Segment by issue type, channel, and agent to identify patterns
- Monitor for gaming indicators (unusually high scores from specific agents, survey timing anomalies)

### Customer Effort Score (CES)

CES measures how easy it was for the customer to get their issue resolved, typically on a 1-7 scale. Research by CEB (now Gartner) found that customer effort is a stronger predictor of loyalty than customer delight.

**Key insight:** Reducing effort (making support easy) is more impactful than exceeding expectations (delighting customers). Customers penalize high effort far more than they reward low effort.

CES is particularly useful for identifying process friction: transfers, repeated contacts, inconsistent information, and complex resolution paths.

### First Contact Resolution (FCR)

FCR measures the percentage of support issues resolved in a single interaction. It is one of the most reliable predictors of customer satisfaction.

**Calculation challenges:**
- How do you define "resolved"? Customer says resolved? No follow-up within X days?
- How do you define "first contact"? Same ticket? Same issue (which may span multiple tickets)?

Define FCR consistently, document the methodology, and track trends rather than fixating on absolute values.

### Resolution Time

**First response time** -- Time from customer contact to first agent response. Expectations vary by channel: seconds for chat, minutes for phone, hours for email.

**Resolution time** -- Time from initial contact to issue resolution. Depends heavily on issue complexity.

**Handle time** -- Active time the agent spends on the issue. Used for staffing and efficiency, but targeting handle time aggressively degrades quality.

### Ticket Volume and Deflection

**Ticket volume** -- Total support contacts. Track trends and spikes. Volume increases may indicate product issues, and spikes often correlate with product releases or incidents.

**Deflection rate** -- Percentage of support needs resolved without human agent involvement, through:
- Self-service documentation (help center, FAQs)
- Community forums
- Chatbots and AI-assisted support
- In-product guidance

Deflection is cost-efficient and often preferred by customers (who would rather self-serve than wait for an agent). But forced deflection (making it hard to reach a human) damages satisfaction.

### Support as Product Signal

Support data is a rich source of product intelligence:

- **Issue categorization** -- What are customers struggling with? Topic clustering of tickets reveals product friction points.
- **Feature request tracking** -- What do customers ask for? Quantified feature requests inform product roadmapping.
- **Bug detection** -- Support volume spikes after releases indicate bugs that automated testing missed.
- **Onboarding gaps** -- New user support contacts reveal where onboarding fails to educate.
- **Churn prediction** -- Support interaction patterns (escalations, repeated contacts, frustrated language) predict churn.

### Agent Performance Metrics

- **Tickets resolved per day/hour** -- Productivity
- **CSAT per agent** -- Quality
- **FCR per agent** -- Effectiveness
- **Handle time per agent** -- Efficiency (use cautiously to avoid gaming)
- **Escalation rate** -- Percentage of tickets escalated. High escalation may indicate training gaps or inappropriate routing.

## Application to Data Squad

### Support-Product Feedback Loop

Build a systematic pipeline that connects support data to product analytics:
1. Categorize tickets by product area (automated or manual)
2. Quantify ticket volume by category weekly
3. Correlate support volume with product releases and changes
4. Surface top friction areas to product teams in regular reviews
5. Track whether product changes reduce associated support volume

### Voice of Customer Dashboard

Create a dashboard that synthesizes support signals:
- Top issue categories and trends
- Customer effort score trends
- Feature requests ranked by volume and customer value
- Sentiment analysis of ticket content
- Correlation between support contacts and churn risk

### Self-Service Effectiveness Measurement

Measure the effectiveness of self-service resources:
- Help article pageviews and search queries (what are people looking for?)
- Search-to-ticket rate (how often does a help center visit end in a ticket submission?)
- Article helpfulness ratings
- Deflection rate trend (is self-service handling an increasing share?)

### Support Cost Analysis

Calculate the fully-loaded cost per support interaction:
- Agent compensation and benefits
- Technology costs (help desk platform, telephony)
- Management overhead
- Training costs

Use this to build the business case for product improvements that reduce support volume and for self-service investments.

### Predictive Support Models

Build models that predict:
- Which customers are likely to contact support (proactive outreach opportunity)
- Which tickets are likely to escalate (route to senior agents preemptively)
- Which product changes will increase or decrease support volume

### SLA Monitoring

Build real-time monitoring for support SLAs:
- First response time within target by channel
- Resolution time within target by priority
- CSAT above threshold
- Alert when SLAs are at risk before they are breached

## Pitfalls

### Optimizing Handle Time Aggressively

When agents are evaluated primarily on handle time, they rush interactions, provide shallow answers, and close tickets prematurely. This improves the metric while degrading the customer experience. Balance efficiency metrics with quality metrics.

### CSAT Gaming

Agents can game CSAT by selectively requesting surveys from satisfied customers, coaching customers to give high scores, or cherry-picking easy tickets. Monitor for gaming indicators and use CSAT as one signal among several, not as the sole performance metric.

### Ignoring the Quiet Majority

Most dissatisfied customers do not contact support -- they simply leave. Support analytics captures only the customers who bothered to complain. Combine support analytics with product analytics (engagement decline, feature abandonment) to see the full picture.

### Deflection Without Quality

Forcing customers through chatbots and help articles that do not actually solve their problem increases customer effort and frustration. Measure deflection quality (was the issue actually resolved?) not just deflection volume.

### Treating Support as Cost Center Only

When support is viewed purely as a cost to minimize, investment in support analytics focuses solely on efficiency. This misses the strategic value of support data as product intelligence and the retention value of excellent support experiences.

## Cross-References

- **product-analytics-framework.md** -- Support data enriches product analytics with qualitative user feedback
- **mcclure-pirate-metrics-original.md** -- Support quality affects Retention and Referral stages of AARRR
- **campbell-law-framework.md** -- Support metrics (CSAT, handle time) are highly vulnerable to Campbell's Law corruption
- **goodhart-law-framework.md** -- Handle time targets are a textbook Goodhart's Law example
- **revenue-analytics-framework.md** -- Support interactions predict churn, connecting to revenue retention
- **kahneman-noise-framework.md** -- Inconsistency in support quality across agents is noise that affects customer experience
- **governance-layer.md** -- Support metric definitions and SLAs require governance
