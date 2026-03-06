# The Customer-Base Audit - Peter Fader, Bruce Hardie, Michael Ross (2022)

## Book Info

- **Title:** The Customer-Base Audit: The First Step on the Journey to Customer Centricity
- **Author:** Peter Fader, Bruce Hardie, Michael Ross
- **Publisher:** Wharton School Press
- **Year:** 2022
- **ISBN:** 978-1613631607
- **Pages:** 200
- **Context:** The operational companion to Fader's Customer Centricity. Co-authored with Bruce Hardie (London Business School), Fader's longtime academic collaborator, and Michael Ross (DynamicAction), who brought the practitioner perspective. The book provides a structured diagnostic framework that any company can apply to understand the health of its customer base.

## Core Thesis

Before a company can become customer-centric, it must first understand the current state of its customer base with rigorous, standardized diagnostics. The Customer-Base Audit is a five-lens framework that examines customer behavior from complementary angles, revealing patterns that aggregate revenue figures obscure. Most companies cannot answer basic questions about their customer dynamics -- how many customers are active, whether new cohorts perform better or worse than old ones, or whether revenue growth comes from acquiring more customers or extracting more from existing ones. The audit fixes this blindness.

## Key Concepts

### 1. The Five Lenses of the Customer-Base Audit
(a) **Customer count and growth** -- how many customers are active and how is that changing? (b) **Customer quality distribution** -- how is value distributed across the base? (c) **Customer behavior over time (cohort analysis)** -- how do cohorts evolve? (d) **Customer migration patterns** -- how do customers move between value tiers? (e) **Customer unit economics** -- what are the acquisition and retention economics?

### 2. Lens 1: How Many Customers and How Is That Changing?
Decompose total revenue into customer count multiplied by revenue per customer. Track both components separately. Revenue growth driven purely by customer count is very different from growth driven by increasing spend per customer. Further decompose customer count into new acquisitions, retained customers, and reactivated lapsed customers.

### 3. Lens 2: How Unequal Is the Customer Base?
Examine the distribution of revenue and profit across customers. Build decile analyses. Compute Gini coefficients or Pareto ratios. Most companies are shocked by how concentrated their revenue is. This lens directly informs Fader's customer-centricity argument: if 20% of customers drive 80% of value, strategy must reflect that asymmetry.

### 4. Lens 3: How Are Cohorts Behaving Over Time?
Track each acquisition cohort's spending, frequency, and retention over time. Are newer cohorts performing better or worse than older ones on a same-vintage basis? Cohort degradation is an early warning sign of acquisition quality problems. Cohort improvement suggests product-market fit is strengthening.

### 5. Lens 4: How Are Customers Migrating Between Segments?
Build transition matrices showing how customers move between value tiers (e.g., high, medium, low, inactive) from period to period. Healthy customer bases show upward mobility and low churn. Unhealthy bases show persistent downward migration. This lens catches problems that average metrics conceal.

### 6. Lens 5: What Are the Unit Economics?
Calculate acquisition cost, first-period revenue, retention rates, and projected lifetime value by cohort and channel. Determine whether the business is acquiring customers profitably. This lens connects the behavioral diagnostics to financial sustainability.

### 7. The Audit as a Recurring Practice
The audit is not a one-time exercise but a quarterly or semi-annual discipline. Tracking each lens over time reveals trends that point-in-time snapshots miss. The authors provide templates and visualization standards for ongoing monitoring.

### 8. Data Requirements and Pragmatism
The audit requires surprisingly little data: customer ID, transaction date, and transaction amount. The authors explicitly address messy data realities and provide guidance on handling missing data, defining "active" customers, and choosing appropriate time windows.

## Application to Data Squad

- **Standard engagement deliverable:** The Customer-Base Audit should be a standard early deliverable in every Data Squad engagement. It establishes baseline health and identifies the highest-leverage problems.
- **Five-lens dashboard template:** Build a reusable dashboard template that implements all five lenses. This becomes the core diagnostic tool for customer analytics engagements.
- **Cohort analysis discipline:** Make cohort-based analysis the default for any retention or revenue analysis. Never report aggregate trends without cohort decomposition.
- **Migration matrices for churn prediction:** Transition matrices are an intuitive way to show stakeholders where churn risk concentrates and whether interventions are working.
- **Data minimalism:** The audit's minimal data requirements (ID, date, amount) mean it can be executed quickly even with clients who have immature data infrastructure.
- **Recurring cadence:** Position the audit as a recurring health check, not a one-time project. This creates ongoing engagement value and builds client analytical capability.

## Key Quotes

> "You cannot manage what you do not diagnose. And most companies have never performed a rigorous diagnostic on their most important asset: their customers."

> "Revenue is a vanity number. Customer count times revenue per customer is the beginning of wisdom."

> "Cohort analysis is the single most important analytical technique in customer analytics. If you do nothing else, do this."

> "The transition matrix tells you the truth about your customer base that no aggregate metric can reveal: are your customers getting better or worse over time?"

> "The beauty of the customer-base audit is that it requires only three fields: who bought, when they bought, and how much they spent."

## Cross-References

- **fader-customer-centricity.md** - The strategic philosophy that motivates the audit; read the Audit as the "how to diagnose" companion to Customer Centricity's "why to care."
- **fader-customer-equity.md** - The academic CLV models that can be applied after the audit to generate forward-looking valuations.
- **mehta-customer-success.md** - CS teams operationalize the retention and migration insights the audit surfaces.
- **kaushik-web-analytics-2-0.md** - Kaushik's outcomes analysis maps to the unit economics lens of the audit.
- **davenport-competing-analytics.md** - Davenport's maturity model helps position where a company falls on the journey the audit initiates.
- **provost-data-science-business.md** - Provides the data mining techniques that extend the audit into predictive modeling.
