# Workshop Kit: Experimentation Culture Building

## Workshop Overview

**Duration:** 4 hours (recommended as two 2-hour sessions, one week apart)
**Audience:** Product managers, engineers, designers, and analysts who will design and interpret experiments
**Group size:** 10-25 participants
**Prerequisite:** Basic understanding of metrics (or completion of the Data Literacy workshop)
**Goal:** Participants leave able to design a valid experiment, interpret results correctly, avoid common pitfalls, and advocate for experimentation in their teams

## Session 1: Foundations of Experimentation (2 hours)

### Module 1: Why Experiment? (30 minutes)

**Opening scenario (10 min):**
Present a real product debate from your organization (or a well-known case) where two intelligent people disagreed about what to build. Show how intuition, user research, and data analysis all pointed in different directions. Introduce experimentation as the tiebreaker.

**The cost of not experimenting (10 min):**
Walk through three categories of cost:
1. **Shipping bad changes**: Without experiments, you discover failures through declining business metrics weeks or months later
2. **Killing good ideas prematurely**: Ideas that look bad on paper sometimes work in practice. Without experiments, promising ideas die in committee.
3. **Decision debt**: Every opinion-based decision creates uncertainty about whether it was right. This uncertainty compounds.

**Discussion (10 min):** Ask participants: "Think of a recent decision in your team that was made without experimentation. What would have been different if you had tested it?" Share examples.

### Module 2: Experiment Design Fundamentals (45 minutes)

**The experiment canvas (20 min):**

Introduce a one-page experiment design template:

| Element | Description | Example |
|---|---|---|
| Hypothesis | What we believe and why | "Simplifying the signup form will increase completion rate because the current form has a 60% abandonment rate at step 3" |
| Primary metric | The one number we will use to decide | Signup form completion rate |
| Secondary metrics | Additional metrics we hope improve | Time to complete, downstream activation |
| Guardrail metrics | Metrics that must not degrade | Data quality of collected information, fraud rate |
| Minimum detectable effect | Smallest improvement worth detecting | 5% relative improvement (from 40% to 42%) |
| Sample size needed | Users per variant | 8,500 per variant (based on power analysis) |
| Runtime | How long the experiment will run | 14 days (to reach sample size and cover 2 full weeks) |
| Decision criteria | What we will do based on results | Ship if primary metric is significantly positive and guardrails are flat |

**Power analysis demystified (15 min):**
Explain power analysis without formulas using an analogy: "Power analysis is like asking 'how many people do I need to survey to hear a whisper in a noisy room?' The quieter the whisper (smaller effect), the more people you need. The louder the room (higher variance), the more people you need."

Walk through a practical example using an online power calculator. Show how changing the expected effect size changes the required sample size. Key takeaway: if you cannot reach the required sample size in a reasonable time, you need a different approach (proxy metrics, variance reduction, or a qualitative method).

**Exercise (10 min):** Give participants a product change their team is considering. Have them fill out the experiment canvas. Review 2-3 as a group.

### Module 3: The Peeking Problem and When to Stop (45 minutes)

**Interactive demonstration (15 min):**
Run a live simulation (using a spreadsheet or simple script) showing what happens when you peek at experiment results daily. Generate random data (no real treatment effect) and check for significance each day. Show that approximately 30% of the time, you will see "significance" at some point during the experiment even though there is no real effect.

Then show what happens when you wait until the planned end date: the false positive rate is the expected 5%.

This demonstration is typically the most impactful moment in the workshop -- participants viscerally understand why peeking is dangerous.

**Sequential testing overview (15 min):**
Introduce the concept that methods exist for continuous monitoring that maintain valid error rates. Explain at a conceptual level (without math) how sequential testing "spends" the error budget over time, requiring stronger evidence for early stopping.

Key message: "You can monitor experiments safely, but you need to use the right tools. Standard p-values with repeated checking are not the right tools."

**Exercise (15 min):** Present 3 experiment scenarios with results at different time points. Ask participants to decide: stop and ship, stop and kill, or keep running? Discuss the reasoning and introduce decision criteria for each scenario.

## Session 2: Advanced Topics and Practice (2 hours)

### Module 4: Interpreting Results (45 minutes)

**The five experiment outcomes (20 min):**

Walk through each outcome with a real or realistic example:

