# Brazil & LATAM Data Context

## Overview

Operating a data practice in Brazil and Latin America introduces unique
considerations around tools, privacy regulation, payment infrastructure,
and cultural context that are poorly served by US/EU-centric data playbooks.
This reference covers the practical realities of building a data-driven
organization in the region.

---

## LGPD (Lei Geral de Protecao de Dados) Compliance

### What It Is

Brazil's LGPD (Law No. 13,709/2018) is the country's comprehensive data
protection law, modeled after GDPR but with Brazil-specific provisions.
It applies to any organization processing personal data of individuals in
Brazil, regardless of where the organization is based.

### Key Requirements for Data Teams

**Legal Basis for Processing:** Every data processing activity must have a
legal basis (consent, legitimate interest, contract performance, etc.).
Data teams must document the legal basis for each data pipeline that processes
personal data.

**Data Subject Rights:** Users can request access, correction, deletion, and
portability of their data. Data architectures must support these requests
within reasonable timeframes.

**Data Protection Impact Assessment (DPIA):** Required for high-risk
processing activities. Analytics involving profiling, scoring, or automated
decision-making typically require a DPIA.

**Data Protection Officer (DPO):** Organizations must appoint a DPO (called
"Encarregado" in LGPD). The DPO must be accessible and involved in data
processing decisions.

**Anonymization:** Properly anonymized data falls outside LGPD scope. However,
anonymization must be irreversible — pseudonymization (which is reversible)
is still subject to LGPD.

### Practical Implications

- **Consent management:** Use tools that support Portuguese-language consent
  flows and LGPD-specific consent categories.
- **Data retention policies:** Define and enforce retention periods for all
  personal data. "Keep everything forever" is not LGPD-compliant.
- **Cross-border data transfers:** Transferring data outside Brazil requires
  specific safeguards (standard contractual clauses, adequacy decisions, or
  specific consent).
- **Breach notification:** ANPD (the enforcement authority) must be notified
  of breaches that may cause significant harm, within a "reasonable" timeframe.

---

## PIX Data and Payment Analytics

### What PIX Is

PIX is Brazil's instant payment system, launched by the Central Bank in
November 2020. It enables free, instant, 24/7 transfers between individuals
and businesses. As of 2025, PIX processes more transactions than credit
and debit cards combined in Brazil.

### Analytics Implications

**Transaction Volume:** PIX has dramatically increased transaction frequency
for many businesses. A customer who previously paid monthly via boleto may
now make multiple smaller payments. This changes:
- Purchase frequency metrics (higher frequency, lower AOV)
- Cash flow patterns (more distributed, less lumpy)
- Payment failure rates (near zero for PIX vs. 5-10% for card)

**Conversion Rate Impact:** PIX reduces checkout friction compared to boleto
(which requires bank payment within 3 days) and credit card (which requires
card data entry). Track conversion rate by payment method to quantify the
PIX advantage.

**Churn and Involuntary Churn:** PIX-based recurring payments do not
experience involuntary churn from expired cards. This changes churn dynamics
for subscription businesses.

**Boleto Conversion Rate:** Boleto bancario (bank slip) still exists but
has lower conversion than PIX. Track boleto generation-to-payment rate
(typically 50-70%) and use it to calibrate revenue forecasts.

**Data Availability:** PIX transaction data from acquirers and bank APIs
provides rich payment analytics. However, reconciliation between PIX
settlements and business systems requires careful engineering.

---

## Accessible Tools for BR/LATAM Data Teams

### Analytics and BI

Many LATAM data teams operate with tighter budgets than US counterparts.
Practical tool recommendations:

- **Google BigQuery + Looker Studio:** Free tier sufficient for many
  early-stage companies. Looker Studio (formerly Data Studio) is free.
- **Metabase:** Open-source BI tool with strong community. Can be self-hosted
  to minimize cost.
- **dbt (data build tool):** Free open-source version handles most needs.
  dbt Cloud free tier covers small teams.
- **Google Analytics 4:** Standard for web analytics. Free tier is generous.
- **Hotjar / Microsoft Clarity:** For user behavior analytics. Clarity is
  free; Hotjar has a limited free tier.

### Data Engineering

- **Google Cloud Platform:** Offers startup credits and has data centers in
  Sao Paulo (southamerica-east1). Local data residency is important for
  LGPD compliance.
- **AWS:** Sao Paulo region available. Strong startup programs.
- **Airbyte:** Open-source data integration. Handles most common Brazilian
  data sources.

### Marketing and Product Analytics

- **RD Station:** Brazil's leading marketing automation platform. Native
  integration with Brazilian tools and processes.
- **Amplitude / Mixpanel:** Product analytics. Both have free tiers
  suitable for startups.
- **Hotmart Analytics:** For infoproduct businesses on the Hotmart platform.

---

## Local Platform Considerations

### Hotmart, Eduzz, Monetizze

Brazil's major infoproduct platforms have their own analytics ecosystems.
Data teams should:
- Extract data via APIs for centralized analysis
- Be aware of metric definition differences between platforms
- Track cross-platform customer behavior if selling on multiple platforms
- Account for platform-specific refund policies in revenue metrics

### iFood, Rappi, Mercado Livre

For marketplace businesses, each platform provides seller analytics with
different metric definitions, time zones, and update frequencies. Standardize
definitions when aggregating cross-platform data.

### WhatsApp as a Data Source

WhatsApp is the primary communication channel in Brazil. For businesses using
WhatsApp Business API:
- Track conversation-to-conversion rates
- Measure response time and its impact on conversion
- Integrate WhatsApp interaction data into customer journey analytics
- Be mindful of LGPD requirements for conversation data storage

---

## Cultural and Regional Context

### Seasonal Patterns

- **Carnival (Feb/Mar):** Significant drop in B2B activity. Plan around it.
- **Black Friday (Nov):** Massive e-commerce event in Brazil, often bigger
  than in the US relative to annual sales. Plan data infrastructure for
  traffic spikes.
- **Dia das Maes, Dia dos Namorados, Dia dos Pais:** Brazilian commerce
  peaks that differ from US calendar (e.g., Valentine's Day is June 12).
- **13th salary (December):** Extra month's salary paid in December drives
  year-end consumer spending.

### Payment Installments (Parcelamento)

Brazilian consumers routinely pay in installments (parcelamento) via credit
card, even for small purchases. Analytics implications:
- Revenue recognition differs from payment timing
- AOV may be higher than in markets without installment culture
- Default risk on installment plans must be tracked
- "Price" in Brazil often means "monthly installment price," not total price

### Regional Variation

Brazil is continental in scale. Sao Paulo, Rio, and the Southeast have
different digital behaviors than the Northeast, North, or South regions.
Segment analytics by region when possible, especially for:
- Payment method preferences
- Device type (mobile-heavy in lower-income regions)
- Platform preferences
- Price sensitivity

---

## Cross-References

- **E-commerce Data Playbook** (`ecommerce-data-playbook.md`) — For BR e-commerce specific patterns.
- **Infoproduct Data Playbook** (`infoproduct-data-playbook.md`) — BR infoproduct ecosystem context.
- **Marketplace Data Playbook** (`marketplace-data-playbook.md`) — BR marketplace specifics.
- **Attribution Quality Checklist** (`checklists/attribution-quality.md`) — WhatsApp attribution challenges.
- **Framing Effects in Reports** (`reference/psychology/framing-effects-in-reports.md`) — Installment vs. total price framing.

---

*Version: 1.0 | Last updated: 2026-03-06*
