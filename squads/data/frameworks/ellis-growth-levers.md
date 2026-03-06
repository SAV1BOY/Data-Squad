# Ellis Growth Levers

## Overview

The Growth Lever framework is Sean Ellis's methodology for identifying, prioritizing, and moving
the specific interventions that will have the highest impact on growth given current constraints.
While the Growth Equation diagnoses which component is weakest, Growth Levers drill into the
specific mechanisms within that component that can be moved. A growth lever is a specific, testable
intervention with a clear causal hypothesis for how it will improve a growth metric. The framework
prevents the common failure of treating all growth opportunities as equal and instead forces
rigorous prioritization based on impact, feasibility, and current context.

## Origin

Developed by **Sean Ellis** through his practical experience leading growth at multiple startups
and advisory work with growth-stage companies. The concept extends naturally from the Growth
Equation: once the weakest component is identified, the question becomes "which specific
interventions will move this component most effectively?" Ellis formalized the lever identification
and prioritization process to prevent growth teams from defaulting to familiar tactics rather than
systematically identifying the highest-impact opportunities.

## Core Model

### What Makes Something a Growth Lever

A true growth lever has five characteristics:

1. **Specificity:** It is a concrete intervention, not a vague aspiration. "Improve onboarding" is
   not a lever. "Reduce sign-up form from 8 fields to 3 fields" is a lever.
2. **Measurability:** It has a clear metric that will indicate success or failure.
3. **Causal hypothesis:** There is a stated reason why this intervention should work, connected to
   user behavior or market dynamics.
4. **Feasibility:** It can be executed with available resources within a reasonable timeframe.
5. **Impact potential:** If successful, it will meaningfully move the target growth metric.

### The Lever Identification Process

**Step 1: Anchor to the growth equation**
Start with the weakest component of Growth = Reach x Activation x Engagement x Revenue x Referral.
All lever identification should focus on this component. Resist the temptation to identify levers
for all components simultaneously.

**Step 2: Map the sub-mechanics**
Decompose the weak component into its sub-elements. For example, if Activation is the constraint:

- Traffic to sign-up page -> Sign-up page to registration -> Registration to onboarding start ->
  Onboarding start to aha moment -> Aha moment to retained user

Each transition point is a potential lever location.

**Step 3: Quantify each sub-element**
Measure the conversion rate at each transition. Identify where the largest drops occur. A 90%
drop from sign-up to aha moment is a different problem from a 90% drop from traffic to sign-up.

**Step 4: Generate lever hypotheses**
For the highest-drop transition points, brainstorm specific interventions:
- What is causing the drop? (Data, user research, session recordings)
- What could reduce the drop? (Design changes, flow simplification, messaging clarity)
- What have similar products done? (Competitive analysis)
- What do users say they need? (Surveys, interviews)

**Step 5: Score and rank levers**
Use ICE (Impact, Confidence, Ease) or a similar scoring framework to rank all identified levers.
The highest-scored lever becomes the first experiment.

### The Lever Prioritization Matrix

Levers can be mapped on two dimensions:

**Impact (vertical axis):**
- High: Affects a large portion of users or a critical metric significantly
- Medium: Meaningful improvement but limited in scope or magnitude
- Low: Marginal improvement, nice-to-have

**Effort (horizontal axis):**
- Low: Can be tested within a week, minimal engineering
- Medium: Requires a sprint of work, some design and engineering
- High: Multi-week project, significant resource commitment

**Prioritization quadrants:**
- High Impact / Low Effort: Do these first (quick wins)
- High Impact / High Effort: Plan these next (strategic bets)
- Low Impact / Low Effort: Do these when capacity allows (incremental gains)
- Low Impact / High Effort: Deprioritize or discard (resource traps)

### Compound Levers vs. One-Time Levers

**One-time levers** produce a step-function improvement:
- Redesigning the sign-up page (improves conversion rate permanently)
- Fixing a checkout bug (removes a one-time barrier)
- Adding a key integration (unlocks a new user segment)

**Compound levers** produce ongoing, accumulating returns:
- Building a referral system (each new user can bring more users)
- Creating SEO content (compounds as content ranks and earns links)
- Improving product quality (drives retention which compounds lifetime value)

Compound levers are strategically superior because their returns grow over time. Prioritize compound
levers when impact and effort are otherwise equal.

### Moving the Lever

Once a lever is prioritized, execution follows a structured process:

1. **Hypothesis documentation:** "If we [intervention], then [metric] will improve by [amount]
   because [causal mechanism]."
