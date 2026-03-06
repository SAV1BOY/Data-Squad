# Fintech Data Playbook

## Overview

Fintech analytics operates under unique constraints: regulatory requirements,
fraud risk, high trust sensitivity, and complex financial product lifecycles.
Data teams must balance growth analytics with compliance reporting, and every
metric carries legal and financial implications. A data error in fintech is
not just embarrassing — it can trigger regulatory action, financial losses,
or loss of customer trust that takes years to rebuild.

---

## Core Metrics

### Acquisition and Growth

**CAC Payback Period:** Months to recover customer acquisition cost from gross
margin. In fintech, CAC tends to be high (identity verification, onboarding
friction, trust-building) and payback periods are longer than in other
industries. Segment by product (credit, payments, savings, insurance).

**Activation Rate:** Percentage of signups who complete identity verification
and make their first qualifying transaction. Fintech activation funnels are
longer than typical SaaS due to KYC/KYB requirements, making each step
critical to measure separately.

**Funded Account Rate:** Percentage of verified accounts that deposit or
receive funds. This is often the true activation metric — accounts without
funds have near-zero lifetime value.

### Transaction and Revenue Metrics

**Transaction Volume (TPV):** Total payment volume processed. Track by
product, segment, and geography. TPV growth rate should outpace customer
growth rate if customers are deepening engagement.

**Revenue Per Account:** Total revenue (interchange, fees, interest, float)
divided by active accounts. Segment by product, tenure, and account tier.

**Take Rate / Net Revenue Margin:** Revenue retained per transaction dollar.
In payments, this is typically 0.5-3% of TPV. In lending, it is the net
interest margin. Track trends — compression indicates competitive pressure.

### Risk Metrics

**Fraud Rate:** Fraudulent transactions as a percentage of total transactions
(by count and by value). Track false positive rate alongside — aggressive fraud
prevention blocks legitimate customers.

**Default Rate / Delinquency Rate (lending):** Percentage of loans that are
30/60/90 days past due. Vintage analysis (by origination month) is essential
to detect changes in credit quality.

**Chargeback Rate:** Disputed transactions as a percentage of total. Card
network thresholds (typically 1%) are hard limits that can result in losing
processing capabilities.

### Compliance Metrics

**KYC Completion Rate:** Percentage of applicants who successfully complete
identity verification. Segment by document type, country, and verification
method. Low completion rates indicate friction that kills growth.

**Suspicious Activity Report (SAR) Volume:** Number of SARs filed. Trending
upward may indicate either better detection or worse customer quality.

**Regulatory Reporting Accuracy:** Percentage of regulatory reports submitted
on time and without corrections. Track as a quality metric, not just a
compliance checkbox.

---

## Key Analytical Patterns

### Vintage Analysis

Essential for any lending product. Group loans by origination month and track:
- Cumulative default rates at 30, 60, 90, 180, 365 days
- Loss rates (defaults x loss given default)
- Recovery rates

Compare vintages to detect whether newer loans are higher or lower quality.
Economic conditions, underwriting changes, and marketing mix all affect vintage
performance.

### Fraud Pattern Detection

- Monitor transaction velocity (unusual frequency from single accounts)
- Geographic anomalies (transactions from unexpected locations)
- Device fingerprint clusters (multiple accounts from same device)
- Amount pattern analysis (structured amounts just below reporting thresholds)

Combine rule-based detection with ML models, and track model performance
(precision, recall) continuously. Fraud patterns evolve; static models decay.

### Unit Economics by Product

Fintech companies often offer multiple products (checking, savings, lending,
payments, insurance). Each has different economics:
- Cost to acquire and activate
- Revenue per account per month
- Marginal cost to serve
- Regulatory cost overhead
- Cross-sell probability to other products

A customer acquired for payments who cross-sells into lending may have 5-10x
the LTV of a payments-only customer.

---

## Common Pitfalls

1. **Ignoring fraud in growth metrics.** Rapid account growth may include
   fraudulent accounts. Always report verified, funded accounts alongside
   total signups.
2. **Vintage analysis lag.** Loan performance takes months to materialize.
   Decisions based on incomplete vintages can be catastrophically wrong.
3. **False precision in credit models.** Thin-file or new-to-credit
   populations have inherently uncertain risk profiles. Report confidence
   intervals, not point estimates.
4. **Regulatory reporting as an afterthought.** Data pipelines must be built
   with regulatory requirements from the start. Retrofitting compliance is
   expensive and error-prone.
5. **Confusing TPV growth with revenue growth.** Processing more volume at
   lower margins is not necessarily progress.

---

## Cross-References

- **LTV/CLV Model Quality Checklist** (`checklists/ltv-clv-model-quality.md`) — Multi-product CLV in fintech.
- **Activation Funnel Quality Checklist** (`checklists/activation-funnel-quality.md`) — KYC-heavy activation funnels.
- **Experiment Design Quality Checklist** (`checklists/experiment-design-quality.md`) — Experimentation with financial products requires extra care.
- **Base Rate Neglect** (`reference/psychology/base-rate-neglect.md`) — Critical in fraud detection and credit risk.

---

*Version: 1.0 | Last updated: 2026-03-06*
