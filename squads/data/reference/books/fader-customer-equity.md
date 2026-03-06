# Fader, Hardie, Lee CLV Papers Index - Academic CLV Foundation

## Book Info

- **Title:** Collected Papers on Customer Lifetime Value Modeling
- **Authors:** Peter S. Fader (Wharton), Bruce G.S. Hardie (London Business School), Ka Lok Lee (various)
- **Publisher:** Various academic journals (Journal of Marketing Research, Marketing Science, Journal of Marketing)
- **Years:** 2005-2020+
- **Context:** This is an index of the most important academic papers from the Fader-Hardie-Lee collaboration, which has produced the foundational probabilistic models used in modern CLV estimation. These papers are the mathematical backbone behind the practical frameworks in Fader's trade books. The BG/NBD and BG/BB models are the most widely implemented CLV models in industry.

## Core Thesis

Customer lifetime value can and should be estimated using probabilistic models that account for heterogeneity in purchase frequency, transaction value, and dropout probability across customers. Simple heuristic approaches (average revenue times average tenure) systematically overestimate CLV for low-value customers and underestimate it for high-value ones. The Fader-Hardie framework provides closed-form models that require only transaction-level data and produce individual-level CLV estimates with known statistical properties.

## Key Concepts

### 1. BG/NBD Model (Beta-Geometric / Negative Binomial Distribution)
The workhorse model for non-contractual settings (e-commerce, retail). Each customer has a latent purchase rate (gamma-distributed across the population) and a latent dropout probability (beta-distributed). The model estimates both from observed transaction data. Key paper: "Counting Your Customers the Easy Way" (Marketing Science, 2005). This paper alone has thousands of citations and spawned an industry of CLV tools.

### 2. Pareto/NBD Model
The predecessor to BG/NBD, developed by Schmittlein, Morrison, and Colombo (1987). More complex and computationally expensive than BG/NBD but historically important. Fader and Hardie showed that BG/NBD produces nearly identical results with dramatically simpler computation.

### 3. BG/BB Model (Beta-Geometric / Beta-Binomial)
The discrete-time analogue of BG/NBD, appropriate for settings where transactions occur in defined time periods (e.g., subscription renewals, quarterly purchases). Useful for businesses with natural purchase cycles.

### 4. Gamma-Gamma Model for Monetary Value
A companion model that estimates expected average transaction value per customer, conditional on their transaction history. Combined with BG/NBD (which models frequency and recency), the Gamma-Gamma model completes the CLV estimate by adding the monetary dimension.

### 5. RFM (Recency, Frequency, Monetary Value) as Sufficient Statistics
Fader and Hardie showed that individual-level RFM summaries are sufficient statistics for their models -- you don't need the full transaction log, just three numbers per customer plus the observation period length. This dramatically simplifies implementation.

### 6. Probability of Being "Alive"
A key output of the BG/NBD model is P(alive) -- the posterior probability that a customer is still active. This is invaluable for distinguishing truly churned customers from those in a natural inter-purchase gap. In non-contractual settings, you never observe churn directly; you can only estimate its probability.

### 7. Customer-Based Corporate Valuation (CBCV)
Later papers (with Daniel McCarthy) extend individual CLV to firm valuation. By summing predicted CLV across the current customer base and modeling future acquisition, the authors derive a customer-based estimate of firm enterprise value. Applied to companies like Wayfair pre-IPO.

### 8. Key Papers Index
- **"Counting Your Customers the Easy Way" (2005)** - BG/NBD model introduction
- **"A Note on Deriving the Conditional PMF of the BG/NBD" (2005)** - Technical derivation
- **"RFM and CLV: Using Iso-Value Curves for Customer Base Analysis" (2005)** - Connecting RFM to CLV
- **"Probability Models for Customer-Base Analysis" (2009)** - Tutorial/overview paper
- **"Customer-Base Valuation in a Contractual Setting" (2007)** - BG/BB for subscriptions
- **"The Gamma-Gamma Model of Monetary Value" (various)** - Monetary value extension
- **"Valuing Subscription-Based Businesses Using Publicly Disclosed Customer Data" (2017)** - CBCV applied
- **"How to Value a Company by Analyzing Its Customers" (2020, HBR)** - Practitioner summary

## Application to Data Squad

- **Model selection guide:** Use BG/NBD + Gamma-Gamma for non-contractual clients (e-commerce, marketplaces). Use BG/BB or survival models for subscription clients. The business context dictates the model.
- **P(alive) as operational metric:** Surface P(alive) to client CS and marketing teams as an actionable churn risk indicator. Customers with declining P(alive) should trigger re-engagement campaigns.
- **CLV-based segmentation:** Replace heuristic segmentation (high/medium/low spenders) with model-based CLV tiers that incorporate predicted future value, not just past spend.
- **Implementation via libraries:** The lifetimes (Python) and BTYD (R) packages implement these models. Data Squad should standardize on these for CLV estimation engagements.
- **CBCV for investor clients:** For clients in investment or M&A contexts, CBCV provides a rigorous framework for valuing target companies based on customer economics rather than just financial multiples.
- **Data requirements are minimal:** These models require only customer ID, transaction date, and transaction value. This low bar means CLV modeling can begin almost immediately in any engagement.

## Key Quotes

> "The key to understanding a non-contractual customer base is recognizing that you never directly observe the moment a customer decides to leave." -- Fader & Hardie, 2005

> "A customer who last purchased 6 months ago and has historically purchased every month is very different from one who purchased 6 months ago but historically purchased once a year. Recency and frequency together tell you whether to worry." -- Fader & Hardie, 2009

> "RFM is not a model. It is a set of sufficient statistics that feeds into a model." -- Fader & Hardie, 2005

> "The value of a company is, fundamentally, the sum of the lifetime values of its current and future customers. Everything else is accounting." -- McCarthy & Fader, 2017

## Cross-References

- **fader-customer-centricity.md** - The strategic framework that motivates CLV as the central metric; the papers provide the mathematical implementation.
- **fader-customer-base-audit.md** - The audit generates the data inputs (RFM summaries, cohort patterns) that feed directly into these models.
- **mehta-customer-success.md** - CS teams operationalize the P(alive) and CLV outputs from these models in their account management.
- **provost-data-science-business.md** - Broader data science context for understanding where probabilistic customer models fit in the analytics toolkit.
- **hubbard-measure-anything.md** - Philosophical grounding for why probabilistic estimates of CLV are valuable even with uncertainty.
- **kohavi-trustworthy-experiments.md** - Experimentation framework for testing interventions designed to improve CLV.