2. **Experiment design:** Define control and treatment, sample size, duration, and success criteria.
3. **Implementation:** Build the minimum viable version of the intervention for testing.
4. **Measurement:** Run the experiment to statistical significance.
5. **Decision:** Ship (if successful), iterate (if promising but inconclusive), or kill (if failed).
6. **Documentation:** Record results and lessons regardless of outcome.
7. **Reassessment:** After moving one lever, reassess the full set to identify the new highest-
   impact opportunity.

## Application Steps

### Step 1: Confirm the Binding Constraint
Use the growth equation to verify which component is the current bottleneck. Do not assume -- the
binding constraint may have shifted since the last assessment.

### Step 2: Map the Funnel Within the Constraint
Break down the constrained component into measurable sub-steps. Quantify each transition point to
identify where the biggest drops occur.

### Step 3: Conduct Root Cause Analysis
For the biggest drops, investigate why users are falling off. Use quantitative data (analytics,
funnel reports) and qualitative data (user interviews, session recordings, support tickets).

### Step 4: Generate 15-20 Lever Ideas
Cast a wide net during ideation. Include obvious improvements, creative experiments, and structural
changes. Quantity over quality at this stage.

### Step 5: Score and Rank
Apply ICE scoring to all ideas. Resist the temptation to skip scoring because "we already know
which one to do." Scoring forces objectivity and surfaces non-obvious opportunities.

### Step 6: Execute the Top Lever
Take the highest-scored lever through the experiment process. Give it full attention rather than
splitting focus across multiple levers simultaneously (unless the levers are truly independent and
resources allow parallel execution).

### Step 7: Iterate and Cycle
After each experiment, update the lever backlog. Rescore based on new information. Move to the
next highest-priority lever. Maintain the weekly growth meeting cadence to sustain momentum.

## Key Distinctions

- **Levers are not strategies.** A strategy is "improve activation." A lever is "add a progress
  bar to onboarding to increase completion from 35% to 50%." Levers are specific and testable.
- **The best lever depends on context.** The same product at different stages will have different
  highest-impact levers. What works at 1,000 users may not work at 100,000.
- **Not all levers require engineering.** Messaging changes, pricing experiments, process changes,
  and operational improvements are all valid growth levers.
- **Levers interact.** Improving one lever may change the effectiveness of others. After improving
  activation, the highest-impact engagement lever may change.
- **Compound levers are worth more effort.** A compound lever that requires 4x the effort but
  produces accumulating returns will outperform a one-time lever over any meaningful time horizon.

## Pitfalls

1. **Defaulting to familiar levers.** Teams repeatedly pull the levers they know (paid acquisition,
   discounting) instead of identifying the highest-impact lever for the current context.
2. **Lever identification without data.** Choosing levers based on intuition or opinion rather than
   quantitative funnel analysis and qualitative user research.
3. **Too many levers simultaneously.** Pulling multiple levers at once makes it impossible to
   attribute results. Focus on one lever at a time within each growth component.
4. **Ignoring compound levers.** One-time levers are easier to execute and measure, creating a
   bias toward them. Deliberately allocate resources to compound levers.
5. **Lever fatigue.** Teams sometimes abandon a lever prematurely because the first experiment did
   not work. A lever may require multiple experiments to find the right intervention.
6. **Confusing activity with lever movement.** Running experiments is activity. Moving the target
   metric is lever movement. If experiments are running but the metric is not moving, the lever
   hypothesis may be wrong.
7. **Not reassessing after success.** After successfully moving a lever, the binding constraint
   may shift. Continuing to focus on the same area yields diminishing returns.

## Cross-References

- **Ellis Growth Equation** -- The growth equation identifies the binding constraint; growth levers
  are the specific interventions to address that constraint.
- **Ellis High-Tempo Testing** -- High-tempo testing is the execution framework for running
  experiments on prioritized growth levers.
- **Ellis Activation and Aha Moment** -- The aha moment is often the single most impactful growth
  lever, particularly for products with strong PMF but weak activation.
- **Ellis PMF Framework** -- Before PMF, the primary "lever" is product-market fit itself. Growth
  lever analysis is most effective after PMF is established.
- **Kao Constraint-Led Strategy** -- Kao's constraint thinking aligns with the lever framework:
  identify the binding constraint and focus all effort on relieving it.
- **Kaushik DMMM** -- Growth levers can be integrated into the DMMM as the action layer beneath
  KPIs: "This KPI will improve because we are moving this specific lever."