1. **Clear win**: Primary metric significantly positive, guardrails stable. Action: ship.
2. **Clear loss**: Primary metric significantly negative. Action: kill the treatment, investigate why the hypothesis was wrong.
3. **Inconclusive**: No significant effect detected. Action: check if the experiment was adequately powered. If yes, the effect is likely smaller than your MDE -- decide if it is worth a larger test or if you should move on.
4. **Mixed signals**: Primary metric positive, but a guardrail metric degraded. Action: investigate the tradeoff, quantify both effects, escalate to leadership if the tradeoff is significant.
5. **Surprise**: The effect is the opposite of expected, or an unexpected metric moved dramatically. Action: investigate deeply -- surprises are the most valuable experiments because they reveal flawed assumptions.

**The confidence interval exercise (15 min):**
Present experiment results as confidence intervals rather than p-values. Example: "The treatment effect on conversion rate is +1.2% with a 95% CI of [-0.3%, +2.7%]." Ask participants:
- Is this a win? (Not by conventional significance, but the CI is mostly positive)
- What is the worst plausible outcome? (-0.3%, nearly no downside)
- What is the best plausible outcome? (+2.7%, substantial upside)
- What would you decide?

This exercise teaches participants to think about effect sizes and uncertainty rather than binary significance.

**Discussion (10 min):** How should your team handle each of the five outcomes? Draft a team decision framework.

### Module 5: Common Pitfalls Workshop (30 minutes)

**Pitfall identification exercise (30 min):**
Present 5 experiment case studies (realistic scenarios based on common mistakes). For each, ask participants to identify what went wrong and how to fix it.

**Case 1:** An experiment on email subject lines tested 20 variants. Two showed significant improvement. The team shipped both.
*Pitfall: Multiple testing without correction.*

**Case 2:** A marketplace experiment randomized individual buyers. The treatment improved buyer conversion but reduced seller earnings because treatment-group buyers consumed limited inventory.
*Pitfall: Interference/spillover effects.*

**Case 3:** A new feature was tested for 5 days. It showed a 15% improvement in engagement. After shipping, engagement returned to baseline within 3 weeks.
*Pitfall: Novelty effect with insufficient runtime.*

**Case 4:** An experiment targeting enterprise customers (50 per variant) showed a 25% improvement with p = 0.04. The team shipped with high confidence.
*Pitfall: Small sample + large effect = likely false positive or inflated effect.*

**Case 5:** A pricing experiment showed no significant effect on conversion. The team concluded "pricing does not matter." The experiment had 500 users per variant and a minimum detectable effect of 30% relative change.
*Pitfall: Underpowered test interpreted as evidence of no effect.*

### Module 6: Building Experimentation into Your Workflow (45 minutes)

**The experimentation ladder (15 min):**
Not every decision needs an A/B test. Introduce a decision framework:

| Decision Type | Method | When to Use |
|---|---|---|
| Reversible, low impact | Just ship it and monitor | Button color, copy changes |
| Reversible, moderate impact | A/B test | Feature changes, flow changes |
| Reversible, high impact | A/B test with holdout | Major redesigns, algorithm changes |
| Irreversible | Research + careful launch | Pricing changes, brand changes |

**Team experimentation rhythm (15 min):**
Design a team-specific experimentation cadence:
- How many experiments should you aim to run per quarter?
- Who can launch experiments? What approval is needed?
- When and how are results reviewed?
- Where are learnings documented?

**Action planning (15 min):**
Each participant identifies:
1. One decision in the next month they will experiment on (instead of deciding by opinion)
2. One experiment their team previously ran that they now recognize had a methodological issue
3. One change to their team's process that would improve experimentation quality

## Post-Workshop Resources

### Experiment Review Checklist
- [ ] Hypothesis is written and pre-registered
- [ ] Primary metric is defined and agreed upon
- [ ] Power analysis is complete and sample size is achievable
- [ ] Guardrail metrics are identified
- [ ] Decision criteria are documented for all five outcome types
- [ ] Runtime accounts for at least one full business cycle
- [ ] Potential contamination pathways have been assessed
- [ ] Results will not be checked before the planned analysis date (or sequential testing is in place)

### Recommended Next Steps
- Run a "practice experiment" in the next 2 weeks using the experiment canvas
- Schedule a 30-minute experiment review session for results interpretation
- Identify your team's top 3 "we should test that" ideas and prioritize with ICE scoring
- Set up a shared experiment log (even a simple spreadsheet) to track all experiments and learnings

## Measuring Workshop Impact

**Immediate:** Post-workshop survey on confidence in designing and interpreting experiments
**30-day:** Number of experiments launched using the canvas framework
**90-day:** Experiment quality score (% of experiments with pre-registered hypotheses, power analyses, and documented results)
**6-month:** Ratio of data-backed decisions to opinion-backed decisions in product reviews
