# Ellis High-Tempo Testing

## Overview

High-Tempo Testing is Sean Ellis's operational framework for accelerating growth through rapid
experimentation. The core premise is that the velocity of experimentation -- not the brilliance of
any single experiment -- is the primary competitive advantage in growth. Organizations running 2-3
experiments per week will learn faster and compound their advantages faster than those running 2-3
per month. The framework provides the process, culture, and tooling requirements to sustain a high
experiment velocity without sacrificing rigor.

## Origin

Developed by **Sean Ellis** through his experience as the first growth lead at Dropbox, LogMeIn,
and Eventbrite, and formalized in *Hacking Growth* (2017). Ellis observed that the highest-
performing growth teams shared a common trait: they ran more experiments than their competitors.
Not better experiments, not smarter experiments -- more experiments. This insight led to the
systematic codification of how to increase testing velocity as an organizational capability.

## Core Model

### The Tempo Principle

Growth is a function of the number of experiments run, the percentage that succeed, and the
magnitude of successful experiments:

**Growth = Experiment Velocity x Win Rate x Average Win Magnitude**

Of these three, Experiment Velocity is the only one directly controllable. Win rate and magnitude
are emergent properties of running many experiments and learning. Increasing velocity also indirectly
improves win rate over time because the team learns faster what works.

### Target Velocity

**Minimum viable tempo:** 1 experiment per week
**Competitive tempo:** 2-3 experiments per week
**Elite tempo:** 5+ experiments per week (large teams)

A team running 3 experiments per week conducts 150+ experiments per year. At a 20% win rate, that
is 30 wins. A team running 3 per month conducts 36 per year, yielding 7 wins. The difference
compounds over quarters and years.

### The Experiment Pipeline

High tempo requires a full pipeline of experiments at every stage:

**Backlog (50+ ideas):**
Ideas collected from all sources -- user feedback, data analysis, competitive observation, team
brainstorming, customer support patterns. Quantity matters more than quality at this stage.

**Prioritized queue (10-15 experiments):**
Ideas scored and ranked using ICE (Impact, Confidence, Ease) or similar framework. The top of the
queue should always have experiments ready to launch.

**In-progress (2-5 experiments):**
Currently running experiments with defined hypotheses, success metrics, and end conditions.

**Analysis (1-3 experiments):**
Recently completed experiments awaiting results analysis and documentation.

**Archive (all completed):**
Documented results of all experiments, both wins and losses, creating an institutional knowledge
base.

### The ICE Scoring Framework

Each experiment idea is scored on three dimensions (1-10 scale):

**Impact:** If this experiment succeeds, how much will it move the target metric? Score based on
estimated percentage improvement and the volume of users affected.

**Confidence:** How confident are you that this experiment will succeed? Score based on supporting
data, analogous results, and theoretical foundation. Low confidence is acceptable -- it does not
disqualify an experiment but affects prioritization.

**Ease:** How quickly and cheaply can this experiment be implemented? Score based on engineering
effort, design requirements, and dependencies.

**ICE Score = Impact x Confidence x Ease** (or average, depending on preference)

Experiments with high ICE scores are prioritized first. This prevents the common failure of always
running easy low-impact experiments or always running hard high-impact experiments.

### The Weekly Growth Meeting

The cadence that sustains high tempo:

**Duration:** 60 minutes, weekly, never skipped.

**Agenda:**
1. Metrics review (15 min): Key growth metrics and any notable changes.
2. Completed experiment review (15 min): Results from experiments that finished this week. What was
   learned? What is the decision (ship, iterate, or kill)?
3. Launching this week (15 min): Which experiments are going live? Confirm hypotheses, metrics, and
   success criteria are defined.
4. Pipeline review (15 min): Score new ideas. Reprioritize the queue based on new data.

**Attendees:** Growth lead, product manager, engineering representative, designer, data analyst.
All functions needed to execute experiments must be represented.

## Application Steps

### Step 1: Build the Backlog
Before attempting high tempo, accumulate at least 30 experiment ideas. Sources include: user
research, analytics findings, competitor analysis, support ticket themes, sales feedback, and
brainstorming sessions. Volume over quality at this stage.

### Step 2: Score and Prioritize
Apply ICE scoring to the entire backlog. Rank by score. This first prioritization reveals which
experiments are high-value and easy versus those that require more investment.

