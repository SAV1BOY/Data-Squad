# Sunk Cost Fallacy in Experiments

## What It Is

The sunk cost fallacy is the tendency to continue investing in something because of the resources already spent, rather than evaluating future decisions based on expected future value. In experiments, this means continuing or shipping an experiment because "we already invested in building it," not because the data supports shipping it.

## How It Manifests in Experimentation

### Not Killing Losing Experiments

**Scenario:** A team spent 6 weeks building a new checkout flow. The A/B test shows no improvement (or even a slight degradation) in conversion. Instead of accepting the result, the team argues:

- "We put so much work into this. Let us give it more time."
- "The sample might not be representative. Let us extend the test."
- "Maybe we need to tweak it slightly and re-test."
- "The users just need time to adapt."

**The reality:** If the experiment was properly designed (adequate sample size, sufficient duration, pre-registered metrics), the result should be accepted. The 6 weeks of engineering effort are gone regardless of the decision. The question is only: "Does shipping this treatment create more value going forward?"

### Shipping Inconclusive Results

**Scenario:** An experiment runs for its planned duration but the primary metric is not statistically significant. The team wants to ship anyway because:

- "We already built it and it is ready."
- "It is directionally positive (even if not significant)."
- "The status quo has its own problems."

**The problem:** An inconclusive result means we do not have evidence that the treatment is better. Shipping it introduces change (migration costs, support overhead, user disruption) without demonstrated benefit.

**The correct response:** The status quo wins in a tie. If we cannot demonstrate improvement, we should not incur the costs of change.

### Iterating Endlessly on a Bad Idea

**Scenario:** The team tested Version A of a feature. It lost. They built Version B with tweaks. It was inconclusive. Now they want to build Version C.

At some point, the hypothesis itself may be wrong. More iterations on a flawed concept are sunk cost reasoning: "We have learned so much about this space, we must be close to cracking it."

**When to stop:** If two well-designed experiments fail to show improvement, seriously question the hypothesis. Invest the next experiment in a fundamentally different approach, not another iteration.

### Over-Engineering Before Testing

**Scenario:** A team spends 3 months building a polished, production-ready feature before running any experiment. When the experiment shows negative results, the sunk cost is enormous, making it psychologically almost impossible to revert.

**The fix:** Build the minimum viable version needed to test the hypothesis. If the experiment succeeds, invest in polish. If it fails, the loss is minimized.

- Prototype or hack: 1-2 weeks.
- Experiment: 2-4 weeks.
- If positive: Production-grade build: 4-8 weeks.
- If negative: Move on. Total investment: 3-6 weeks, not 3 months.

## The Psychology

### Loss Aversion

People feel losses more intensely than equivalent gains. Killing an experiment feels like losing the investment. Shipping it (even without evidence) avoids the feeling of loss, even though it may create actual future losses.

### Effort Justification

People value things they worked hard on, regardless of the objective quality. The IKEA effect: you value the bookshelf you assembled more than a better bookshelf you bought. Teams value the features they built more than the data says they should.

### Escalation of Commitment

Once a course of action is started, there is a psychological pressure to continue. Each additional investment makes it harder to stop. "We have already spent 6 weeks. Another 2 weeks of iteration will surely work." Two weeks later: "We have spent 8 weeks. One more tweak..."

### Identity and Reputation

The team's identity becomes tied to the project. Killing it feels like admitting failure. The PM who championed the feature fears reputational damage. The engineer who built it feels their work was wasted.

## Why It Matters

### Opportunity Cost

Every week spent iterating on a losing experiment is a week not spent on something that might actually work. The real cost of sunk cost thinking is not the past investment -- it is the future opportunities you miss.

### Compounding Bad Decisions

Shipping an experiment without evidence of improvement adds complexity to the codebase, introduces potential regression risks, and creates a precedent that results do not matter.

### Erosion of Experiment Culture

If the organization ships experiments regardless of results, people stop trusting the experimentation process. "Why run an experiment if we are going to ship it anyway?" The entire value of experimentation -- learning what works -- is destroyed.

## How to Avoid Sunk Cost Thinking in Experiments

### Pre-Commitment to Decision Rules

Before an experiment launches, agree on the decision rules (see `experimentation-standards.md`):

- **Ship if:** Primary metric is statistically significant in the expected direction AND guardrails hold.
- **Do not ship if:** Primary metric is not significant or is in the wrong direction.
- **Inconclusive:** Do not ship. Discuss whether a follow-up is warranted.

Write these down. Get stakeholder sign-off. When results come in, follow the rules.

### Celebrate Learning, Not Just Winning

If the only experiments celebrated are "wins," teams will avoid running risky experiments and will resist killing losing ones.

**Change the culture:**
- Celebrate well-designed experiments regardless of outcome.
- Share "What we learned from experiments that did not work" in team meetings.
- Track experiment velocity (how many experiments run) alongside win rate.
- Reward the decision to kill a losing experiment as a good decision.

### Separate Build from Ship

The decision to build something and the decision to ship it should be made at different times with different criteria:

- **Build decision:** "Is this hypothesis worth testing?" Based on expected impact, feasibility, and strategic alignment.
- **Ship decision:** "Did the experiment show evidence of improvement?" Based on data alone.

The build decision is made before the investment. The ship decision is made after, based on results. Sunk costs from the build should not influence the ship decision.

### Use Lightweight Tests

Reduce sunk costs by reducing the investment before the experiment:

| Investment Level | Method | When to Use |
|-----------------|--------|-------------|
| Minimal | Fake door test, survey, prototype | Validating demand or interest |
| Low | Feature flag with minimal UI | Testing core hypothesis |
| Medium | Functional but unpolished version | Testing user behavior |
| High | Production-ready implementation | Only after hypothesis is validated |

### Time-Box Iterations

If the first experiment fails and the team wants to iterate:

- Allow at most 2 iterations.
- Each iteration must have a specific, testable change (not just "make it better").
- If 2 iterations fail, move on to a different hypothesis.
- Set a total time budget for the initiative, not just per experiment.

### Kill Criteria

Define conditions that trigger automatic experiment termination:

- Any guardrail metric degradation beyond the threshold.
- Primary metric trending negative with sufficient sample.
- Technical issues that compromise the experiment integrity.
- External events that invalidate the test conditions.

### Regular Experiment Portfolio Review

Monthly, review all active and recent experiments:

- Which experiments should be killed?
- Which are consuming resources without clear justification?
- Is any team escalating commitment on a losing bet?
- Are we allocating experimentation resources to the highest-value hypotheses?

## Reframing Failure

The correct frame for a "failed" experiment is not "We wasted our investment." It is:

- "We learned that this approach does not work, saving us from investing further in the wrong direction."
- "We now know what does NOT move the needle for our users."
- "We avoided the cost of maintaining a feature that does not improve outcomes."

Every well-run experiment that produces a clear result -- positive or negative -- is a success. The only failure is a poorly designed experiment that produces no usable information.

## Summary

The cost of building an experiment is already spent. It cannot be recovered by shipping the result. The only relevant question is: "Based on the evidence we now have, does shipping this create more value than not shipping it?" If the answer is no, the courageous and correct decision is to not ship, learn from the result, and invest your future resources in ideas with better evidence.
