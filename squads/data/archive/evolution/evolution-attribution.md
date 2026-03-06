# Evolution of Attribution: From Last-Click to Incrementality Testing

## Context

Attribution -- the practice of assigning credit for conversions to marketing touchpoints -- has been one of the most debated topics in analytics for two decades. The question seems simple: which marketing channel caused a customer to convert? In practice, it is extraordinarily difficult because customers interact with multiple channels, causation is nearly impossible to observe directly, and every attribution model contains assumptions that favor certain channels over others.

The evolution of attribution reflects the broader maturation of analytics from simple heuristics to sophisticated causal methods, and the ongoing tension between what is easy to measure and what is true.

## What Happened

### Era 1: Last-Click Attribution (2000-2010)

The default attribution model for the first decade of digital marketing was last-click: 100% of conversion credit goes to the last touchpoint before the customer converted.

**How it works:**
- A customer clicks a Google ad, then visits via organic search, then clicks a retargeting display ad, then converts
- Last-click gives 100% credit to the retargeting ad
- All upstream touchpoints receive zero credit

**Why it dominated:**
- Simple to implement -- just look at the referring source at conversion time
- Google Analytics used it as the default for over a decade
- It aligned with the way most ad platforms (Google Ads, Facebook) already claimed conversions
- It was easy to explain to stakeholders

**What it got wrong:**
- Systematically overcredited lower-funnel channels (retargeting, brand search) that intercepted customers who were already going to convert
- Systematically undercredited upper-funnel channels (content marketing, display, social) that drove awareness and consideration
- Created perverse incentives: marketers invested heavily in retargeting and brand search because those channels showed the best "ROI" under last-click, while the channels actually driving demand were starved of budget
- The retargeting industry effectively became an attribution arbitrage business -- showing ads to people who were already going to buy, then claiming credit for the sale

### Era 2: Multi-Touch Attribution (2010-2016)

Recognizing last-click's limitations, the industry developed multi-touch attribution (MTA) models that distributed credit across multiple touchpoints.

**Common models:**
- **First-click**: 100% credit to the first touchpoint (overcredits awareness channels)
- **Linear**: Equal credit to all touchpoints
- **Time-decay**: More credit to touchpoints closer to conversion
- **Position-based (U-shaped)**: 40% to first touch, 40% to last touch, 20% distributed among middle touches
- **Custom rules**: Business-specific weighting schemes

**What changed:**
- Acknowledged that the customer journey involves multiple touchpoints
- Created visibility into upper-funnel marketing effectiveness
- Forced conversations about channel synergy and customer journeys

**What it got wrong:**
- All rule-based models are arbitrary. Why 40/20/40 and not 30/40/30? There is no theoretical basis for any particular weighting.
- Still correlation-based: just because a touchpoint appeared in the journey does not mean it caused the conversion.
- Required tracking across channels, which was technically challenging and became increasingly difficult with cross-device behavior.
- Different models gave dramatically different answers, and choosing between them was itself an arbitrary decision.

### Era 3: Data-Driven Attribution (2016-2021)

Data-driven attribution (DDA) used statistical and ML methods to assign credit based on observed conversion patterns rather than predetermined rules.

**How it works:**
- **Shapley value approaches**: Apply cooperative game theory to calculate each channel's marginal contribution across all possible orderings of touchpoints
- **Markov chain models**: Model the customer journey as a series of transitions between channel states, measuring each channel's removal effect on overall conversion probability
- **Algorithmic models**: ML models (logistic regression, gradient boosting) trained on conversion data to estimate each touchpoint's contribution

Google Analytics 4 adopted data-driven attribution as its default model, and platforms like Google Ads and Facebook moved toward conversion modeling that used similar principles.

**What changed:**
- Attribution was grounded in observed data patterns rather than arbitrary rules
- Channels were evaluated on their marginal contribution -- what would happen if the channel were removed
- Cross-device and cross-platform attribution improved through probabilistic matching

**What it still got wrong:**
- Still fundamentally correlational. Observing that customers who see display ads convert more does not prove display ads caused the conversion. Selection bias dominates: ad platforms target users who are likely to convert anyway.
- Relied heavily on user-level tracking (cookies, device IDs) that was disappearing due to privacy regulations and browser changes.
- Shapley values and Markov models make strong assumptions (e.g., channel interactions are order-independent) that rarely hold in practice.
- Created false precision: reporting that channel X deserves 23.7% of credit implies a level of accuracy that does not exist.

