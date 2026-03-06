# Data Storytelling Framework

> Insight -> Context -> Narrative -> Action (with honest storytelling principles)

---

## Overview

Data storytelling is the discipline of translating analytical findings into narratives
that drive decisions and action. It bridges the gap between what the data shows and
what the audience needs to do about it. This framework follows a four-step arc:
identify the Insight, provide Context, construct a Narrative, and recommend Action.
It also embeds principles of honest storytelling to prevent manipulation and ensure
analytical integrity.

---

## When to Use

- When presenting analytical findings to stakeholders who will make decisions.
- When a dashboard or report exists but nobody acts on it.
- When complex data needs to be communicated to non-technical audiences.
- When building a culture of data-informed decision-making.
- When training analysts on communication skills alongside technical skills.

---

## Core Concept

### The Four-Step Arc

#### 1. Insight
The specific, non-obvious finding from the data. An insight is not a data point; it
is a finding that challenges expectations, reveals a pattern, or identifies an
opportunity or risk.

**Test:** "So what?" If the audience would shrug, it is not an insight.

**Examples of insights (vs. data points):**
- Data point: "Q4 revenue was $12M." (Descriptive, no tension.)
- Insight: "Q4 revenue was $12M, 15% below forecast, driven entirely by a 40% drop
  in enterprise renewals -- our SMB segment actually grew 20%."

#### 2. Context
The background information the audience needs to understand why the insight matters.

**Context includes:**
- Historical comparison (trend, baseline, prior period).
- Benchmarks (industry, competitors, internal targets).
- Causal factors (what happened in the business or market).
- Scope and limitations (what the data covers and does not cover).

#### 3. Narrative
The structured story that connects insight and context into a coherent, compelling
account.

**Narrative structure:**
- **Setup:** What was expected or assumed?
- **Tension:** What did the data reveal that challenges the assumption?
- **Resolution:** What explains the tension?
- **Implication:** What does this mean for the business going forward?

#### 4. Action
The specific, concrete recommendation(s) that follow from the narrative.

**Good actions are:**
- Specific (not "we should investigate" but "we should run a win/loss analysis on
  the 15 lost enterprise renewals by March 15").
- Owned (a person or team is named).
- Time-bound (a deadline or cadence).
- Proportionate (the recommended effort matches the size of the insight).

### Honest Storytelling Principles

Data stories can mislead, intentionally or accidentally. Embed these guardrails:

1. **Show the uncertainty.** Include confidence intervals, sample sizes, and caveats.
   Do not present estimates as facts.

2. **Do not cherry-pick.** If the data supports multiple interpretations, acknowledge
   them. Present the strongest counterargument to your conclusion.

3. **Use appropriate scales.** Do not truncate axes to exaggerate effects. Do not use
   dual axes that create false correlations.

4. **Distinguish correlation from causation.** If the data is observational, say so.
   Do not imply causation without experimental or quasi-experimental evidence.

5. **Acknowledge what you do not know.** Gaps in data, confounders, and alternative
   explanations should be stated, not hidden.

6. **Separate facts from opinions.** Clearly label "the data shows..." vs. "I
   recommend..."

---

## Steps / Process

### Step 1: Find the Insight
- Start with the analytical question or business problem.
- Explore the data. Look for surprises, anomalies, and patterns.
- Test candidate insights against the "so what?" filter.

### Step 2: Build the Context
- Gather comparison points: historical, benchmark, target.
- Research the business context: what events or decisions might explain the finding?
- Define the scope and limitations of the analysis.

### Step 3: Construct the Narrative
- Write the story arc: setup, tension, resolution, implication.
- Choose the right medium: slide deck, written memo, live presentation, dashboard
  annotation.
- Design visuals that support (not replace) the narrative.
- Apply honest storytelling principles to every visual and claim.

### Step 4: Recommend Action
- Translate the implication into 1-3 specific recommendations.
- For each recommendation: what, who, when, how we will know it worked.
- If the insight does not lead to action, ask whether the analysis addressed the
  right question.

### Step 5: Deliver and Iterate
- Present to the decision-making audience.
- Invite challenge: "What am I missing? What alternative explanations exist?"
- Track whether the recommended actions were taken and what resulted.

---

## Inputs / Outputs

### Inputs
| Input                          | Source                          |
|--------------------------------|---------------------------------|
| Analytical findings            | Analyst / data scientist        |
| Business context               | Stakeholders, domain experts    |
| Historical data and benchmarks | Data warehouse, research        |
| Audience profile               | Stakeholder map                 |

### Outputs
| Output                         | Consumer                        |
|--------------------------------|---------------------------------|
| Data story (deck, memo, etc.)  | Decision-makers                 |
| Action recommendations         | Responsible teams               |
| Follow-up analysis plan        | Analytics team                  |

---

## Pitfalls

1. **Leading with data, not insight.** "Here are 20 charts" is not a story. Start with
   the finding, then support with data.

2. **No action.** A beautifully told story without a recommendation is entertainment,
   not decision support.

3. **Overcomplicated visuals.** If the audience cannot parse the chart in 10 seconds,
   simplify it. Cognitive load kills comprehension.

4. **Confirmation bias.** Analysts can unconsciously construct narratives that confirm
   what stakeholders want to hear. Apply the honest storytelling principles rigorously.

5. **One-size-fits-all delivery.** An executive needs a 2-minute summary. A technical
   team needs the methodology. Tailor the depth to the audience.

6. **No follow-through.** If nobody tracks whether the recommended action was taken
   and what happened, the story loop is broken.

7. **Dishonest framing.** Omitting uncertainty, cherry-picking time windows, or
   implying causation from correlation damages trust and leads to bad decisions.

---

## Cross-References

- [DMMM (Kaushik)](dmmm-kaushik.md) -- Storytelling often explains why KPIs moved.
- [Experiment Framework](experiment-framework.md) -- Experiment results need narrative
  context to drive decisions.
- [Tufte Data Visualization](tufte-data-visualization-principles.md) -- Visual design
  principles for honest data display.
- [Few Dashboard Design](few-dashboard-design-principles.md) -- Dashboard design that
  enables self-serve storytelling.
- [OKR-to-Metrics Alignment](okr-to-metrics-alignment.md) -- Storytelling about
  progress toward objectives.
