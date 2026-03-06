# Framing Effects: How Presentation Changes Decisions

## What It Is

The framing effect is a cognitive bias where people react differently to the same information depending on how it is presented. The same data, framed positively or negatively, leads to different decisions. In analytics, every choice about how to present a number -- the words, the format, the comparison, the visual -- frames the viewer's interpretation.

## Classic Demonstration

Tversky and Kahneman (1981) presented a disease scenario to two groups:

- **Group A:** "A treatment saves 200 out of 600 people." 72% chose this treatment.
- **Group B:** "A treatment lets 400 out of 600 people die." Only 22% chose this treatment.

Same outcome. Different framing. Dramatically different decisions.

## Framing in Analytics Reports

### Gain vs. Loss Framing

The same metric can be framed as a gain or a loss:

| Gain Frame | Loss Frame | Same Data |
|-----------|-----------|-----------|
| "92% uptime" | "8% downtime" | Same system reliability |
| "85% retention" | "15% churn" | Same customer behavior |
| "70% of users complete onboarding" | "30% of users abandon onboarding" | Same funnel |
| "Conversion improved 20% relative" | "Conversion improved 1 percentage point" | Same change |

People are loss-averse. "15% churn" triggers more concern than "85% retention," even though they describe the same reality.

**How analysts exploit this (intentionally or not):**
- Want to sound positive? "Retention is at 85%!"
- Want to trigger action? "We are losing 15% of our customers."
- Both are true. The choice of framing shapes the response.

**Best practice:** Present both frames and let the audience evaluate. "Retention is 85% (churn: 15%)." This is more honest and avoids manipulating the emotional response.

### Relative vs. Absolute Framing

| Relative Frame | Absolute Frame | Context |
|---------------|---------------|---------|
| "Revenue grew 50%!" | "Revenue grew from $200K to $300K" | Small business |
| "Conversion increased 25%" | "Conversion increased from 4% to 5%" | One percentage point |
| "Churn decreased by 30%" | "Churn decreased from 10% to 7%" | Three percentage points |
| "User complaints dropped 80%" | "User complaints dropped from 5 to 1" | Tiny sample |

Relative frames exaggerate small changes. Absolute frames provide context. Both are needed.

**Best practice:** Always present both: "Conversion increased from 4.0% to 5.0% (+1.0 pp, +25% relative)."

### Comparison Frame

What you compare a metric to completely changes its interpretation:

| Comparison | Frame | Feeling |
|-----------|-------|---------|
| vs. last month (which was bad) | "Revenue is up 15%!" | Optimistic |
| vs. same month last year | "Revenue is down 5% YoY" | Concerning |
| vs. plan/target | "Revenue is at 92% of plan" | Close but behind |
| vs. industry benchmark | "We outperform the industry average by 2x" | Confident |
| vs. best-in-class | "We are at 60% of best-in-class" | Room to grow |

The same revenue number gets five different emotional reactions depending on the comparison chosen.

**Best practice:** Include at least two comparisons: vs. previous period AND vs. target or plan. This gives a more balanced view.

### Time Range Framing

The time range you choose for a chart tells a story:

- **Last 30 days:** Shows recent momentum. A short-term dip looks dramatic.
- **Last 12 months:** Shows trends. Short-term noise is smoothed out.
- **Last 3 years:** Shows long-term trajectory. Recent changes are barely visible.
- **Custom (March to July):** Cherry-picks a favorable window.

**Best practice:** Default to a standard time range that matches the decision context. Add a date range filter so viewers can adjust.

### Denominator Framing

Choosing the denominator changes the story:

- "20% of active users adopted Feature X" (sounds good).
- "5% of all registered users adopted Feature X" (sounds less impressive).
- "Feature X has 500 users" (is that a lot? depends on total).

**Best practice:** State the denominator explicitly. "500 of 10,000 active users (5%) adopted Feature X."

## Visual Framing

### Color Framing

