# Ellis Growth Framework: Actionable Summary for Practitioners

## Core Idea

Sean Ellis, who coined the term "growth hacking," developed a framework for systematic, experiment-driven growth that moves beyond intuition and one-off tactics. His core argument is that growth is not magic -- it is a repeatable process of identifying the highest-leverage growth levers, generating hypotheses, running rapid experiments, and compounding learnings over time. The framework is designed for product-led companies but applies broadly to any organization seeking to accelerate growth through data and experimentation.

## The Framework

### Foundation: Product-Market Fit First

Ellis's most important principle is that growth efforts are wasted without product-market fit. His litmus test: survey existing users and ask, "How would you feel if you could no longer use this product?" If fewer than 40% answer "very disappointed," you do not have product-market fit, and no amount of growth work will compensate.

**How to apply it:**
- Run the Sean Ellis Survey (also called the PMF survey) with at least 30-50 active users
- Ask: "How would you feel if you could no longer use [product]?" with options: Very disappointed, Somewhat disappointed, Not disappointed
- If less than 40% say "very disappointed," focus on product improvement before growth
- Segment responses by user type -- you may have PMF with one segment but not another
- Re-run quarterly to track PMF as the product and user base evolve

### Step 1: Define Your North Star Metric

The North Star Metric (NSM) is the single metric that best captures the core value your product delivers to customers. It is not a revenue metric -- it is a value-delivery metric that, when improved, reliably drives revenue as a consequence.

**How to choose it:**
- Ask: "What action represents a customer getting value from our product?"
- It should correlate with retention and revenue but measure value, not money
- It should be influenceable by multiple teams
- It should be measurable on a weekly or daily basis

**Examples:**
| Company Type | North Star Metric |
|---|---|
| SaaS collaboration tool | Weekly active teams sending messages |
| E-commerce | Weekly purchases by repeat customers |
| Content platform | Weekly reading time by returning users |
| Marketplace | Weekly completed transactions |

### Step 2: Map the Growth Model

Ellis advocates mapping the full growth equation -- the set of input metrics that mathematically drive the North Star Metric. This makes the growth model explicit and identifies which levers are underperforming.

**How to build it:**
- Decompose the NSM into its component parts using the pirate metrics framework (AARRR):
  - **Acquisition**: How do users find you?
  - **Activation**: Do they have a great first experience?
  - **Retention**: Do they come back?
  - **Revenue**: Do they pay?
  - **Referral**: Do they tell others?
- For each stage, identify 2-3 measurable metrics
- Model the mathematical relationship: NSM = f(Acquisition x Activation x Retention x ...)
- Identify the weakest stage -- this is your highest-leverage growth opportunity

**Example growth model:**
```
North Star: Weekly Active Paying Users
= New Signups x Activation Rate x Week-1 Retention x Paid Conversion
= 10,000 x 35% x 40% x 15% = 210

Weakest link: Activation Rate at 35% (benchmark: 50-60%)
Highest leverage: Improving activation from 35% to 50% would increase NSM by 43%
```

### Step 3: Generate and Prioritize Hypotheses (ICE Framework)

Growth teams generate large volumes of experiment ideas and need a systematic way to prioritize them. Ellis uses the ICE framework:

- **Impact**: If this works, how big is the potential impact? (1-10)
- **Confidence**: How confident are we that this will work, based on data, research, or similar experiments? (1-10)
- **Ease**: How easy is this to implement and test? (1-10)

ICE Score = Impact x Confidence x Ease

**How to apply it:**
- Maintain an experiment backlog with ICE scores for all ideas
- Run the highest-scoring experiments first
- Review and re-score monthly as you learn more
- Beware of only running "easy" experiments -- periodically invest in high-impact, high-effort bets

### Step 4: Run Rapid Experiments

Ellis advocates for a high-tempo experimentation cadence: 2-3 experiments per week for a dedicated growth team. Speed of learning compounds -- the team that runs 100 experiments per quarter learns faster than one that runs 10.

**Experiment process:**
1. **Hypothesis**: "We believe [change] will improve [metric] because [reason]"
2. **Design**: Define treatment, control, primary metric, sample size, and runtime
3. **Build**: Implement the minimum viable test (not the full feature)
4. **Measure**: Run for the planned duration, no peeking
5. **Learn**: Document the result, the insight, and the next hypothesis it generates

**Key principles:**
- Minimum viable tests: test the concept before building the full solution
- One variable at a time where possible
- Document learnings even (especially) from failed experiments
- Share results broadly -- growth insights benefit the whole organization

### Step 5: Build a Growth Machine (Process, Not Tactics)

Ellis emphasizes that sustainable growth comes from the process of experimentation, not from any individual tactic. The growth machine is the organizational capability to continuously generate, test, and learn from growth hypotheses.

**Components of the growth machine:**
- **Weekly growth meeting**: Review last week's experiment results, prioritize this week's experiments, share learnings
- **Experiment tracker**: Central repository of all experiments (past and planned) with hypotheses, results, and learnings
- **Cross-functional team**: Growth requires engineering, design, data, and marketing working together with shared goals
- **Learning repository**: Accumulated insights that prevent repeating failed experiments and compound successful patterns

## The Growth Equation in Practice

### Diagnosing Growth Problems

When growth stalls, use the growth model to diagnose where the bottleneck is:

| Symptom | Likely Bottleneck | Focus Area |
|---|---|---|
| Plenty of signups, low engagement | Activation | Improve onboarding, time-to-value |
| Good initial engagement, declining over time | Retention | Identify and fix churn triggers |
| High retention, flat revenue | Monetization | Optimize pricing, upsell paths |
| Flat signups, strong retention | Acquisition | Invest in channels, referral loops |
| Declining across all stages | Product-market fit | Revisit PMF survey, talk to churned users |

### Growth Loops vs. Funnels

Ellis's later work emphasizes growth loops over funnels. A funnel is linear (acquire -> activate -> retain). A loop is circular (user gains value -> user shares/creates content -> new user discovers product -> new user gains value). Loops compound; funnels leak.

**Common growth loops:**
- **Viral loop**: User invites others (Dropbox referral program)
- **Content loop**: User creates content that attracts new users through search (Stack Overflow)
- **Paid loop**: Revenue funds acquisition spend that drives more revenue (performance marketing)
- **Sales loop**: Happy customers become references that help close new deals (B2B SaaS)

## Key Takeaways for Practitioners

1. **Validate PMF before investing in growth.** Run the Ellis survey. If you are below 40% "very disappointed," improve the product first.
2. **Define a North Star Metric that captures value delivery.** Revenue is an output; your NSM should measure the input of value that drives revenue.
3. **Map your growth model explicitly.** Decompose your NSM into its component metrics and identify the weakest link.
4. **Prioritize experiments with ICE.** Score every idea, run the highest-leverage experiments first, and maintain a living backlog.
5. **Optimize for learning velocity.** The number of experiments per quarter is itself a key metric. Faster learning compounds into faster growth.
6. **Document everything.** An experiment repository is the growth team's most valuable asset. Failed experiments teach as much as successful ones.
7. **Look for loops, not just funnels.** Identify how your product can create self-reinforcing growth cycles where each new user contributes to acquiring the next.
