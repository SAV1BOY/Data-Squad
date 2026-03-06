# Kao Rigorous Thinking Framework

## Overview

The Rigorous Thinking Framework is a structured approach to analytical reasoning that guards against
the cognitive shortcuts, biases, and lazy thinking that produce flawed data-driven decisions. It
provides a systematic process for questioning assumptions, distinguishing correlation from causation,
and stress-testing conclusions before acting on them. The framework acknowledges that the biggest
risk in data work is not bad data but bad thinking applied to good data. Rigorous thinking is the
discipline of deliberately challenging your own conclusions at every step.

## Origin

Articulated by **Emily Kao** through her work in data strategy and analytics leadership. Kao
observed that organizations with sophisticated data infrastructure still made poor decisions because
the humans interpreting the data applied flawed reasoning. Technical skill (SQL, Python, statistics)
is necessary but not sufficient; what distinguishes effective data practitioners is the quality of
their thinking, not the quality of their tools. This framework codifies the thinking habits that
separate insightful analysis from data-decorated opinion.

## Core Model

### Pillar 1: Question Assumptions

Every analysis rests on assumptions, most of which are invisible to the analyst. Rigorous thinking
requires surfacing and testing these assumptions before accepting conclusions.

**Types of hidden assumptions:**

**Data assumptions:**
- The data is complete (it rarely is)
- The data is accurate (collection errors are endemic)
- The data definitions are consistent over time (they change)
- Missing data is random (it usually is not)

**Model assumptions:**
- The relationship is linear (it may not be)
- Past patterns will continue (they may not)
- The sample represents the population (selection bias is pervasive)
- Variables are independent (they often interact)

**Business assumptions:**
- The metric we are measuring is the right one (it may not be)
- The question we are answering is the right question (it may not be)
- The stakeholder knows what they need (they often do not)
- The timeframe of analysis is appropriate (it may be too short or too long)

**The assumption audit process:**
1. State the conclusion of your analysis
2. List every assumption required for that conclusion to be true
3. For each assumption, ask: "What evidence do I have that this is true?"
4. For each assumption, ask: "What would change if this assumption were false?"
5. Prioritize testing the assumptions whose failure would most change the conclusion

### Pillar 2: Distinguish Correlation from Causation

The correlation-causation conflation is the single most common analytical error. It is also the
most consequential because causal claims drive action, and false causal claims drive wrong action.

**The four possible explanations for observed correlation:**

1. **A causes B:** The assumed direction. User engagement causes retention.
2. **B causes A:** Reverse causation. Users who were already going to retain naturally engage more.
3. **C causes both A and B:** Confounding. A third variable (e.g., user motivation) drives both
   engagement and retention.
4. **Coincidence:** Random co-occurrence, especially common with small samples or many comparisons.

**Tools for distinguishing:**
- **Randomized experiments:** The gold standard. Randomly assign users to conditions and measure
  outcomes. If you cannot experiment, acknowledge the causal claim is unproven.
- **Natural experiments:** Find situations where an external event creates quasi-random variation.
  A platform outage, a policy change, or a natural boundary can serve as an instrument.
- **Temporal ordering:** Does A consistently precede B? This does not prove causation but
  eliminates one direction.
- **Dose-response:** Does more A lead to more B in a graded fashion? This is suggestive but not
  conclusive.
- **Mechanism:** Can you articulate a plausible mechanism for how A causes B? The absence of a
  mechanism weakens a causal claim.

### Pillar 3: Stress-Test Conclusions

Before communicating a finding, subject it to deliberate attempts to disprove it. This is the
intellectual equivalent of quality assurance.

**The stress-test checklist:**

1. **The opposite test:** What if the conclusion were exactly wrong? What evidence would you expect
   to see? Do you see any of it?
2. **The segment test:** Does the conclusion hold across all relevant segments? Or does it hold for
   one segment and not others? Averaging across segments can hide contradictions.
3. **The time test:** Does the conclusion hold across different time periods? A finding from Q4
   may not apply to Q2. Seasonality and trends can produce false conclusions.
4. **The edge case test:** What happens at the extremes? Does the conclusion hold for the top 1%
   and bottom 1%, or only for the middle of the distribution?