- Showing a metric in green implies it is positive/healthy.
- Showing the same metric in red implies it is negative/alarming.
- Color is not neutral. It carries judgment.

**Best practice:** Define color meaning in a standard and apply it consistently. Do not use green for a declining metric just because it is "declining less than expected."

### Scale Framing

- A Y-axis from 0 to 100 makes a change from 45 to 50 look small.
- A Y-axis from 40 to 55 makes the same change look dramatic.
- Both are technically correct. The choice frames the interpretation.

**Best practice:** For bar charts, always start at zero. For line charts, choose a range that honestly represents the magnitude of change. When in doubt, show both zoomed-in and full-scale views.

### Chart Type Framing

- A line chart emphasizes trend and direction.
- A bar chart emphasizes comparison and magnitude.
- A table emphasizes precision and detail.
- A pie chart emphasizes part-to-whole relationship.

The same data in different chart types tells different stories. A flat line chart looks like stagnation. The same data in a bar chart compared to target might show consistent achievement.

## Language Framing in Reports

### Word Choice

| Neutral | Positive Frame | Negative Frame |
|---------|---------------|----------------|
| "Changed by 5%" | "Grew by 5%" | "Only reached 5%" |
| "55% completion" | "Majority completed" | "Nearly half did not complete" |
| "Flat month-over-month" | "Stable performance" | "No growth this month" |
| "Results were not significant" | "Consistent with the baseline" | "Experiment failed" |

**Best practice:** Use neutral, factual language. Avoid adjectives that carry judgment. Let the data and the reader's context determine the interpretation.

### Sentence Structure

- "Despite the pricing change, retention remained at 85%." (Positive frame: resilience.)
- "After the pricing change, 15% of customers churned." (Negative frame: damage.)
- "Retention was 85% in the month following the pricing change, consistent with the prior period." (Neutral frame: observation.)

### Headlines

Dashboard titles and section headers frame interpretation:

- "Revenue Performance" (neutral)
- "Revenue Growth" (implies growth is happening or expected)
- "Revenue Recovery" (implies there was a problem)
- "Revenue Gap" (implies underperformance)

**Best practice:** Use descriptive, neutral titles. Let the data speak.

## Ethical Considerations

### When Framing Is Manipulation

Framing becomes manipulation when:
- The presenter deliberately chooses a frame to produce a specific decision.
- Alternative frames are suppressed.
- The audience is not given enough information to apply their own framing.
- The frame misrepresents the magnitude or direction of the data.

### When Framing Is Inevitable

All communication involves framing. You cannot present data without making choices about words, visuals, and comparisons. The goal is not to eliminate framing but to be aware of it and choose frames that serve honest understanding.

## Debiasing Techniques

### For Analysts (Presenters)

1. **Present multiple frames.** Show gain and loss, relative and absolute, multiple comparisons.
2. **Use neutral language.** Avoid loaded adjectives. State facts.
3. **Default to standard views.** Standard time ranges, standard comparisons, standard colors.
4. **Disclose your choices.** "I chose this time range because X. Here is what it looks like with a different range."
5. **Test with a colleague.** Ask someone to review your report and describe what story they take away. If it is more extreme than you intended, adjust the framing.

### For Decision Makers (Consumers)

1. **Ask for the other frame.** If presented with a gain frame, ask "What does this look like as a loss?" and vice versa.
2. **Ask for absolute numbers** when presented with percentages.
3. **Ask about the comparison.** "Why are we comparing to this period and not another?"
4. **Ask about the denominator.** "What population are we measuring this against?"
5. **Look at the full dashboard, not just the highlighted metric.** The metrics NOT highlighted may tell a different story.

## Key Takeaway

Every analytical presentation is framed. There is no such thing as an unframed presentation of data. The choice of metric, comparison, time range, chart type, color, and words all constitute a frame. The ethical analyst's job is to choose frames that serve understanding and to make those choices transparent.
