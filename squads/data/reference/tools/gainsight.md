# Gainsight Reference

## Overview

Gainsight is a customer success platform that helps B2B SaaS companies reduce churn, drive adoption, and expand revenue. It combines product usage data, customer health scoring, and workflow automation to enable proactive customer success management.

## Core Modules

### Customer 360

A unified view of each customer account:

| Data Source | What It Provides |
|------------|------------------|
| CRM (Salesforce, HubSpot) | Contract details, ARR, renewal dates, contacts |
| Product usage | Feature adoption, login frequency, active users |
| Support (Zendesk, Intercom) | Ticket volume, CSAT, open issues |
| Surveys (NPS, CSAT) | Customer sentiment scores |
| Financial data | Invoices, payments, overdue amounts |
| Custom data | Any data source via API or CSV |

### Health Scores

Health scores predict whether a customer is likely to renew, churn, or expand.

#### Building a Health Score

1. **Choose dimensions:** Product usage, support engagement, stakeholder relationships, survey results, contract details.
2. **Weight each dimension:** Assign importance based on historical correlation with outcomes.
3. **Define thresholds:** What constitutes "healthy," "at risk," and "red" for each dimension.
4. **Combine into an overall score:** Weighted average or rule-based composite.

#### Example Health Score Model

| Dimension | Weight | Green | Yellow | Red |
|-----------|--------|-------|--------|-----|
| Product usage (DAU/MAU) | 30% | > 40% | 15-40% | < 15% |
| Feature adoption | 20% | > 5 features | 3-5 features | < 3 features |
| Support tickets (30d) | 15% | 0-2 | 3-5 | > 5 |
| NPS score | 15% | 9-10 | 7-8 | 0-6 |
| Stakeholder engagement | 10% | Monthly contact | Quarterly | > 90 days |
| Contract growth | 10% | Expanding | Flat | Contracting |

#### Health Score Best Practices

1. **Validate against outcomes.** Backtest your health score against historical churn data. If it does not predict churn better than random, revise it.
2. **Keep it simple.** 4-6 dimensions maximum. More dimensions add noise, not signal.
3. **Update regularly.** Recalibrate weights quarterly based on new churn data.
4. **Do not over-automate actions based on scores.** Health scores are signals, not certainties. CSMs should apply judgment.
5. **Separate leading from lagging indicators.** Product usage decline is leading (can act on); churn is lagging (too late).

### Playbooks

Automated or semi-automated workflows triggered by customer events:

| Trigger | Playbook | Actions |
|---------|----------|---------|
| Health score drops to yellow | Risk mitigation | Create CTA, assign to CSM, schedule check-in |
| 90 days before renewal | Renewal preparation | Send usage summary, schedule renewal call |
| New customer onboarded | Onboarding success | Send welcome email, schedule kickoff, assign tasks |
| Feature adoption below threshold | Adoption drive | Send training resources, schedule product walkthrough |
| NPS detractor response | Detractor recovery | Alert CSM, create escalation, schedule follow-up |
| Usage spike | Expansion opportunity | Alert AE, prepare expansion proposal |

### Calls to Action (CTAs)

Tasks assigned to CSMs based on playbook triggers or manual creation:

- **Priority levels:** Critical, High, Medium, Low.
- **Types:** Risk, Renewal, Expansion, Onboarding, Lifecycle.
- **SLAs:** Define expected response times per CTA type.
- **Tracking:** Monitor CTA close rates, time to close, and outcomes.

## Product Analytics in Gainsight

### Gainsight PX (Product Experience)

Separate product within the Gainsight ecosystem focused on in-app analytics and engagement:

- **Feature adoption tracking:** Which features are used, by whom, and how often.
- **In-app guides:** Tooltips, modals, and walkthroughs to drive adoption.
- **Surveys:** In-app NPS, CSAT, and custom surveys.
- **Path analysis:** How users navigate through the product.
- **Engagement scoring:** Quantify user engagement based on product usage.

### Connecting Usage Data to CS

The power of Gainsight is connecting product usage data to customer success workflows:

1. Product usage data flows into Gainsight (from PX, Segment, Mixpanel, or custom integration).
2. Health scores incorporate usage metrics.
3. Playbooks trigger based on usage changes.
4. CSMs receive actionable intelligence, not raw data.

## Data Integration

### Connectors

| Source | Integration Method |
|--------|-------------------|
| Salesforce | Native bi-directional sync |
| HubSpot | Native connector |
| Segment | Destination connector |
| Snowflake/BigQuery | S3/GCS data loader |
| Custom APIs | Gainsight API |
| CSV | Manual or automated upload |

### Data Architecture

```
CRM (Salesforce) ──┐
Product Usage ─────┤
Support (Zendesk) ─┤──> Gainsight ──> Health Scores ──> Playbooks ──> CSM Actions
Surveys ───────────┤
Financial Data ────┘
```

### Best Practices for Data Integration

1. **Define the data model before implementing.** Map CRM objects to Gainsight objects.
2. **Use MDA (Gainsight's data architecture)** for custom objects when CRM does not have the right structure.
3. **Sync frequency:** Daily for most data. Real-time for critical alerts (e.g., outage notifications).
4. **Data quality:** Gainsight is only as good as the data it receives. Clean your CRM data first.

## Reporting and Analytics

### Standard Reports

- **Health score distribution:** How many customers are green/yellow/red.
- **Renewal forecast:** Expected renewals by quarter with risk assessment.
- **CTA performance:** Open CTAs, close rate, average time to close.
- **Adoption metrics:** Feature usage by segment, cohort, or customer tier.
- **NPS trends:** Score over time, promoter/detractor breakdown.

### Custom Reports

- Build reports using Gainsight's report builder.
- Join data from multiple objects (accounts, CTAs, timeline, usage).
- Export to BI tools for more advanced analysis.

### Dashboards

- Executive dashboard: ARR at risk, churn forecast, NPS trend.
- CSM dashboard: My accounts, open CTAs, upcoming renewals.
- Product dashboard: Feature adoption, engagement trends.

## Success Planning

- Create success plans with measurable objectives for strategic accounts.
- Track milestones and outcomes.
- Share with customers for alignment and accountability.
- Link objectives to product usage metrics when possible.

## Common Implementation Mistakes

1. **Overcomplicating health scores.** Start with 3-4 dimensions. Add complexity only when validated.
2. **Not connecting product usage data.** Without usage data, health scores are based on relationship signals alone, which are lagging indicators.
3. **Too many playbooks.** CSMs get overwhelmed with CTAs. Prioritize ruthlessly.
4. **Ignoring data quality.** Bad CRM data produces bad health scores and false alerts.
5. **Not training CSMs.** Gainsight is powerful but complex. Invest in training.
6. **Using Gainsight as a reporting tool instead of an action tool.** The value is in automated workflows and proactive intervention, not just dashboards.
7. **Not closing the loop.** Track whether playbook actions actually reduce churn. If they do not, change the playbook.

## Metrics to Track

| Metric | Definition | Target |
|--------|-----------|--------|
| Gross Retention Rate (GRR) | Revenue retained excluding expansion | > 90% |
| Net Revenue Retention (NRR) | Revenue retained including expansion | > 110% |
| Time to Value | Days from contract to first value milestone | < 30 days |
| Health Score Accuracy | % of red accounts that actually churned | > 70% predictive |
| CTA Close Rate | % of CTAs closed within SLA | > 80% |
| NPS | Net Promoter Score | > 40 |
| Feature Adoption Rate | % of users using core features | > 60% |
