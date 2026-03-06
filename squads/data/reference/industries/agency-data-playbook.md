# Agency Data Playbook

## Overview

Agencies — whether focused on marketing, design, development, or consulting —
face unique data challenges. Revenue is project-based or retainer-based, making
it lumpy and hard to predict. Success depends on client outcomes that the agency
only partially controls. And the most critical metrics (delivery margin, team
utilization, client health) are often tracked in spreadsheets rather than
proper analytics systems. This playbook covers the metrics and patterns that
separate data-driven agencies from those flying blind.

---

## Core Metrics

### Client Metrics

**Client Retention Rate:** Percentage of clients who renew or continue
engagements over successive periods. For retainer-based agencies, track
monthly or quarterly. For project-based, track re-engagement rate (percentage
of clients who start a new project within 12 months).

Benchmark: top-performing agencies retain 85-90% of clients annually. Below
75% indicates systematic delivery or relationship problems.

**Net Revenue Retention (NRR):** Revenue retained from existing clients
including expansion (upsell, new services) and contraction (reduced scope).
NRR > 100% means the agency grows from existing clients alone.

**Client Concentration Risk:** Percentage of revenue from top 1, 3, and 5
clients. If the top client represents more than 20% of revenue, the agency
has dangerous concentration risk. Track and actively diversify.

**Client NPS / Satisfaction:** Regular satisfaction measurement, ideally
quarterly. Segment by service line, account manager, and project type.
A leading indicator of retention.

**Client Lifetime Value:** Total revenue generated from a client over the
full relationship duration. In agencies, CLV is driven by:
- Initial project value
- Retainer duration
- Service line expansion
- Referrals generated

### Delivery Metrics

**Delivery Margin:** (Revenue - Direct Costs) / Revenue per project or client.
Direct costs include team time (at loaded cost rate), tools, and subcontractors.
Healthy agencies target 50-65% delivery margin.

**Utilization Rate:** Billable hours / Available hours per team member. Target
varies by role: 75-85% for individual contributors, 50-65% for managers, 30-40%
for directors. Over-utilization leads to burnout; under-utilization erodes margin.

**Project Profitability:** Revenue minus all allocated costs (direct team time,
overhead allocation, tools) per project. Track actual vs. estimated profitability
to improve future scoping accuracy.

**Scope Creep Rate:** Percentage of projects where actual hours exceed estimated
hours by more than 15%. Persistent scope creep indicates estimation problems
or boundary-setting issues.

**On-Time Delivery Rate:** Percentage of projects or deliverables completed
by the agreed deadline. Track at the milestone level, not just final delivery.

### Financial Metrics

**Revenue Per Employee:** Total revenue divided by total headcount. A proxy
for productivity and pricing power. Track trends over time.

**Pipeline Coverage Ratio:** Total pipeline value divided by revenue target
for the period. Agencies typically need 3-4x pipeline coverage for predictable
revenue.

**Average Project Value:** Mean revenue per engagement. Track whether this
is growing (moving upmarket) or shrinking (commoditization pressure).

---

## Key Analytical Patterns

### Attribution Accuracy for Clients

Agencies that run marketing campaigns for clients must demonstrate attribution
rigorously. The agency's credibility depends on honest, validated reporting:

- Use incrementality testing, not just platform-reported conversions
- Report confidence levels alongside attribution numbers
- Acknowledge what the attribution model cannot measure
- Triangulate model-based and self-reported attribution
- Present limitations proactively — clients respect honesty more than
  inflated numbers

See the Attribution Quality Checklist for detailed validation criteria.

### Capacity Planning Analysis

Match team capacity to pipeline and project forecasts:
- Current utilization by role and skill set
- Committed hours for in-progress projects
- Forecasted hours for pipeline projects (weighted by probability)
- Gap analysis: where will you be over/under-resourced in 30/60/90 days?
- Hiring trigger thresholds: at what utilization rate should hiring begin?

### Client Health Scoring

Build a composite client health score from:
- Delivery metrics (on-time, on-budget, scope adherence)
- Relationship signals (meeting frequency, response time, NPS)
- Financial signals (payment timeliness, scope expansion vs. contraction)
- Engagement signals (stakeholder involvement, feedback quality)

Use the health score to prioritize account management attention and predict
retention risk.

### Service Line Profitability

Not all services are equally profitable. Analyze by service line:
- Revenue, margin, and growth rate per service
- Client overlap (do certain services cross-sell well?)
- Team skill requirements and availability
- Competitive positioning (where does the agency have pricing power?)

---

## Common Pitfalls

1. **Tracking revenue without margin.** An agency can be growing revenue
   while losing money on each project. Always report margin alongside revenue.
2. **Utilization as a blunt instrument.** Maximizing utilization without
   considering project fit, skill development, and burnout is short-sighted.
3. **Client-reported satisfaction only.** Clients who are unhappy may not tell
   you — they just leave. Track behavioral signals (engagement, scope changes)
   alongside survey responses.
4. **Inflating attribution for clients.** It feels good to report great
   numbers, but over-attributed results erode trust when clients eventually
   discover the gap between reported and actual impact.
5. **No project post-mortem analysis.** Each project generates data about
   estimation accuracy, delivery efficiency, and client satisfaction. Without
   systematic post-mortem analysis, the same mistakes repeat.

---

## Cross-References

- **Attribution Quality Checklist** (`checklists/attribution-quality.md`) — Critical for client reporting.
- **LTV/CLV Model Quality Checklist** (`checklists/ltv-clv-model-quality.md`) — Client lifetime value modeling.
- **Cross-Squad Data Handoff Template** (`templates/operational/cross-squad-data-handoff.md`) — Client data handoffs between teams.
- **Authority Bias in Dashboards** (`reference/psychology/authority-bias-in-dashboards.md`) — When client stakeholders override data.

---

*Version: 1.0 | Last updated: 2026-03-06*
