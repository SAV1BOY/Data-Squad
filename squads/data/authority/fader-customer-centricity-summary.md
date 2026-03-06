# Fader's Customer Centricity: Actionable Summary for Practitioners

## Core Idea

Peter Fader's "Customer Centricity" argues that not all customers are equal and that treating them equally is both financially wasteful and strategically wrong. The central thesis is that organizations should identify their most valuable customers, allocate disproportionate resources to acquiring and retaining similar customers, and accept that some customer segments are not worth pursuing. This is a radical departure from the product-centric view that dominates most organizations, where the goal is to sell products to as many people as possible.

## The Customer Centricity Framework

### Principle 1: Customer Lifetime Value Is the Core Metric

Fader places CLV at the center of all strategic decisions. CLV is not just a metric -- it is the lens through which acquisition, retention, product development, and resource allocation should be evaluated.

**How to apply it:**
- Calculate CLV for every customer or customer segment using transaction history
- For contractual businesses (SaaS, subscriptions): CLV = (Monthly Revenue x Gross Margin) / Monthly Churn Rate, discounted for time value
- For non-contractual businesses (e-commerce, retail): Use probabilistic models (BG/NBD + Gamma-Gamma) that estimate future purchasing probability and monetary value
- Rank customers by predicted future CLV, not by historical revenue (a customer who spent $10,000 once is less valuable than one who spends $200/month for years)

### Principle 2: Customer Heterogeneity Is a Feature, Not a Bug

Fader demonstrates that customer value follows a power law distribution: a small percentage of customers generate the majority of value. This is not an anomaly to be smoothed out -- it is the fundamental nature of customer bases that should drive strategy.

**How to apply it:**
- Visualize your CLV distribution. Typically, the top 20% of customers generate 60-80% of total CLV.
- Segment customers into value tiers: top tier (high CLV, invest heavily), middle tier (moderate CLV, maintain efficiently), and bottom tier (low or negative CLV, serve cheaply or not at all)
- Challenge the assumption that "more customers = better." Growth in low-CLV segments can destroy value if acquisition and servicing costs exceed lifetime revenue.

### Principle 3: Acquire the Right Customers, Not Just More Customers

Customer-centric acquisition means spending more to acquire customers who look like your best existing customers, even if this means acquiring fewer customers overall.

**How to apply it:**
- Build a profile of your highest-CLV customers: demographics, acquisition channel, first-purchase behavior, product preferences
- Create lookalike audiences for acquisition campaigns based on high-CLV customer profiles, not just any converted customer
- Measure acquisition quality by predicted CLV of acquired cohorts, not just volume or immediate conversion rate
- Accept higher CPAs for high-CLV-lookalike targets. A $200 CPA for a customer with $2,000 CLV is better than a $50 CPA for a customer with $100 CLV.

### Principle 4: Retention Efforts Should Be Proportional to Customer Value

Not all churn is equally harmful. Losing a high-CLV customer is catastrophically more expensive than losing a low-CLV customer. Retention resources should be allocated accordingly.

**How to apply it:**
- Build a churn risk model that incorporates CLV tier, not just churn probability
- Create an "expected value at risk" metric: Churn Probability x CLV. This prioritizes saving high-value customers who are at moderate risk over low-value customers at high risk.
- Design differentiated retention programs: personal outreach for top-tier at-risk customers, automated campaigns for mid-tier, no intervention for bottom-tier
- Accept that some churn is healthy. Losing low-CLV, high-servicing-cost customers improves overall business economics.

### Principle 5: Product Development Should Serve Best Customers First

In a customer-centric organization, product decisions are informed by what high-CLV customers need, not what the average customer or the loudest customer requests.

**How to apply it:**
- Weight feature requests and feedback by customer CLV. A feature requested by 10 top-tier customers is more strategically important than one requested by 100 bottom-tier customers.
- Analyze which product features predict high CLV. Invest in features that attract and retain high-value customers.
- Use CLV-weighted satisfaction metrics. NPS from your top 20% of customers matters more than overall NPS.

## Fader's CLV Calculation Approach

Fader is specific about CLV methodology. He warns against two common mistakes:

**Mistake 1: Using historical CLV (past revenue) as a predictor of future value.** Past spending is weakly correlated with future spending for many businesses. Probabilistic models that account for purchase probability are more accurate.

**Mistake 2: Using simple averages.** Average CLV is misleading because of the power law distribution. Report CLV by segment or as a distribution, not as a single number.

**Fader's recommended approach for non-contractual businesses:**
1. Use the BG/NBD model to predict each customer's probability of being "alive" (still active)
2. Use the Gamma-Gamma model to predict expected monetary value per transaction
3. Combine: Predicted CLV = Sum over future periods of [P(alive) x Expected transactions x Expected monetary value], discounted

**For contractual businesses:**
1. Model churn probability as a function of tenure and behavior
2. Predicted CLV = Sum over future periods of [P(retained) x Expected revenue], discounted
3. Account for expansion revenue (upsells) separately from base retention

## Organizational Implications

### What Changes in a Customer-Centric Organization

| Function | Product-Centric Approach | Customer-Centric Approach |
|---|---|---|
| Marketing | Maximize customer acquisition volume | Maximize CLV of acquired customers |
| Sales | Close every deal | Prioritize high-potential accounts |
| Product | Build for the average user | Build for best customer profiles |
| Support | Treat all tickets equally | Prioritize by customer value tier |
| Finance | Report revenue and customer count | Report CLV-based customer equity |

### Resistance Points

Fader acknowledges that customer centricity is organizationally difficult:
- Sales teams resist because it means qualifying out low-value prospects
- Marketing teams resist because it means smaller (but higher-quality) acquisition volumes
- Support teams resist because it feels unfair to treat customers differently
- Leaders resist because it requires admitting that some past growth was value-destroying

## Key Takeaways for Practitioners

1. **Calculate and segment by CLV immediately.** Even a rough CLV calculation reveals the power law in your customer base and changes how you think about acquisition and retention.
2. **Shift acquisition metrics from volume to value.** Report on predicted CLV of new cohorts alongside count and CPA. Celebrate quality, not just quantity.
3. **Build differentiated experiences based on value.** This does not mean bad service for low-value customers -- it means proportional investment in retention and enhancement.
4. **Use CLV as a common language across teams.** When marketing, sales, product, and support all reference CLV, alignment improves dramatically.
5. **Accept that not all growth is good growth.** Customer-centricity means saying no to segments that destroy value, even if they increase top-line metrics.
6. **Start with probabilistic models, not spreadsheets.** Fader's BG/NBD and Gamma-Gamma models are available in open-source libraries and produce dramatically better predictions than simple averages or historical extrapolation.
