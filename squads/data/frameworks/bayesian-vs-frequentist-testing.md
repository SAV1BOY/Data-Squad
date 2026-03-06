# Bayesian vs. Frequentist A/B Testing

> When to use each approach, with practical trade-offs

---

## Overview

A/B testing can be analyzed using either frequentist (classical hypothesis testing) or
Bayesian statistical frameworks. Both answer the question "is there a real difference
between variants?" but they frame the question differently, make different assumptions,
and produce different types of outputs. This framework compares the two approaches,
identifies when each is most appropriate, and addresses practical trade-offs for
experimentation programs.

---

## When to Use

- When setting up or redesigning an experimentation platform and choosing the
  statistical engine.
- When stakeholders ask "can we peek at results early?" (Bayesian handles this more
  naturally).
- When deciding between fixed-horizon and adaptive experiment designs.
- When communicating results to non-statisticians who may misinterpret p-values.
- When running experiments with small sample sizes or strong prior information.

---

## Core Concept

### Frequentist Approach

**Framework:** Null Hypothesis Significance Testing (NHST).

**Key outputs:**
- p-value: probability of observing data this extreme (or more) if there is no true
  effect.
- Confidence interval: range of effect sizes consistent with the data at a given
  confidence level.
- Binary decision: reject or fail to reject the null hypothesis.

**Assumptions and requirements:**
- Sample size calculated in advance (fixed-horizon).
- Significance level (alpha) and power (1-beta) set before the test.
- No peeking at results before the planned end (unless sequential testing methods
  are used).
- Results: "statistically significant" or "not statistically significant."

### Bayesian Approach

**Framework:** Update prior beliefs with observed data to produce posterior
distributions.

**Key outputs:**
- Posterior distribution of the effect size.
- Probability that variant B is better than variant A (e.g., "93% probability that
  B beats A").
- Credible interval: range containing the true effect with a given probability.
- Expected loss: the expected cost of choosing the wrong variant.

**Assumptions and requirements:**
- A prior distribution must be specified (can be uninformative / weakly informative).
- No fixed sample size required (can check results at any time without inflating
  error rates).
- Results: continuous probability statements about the effect.

### Head-to-Head Comparison

| Dimension               | Frequentist                        | Bayesian                             |
|--------------------------|------------------------------------|--------------------------------------|
| **Primary output**       | p-value, CI                        | Posterior probability, credible interval|
| **Decision rule**        | p < alpha -> reject null           | P(B > A) > threshold, or expected loss < threshold|
| **Sample size**          | Fixed, calculated in advance       | Flexible, can check continuously     |
| **Peeking**              | Inflates false positives           | Handled naturally                    |
| **Prior information**    | Not used                           | Incorporated via prior distribution  |
| **Interpretation**       | "If no effect, 3% chance of this data" | "93% probability B is better"     |
| **Ease of communication**| Counter-intuitive (p-value misuse) | More intuitive for non-statisticians |
| **Computational cost**   | Low                                | Moderate (MCMC or conjugate priors)  |
| **Regulatory acceptance**| High (established standard)        | Growing but less established         |

---

## Steps / Process

### Choosing the Approach

**Choose Frequentist when:**
- The organization has an established frequentist experimentation platform.
- Regulatory or scientific standards require p-values (e.g., clinical trials).
- Sample sizes are large and fixed-horizon designs are feasible.
- The team has statistical expertise to avoid common p-value misinterpretations.

**Choose Bayesian when:**
- Stakeholders need intuitive probability statements ("85% chance B is better").
- Experiments are costly or slow, and early stopping would be valuable.
- Strong prior information exists (e.g., prior experiments on similar features).
- The team wants to make continuous decisions rather than binary ship/no-ship calls.
- Small sample sizes make frequentist tests underpowered.

**Choose Sequential Testing (frequentist variant) when:**
- You want the rigor of frequentist inference but need to peek at results.
- Methods: group sequential testing, alpha spending functions, always-valid p-values.

### Implementation Steps

1. **Select the framework** based on the criteria above.
2. **Define the decision rule:**
   - Frequentist: alpha = 0.05, MDE, power = 0.80, fixed horizon.
   - Bayesian: prior distribution, decision threshold (e.g., P(B > A) > 0.95 or
     expected loss < $X).
3. **Pre-register** the analysis plan regardless of framework.
4. **Run the experiment** with monitoring appropriate to the framework.
5. **Analyze and decide** using the pre-committed decision rule.
6. **Document** the results, including which framework was used and why.

---

## Inputs / Outputs

### Inputs
| Input                          | Source                          |
|--------------------------------|---------------------------------|
| Experiment design parameters   | Experiment owner / statistician |
| Prior information (Bayesian)   | Historical experiments          |
| Sample size estimates          | Power analysis / simulation     |
| Organizational constraints     | Stakeholders                    |

### Outputs
| Output                         | Consumer                        |
|--------------------------------|---------------------------------|
| Test results in chosen framework| Product team, leadership       |
| Decision recommendation        | Product team                    |
| Framework selection rationale   | Experiment repository           |

---

## Pitfalls

1. **Misinterpreting p-values.** A p-value of 0.03 does NOT mean "3% probability the
   null is true." This misinterpretation is pervasive and consequential.

2. **Uninformative priors as a crutch.** Using flat priors in Bayesian analysis wastes
   the framework's advantage. Invest time in specifying reasonable priors.

3. **Bayesian peeking without a stopping rule.** While Bayesian methods handle peeking
   better than frequentist, making decisions at every peek without a loss threshold
   can still lead to poor outcomes.

4. **Mixing frameworks.** Running a frequentist test but reporting "probability that
   B is better" (a Bayesian statement) is incoherent. Be consistent.

5. **Ignoring practical significance.** Both frameworks can declare a tiny effect as
   "real." Always pair statistical conclusions with business impact assessment.

6. **Over-reliance on defaults.** Alpha = 0.05 is a convention, not a law. Similarly,
   a Bayesian threshold of 0.95 may be too conservative for low-stakes tests.

7. **Computational overhead dismissal.** Bayesian methods at scale (millions of users,
   thousands of metrics) require more compute. Plan infrastructure accordingly.

---

## Cross-References

- [Experiment Framework](experiment-framework.md) -- The full experiment lifecycle that
  this framework plugs into at the Analysis phase.
- [Attribution & Incrementality](attribution-and-incrementality.md) -- Incrementality
  tests need a statistical framework.
- [Kohavi Online Experiments](kohavi-online-experiments.md) -- Comprehensive reference
  on frequentist online experimentation.
- [ICE/PIE/RICE Prioritization](ice-pie-rice-prioritization.md) -- Prioritizing what
  to test.
- [Data Quality Triad](data-quality-triad.md) -- Bad data quality invalidates results
  regardless of statistical framework.
