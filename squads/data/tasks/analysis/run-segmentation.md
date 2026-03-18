# Task: Run Segmentation
> Agent(s): peter-fader, data-chief
> Frameworks: value-based-segmentation-fader, rfm-segmentation, fader-whale-curve-framework
> Checklists: segmentation-quality, fader/value-segmentation-audit, fader/fader-whale-curve-audit
> Templates: outputs/segmentation-report
> Registry: segment-registry

## Objective
Identify meaningful user segments based on behavior, attributes, or value to enable targeted
product decisions, personalization, and differentiated strategies for each segment.

## Prerequisites
- User-level behavioral data is available (minimum 3 months).
- Key metrics (engagement, retention, revenue) are defined.
- Business context for why segmentation is needed.
- Statistical tools or libraries available (Python/R with clustering packages).

## Steps
1. **Define segmentation goal** -- Clarify what the segmentation will be used for:
   targeting, personalization, strategy differentiation, or resource allocation.
2. **Select segmentation approach** -- Choose the method:
   - Rule-based: manual thresholds (e.g., power users = top 10% by sessions).
   - RFM: Recency, Frequency, Monetary value scoring.
   - Behavioral clustering: k-means, hierarchical, or DBSCAN on behavioral features.
   - Attribute-based: company size, industry, geography.
3. **Select features** -- Identify the variables to segment on. For behavioral segmentation,
   common features include: session frequency, feature usage breadth, time spent,
   conversion events, support ticket volume.
4. **Prepare data** -- Extract user-level feature data. Handle:
   - Missing values (impute or exclude).
   - Outliers (cap at 99th percentile).
   - Normalization (standardize features if using clustering).
5. **Run segmentation** -- Apply the chosen method:
   - Rule-based: apply threshold rules and assign segments.
   - RFM: score each dimension 1-5, create composite segments.
   - Clustering: run algorithm, evaluate with silhouette score and elbow method,
     select optimal number of clusters (typically 3-6).
6. **Profile each segment** -- For each segment, calculate:
   - Size (% of total users).
   - Key metric averages (engagement, retention, revenue).
   - Distinguishing behaviors and attributes.
   - Give each segment a descriptive name.
7. **Validate stability** -- Re-run segmentation on a different time period. Check that
   segments are consistent (> 70% of users remain in the same segment).
8. **Analyze transitions** -- If longitudinal data exists, track how users move between
   segments over time. Identify upgrade and downgrade patterns.
9. **Identify actionable differences** -- For each segment, answer: what should we do
   differently for this group? If the answer is "nothing different," the segment may
   not be useful.
10. **Document segments** -- Write a segment profile document with names, definitions,
    sizes, key metrics, and recommended strategies.
11. **Operationalize** -- If segments will be used in-product, define how segment
    membership is calculated and refreshed (batch vs. real-time).
12. **Present and align** -- Share segmentation with stakeholders. Align on which segments
    to prioritize and how to act on them.

## Deliverable
A segmentation analysis document containing:
- Segmentation methodology and feature selection rationale.
- Segment profiles (3-6 segments) with names and descriptions.
- Size, metrics, and distinguishing characteristics for each segment.
- Stability validation results.
- Recommended strategies per segment.
- Operationalization plan (if applicable).

## Quality Gate
- [ ] Segmentation goal is clearly defined.
- [ ] Feature selection is documented with rationale.
- [ ] Segments are distinct (measurably different on key metrics).
- [ ] Each segment is actionable (different strategy warranted).
- [ ] Stability validated across time periods (> 70% consistency).
- [ ] Segments have descriptive, memorable names.
- [ ] Minimum 3 and maximum 6 segments defined.
- [ ] Stakeholders reviewed and agreed on segment definitions.

## Registry Update
- Add segment definitions to `segment-registry` with criteria and refresh cadence.
- Link segments to `metric-registry` where segment-level metrics are tracked.
- Log analysis in `analysis-registry` and `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** peter-fader owns this task end-to-end.
- **Supporting agents:** data-chief contribute to their domain-specific steps.
- **Review:** data-chief reviews the final deliverable before it exits the squad.
- **Cross-squad delivery:** If the output is requested by another squad, deliver via the cross-squad-data-delivery-workflow with data-chief sign-off.

### Escalation Rules
- **Data blocker:** If required data is unavailable or unreliable, escalate to data-chief within 24 hours.
- **Stakeholder disagreement:** If stakeholders reject the methodology or conclusions, escalate to data-chief for mediation.
- **Deadline risk:** If the task cannot be completed on schedule, notify data-chief at least 48 hours before the deadline.

### Rework Loop
- **Trigger:** Any checklist item marked as fail, or reviewer requests changes.
- **Maximum iterations:** 2 rework cycles. If the deliverable fails after 2 reworks, escalate to data-chief for a scope review.
- **Between iterations:** The reviewing agent provides specific, written feedback on what must change. No vague "needs improvement" — every rework request cites a checklist item or specific deficiency.

### RalphLoop Gate
- **Applicable gate:** G4 -- Insight
- **Must-pass checklists:** `checklists/segmentation-quality.md`, `checklists/fader/value-segmentation-audit.md`, `checklists/fader/fader-whale-curve-audit.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/segment-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [value-based-segmentation-fader](../../frameworks/value-based-segmentation-fader.md), [rfm-segmentation](../../frameworks/rfm-segmentation.md), [fader-whale-curve-framework](../../frameworks/fader-whale-curve-framework.md)
- **Checklists:** [segmentation-quality](../../checklists/segmentation-quality.md), [fader/value-segmentation-audit](../../checklists/fader/value-segmentation-audit.md), [fader/fader-whale-curve-audit](../../checklists/fader/fader-whale-curve-audit.md)
- **Templates:** [outputs/segmentation-report](../../templates/outputs/segmentation-report.md)
- **Workflows:** [clv-to-strategy-workflow](../../workflows/clv-to-strategy-workflow.md)
