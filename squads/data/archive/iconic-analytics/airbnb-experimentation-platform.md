# Airbnb Experimentation Platform: Marketplace Experiments at Scale

## Context

Airbnb operates a two-sided marketplace connecting hosts and guests, which makes experimentation fundamentally more complex than single-sided products. When you change the guest experience, you affect host behavior, and vice versa. Network effects, seasonality, geographic variation, and supply constraints all create challenges that standard A/B testing frameworks were not designed to handle.

Airbnb began building its experimentation platform (internally called ERF -- Experiment Reporting Framework) in the early 2010s and has iterated through multiple generations. By 2020, they were running hundreds of experiments simultaneously, with a dedicated experimentation team of data scientists and engineers supporting product teams across the company. Their journey offers critical lessons for any organization running experiments in complex, interdependent systems.

## What Happened

### Generation 1: Basic A/B Testing (2012-2014)

Airbnb's first experimentation platform was straightforward: randomize users into treatment and control groups, measure conversion rates, compute p-values. This worked for simple UI changes but quickly revealed its limitations:

- **Sample size challenges**: Many experiments targeted specific segments (new hosts in a particular city, luxury listings, business travelers) with insufficient sample sizes to reach statistical significance in reasonable timeframes.
- **Interference effects**: Randomizing guests into treatment/control changed the supply they consumed, affecting control group outcomes. A guest in the treatment group who booked a listing made it unavailable for control group guests.
- **Seasonality confounds**: Travel behavior varies dramatically by season, making time-based comparisons unreliable.

### Generation 2: Marketplace-Aware Experimentation (2014-2017)

Airbnb's data science team developed marketplace-specific experimental methods:

- **Cluster randomization**: Instead of randomizing individual users, they randomized by geographic market (city or region). This contained interference effects within clusters, though it reduced effective sample size.
- **Switchback experiments**: For supply-side changes, they alternated between treatment and control over time within the same market, using each market as its own control.
- **Variance reduction with CUPED**: Following Netflix's lead, Airbnb implemented CUPED (Controlled-experiment Using Pre-Experiment Data) to reduce metric variance, allowing experiments to reach significance with smaller samples.

### Generation 3: Causal Inference and Sophistication (2017-Present)

The platform evolved to include advanced methods:

- **Heterogeneous treatment effects**: Rather than just measuring average treatment effects, the team estimated how effects varied across user segments, market types, and time periods.
- **Long-term effect estimation**: Many Airbnb interventions (e.g., changes to review systems) have effects that unfold over months. The team developed methods to estimate long-term impact from short-term experiment data.
- **Interference modeling**: For experiments where cluster randomization was impractical, the team built models to estimate and correct for interference between treatment and control groups.
- **Bayesian methods**: For decisions that needed to be made quickly or with small samples, Bayesian approaches provided more intuitive uncertainty quantification than frequentist methods.

### The Sample Size Problem

Airbnb's sample size challenges were severe and instructive. Key examples:

- **Host-side experiments**: Airbnb has far fewer hosts than guests, and many changes target specific host segments. An experiment targeting new hosts in mid-tier US cities might have a sample of only a few thousand.
- **Booking-level metrics**: Since bookings are rare events (most sessions do not result in a booking), booking rate experiments require large samples or long runtimes.
- **Revenue metrics**: Revenue has extremely high variance (a single luxury booking can skew results), requiring either variance reduction techniques or alternative metrics.

Solutions included metric surrogates (using search-to-booking conversion as a proxy for revenue), composite metrics, and Bayesian methods that incorporated prior information.

## Key Metrics and Methods

| Metric | Type | Challenge |
|---|---|---|
| Nights booked | Primary outcome | High variance, rare event |
| Guest conversion (search to book) | Funnel metric | Seasonal variation |
| Host acceptance rate | Supply quality | Small sample sizes |
| Guest review score | Quality indicator | Delayed measurement |
| Revenue per available night | Marketplace efficiency | Extreme variance |
| Time to first booking (new hosts) | Activation | Censored data |

### Experimental Methods

| Method | Use Case | Tradeoff |
|---|---|---|
| User-level randomization | UI changes, recommendation algorithms | Subject to interference |
| Market-level cluster randomization | Pricing, supply interventions | Reduced statistical power |
| Switchback designs | Time-sensitive marketplace changes | Carryover effects |
| Synthetic control | Market-level policy changes | Requires good donor pool |
| Regression discontinuity | Threshold-based policy changes | Local treatment effect only |

## Lessons

### 1. Marketplace Experiments Require Marketplace Methods
Standard A/B testing assumes no interference between treatment and control groups. In marketplaces, this assumption almost always fails. Ignoring interference leads to biased treatment effect estimates -- sometimes dramatically so.

### 2. Sample Size Is a Design Constraint, Not an Afterthought
Many experiment ideas at Airbnb were infeasible because the target population was too small. The experimentation team learned to evaluate statistical power before committing engineering resources, saving months of wasted effort.

### 3. Proxy Metrics Unlock Experimentation
When the metric you care about (revenue, long-term retention) is too noisy or slow to measure, validated proxy metrics make experimentation practical. The investment in validating proxies pays for itself many times over.

### 4. Experimentation Infrastructure Is a Product
Airbnb treated their experimentation platform as an internal product with users (product teams), roadmap, and quality standards. This ensured the platform evolved to meet real needs rather than becoming technical debt.

### 5. Statistical Sophistication Must Be Accessible
Advanced methods are only valuable if product teams can use them. Airbnb invested in documentation, training, and self-service tools that made sophisticated experimentation accessible to non-statisticians.

### 6. Some Questions Cannot Be Answered by Experiments
Airbnb learned that strategic decisions (entering new markets, launching new product categories) often cannot wait for experimental evidence. The team developed frameworks for combining experimental evidence with observational analysis and business judgment.

## Application to Data Squad

- **Assess interference in your experiments**: If your product has network effects or shared resources, standard A/B testing may give biased results. Consider cluster randomization or switchback designs.
- **Run power analyses before experiments**: Calculate required sample size before launching. If you cannot reach significance in a reasonable timeframe, consider proxy metrics or alternative methods.
- **Validate proxy metrics rigorously**: If you use surrogate metrics, regularly validate that they predict the outcomes you actually care about. Proxies can drift over time.
- **Treat your experimentation tools as a product**: Assign ownership, gather user feedback, and iterate. Poor tooling kills experimentation culture faster than poor statistics.
- **Build a method menu**: Not every question requires an A/B test. Develop capability in quasi-experimental methods, observational causal inference, and Bayesian analysis to handle the full range of decision problems.
- **Document your interference model**: For marketplace or platform businesses, explicitly describe how treatment and control groups can affect each other, and choose experimental designs accordingly.