### Era 4: Incrementality Testing and Media Mix Modeling (2021-Present)

The current era is driven by two forces: the collapse of user-level tracking (cookie deprecation, iOS App Tracking Transparency) and the recognition that only causal methods can truly answer "what is the incremental impact of this channel?"

**Key approaches:**

**Incrementality testing (geo-experiments):**
- Randomly assign geographic regions to treatment (ads on) and control (ads off)
- Measure the difference in conversions between treatment and control regions
- Provides true causal estimates of advertising impact
- Pioneered by Google (GeoLift) and Facebook (Conversion Lift)

**Media Mix Modeling (MMM):**
- Regression-based models estimating the impact of marketing spend on outcomes, controlling for seasonality, economic conditions, and other factors
- Revived from its TV-era origins with modern Bayesian implementations (Google's Meridian, Meta's Robyn)
- Works with aggregate data, avoiding user-level tracking requirements
- Handles offline and online channels in a unified framework

**Calibrated MMM:**
- Combines MMM with incrementality test results: use experiment results to calibrate and validate the MMM's channel-level estimates
- Provides the scale of MMM with the causal validity of experimentation

**What changed:**
- The question shifted from "which touchpoint gets credit" to "what is the causal impact of this marketing spend"
- Privacy-compatible: works with aggregate data rather than user-level tracking
- Forces honest measurement: incrementality tests often show that channels contributing less than attribution models suggest
- Budget optimization becomes possible based on causal impact curves rather than correlational attribution

**What it gets wrong (so far):**
- Geo-experiments require significant geographic scale and are expensive to run (you must turn off advertising in control regions)
- MMM models have wide confidence intervals and are sensitive to model specification
- Neither approach provides the touchpoint-level granularity that tactical marketers crave
- Organizational resistance: many teams do not want to discover that their favorite channel is less effective than attributed data suggests

## Key Methods Across Eras

| Era | Method | Data Required | Causal Validity |
|---|---|---|---|
| Last-click | Conversion referrer | Minimal | None |
| Multi-touch | Rule-based allocation | Full journey data | None |
| Data-driven | Statistical/ML models | Full journey data | Weak (correlational) |
| Incrementality | Experiments + MMM | Aggregate + experiments | Strong (causal) |

## Lessons

### 1. Attribution Has Always Been a Causal Question Answered with Correlational Methods
Until incrementality testing, every attribution model answered the question "which touchpoints were present" rather than "which touchpoints caused the conversion." This distinction is not academic -- it drives millions of dollars of misallocated marketing spend.

### 2. Default Models Shape Behavior
Google Analytics' default of last-click attribution influenced an entire generation of marketing investment toward lower-funnel channels. Defaults are not neutral; they are the most powerful policy lever in analytics.

### 3. Precision in Attribution Is Usually False Precision
Reporting channel-level attribution to decimal places creates an illusion of accuracy. In reality, the uncertainty in any attribution model is enormous. Communicating ranges and directional insights is more honest and more useful.

### 4. Privacy Regulation Forced Better Measurement
Ironically, the collapse of user-level tracking is pushing the industry toward methods (incrementality testing, MMM) that are more causally valid. The loss of granularity is being compensated by gains in causal integrity.

### 5. Incrementality Tests Are the Gold Standard but Require Courage
Turning off advertising in control regions means accepting short-term revenue loss for long-term measurement clarity. Many organizations are unwilling to run these tests, which means they never discover their true channel effectiveness.

## Application to Data Squad

- **Stop relying solely on platform-reported attribution**: Google, Facebook, and other platforms all overclaim conversions. Use their data as one input, not as truth.
- **Run incrementality tests on your largest channels**: Start with your highest-spend channel. Turn it off in a random set of geographic regions for 4-8 weeks and measure the difference.
- **Build or adopt a Media Mix Model**: Use Bayesian MMM (Meta's Robyn or Google's Meridian) to estimate channel-level impact from aggregate data. Calibrate with incrementality test results.
- **Communicate attribution as ranges, not points**: Tell stakeholders "this channel drives between 15% and 25% of conversions" rather than "this channel drives 19.3% of conversions."
- **Educate stakeholders on the difference between correlation and causation in attribution**: This is the single most important concept for marketing leaders to understand.
- **Design your measurement for a cookieless world**: Assume user-level cross-channel tracking will continue to degrade. Invest in aggregate methods now.
