# A/B Testing - Dan Siroker & Pete Koomen (2013)

## Book Info

- **Title:** A/B Testing: The Most Powerful Way to Turn Clicks Into Customers
- **Authors:** Dan Siroker, Pete Koomen
- **Publisher:** Wiley
- **Year:** 2013
- **ISBN:** 978-1118792414
- **Pages:** 224
- **Context:** Siroker and Koomen are co-founders of Optimizely, one of the leading A/B testing platforms. Siroker famously led the optimization of Barack Obama's 2008 presidential campaign website, where A/B testing reportedly increased email signups by 40% and raised an additional $60M in donations. The book translates their practitioner experience into an accessible guide for teams getting started with experimentation.

## Core Thesis

A/B testing is the most reliable method for making data-driven product and marketing decisions because it establishes causality, not just correlation. Every change to a website, app, or marketing campaign is a hypothesis that can be tested. Companies that build a culture of testing outperform those that rely on intuition, design committees, or the HiPPO (Highest Paid Person's Opinion) because testing replaces opinion with evidence. The practice of testing is more important than any individual test result.

## Key Concepts

### 1. The HiPPO Problem
In most organizations, decisions are made by the Highest Paid Person's Opinion. The HiPPO is not necessarily wrong, but they are not always right either, and their authority prevents alternative ideas from being tested. A/B testing democratizes decision-making: anyone's idea can be tested, and the data picks the winner regardless of who proposed it.

### 2. Hypothesis-Driven Testing
Every test should start with a clear hypothesis: "We believe that [change] will cause [effect] because [reason]." This discipline prevents aimless testing and ensures that every experiment generates learning whether it wins or loses. A test without a hypothesis is an activity; a test with a hypothesis is an experiment.

### 3. Statistical Significance
A result is statistically significant when the observed difference between control and treatment is unlikely to have occurred by chance. Siroker and Koomen explain significance at a practical level: sample size requirements, confidence levels (typically 95%), and the relationship between effect size and required sample. They warn against stopping tests early when results "look" significant.

### 4. What to Test (and in What Order)
A prioritization framework based on impact and effort: (a) **High traffic pages first** -- more traffic means faster tests and larger impact. (b) **Conversion-critical pages** -- landing pages, checkout flows, signup forms. (c) **Radical changes before refinements** -- test big differences first (entirely new layouts) because they move the needle more than small tweaks (button color). (d) **Headlines and CTAs** -- the highest-impact, lowest-effort tests available.

### 5. Multivariate Testing (MVT)
Testing multiple variables simultaneously to identify the best combination. MVT is more efficient than sequential A/B tests when you need to test several elements on the same page, but requires much larger sample sizes. Siroker recommends starting with A/B tests (simpler, faster, easier to interpret) and graduating to MVT when traffic and testing maturity support it.

### 6. Personalization Through Testing
Using test results to deliver different experiences to different segments. If version A wins for new visitors and version B wins for returning visitors, serve each segment its winning version. This bridges testing and personalization, creating increasingly optimized experiences for different user types.

### 7. Testing Culture and Process
Building a testing program is an organizational challenge, not just a technical one. Key elements: executive sponsorship, a dedicated testing backlog, a regular testing cadence, documentation of all tests (including losers), and celebration of learning rather than just winning. The goal is to make testing the default way decisions are made, not a special project.

### 8. Common Testing Mistakes
The book catalogs frequent errors: (a) stopping tests too early (peeking problem), (b) testing too many variations with insufficient traffic, (c) not accounting for external factors (seasonality, campaigns) that affect both control and treatment, (d) testing trivial changes that cannot meaningfully impact business metrics, and (e) failing to document and share learnings from past tests.

## Application to Data Squad

- **Testing program design:** Help clients build structured testing programs with hypothesis templates, prioritization frameworks, and documentation standards.
- **Statistical rigor:** Ensure clients' testing practices meet statistical standards: proper sample size calculations, significance thresholds, and protection against peeking.
- **Test prioritization:** Use the high-traffic/high-impact matrix to prioritize client testing backlogs. Focus on the pages and flows with the most volume and conversion sensitivity.
- **Testing culture workshops:** Facilitate workshops that help client organizations transition from HiPPO decision-making to evidence-based decision-making through testing.
- **Hypothesis quality review:** Review client test hypotheses for clarity and testability before experiments launch. A well-formed hypothesis is the single most important determinant of a test's learning value.
- **Test documentation systems:** Build systems for documenting test results, hypotheses, and learnings so that institutional knowledge accumulates over time.

## Key Quotes

> "A/B testing is not about finding winners. It is about eliminating opinions and replacing them with evidence."

> "The best time to start testing was yesterday. The second best time is today. Every day you are not testing is a day you are leaving money on the table."

> "A failed test is not a failure. It is a learning that saves you from investing in an idea that does not work."

> "The HiPPO is not the enemy. Untested opinions are the enemy. The HiPPO's idea deserves to be tested just like everyone else's."

> "Test big before you test small. The difference between a green button and an orange button is almost always noise. The difference between two entirely different value propositions is often signal."

## Cross-References

- **kohavi-trustworthy-experiments.md** - The deeper, more rigorous treatment of experimentation methodology. Siroker provides the accessible introduction; Kohavi provides the graduate-level course.
- **ellis-hacking-growth.md** - Growth teams use A/B testing as their primary tool for validating growth hypotheses at high tempo.
- **kaushik-web-analytics-2-0.md** - Testing is Kaushik's third pillar of the multiplicity model; Siroker provides the operational playbook.
- **ries-lean-startup.md** - A/B testing operationalizes the "Measure" phase of Build-Measure-Learn for digital products.
- **kahneman-thinking-fast-slow.md** - Testing is the antidote to the cognitive biases (overconfidence, anchoring, narrative fallacy) that corrupt intuitive decision-making.
- **cagan-inspired.md** - Product discovery relies heavily on A/B testing to validate that solutions are valuable and usable.