5. **The alternative explanation test:** Can you construct an equally plausible alternative
   explanation for the same data? If yes, the conclusion is not as strong as it appears.
6. **The sample size test:** Is the sample large enough to support the precision of the claim?
   Small samples produce dramatic findings that do not replicate.
7. **The stakeholder test:** Would someone with a different perspective (different department,
   different role) interpret this data differently? If so, why?

## Application Steps

### Step 1: Before Starting Any Analysis
Write down what you expect to find. This makes your priors explicit and helps you notice when you
are unconsciously confirming them. Pre-registration of hypotheses is the gold standard.

### Step 2: During Data Exploration
When you notice a pattern, pause before interpreting it. Ask: "What assumptions must be true for
this pattern to mean what I think it means?" List at least three alternative explanations.

### Step 3: Before Building Models
Document all modeling assumptions. For each, assess: Is this testable? Have we tested it? What
would the model produce if this assumption were violated?

### Step 4: Before Drawing Conclusions
Run through the stress-test checklist. Try to break your own finding before someone else does.
The best analysts are their own toughest critics.

### Step 5: Before Communicating
Separate what the data shows (fact), what you believe it means (interpretation), and what you
recommend (action). Present all three, making the boundaries between them explicit.

### Step 6: After Action
Track whether the predicted outcome of your recommendation actually occurred. This feedback loop
is how analytical rigor improves over time.

## Key Distinctions

- **Rigorous thinking is not slow thinking.** It does not mean analyzing everything forever. It
  means knowing which assumptions matter and checking those, not all possible assumptions.
- **Rigor does not mean certainty.** Rigorous analysis still produces uncertain conclusions. The
  difference is that rigorous analysis correctly characterizes its uncertainty rather than hiding it.
- **Data literacy is not analytical rigor.** Being able to write SQL, build dashboards, and run
  statistical tests is data literacy. Knowing when those analyses are misleading is rigor.
- **Rigor applies to qualitative analysis too.** Interviewing five users and drawing broad
  conclusions about "what users want" is the qualitative equivalent of over-fitting. Rigorous
  qualitative analysis acknowledges sample limitations and seeks disconfirming evidence.
- **The goal is better decisions, not better analysis.** Rigor that slows decisions without
  improving them is academic exercise, not practical rigor.

## Pitfalls

1. **Confirmation bias.** The tendency to find what you are looking for. Pre-registration of
   hypotheses and deliberate search for disconfirming evidence are the primary defenses.
2. **Survivorship bias.** Analyzing only the data you have while ignoring the data you are missing.
   The customers who left did not fill out the exit survey. The failed experiments are not in the
   success case study.
3. **The narrative fallacy.** Constructing a compelling story around data and then believing the
   story more than the data warrants. A good story is not evidence of a correct conclusion.
4. **Anchoring on the first finding.** The first number you see becomes the reference point. All
   subsequent analysis is interpreted relative to it, even if the anchor was arbitrary.
5. **Metric fixation.** Optimizing a metric so intensely that it ceases to measure what it was
   intended to measure (Goodhart's Law). The metric becomes the target and stops being a useful
   indicator.
6. **False precision.** Reporting results to three decimal places when the underlying data supports
   only one. Precision that exceeds accuracy is misleading.
7. **Analysis paralysis.** Using rigor as an excuse not to decide. There is a point where further
   analysis has diminishing returns. Recognize it and decide.

## Cross-References

- **Kao Spiky POV** -- Rigorous thinking produces differentiated insights that lead to spiky points
  of view. Bland analysis produces bland conclusions.
- **Kao Learning Velocity** -- Rigorous thinking accelerates learning by reducing the number of
  false conclusions that lead to wasted effort.
- **Kao Constraint-Led Strategy** -- Rigorous thinking about constraints prevents mistaking symptoms
  for root causes, ensuring constraints are correctly identified.
- **Kaushik 10/90 Rule** -- Rigorous thinking is a human skill that requires investment in people.
  Tools cannot question their own assumptions.
- **Kaushik Trinity Strategy** -- The Trinity's multi-lens approach is an application of rigorous
  thinking: requiring multiple perspectives before drawing conclusions.
- **Ellis Activation and Aha Moment** -- The distinction between correlation and causation is
  critical when identifying aha moments. A correlated behavior is not necessarily a causal driver.