### Step 3: Define Experiment Standards
Establish minimum requirements for every experiment:
- Written hypothesis: "If we [change], then [metric] will [improve] because [reason]."
- Primary metric with success threshold
- Sample size and duration calculation
- Guardrail metrics (metrics that must not degrade)

### Step 4: Start at Achievable Tempo
If the team is running zero experiments per week, targeting 3 will fail. Start at 1 per week.
Master the process. Then increase to 2. Sustainable tempo is built incrementally.

### Step 5: Establish the Weekly Meeting
The weekly growth meeting is the heartbeat of high-tempo testing. It creates accountability,
ensures experiments are reviewed, and keeps the pipeline flowing. Consistency matters more than
perfection.

### Step 6: Instrument for Speed
Identify and eliminate bottlenecks in the experiment lifecycle:
- Slow engineering implementation: invest in experiment infrastructure (feature flags, A/B testing
  platforms, no-code experiment tools)
- Slow analysis: build automated result dashboards, standardize statistical methods
- Slow decision-making: define decision criteria upfront (what constitutes a win?)

### Step 7: Build the Learning Archive
Every experiment, win or lose, is documented with hypothesis, setup, results, and lessons learned.
This archive prevents repeating failed experiments and enables cumulative learning.

### Step 8: Scale Tempo Gradually
Once the team sustains 1/week comfortably, increase to 2. Then 3. Tempo should increase as
infrastructure and process mature, not before.

## Key Distinctions

- **Velocity is the strategy.** High-tempo testing is not about running random experiments faster.
  It is about systematically increasing the organization's learning rate.
- **Most experiments fail, and that is fine.** A 20-30% win rate is healthy. If your win rate is
  80%+, you are running experiments that are too safe and not learning enough.
- **Small wins compound.** A 2% improvement per experiment, compounded across 30 wins per year,
  produces significant growth. Do not dismiss small wins.
- **Process enables creativity.** The structured process (backlog, scoring, meeting, archive) is
  not bureaucracy -- it is the scaffolding that allows creative experimentation at scale.
- **Testing is not just A/B testing.** Experiments can include pricing tests, messaging tests,
  feature experiments, channel experiments, and operational changes. The framework applies to
  any testable hypothesis.

## Pitfalls

1. **Running experiments without hypotheses.** "Let's see what happens" is not an experiment. Every
   test needs a hypothesis with a predicted outcome and a rationale.
2. **Stopping experiments early.** The temptation to call a winner before reaching statistical
   significance is strong. Pre-commit to minimum duration and sample size.
3. **Only testing easy things.** If all experiments are button color changes, you are missing
   structural improvements. Balance quick tests with bigger bets.
4. **No learning archive.** Without documentation, the same failed experiments get re-proposed
   every quarter. The archive is institutional memory.
5. **Tempo without focus.** Running many experiments across all growth equation components
   simultaneously dilutes learning. Focus experiments on the current weakest link.
6. **Engineering bottleneck.** If every experiment requires a sprint of engineering work, tempo
   will be throttled. Invest in no-code tools, feature flags, and reusable experiment templates.
7. **Celebrating only wins.** If only successful experiments are valued, teams will avoid
   ambitious experiments. Celebrate learning, not just results.
8. **Skipping guardrail metrics.** An experiment that improves the primary metric but degrades
   another critical metric is not a win. Always define and monitor guardrails.

## Cross-References

- **Ellis Growth Equation** -- The growth equation identifies the weakest component; high-tempo
  testing is the methodology for improving it through rapid experimentation.
- **Ellis PMF Framework** -- High-tempo testing is most effective after PMF is established. Before
  PMF, experimentation should focus on product-market fit, not growth optimization.
- **Ellis Activation and Aha Moment** -- Experiments to discover and optimize the aha moment are
  among the highest-impact experiments in the high-tempo pipeline.
- **Ellis Growth Levers** -- Growth levers provide the strategic direction; high-tempo testing
  provides the execution methodology for moving each lever.
- **Kaushik 10/90 Rule** -- High-tempo testing requires skilled experimenters (the 90%), not just
  testing tools (the 10%).
- **Kao Learning Velocity** -- High-tempo testing is an operationalization of Kao's learning velocity
  principle: faster learning compounds into larger advantages.
