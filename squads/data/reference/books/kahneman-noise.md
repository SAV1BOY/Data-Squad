# Noise: A Flaw in Human Judgment - Daniel Kahneman, Olivier Sibony, Cass R. Sunstein (2021)

## Book Info

- **Title:** Noise: A Flaw in Human Judgment
- **Authors:** Daniel Kahneman, Olivier Sibony, Cass R. Sunstein
- **Publisher:** Little, Brown Spark
- **Year:** 2021
- **ISBN:** 978-0316451406
- **Pages:** 464
- **Context:** Written as a companion to Thinking, Fast and Slow, this book addresses a different failure mode in human judgment: noise (unwanted variability) as opposed to bias (systematic error). Kahneman partners with Sibony (McKinsey and HEC Paris) and Sunstein (Harvard Law) to show that noise is at least as damaging as bias but receives far less attention.

## Core Thesis

Wherever there is judgment, there is noise -- and more of it than you think. Noise is unwanted variability in judgments that should be identical. Two doctors given the same patient file will give different diagnoses. Two underwriters given the same application will set different premiums. Two analysts given the same data will reach different conclusions. Bias gets all the attention because it is directional and easier to detect, but noise is often a larger source of error. Reducing noise is one of the highest-return improvements organizations can make to their decision quality.

## Key Concepts

### 1. Noise vs. Bias
Bias is systematic error: all judges err in the same direction (e.g., everyone overestimates project timelines). Noise is random variability: different judges err in different directions for no systematic reason. Both degrade decision quality, but noise is invisible in individual decisions and only becomes apparent when you compare multiple judgments. A noise audit -- having multiple people judge the same case independently -- is the only way to detect noise.

### 2. Types of Noise
(a) **Level noise** -- different judges have systematically different baselines (one doctor prescribes antibiotics more liberally than another). (b) **Pattern noise** -- different judges respond differently to specific cases (Judge A is harsh on fraud but lenient on theft; Judge B is the opposite). (c) **Occasion noise** -- the same judge varies across time based on mood, fatigue, weather, or what they had for lunch. All three types contribute to total noise.

### 3. The Noise Audit
A structured exercise to measure noise: have multiple independent judges evaluate the same set of cases, then analyze the variability across judges. Organizations are almost always shocked by the results. Insurance companies find that underwriters' assessments of the same risk differ by 55%. Sentencing judges vary wildly on identical case files. The noise audit is the first step toward noise reduction.

### 4. Decision Hygiene
Systematic practices that reduce noise without requiring identification of specific biases: (a) structure judgments (break complex assessments into independent components), (b) use scales with clear anchors, (c) ensure independence of judgments before discussion (to prevent group anchoring), (d) aggregate multiple independent judgments, (e) use models and algorithms where possible (even simple ones outperform unaided human judgment for most prediction tasks).

### 5. The Value of Algorithms
Simple algorithms -- even crude ones -- consistently outperform human judgment for predictive tasks because they eliminate noise. A linear model with equal weights often outperforms both expert judgment and optimized regression weights because it eliminates noise while capturing the main signal. This does not mean algorithms are unbiased, but they are noise-free: they give the same output for the same input every time.

### 6. Structured Decision-Making
For judgments that require human input (hiring, performance evaluation, strategic decisions), structure reduces noise dramatically. Define evaluation criteria in advance, evaluate each criterion independently, score before discussing, and aggregate scores mechanically. This is the opposite of holistic judgment, which maximizes noise by allowing all dimensions to interact in the judge's mind.

### 7. The Mediating Assessment Protocol (MAP)
Kahneman's recommended decision-making process: (a) define the key dimensions relevant to the decision, (b) assess each dimension independently using a structured scale, (c) delay intuitive holistic judgment until after structured assessment, (d) use the structured assessments as the primary input to the decision. The protocol preserves the value of human judgment while dramatically reducing noise.

### 8. When Noise is Acceptable
Not all judgment variability is unwanted. In creative tasks, artistic judgment, and some strategic decisions, variability is the point. The key distinction: is this a case where the right answer exists and variability is error (predictive judgment), or is this a case where multiple answers are legitimate and variability is diversity (evaluative judgment)?

## Application to Data Squad

- **Noise audits for client decision processes:** Offer noise audits as a diagnostic service: measure how much variability exists in key client decision processes (lead scoring, customer segmentation, performance evaluation) and quantify the cost of that variability.
- **Algorithm development for noisy judgments:** Identify client decision processes with high noise and build simple algorithmic alternatives. Even basic scoring models reduce noise dramatically.
- **Structured analytical reviews:** Apply the MAP protocol to Data Squad's own analytical process: define evaluation criteria before analyzing data, assess dimensions independently, and delay holistic conclusions.
- **Scoring rubrics for qualitative assessments:** When Data Squad must make qualitative judgments (data quality assessments, maturity evaluations), use structured scoring rubrics to reduce inter-analyst variability.
- **Model-vs-human benchmarks:** When delivering predictive models to clients, benchmark model performance against the noise level in the current human judgment process. Often the model does not need to be very good to outperform noisy human judgment.
- **Decision hygiene training:** Include decision hygiene principles in client workshops alongside analytics training. Better decision processes amplify the value of better data.

## Key Quotes

> "Wherever there is judgment, there is noise -- and usually more of it than you think."

> "The scandal of noise is that we tolerate it because we do not see it. Bias has direction and is detectable. Noise is invisible in any single judgment."

> "A simple algorithm will outperform human judgment in most predictive tasks, not because the algorithm is brilliant, but because it does not have bad days."

> "If two equally qualified experts give you very different answers to the same question, at least one of them is wrong. Probably both are."

> "Decision hygiene is not glamorous. It is not innovative. It is merely effective."

## Cross-References

- **kahneman-thinking-fast-slow.md** - The companion work on cognitive biases; Noise addresses a different dimension of judgment failure that Thinking Fast and Slow did not fully cover.
- **hubbard-measure-anything.md** - Hubbard's calibration training reduces occasion noise by making individual estimators more consistent.
- **kohavi-trustworthy-experiments.md** - Experimentation reduces decision noise by replacing judgment with evidence.
- **provost-data-science-business.md** - Simple models outperforming expert judgment is a key theme in both books.
- **fader-customer-equity.md** - Probabilistic CLV models reduce the noise inherent in human customer valuation judgments.
- **davenport-competing-analytics.md** - The shift from judgment-based to analytics-based decisions is fundamentally a noise reduction strategy.
