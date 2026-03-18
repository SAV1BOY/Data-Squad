# Fintech Benchmarks

## Overview

Fintech benchmarks span a wide range of business models: neobanks, lending platforms, payment processors, insurance tech, and wealth management. Regulatory requirements add compliance metrics that other industries do not track. This reference focuses on consumer and SMB fintech benchmarks. Sources include a16z, Plaid, ARK Invest, and public fintech filings.

---

## Activation and Onboarding

### Activation Rates

| Business Model | Bottom Quartile | Median | Top Quartile |
|---------------|----------------|--------|--------------|
| Neobank (account funded) | 25% | 40% | 55% |
| Lending (application completed) | 15% | 30% | 45% |
| Payments (first transaction) | 35% | 50% | 65% |
| Investing (first deposit) | 20% | 35% | 50% |

Activation is defined as completing the first value-generating action, not just account creation. KYC completion is a prerequisite step, not activation itself.

### KYC Completion Rate

Overall median: 60-70%. Drop-off by step:

| Step | Typical Drop-off |
|------|-----------------|
| Email verification | 5-10% |
| Personal info entry | 10-15% |
| Document upload | 15-25% |
| Identity verification | 5-10% |
| Funding/linking bank | 15-25% |

Reducing document upload friction (camera capture, auto-fill, instant verification) has the highest impact on overall activation.

---

## Transaction Metrics

### Transaction Frequency

| Product Type | Bottom Quartile | Median | Top Quartile |
|-------------|----------------|--------|--------------|
| Neobank (debit card) | 4/month | 8/month | 15/month |
| P2P payments | 1/month | 3/month | 7/month |
| Investing | 1/month | 2/month | 5/month |
| Lending (repayment) | 1/month | 1/month | 1/month |

Primary bank account status is indicated by 10+ debit transactions per month. Below 4 transactions suggests the account is secondary or dormant.

### Deposit Growth

Monthly direct deposit growth rate for neobanks: median 3-5%, top quartile 8-12%. Average direct deposit amount is a stronger indicator of primary account status than deposit count.

---

## Retention

### Monthly Active User Retention

| Period | Bottom Quartile | Median | Top Quartile |
|--------|----------------|--------|--------------|
| Month 1 | 40% | 55% | 70% |
| Month 3 | 25% | 40% | 55% |
| Month 6 | 18% | 32% | 48% |
| Month 12 | 12% | 25% | 40% |

Fintech retention improves significantly when users establish recurring behavior (direct deposit, auto-invest, recurring payments). Users who set up at least one recurring transaction within 30 days have 2-3x higher 12-month retention.

---

## Customer Acquisition

### CAC by Channel

| Channel | Median CAC | Top Quartile CAC |
|---------|-----------|-----------------|
| Paid social (Meta/TikTok) | $35-60 | $15-30 |
| Paid search | $40-80 | $20-40 |
| Referral program | $10-25 | $5-12 |
| Content/SEO | $8-20 | $3-10 |
| Partnerships (payroll, platform) | $15-40 | $8-20 |

Referral programs are highly effective in fintech because trust matters. Referral-acquired users also tend to have 20-40% higher retention than paid-acquired users.

### CAC:LTV Ratio

Healthy range: 1:3 to 1:5. Fintech CAC payback periods are typically longer than SaaS (median 18-24 months) because monetization ramps gradually as users increase engagement.

---

## Regulatory and Compliance Metrics

### Fraud Rates

| Metric | Acceptable | Warning | Critical |
|--------|-----------|---------|----------|
| Transaction fraud rate | < 0.1% | 0.1-0.3% | > 0.3% |
| Account takeover rate | < 0.05% | 0.05-0.15% | > 0.15% |
| False positive rate (fraud blocks) | < 3% | 3-8% | > 8% |
| Chargeback rate | < 0.5% | 0.5-1.0% | > 1.0% |

Card network thresholds: Visa and Mastercard flag merchants with chargeback rates above 0.9-1.0%. Exceeding this triggers monitoring programs with penalties.

### Compliance Metrics

- **SAR filing rate:** Suspicious Activity Reports per 1,000 accounts. Varies by risk profile; track trend rather than absolute number.
- **KYC rejection rate:** Median 5-10%. Above 15% may indicate poor UX or overly aggressive risk rules.
- **Complaint resolution time:** Regulatory expectation is 15 business days for most jurisdictions, 8 days for UK FCA.

---

## Unit Economics

### Revenue per User (Annual)

| Product Type | Bottom Quartile | Median | Top Quartile |
|-------------|----------------|--------|--------------|
| Neobank | $40 | $80 | $150 |
| Lending | $100 | $250 | $500 |
| Payments | $20 | $50 | $120 |
| Investing | $30 | $70 | $180 |

Revenue per user increases with tenure. Year-2 ARPU is typically 1.5-2.5x year-1 ARPU for neobanks as users increase deposit balances and card usage.

---

## Common Pitfalls

1. **Counting registered accounts as active users.** In fintech, only funded and transacting accounts should count as active.
2. **Ignoring regulatory costs in unit economics.** Compliance, fraud losses, and capital requirements are real costs.
3. **Benchmarking CAC without considering activation rate.** A $30 CAC with 30% activation is effectively $100 CAC per activated user.
4. **Measuring retention by login instead of transaction.** A user who logs in to check their balance but never transacts is not truly retained.
5. **Overlooking deposit concentration risk.** If a small number of users hold a disproportionate share of deposits, the portfolio is fragile.

---

## Cross-References

- **Fintech Data Playbook** (`reference/industries/fintech-data-playbook.md`) — Full analytics playbook.
- **Privacy Regulations Summary** (`reference/standards/privacy-regulations-summary.md`) — Regulatory requirements.

---

*Version: 1.0 | Last updated: 2026-03-18*
