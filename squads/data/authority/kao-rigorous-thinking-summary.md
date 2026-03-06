# Kao's Rigorous Thinking for Data Analysis: Actionable Summary

## Core Idea

Emily Kao's framework for rigorous analytical thinking addresses a pervasive problem: most data analysis is technically competent but logically sloppy. Analysts can query databases, build visualizations, and calculate statistics, but they often fail to think rigorously about what their data can and cannot tell them. Kao's work provides a structured approach to analytical reasoning that prevents the most common logical errors in data work: confusing correlation with causation, ignoring selection bias, drawing conclusions from insufficient evidence, and failing to consider alternative explanations.

## The Rigorous Thinking Framework

### Principle 1: Start with the Question, Not the Data

The most common analytical failure is beginning with data exploration ("let me look at the data and see what I find") rather than a specific question ("does X cause Y, and by how much?"). Undirected exploration produces patterns that feel meaningful but are often artifacts of noise, cherry-picking, or confirmation bias.

**How to apply it:**
- Before opening any tool, write down the specific question you are trying to answer
- Distinguish between descriptive questions ("what happened?"), diagnostic questions ("why did it happen?"), predictive questions ("what will happen?"), and causal questions ("what would happen if we did X?")
- Each type of question requires different methods. A causal question cannot be answered with a descriptive method.
- Force yourself to write the question in a single sentence. If you cannot, your question is not clear enough.

### Principle 2: Define the Counterfactual

Rigorous analysis requires thinking about what would have happened in the absence of the thing you are studying. This is the counterfactual -- the scenario you are comparing against.

**How to apply it:**
- For every "X caused Y" claim, ask: "Compared to what?" The counterfactual must be explicit.
- Example: "Our email campaign generated $500K in revenue" -- compared to what? Compared to not sending the email? Compared to sending a different email? Compared to expected revenue without the campaign?
- In experiments, the control group is the counterfactual. In observational analysis, you must construct or argue for a credible counterfactual.
- The quality of your analysis is determined by the quality of your counterfactual. A perfect analysis with a bad counterfactual produces misleading results.

### Principle 3: Identify and Name Your Assumptions

Every analysis rests on assumptions. Rigorous analysts make their assumptions explicit so they can be questioned, tested, and communicated.

**Common assumptions to surface:**
- **Stability assumption**: "The relationship we observed in the past will continue in the future"
- **Independence assumption**: "The treatment of one user does not affect the outcomes of other users"
- **Representativeness assumption**: "Our sample is representative of the population we care about"
- **Completeness assumption**: "We have captured all the relevant factors"
- **Linearity assumption**: "The effect is proportional across the range of the variable"

**How to apply it:**
- Before presenting any analysis, list 3-5 key assumptions it relies on
- For each assumption, assess: How confident are we this holds? What would change if it does not?
- Present assumptions alongside conclusions. This is not weakness -- it is intellectual honesty that builds trust.

### Principle 4: Seek Disconfirming Evidence

Confirmation bias is the strongest and most insidious cognitive bias in analytical work. Once you have a hypothesis, your brain automatically finds evidence that supports it and filters out evidence that contradicts it.

**How to apply it:**
- After reaching a preliminary conclusion, spend deliberate time trying to disprove it
- Ask: "What data would convince me I am wrong? Have I looked for it?"
- Use pre-mortems: "Imagine it is 6 months from now and this conclusion turned out to be wrong. What went wrong?"
- Seek a "red team" -- a colleague whose job is to poke holes in your analysis before it reaches stakeholders
- Look at the same data through different lenses: different time periods, different segments, different metrics

### Principle 5: Distinguish Between Correlation, Causation, and Coincidence

The correlation-causation distinction is well-known but poorly practiced. Kao adds a third category -- coincidence -- that is equally important.

**The three categories:**
- **Coincidence**: Two things moved together by chance. With enough metrics, some will co-move randomly. Multiple comparison correction addresses this.
- **Correlation**: Two things are genuinely associated, but the relationship may be driven by a third factor (confounding), reverse causation, or shared cause.
- **Causation**: Changing X directly changes Y. Establishing causation requires either a randomized experiment or a credible quasi-experimental design.

**How to apply it:**
- Default to "correlation" when presenting observational findings. Use causal language only when supported by experimental or quasi-experimental evidence.
- For every observed correlation, brainstorm at least 3 alternative explanations (confounders, reverse causation, selection effects)
- Use directed acyclic graphs (DAGs) to visualize your causal assumptions and identify what you need to control for

### Principle 6: Quantify Uncertainty

A point estimate without a measure of uncertainty is dangerously incomplete. "Revenue will grow 15%" is less useful and more misleading than "Revenue will grow between 8% and 22%, with our best estimate at 15%."

**How to apply it:**
- Always report confidence intervals or credible intervals alongside point estimates
- For forecasts, provide best-case, expected-case, and worst-case scenarios with associated probabilities
- When uncertainty is high, say so. Stakeholders respect honesty more than false precision.
- Use sensitivity analysis: "If assumption X is wrong, the estimate changes from Y to Z"

## Applying Rigorous Thinking to Common Analytical Tasks

### Interpreting a metric change
1. Is the change real or within normal variation? (Check against historical volatility)
2. Is the change in the data or in the real world? (Rule out data quality issues, tracking changes, definitional changes)
3. What is the likely cause? (List multiple hypotheses, not just the most obvious one)
4. Can we verify the cause? (Check if the causal mechanism is consistent with additional evidence)

### Evaluating a recommendation
1. What evidence supports this recommendation? (Data, experiments, expert judgment, or intuition?)
2. What assumptions does it rest on? (Are they reasonable? Have they been tested?)
3. What are the alternatives? (Has the analysis considered more than two options?)
4. What is the downside risk? (What happens if the recommendation is wrong?)

### Reviewing someone else's analysis
1. What question was the analysis designed to answer?
2. Does the method match the question type? (Descriptive method for a causal question = red flag)
3. What is the implicit counterfactual?
4. What assumptions are unstated?
5. Has disconfirming evidence been considered?

## Common Analytical Fallacies

| Fallacy | Description | How to Avoid |
|---|---|---|
| Post hoc ergo propter hoc | "X happened before Y, so X caused Y" | Demand causal mechanism, not just temporal sequence |
| Survivorship bias | Analyzing only successes, ignoring failures | Ask: "Who is missing from this dataset?" |
| Simpson's paradox | A trend present in segments reverses when combined | Always segment before drawing conclusions |
| Base rate neglect | Ignoring the prior probability of an event | Include base rates in all probability assessments |
| Anchoring | Over-relying on the first number encountered | Generate estimates independently before seeing data |
| Texas sharpshooter | Drawing the target after seeing where the bullets hit | Pre-register hypotheses; separate exploration from confirmation |

## Key Takeaways for Practitioners

1. **Write the question before opening the data.** This single habit prevents more analytical errors than any statistical technique.
2. **Name the counterfactual explicitly.** Every comparison requires a "compared to what?" and the quality of that comparison determines the quality of the analysis.
3. **List your assumptions out loud.** Hidden assumptions are the most dangerous kind. Making them explicit enables scrutiny and builds trust.
4. **Actively seek evidence that you are wrong.** Spend at least 20% of your analysis time trying to disprove your conclusion.
5. **Default to correlation language.** Use "is associated with" rather than "causes" unless you have experimental evidence.
6. **Report uncertainty ranges, not just point estimates.** Communicate what you know and what you do not know with equal rigor.
