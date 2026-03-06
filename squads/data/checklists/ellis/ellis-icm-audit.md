# Ellis ICM Audit

## Purpose

Audit the Impact/Confidence/Ease (ICE) scoring framework used to prioritize growth experiments. ICE (sometimes called ICM for Impact/Confidence/Manageability) is Ellis's recommended system for ranking experiment ideas. This checklist ensures the scoring is calibrated, consistent, and actually useful for prioritization.

---

## Checklist Items

### 1. ICE Framework Is Formally Adopted
- **Pass:** The team has a documented ICE scoring system with defined scales for each dimension (Impact, Confidence, Ease). The framework is used consistently for all experiment prioritization.
- **Fail:** Experiment prioritization is done by gut feel, HiPPO (Highest Paid Person's Opinion), or whatever seems exciting this week.

### 2. Impact Is Scored Against a Defined Metric
- **Pass:** The Impact score is anchored to a specific metric (ideally the NSM or its inputs). A 10/10 impact is defined in concrete terms (e.g., "expected to move activation rate by 5+ percentage points").
- **Fail:** Impact is scored subjectively with no reference metric, meaning one person's 8 is another person's 4.

### 3. Confidence Is Evidence-Based
- **Pass:** Confidence scores reflect the strength of evidence: 10 = strong quantitative evidence or prior test results, 5 = qualitative evidence or analogy from similar product, 1 = pure intuition.
- **Fail:** Confidence is based on how strongly someone believes in the idea, not on evidence.

### 4. Ease Is Realistically Assessed
- **Pass:** Ease accounts for engineering effort, design effort, data requirements, dependencies, and review/approval time. The team responsible for implementation provides the estimate.
- **Fail:** Ease is scored by the proposer without consulting the team that will build it, leading to chronic underestimation of effort.

### 5. Scores Are Calibrated Across the Team
- **Pass:** The team has done at least one calibration exercise: scoring the same set of ideas independently, then discussing discrepancies to align on scale interpretation.
- **Fail:** Different team members use wildly different scales, making cross-person scores incomparable.

### 6. Scores Are Not Gamed
- **Pass:** Team norms discourage inflating scores to get pet projects prioritized. A culture of honest scoring is reinforced, and outlier scores are discussed.
- **Fail:** People routinely give 10/10/10 to their own ideas, rendering the system useless.

### 7. The Backlog Is Ranked, Not Just Scored
- **Pass:** After scoring, experiments are force-ranked. Tied scores are broken by discussion, ensuring a clear execution order. The top 3-5 experiments are the current sprint's candidates.
- **Fail:** Everything scores 7-8 and the team still cannot decide what to work on.

### 8. Past Scores Are Compared to Actual Outcomes
- **Pass:** After experiments conclude, the team compares predicted impact and confidence to actual results. This feedback loop improves future scoring accuracy.
- **Fail:** Scores are never revisited after the experiment, so the team never learns whether their scoring was calibrated.

### 9. Low-Confidence / High-Impact Ideas Get Special Treatment
- **Pass:** Ideas with high potential impact but low confidence are not automatically deprioritized. Instead, they are candidates for quick validation tests (fake door tests, surveys, prototypes) to increase confidence.
- **Fail:** Low-confidence ideas are sent to the bottom of the list regardless of impact, creating a bias toward safe, incremental experiments.

### 10. The Framework Is Lightweight, Not Bureaucratic
- **Pass:** Scoring an idea takes less than 5 minutes. The system accelerates decision-making rather than slowing it down.
- **Fail:** The scoring process is so elaborate (detailed spreadsheets, committee reviews, multi-step approval) that it becomes a bottleneck to experiment velocity.

---

## Cross-References

- [Growth Experiment Velocity](growth-experiment-velocity.md) -- ICE scoring feeds the prioritized experiment queue
- [North Star Metric Audit](north-star-metric-audit.md) -- Impact dimension anchors to NSM
- [Ellis Growth Lever Audit](ellis-growth-lever-audit.md) -- ICE scores should cluster around the focus lever
- [Growth Team Ops](growth-team-ops.md) -- ICE scoring is part of the team's operating rhythm
