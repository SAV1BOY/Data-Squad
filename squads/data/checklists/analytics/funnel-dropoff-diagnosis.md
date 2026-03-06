# Funnel Drop-off Diagnosis Checklist

## Purpose

Systematically identify where users abandon a conversion funnel, distinguish real behavioral drop-offs from instrumentation artifacts, and prioritize probable causes for investigation. This gate turns vague "conversion is low" complaints into actionable hypotheses.

---

## Checklist Items

### 1. Funnel Steps Are Correctly Defined and Sequential

- **Pass:** Each funnel step corresponds to a single, unambiguous user action tracked by a reliable event. Steps are ordered logically, and the team has verified that users cannot skip steps or take them out of order without the funnel accounting for it.
- **Fail:** Steps are ambiguous (e.g., "engaged with page"), events are unreliable, or the funnel assumes a linear path in a non-linear experience.

### 2. Absolute and Relative Drop-off Rates Are Calculated

- **Pass:** For each step transition, both the absolute drop-off count and the percentage relative to the previous step are computed. The overall funnel conversion rate and step-level rates are displayed side by side.
- **Fail:** Only the overall conversion rate is reported, hiding which specific transition loses the most users.

### 3. Instrumentation Artifacts Are Ruled Out

- **Pass:** Before attributing a drop-off to user behavior, the team checks for: missing events due to ad blockers or consent denial, event firing delays, duplicate events inflating upstream counts, and bot traffic. Data is filtered accordingly.
- **Fail:** A 40% drop-off between steps is treated as behavioral when it is actually caused by an event not firing on Safari.

### 4. Drop-off Is Segmented by Key Dimensions

- **Pass:** Drop-off rates are broken down by device type, traffic source, new vs. returning users, geography, and any experiment cohorts. The segments with the highest absolute and relative drop-off are identified.
- **Fail:** Only aggregate drop-off is analyzed; a mobile-specific problem affecting 60% of traffic is invisible.

### 5. Time-to-Transition Is Analyzed

- **Pass:** The median and P90 time between consecutive funnel steps are computed. Unusually long transition times suggest confusion, loading issues, or users abandoning and returning later.
- **Fail:** Only completion is measured, not how long each step takes, missing friction signals.

### 6. Probable Causes Are Hypothesized and Ranked

- **Pass:** For each significant drop-off point, the team lists at least two hypotheses (UX friction, technical error, pricing objection, missing information) ranked by evidence strength and potential impact.
- **Fail:** The analysis stops at "users drop off at step 3" without proposing why.

### 7. Error States and Edge Cases Are Investigated

- **Pass:** Server errors (4xx, 5xx), client-side exceptions, validation failures, and timeout events occurring at the drop-off step are quantified. Error rates are correlated with drop-off rates.
- **Fail:** Error logs are not consulted; a 500 error affecting 8% of users is missed.

### 8. Recommendations Include Expected Impact

- **Pass:** Each proposed fix or investigation includes an estimated recovery: "Fixing the mobile layout issue at step 2 could recover approximately X users/week, representing a Y% improvement in conversion."
- **Fail:** Recommendations are generic ("improve the checkout page") with no sizing.

---

## Cross-References

- [Anomaly Investigation](anomaly-investigation.md) -- A sudden funnel drop-off may be an anomaly requiring the investigation protocol.
- [Tag Manager QA](../instrumentation/tag-manager-qa.md) -- Ensure funnel events are firing correctly before diagnosing behavior.
- [Root Cause Analysis QA](root-cause-analysis-qa.md) -- Deep drop-off investigations benefit from the 5 Whys framework.
