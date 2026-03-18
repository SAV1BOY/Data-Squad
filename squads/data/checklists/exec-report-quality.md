# Executive Report Quality Checklist

> Gate type: Pre-delivery
> Owner: Data Chief
> Applies to: Any executive summary, board deck data slide, leadership briefing, or C-level dashboard

## Purpose

Executives make high-stakes decisions in low-attention-span windows. A cluttered slide, an undefined metric, or a missing "so what" wastes their time and erodes trust in the data team. This gate ensures every executive-facing deliverable is a single-slide truth: one clear message, the decisions it enables, and the next steps it demands.

## Checklist Items

1. - [ ] **One headline insight per slide** -- Each slide or section leads with a single, declarative sentence that states the insight, not just the topic.
   - Pass criteria: The headline is a complete sentence with a verb (e.g., "NRR declined 3 points due to SMB contraction") not a label ("NRR Update").
   - Fail signal: Headline is a noun phrase ("Q1 Metrics") or the slide contains multiple competing messages.
   - Action if fail: Rewrite the headline as a finding. If there are multiple findings, split into separate slides.

2. - [ ] **Metrics are defined on first use** -- Every metric shown is either universally understood by this audience or defined in a footnote.
   - Pass criteria: Non-obvious metrics have a one-line definition on the slide or in an appendix glossary.
   - Fail signal: Acronyms or internal metric names (e.g., "L7 WAU ratio") appear with no explanation.
   - Action if fail: Add footnote definitions or replace jargon with plain language.

3. - [ ] **Comparison context provided** -- Every number is shown alongside a comparison: prior period, target, benchmark, or plan.
   - Pass criteria: Each metric has at least one comparator (e.g., "85% vs. 82% last quarter" or "85% vs. 90% target").
   - Fail signal: A standalone number is presented with no way to judge whether it is good or bad.
   - Action if fail: Add the most relevant comparison. If no target exists, use the prior period.

4. - [ ] **Direction and magnitude clear** -- Trends are shown with direction (up/down), magnitude (by how much), and whether the change is meaningful.
   - Pass criteria: Arrows, color coding, or explicit text indicate direction; percentage change stated.
   - Fail signal: A chart shows a line but the text does not say whether the change is significant or expected.
   - Action if fail: Add a trend annotation with direction, magnitude, and a one-word assessment (improving / stable / concerning).

5. - [ ] **Data is current** -- The "as of" date is stated, and the data is the freshest available at time of delivery.
   - Pass criteria: "Data as of [date]" is visible on every data slide; data is no more than one reporting cycle old.
   - Fail signal: No date stamp, or the data is two weeks stale when weekly data is available.
   - Action if fail: Refresh the data and add the date stamp.

6. - [ ] **Chart type is appropriate** -- The visualization type matches the message (e.g., bar for comparison, line for trend, no pie charts for > 5 categories).
   - Pass criteria: Chart type reinforces the headline insight; axes are labeled; no 3D effects or dual-axis charts without justification.
   - Fail signal: A pie chart with 12 slices, or a bar chart used to show a time trend.
   - Action if fail: Replace with the appropriate chart type and simplify.

7. - [ ] **So-what is explicit** -- The report states what the data means for the business, not just what happened.
   - Pass criteria: Each section ends with a "so what" sentence connecting the data to a business implication.
   - Fail signal: Report presents numbers without interpretation; the reader must infer the meaning.
   - Action if fail: Add interpretation after each key finding.

8. - [ ] **Decisions and next steps listed** -- The report ends with a clear list of decisions needed or actions recommended, with owners and timelines.
   - Pass criteria: 2-5 concrete next steps, each with an owner and a target date or next milestone.
   - Fail signal: Report ends with the last chart and no forward-looking section.
   - Action if fail: Add a "Decisions Needed" or "Next Steps" section. If no decisions are needed, state that explicitly.

9. - [ ] **Caveats and limitations stated** -- Known data limitations, methodology changes, or low-confidence estimates are disclosed, not hidden.
   - Pass criteria: A "Notes" or "Caveats" section lists 1-3 key limitations in plain language.
   - Fail signal: A metric based on incomplete data is presented with the same confidence as a well-validated metric.
   - Action if fail: Add a caveats section. If a number is low-confidence, visually distinguish it (e.g., asterisk, lighter color).

10. - [ ] **No data without a decision it serves** -- Every metric and chart in the report exists because it informs a specific decision; decorative data is removed.
    - Pass criteria: For each chart, the author can state which decision it supports; charts that support no decision are cut.
    - Fail signal: The report contains 15 charts "for context" that no one will act on.
    - Action if fail: Move non-essential charts to an appendix. The main report should be 3-5 slides maximum.

11. - [ ] **Consistent formatting** -- Colors, fonts, number formats (e.g., 1.2M not 1,200,000), and decimal precision are consistent throughout.
    - Pass criteria: A single number format convention used; brand colors applied; no mixed font sizes.
    - Fail signal: Some numbers in thousands, others in raw units; inconsistent decimal places.
    - Action if fail: Standardize formatting across all slides before delivery.

## Cross-References

- See `data-storytelling-quality.md` for the narrative principles that underpin executive communication.
- See `nrr-grr-quality.md` for the specific metric standards when NRR/GRR appears in the report.
- See `experiment-analysis-quality.md` for how experiment results should be summarized at the executive level.

---

## Applied In

| Task | Gate Level | Path |
|------|-----------|------|
| build-exec-report | G5 -- Decision + Registry | `tasks/visualization/build-exec-report.md` |

**Quality Gate Type:** mandatory
