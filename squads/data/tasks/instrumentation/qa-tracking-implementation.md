# Task: QA Tracking Implementation
> Agent(s): avinash-kaushik, data-chief
> Frameworks: instrumentation-layer
> Checklists: instrumentation/tag-manager-qa, instrumentation/data-layer-contract-qa
> Templates: outputs/tracking-spec
> Registry: event-registry

## Objective
Validate that all implemented tracking events fire correctly, carry accurate properties, and
produce reliable data in the analytics platform, catching issues before they reach production.

## Prerequisites
- Event tracking implementation is deployed to staging.
- Event taxonomy and tracking spec are available for reference.
- Access to the analytics platform with debug/live view capability.
- Test accounts and devices for each platform (web, iOS, Android).

## Steps
1. **Prepare test plan** -- Create a QA test matrix listing every event, its trigger
   condition, expected properties, and the platforms to test on.
2. **Set up test environment** -- Log into staging with a test account. Open the analytics
   debug view or real-time event stream. Ensure events from the test device are isolated.
3. **Test each event** -- For every event in the spec:
   a. Perform the trigger action in the application.
   b. Verify the event appears in the debug view.
   c. Check the event name matches the taxonomy exactly.
   d. Verify all required properties are present.
   e. Verify property values are correct and types match.
   f. Verify no extra/unexpected properties are attached.
4. **Test edge cases** -- For each event, test:
   - Rapid repeated triggers (debounce check).
   - Offline/reconnection scenarios (mobile).
   - Empty states and null values.
   - Boundary values for numeric properties.
5. **Test global properties** -- Verify that every event carries the correct global
   properties (user ID, session ID, timestamp, platform, app version).
6. **Test user properties** -- Verify user properties update at the correct lifecycle
   points and persist correctly across sessions.
7. **Test consent mode** -- Verify that no events fire when consent is declined. Verify
   events resume when consent is granted.
8. **Cross-platform validation** -- If multi-platform, repeat tests on each platform.
   Compare event schemas across platforms for consistency.
9. **Volume validation** -- Estimate expected event volume and compare to actual volume
   in staging. Flag significant discrepancies (> 20% deviation).
10. **Document results** -- Record pass/fail for each event. For failures, document the
    issue, expected vs. actual behavior, and severity.
11. **File bugs** -- Create tickets for all failures. Classify as blocking (prevents
    launch) or non-blocking (can fix post-launch).
12. **Retest fixes** -- After engineering fixes, retest failed items until all blocking
    issues are resolved.

## Deliverable
A QA tracking report containing:
- Test matrix with pass/fail status for every event on every platform.
- Bug tickets for all failures with severity classification.
- Volume validation comparison.
- Consent mode test results.
- Sign-off recommendation (ready to ship / blocked / conditional).

## Quality Gate
- [ ] 100% of events in the spec have been tested.
- [ ] All blocking bugs are resolved and retested.
- [ ] Event names match taxonomy with zero discrepancies.
- [ ] All required properties pass validation on every platform.
- [ ] No duplicate events detected for single trigger actions.
- [ ] Consent mode correctly blocks/allows tracking.
- [ ] Volume estimates are within 20% of expected.
- [ ] QA report is completed and stored.

## Registry Update
- Update `event-registry` status for validated events from `implemented` to `validated`.
- Record QA date and tester in each event entry.
- Log task completion in `task-log` with QA report link and pass rate.

---

## Operational Details

### Handoff Rules
- **Lead agent:** avinash-kaushik owns this task end-to-end.
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
- **Applicable gate:** G2 -- Instrumentation
- **Must-pass checklists:** `checklists/instrumentation/tag-manager-qa.md`, `checklists/instrumentation/data-layer-contract-qa.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/event-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [instrumentation-layer](../../frameworks/instrumentation-layer.md)
- **Checklists:** [instrumentation/tag-manager-qa](../../checklists/instrumentation/tag-manager-qa.md), [instrumentation/data-layer-contract-qa](../../checklists/instrumentation/data-layer-contract-qa.md)
- **Templates:** [outputs/tracking-spec](../../templates/outputs/tracking-spec.md)
