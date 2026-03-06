# Data Storytelling Quality Checklist

> Gate type: Review
> Owner: Kaushik (Analytics Evangelist / Data Communication Lead)
> Applies to: Any data presentation, insight narrative, analytical blog post, or stakeholder briefing

## Purpose

Data without narrative is noise; narrative without data is opinion. The gap between a good analysis and a good data story is the difference between being technically correct and actually changing behavior. This gate ensures data narratives are honest, contextual, and structured to drive action -- never to deceive or overwhelm.

## Checklist Items

1. - [ ] **Insight stated upfront** -- The narrative leads with the insight, not the methodology or the data collection journey.
   - Pass criteria: The first sentence or paragraph contains the key finding in plain language.
   - Fail signal: The first two pages describe the SQL queries, data sources, and cleaning steps before any finding appears.
   - Action if fail: Restructure to lead with the insight. Move methodology to an appendix or a "How we got here" section at the end.

2. - [ ] **Context grounds the insight** -- The insight is placed in context: historical trend, industry benchmark, company target, or user impact.
   - Pass criteria: The finding is compared to something the audience already understands (e.g., "This is 2x our historical average" or "Below the industry median of 40%").
   - Fail signal: A number is presented in isolation with no frame of reference.
   - Action if fail: Add the most relevant comparison. If no benchmark exists, use the prior period or a goal.

3. - [ ] **The audience is defined** -- The narrative is tailored to a specific audience (executives, engineers, product managers) and uses their vocabulary.
   - Pass criteria: The document states or implies its audience, and the level of detail matches that audience.
   - Fail signal: A narrative mixes board-level summaries with deep technical details, serving neither audience well.
   - Action if fail: Pick one audience. Create separate versions if multiple audiences need the same analysis.

4. - [ ] **Action is explicit** -- The narrative ends with a clear recommendation or question for the audience to act on.
   - Pass criteria: A "What should we do" or "Recommendation" section with specific, actionable proposals.
   - Fail signal: The narrative ends with "interesting findings" and no guidance on what to do next.
   - Action if fail: Add 1-3 concrete recommendations or, if the analysis is exploratory, state the next question to investigate.

5. - [ ] **Visualizations support, not replace, the narrative** -- Charts illustrate the story; the story is comprehensible without the charts.
   - Pass criteria: Each chart is referenced in the text with a sentence explaining what the reader should see in it.
   - Fail signal: Charts are dropped into the document with no accompanying text; the reader must interpret them alone.
   - Action if fail: Add a caption or in-text reference for each chart explaining the key takeaway.

6. - [ ] **No misleading visuals** -- Axes start at zero (or deviation is justified), scales are consistent, and no visual tricks exaggerate or minimize differences.
   - Pass criteria: Y-axes start at zero for bar charts; any truncated axis is explicitly labeled; dual axes are avoided or clearly marked.
   - Fail signal: A bar chart with a Y-axis starting at 95% makes a 2-point change look like a cliff.
   - Action if fail: Fix the axis or add an annotation explaining why a non-zero baseline is used.

7. - [ ] **Correlation is not presented as causation** -- Observed relationships are described with causal language only if a causal mechanism is established (e.g., via experiment).
   - Pass criteria: Observational findings use "associated with," "correlated with," or "tends to accompany." Causal claims cite an experiment or quasi-experimental design.
   - Fail signal: "Feature X increased retention by 15%" based on an observational cohort comparison with no controls.
   - Action if fail: Soften the language to correlational, or design an experiment to test the causal claim.

8. - [ ] **Uncertainty is communicated** -- Confidence intervals, sample sizes, or qualitative confidence levels are included where relevant.
   - Pass criteria: Key estimates include a range or a caveat about sample size (e.g., "based on 45 accounts, directional only").
   - Fail signal: Point estimates presented as precise facts with no indication of uncertainty.
   - Action if fail: Add confidence intervals, sample sizes, or a plain-language confidence qualifier.

9. - [ ] **Narrative arc is coherent** -- The story follows a logical flow: situation, complication, resolution (or question, evidence, answer).
   - Pass criteria: A reader can summarize the story in three sentences that logically follow from each other.
   - Fail signal: The narrative jumps between unrelated findings or presents data in the order it was queried rather than the order it makes sense.
   - Action if fail: Outline the narrative arc before writing. Reorder sections to follow situation-complication-resolution.

10. - [ ] **Jargon is minimized** -- Technical terms are either replaced with plain language or defined on first use.
    - Pass criteria: A non-technical stakeholder in the target audience can understand the narrative without a glossary.
    - Fail signal: Terms like "p < 0.05," "logistic regression coefficient," or internal codenames appear without explanation.
    - Action if fail: Replace jargon with plain language or add inline definitions.

11. - [ ] **Counter-evidence acknowledged** -- The narrative addresses data that contradicts or complicates the main finding, rather than ignoring it.
    - Pass criteria: At least one "however" or "limitation" that shows the author considered alternative explanations.
    - Fail signal: Cherry-picked data supports a predetermined conclusion; inconvenient data points are omitted.
    - Action if fail: Add a section on limitations, alternative explanations, or contradictory signals.

12. - [ ] **Length is proportionate to stakes** -- The narrative length matches the decision importance: a minor insight gets a paragraph, not a 20-page report.
    - Pass criteria: Word count is proportionate; high-stakes findings get thorough treatment, routine updates get a brief summary.
    - Fail signal: A routine weekly metric update is delivered as a 15-page deck.
    - Action if fail: Trim to the essential content. Use an appendix for supporting detail.

## Cross-References

- See `exec-report-quality.md` for the specific format requirements when the audience is executive leadership.
- See `experiment-analysis-quality.md` for the analytical rigor that should underpin experiment narratives.
- See `community-metrics-quality.md` for anti-vanity principles when telling community stories.
