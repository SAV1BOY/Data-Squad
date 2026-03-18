# Task: Segment Refresh
> Agent(s): peter-fader, avinash-kaushik
> Frameworks: value-based-segmentation-fader, rfm-segmentation, fader-customer-base-audit
> Checklists: segmentation-quality, fader/value-segmentation-audit, analytics/cohort-curve-reading
> Templates: outputs/segmentation-report
> Registry: segment-registry

## Objective
Perform a periodic refresh and validation of all active user segments using updated behavioral
data — ensuring segments remain accurate, mutually useful, and aligned with current business needs.

## Prerequisites
- Access to the data warehouse with updated behavioral and transactional data.
- Current segment definitions from the segment registry.
- At least 90 days of new behavioral data since the last segment refresh.
- Stakeholder list for teams consuming segment data.

## Steps
1. **Inventory active segments** -- Pull all segments from the segment registry with
   `status: active`. For each segment, record:
   - Segment name and definition criteria.
   - Creation date and last refresh date.
   - Consuming teams and use cases (marketing targeting, product personalization, CS tiering).
2. **Recompute segment membership** -- Using the current segment definitions, recompute
   membership with fresh data. For each segment, record:
   - Current member count vs. previous member count.
   - Percentage change in segment size.
   - Member churn (users who left the segment since last refresh).
   - Member inflow (new users entering the segment).
3. **Validate segment separation** -- Check that segments remain distinct and useful:
   - Overlap analysis: what percentage of users belong to multiple segments?
   - Behavioral distinctness: do segments still show meaningfully different behaviors
     (conversion rates, retention, LTV)?
   - Size balance: is any segment > 60% or < 5% of the total base (may indicate the
     segmentation is no longer discriminating)?
4. **Test predictive power** -- For segments used in predictive models or targeting:
   - Recalculate lift per segment for the target behavior.
   - Compare lift to the previous refresh — has discriminating power degraded?
   - Run a stability test: would a re-segmentation from scratch produce similar groups?
5. **Identify drift** -- Flag segments showing significant changes:
   - Size change > 20% from the previous refresh.
   - Behavioral convergence (two segments becoming indistinguishable).
   - New behavioral patterns not captured by any existing segment.
6. **Propose adjustments** -- For segments with drift or degraded predictive power:
   - Recommend boundary adjustments (e.g., updating RFM thresholds).
   - Recommend merging converging segments.
   - Recommend splitting segments that have become too heterogeneous.
   - Recommend new segments for uncaptured behavioral patterns.
7. **Validate with stakeholders** -- Present refresh findings to consuming teams:
   - Share migration counts (users moving between segments).
   - Confirm that adjusted segments still serve their operational needs.
   - Collect feedback on missing segments or overly broad groups.
8. **Update segment definitions** -- Apply approved adjustments:
   - Update criteria in the segment registry.
   - Recompute final membership with adjusted definitions.
   - Version the segment definitions (e.g., v2.1, v2.2).
9. **Update downstream systems** -- Push refreshed segments to consuming systems:
   - Marketing automation platforms.
   - Product personalization engines.
   - CS tiering systems.
   Document the propagation and confirm receipt.
10. **Schedule next refresh** -- Based on segment volatility, set the next refresh date.
    High-volatility segments: monthly. Stable segments: quarterly.

## Deliverable
A segment refresh report containing:
- Segment inventory with membership changes.
- Overlap and behavioral distinctness analysis.
- Predictive power validation results.
- Drift analysis with recommended adjustments.
- Stakeholder feedback summary.
- Updated segment definitions (versioned).
- Downstream propagation confirmation.

## Quality Gate
- [ ] All active segments recomputed with fresh data.
- [ ] Membership changes quantified (inflow, outflow, net change).
- [ ] Overlap analysis completed across all segment pairs.
- [ ] Behavioral distinctness validated with at least 3 key metrics.
- [ ] Predictive power tested for targeting segments.
- [ ] Drift flags documented for segments with > 20% size change.
- [ ] Stakeholders consulted and feedback incorporated.
- [ ] Segment registry updated with versioned definitions.

## Registry Update
- Update `segment-registry` with refreshed membership counts and version.
- Log segment changes in `decision-registry`.
- Log task completion in `task-log`.

---

## Operational Details

### Handoff Rules
- **Lead agent:** peter-fader owns this task end-to-end.
- **Supporting agents:** avinash-kaushik contribute to their domain-specific steps.
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
- **Must-pass checklists:** `checklists/segmentation-quality.md`, `checklists/fader/value-segmentation-audit.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/segment-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [value-based-segmentation-fader](../../frameworks/value-based-segmentation-fader.md), [rfm-segmentation](../../frameworks/rfm-segmentation.md), [fader-customer-base-audit](../../frameworks/fader-customer-base-audit.md)
- **Checklists:** [segmentation-quality](../../checklists/segmentation-quality.md), [fader/value-segmentation-audit](../../checklists/fader/value-segmentation-audit.md), [analytics/cohort-curve-reading](../../checklists/analytics/cohort-curve-reading.md)
- **Templates:** [outputs/segmentation-report](../../templates/outputs/segmentation-report.md)
- **Workflows:** [retention-diagnostics-workflow](../../workflows/retention-diagnostics-workflow.md)
