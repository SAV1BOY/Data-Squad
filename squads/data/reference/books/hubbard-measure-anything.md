# How to Measure Anything - Douglas W. Hubbard (2014, 3rd Edition)

## Book Info

- **Title:** How to Measure Anything: Finding the Value of Intangibles in Business
- **Author:** Douglas W. Hubbard
- **Publisher:** Wiley
- **Year:** 2014 (3rd edition; 1st edition 2007)
- **ISBN:** 978-1118539279
- **Pages:** 432
- **Context:** Hubbard is a management consultant and pioneer in applied information economics. The book challenges the widespread assumption that important business concepts like "brand value," "customer satisfaction impact," or "strategic alignment" are unmeasurable. It provides a practical methodology for measuring anything using calibrated probability estimation and Bayesian reasoning.

## Core Thesis

If something matters, it is observable. If it is observable, it can be measured. The claim that something is "intangible" or "unmeasurable" is almost always false -- it reflects a failure of imagination about what measurement means, not a genuine impossibility. Measurement does not require perfect precision; it requires reducing uncertainty enough to make better decisions. Even a crude estimate that narrows a range of possibilities has measurement value. The key insight: measurement is the reduction of uncertainty, not the attainment of certainty.

## Key Concepts

### 1. The Definition of Measurement
Measurement is a quantitatively expressed reduction of uncertainty based on one or more observations. This is radically broader than the common assumption that measurement means exact counting or precise instrumentation. Under this definition, a calibrated expert estimate that narrows a 90% confidence interval from "somewhere between $0 and $100M" to "somewhere between $5M and $20M" is a valid and useful measurement.

### 2. The Measurement Inversion
Organizations systematically measure the wrong things. Hubbard's research shows that the variables with the highest information value (the ones that would most reduce decision uncertainty) are typically the ones companies say are "unmeasurable." Meanwhile, companies meticulously track low-information-value metrics that barely affect decisions. The measurement inversion means the most important things to measure are precisely the ones currently not being measured.

### 3. Calibration Training
Most people are poorly calibrated: when they say they are 90% confident in a range, they are correct only about 50% of the time. Hubbard provides calibration training exercises (equivalent bets, trivia questions with confidence intervals) that dramatically improve estimation accuracy. Calibrated experts produce useful measurements even without hard data.

### 4. Applied Information Economics (AIE)
Hubbard's five-step method: (a) Define the decision and relevant variables. (b) Determine what you know now (prior distributions). (c) Compute the value of additional information (expected value of perfect information, EVPI). (d) Measure the high-value variables using the most cost-effective method. (e) Make the decision using the updated estimates. The critical step is computing information value before investing in measurement.

### 5. Expected Value of Perfect Information (EVPI)
EVPI quantifies how much it would be worth to eliminate all uncertainty about a variable before making a decision. If EVPI is low, the variable does not need to be measured more precisely -- the current uncertainty does not materially affect the decision. If EVPI is high, investing in better measurement is justified. This prevents organizations from over-measuring low-value variables and under-measuring high-value ones.

### 6. Decomposition
When a concept seems unmeasurable, decompose it into observable components. "Customer satisfaction" is vague; "percentage of customers who repurchase within 12 months" is measurable. "Brand value" is abstract; "price premium customers will pay relative to a generic alternative" is observable. Decomposition transforms unmeasurable concepts into measurable components.

### 7. Small Sample Sizes Are Valuable
Hubbard demonstrates (using the Rule of Five and other statistical principles) that even very small samples -- as few as 5 observations -- can dramatically reduce uncertainty compared to no observations at all. This counters the common objection that "we don't have enough data to measure that." Five random customers can tell you more than zero customers about almost anything.

### 8. Monte Carlo Simulation
For complex decisions involving multiple uncertain variables, Hubbard advocates Monte Carlo simulation: define probability distributions for each input variable, run thousands of random draws, and analyze the distribution of outcomes. This naturally handles interactions between variables and produces decision-useful probability distributions rather than false point estimates.

## Application to Data Squad

- **Measurement planning discipline:** Before any analytics engagement, apply Hubbard's framework: what decisions does the client need to make? What variables most affect those decisions? What is the current state of uncertainty? Where does additional measurement have the highest value?
- **Calibration workshops:** Run calibration training with client teams to improve their estimation accuracy. Calibrated business leaders make better decisions even with imperfect data.
- **EVPI for prioritization:** Use EVPI calculations to prioritize which metrics and data pipelines to build first. This prevents the common mistake of building comprehensive dashboards when a single well-chosen metric would suffice.
- **Decomposition for KPI design:** When clients say something "cannot be measured," use decomposition to identify observable proxies. This is especially valuable for measuring community impact, brand health, and customer experience.
- **Small sample justification:** When clients resist analysis because "we don't have enough data," use Hubbard's statistical arguments to show that even small samples reduce uncertainty meaningfully.
- **Monte Carlo for business cases:** Build Monte Carlo simulations for client business cases rather than single-scenario spreadsheets. This provides honest probability distributions for outcomes.

## Key Quotes

> "If something matters, it is detectable and observable. If it is detectable and observable, it can be measured. The only question is how."

> "The things that are most important to measure are often the things organizations claim are unmeasurable. This is the measurement inversion."

> "Measurement is not about certainty. It is about reducing uncertainty enough to make a better decision."

> "Before you invest in measuring something, ask: how much would it change my decision if I knew this with perfect certainty? If the answer is 'not much,' you already have enough information."

> "Five random observations from a population can reduce your uncertainty about the mean by more than most people realize."

## Cross-References

- **kahneman-thinking-fast-slow.md** - Kahneman's work on cognitive biases explains why humans are poorly calibrated and why Hubbard's calibration training is necessary.
- **kahneman-noise.md** - Noise addresses variability in judgment, which Hubbard's calibration methodology directly counteracts.
- **kaushik-web-analytics-2-0.md** - Kaushik's economic value assignment is a specific application of Hubbard's decomposition: making the "intangible" measurable.
- **fader-customer-equity.md** - CLV models are a sophisticated measurement of what many companies consider an "unmeasurable" variable (future customer value).
- **kohavi-trustworthy-experiments.md** - Experimentation is one of Hubbard's measurement methods; Kohavi provides the detailed methodology.
- **taleb-fooled-by-randomness.md** - Taleb's warnings about confusing signal and noise complement Hubbard's emphasis on calibrated estimation.
