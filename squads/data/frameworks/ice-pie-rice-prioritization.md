# ICE / PIE / RICE Prioritization Frameworks

> Sources: Sean Ellis (ICE), Chris Goward (PIE), Intercom (RICE)

---

## Overview

ICE, PIE, and RICE are lightweight scoring frameworks for prioritizing experiment and
initiative backlogs. They convert subjective assessments into comparable numerical
scores, enabling teams to make faster, more transparent prioritization decisions. Each
framework emphasizes slightly different dimensions, making them suited to different
contexts.

---

## When to Use

- When the experiment backlog has more ideas than capacity to run them.
- When stakeholders disagree on what to test next and need a structured tiebreaker.
- When you want to replace gut-feel prioritization with a repeatable process.
- When onboarding new team members who need to understand the prioritization rationale.

---

## Core Concept

### ICE (Impact / Confidence / Ease)

| Dimension    | Definition                                               | Scale |
|--------------|----------------------------------------------------------|-------|
| **Impact**   | How much will this move the target metric?               | 1-10  |
| **Confidence**| How sure are we about the Impact and Ease estimates?    | 1-10  |
| **Ease**     | How easy is this to implement (inverse of effort)?       | 1-10  |

**ICE Score = Impact x Confidence x Ease**

Best for: Fast, informal prioritization in small teams. Good when speed of scoring
matters more than precision.

### PIE (Potential / Importance / Ease)

| Dimension     | Definition                                              | Scale |
|---------------|---------------------------------------------------------|-------|
| **Potential** | How much room for improvement exists?                   | 1-10  |
| **Importance**| How valuable is the traffic/users on this page/feature? | 1-10  |
| **Ease**      | How easy is the test to implement?                      | 1-10  |

**PIE Score = (Potential + Importance + Ease) / 3**

Best for: CRO (Conversion Rate Optimization) teams prioritizing page-level tests.
Potential explicitly accounts for current performance gaps.

### RICE (Reach / Impact / Confidence / Effort)

| Dimension     | Definition                                              | Unit          |
|---------------|---------------------------------------------------------|---------------|
| **Reach**     | How many users/events will this affect per time period? | Number        |
| **Impact**    | How much will each affected user be impacted?           | 0.25/0.5/1/2/3|
| **Confidence**| How confident are we in the estimates?                  | % (50-100%)   |
| **Effort**    | How many person-weeks/months to implement?              | Person-months |

**RICE Score = (Reach x Impact x Confidence) / Effort**

Best for: Product teams with cross-functional backlogs where Reach and Effort vary
widely across items. The explicit Effort denominator penalizes large projects.

---

## Steps / Process

### Step 1: Choose the Framework
- Small team, rapid iteration, experiments only -> ICE.
- CRO / page-level optimization -> PIE.
- Cross-functional product backlog with varied scope -> RICE.

### Step 2: Define the Target Metric
- What metric are you trying to move? All scoring should reference this metric.
- Align with the KPI tree or North Star Metric.

### Step 3: Calibrate the Scale
- Before scoring, align the team on what "1" and "10" mean for each dimension.
- Use reference examples: "A 10-Impact idea would move our conversion rate by 5pp.
  A 1-Impact idea would move it by 0.1pp."
- For RICE, define the Impact scale explicitly (3 = massive, 2 = high, 1 = medium,
  0.5 = low, 0.25 = minimal).

### Step 4: Score Independently
- Each team member scores ideas independently before discussion.
- This prevents anchoring bias.

### Step 5: Discuss and Converge
- Review items where scores diverge by more than 2 points on any dimension.
- Discussion often reveals hidden assumptions or information.

### Step 6: Rank and Plan
- Sort by composite score, highest first.
- The score is a *starting point* for the conversation, not the final word.
  Strategic considerations may override the score.

### Step 7: Review After Execution
- After experiments complete, compare predicted Impact/Reach to actuals.
- Use this to recalibrate future scoring.

---

## Inputs / Outputs

### Inputs
| Input                          | Source                          |
|--------------------------------|---------------------------------|
| Experiment/initiative backlog  | Growth / product team           |
| Target metric and baseline     | Analytics                       |
| Historical experiment results  | Experiment repository           |
| Effort estimates               | Engineering team                |

### Outputs
| Output                         | Consumer                        |
|--------------------------------|---------------------------------|
| Prioritized backlog            | Growth / product team           |
| Score rationale documentation  | Stakeholders, future reviewers  |
| Calibration reference examples | Team onboarding                 |

---

## Pitfalls

1. **Scoring without calibration.** If the team has not agreed on what the scale means,
   scores are meaningless. Calibrate first.

2. **Treating scores as absolute truth.** Scores are conversation starters, not
   oracles. A low-scoring strategic initiative may still be the right priority.

3. **Confidence inflation.** Teams tend to overestimate confidence. Require evidence
   for confidence scores above 7 (ICE) or 80% (RICE).

4. **Ignoring the Ease/Effort dimension.** Teams that only look at Impact end up with
   a backlog of expensive projects. Ease/Effort keeps ideas practical.

5. **Not updating scores.** As new data comes in (e.g., a similar experiment at another
   company), scores should be revised.

6. **Using one framework for everything.** ICE is wrong for a large product backlog;
   RICE is overkill for a quick CRO sprint. Match the framework to the context.

7. **No retrospective calibration.** Without comparing predicted vs. actual impact,
   the team never improves at estimation.

---

## Cross-References

- [Experiment Framework](experiment-framework.md) -- The lifecycle that follows
  prioritization.
- [KPI Tree](kpi-tree.md) -- Identifies the target metrics for scoring Impact.
- [North Star Metric](north-star-metric.md) -- The ultimate metric that Impact
  should reference.
- [Ellis High-Tempo Testing](ellis-high-tempo-testing.md) -- Growth process that
  relies on rapid prioritization.
