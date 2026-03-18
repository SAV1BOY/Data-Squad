# Task: Implement Event Tracking
> Agent(s): avinash-kaushik, data-chief
> Frameworks: instrumentation-layer
> Checklists: instrumentation/tag-manager-qa, instrumentation/data-layer-contract-qa, instrumentation/consent-mode-tracking-qa
> Templates: outputs/tracking-spec
> Registry: event-registry

## Objective
Implement event tracking in the application codebase according to the measurement plan and
event taxonomy, ensuring accurate, complete, and performant data collection.

## Prerequisites
- Measurement plan is approved and published.
- Event taxonomy with naming conventions is finalized.
- Analytics SDK is integrated into the application.
- Development environment with access to analytics debug tools.
- QA tracking implementation task is understood (will follow this task).

## Steps
1. **Review the tracking spec** -- Read the measurement plan and identify all events
   assigned to this implementation cycle. Note event names, properties, and trigger
   conditions.
2. **Set up development environment** -- Ensure the analytics SDK is configured in dev/staging.
   Enable debug mode and event validation.
3. **Implement global properties** -- If not already set, configure global properties
   (user ID, session ID, platform, app version) on the analytics client.
4. **Implement user property updates** -- Add calls to set/update user properties at the
   appropriate lifecycle points (registration, plan change, profile update).
5. **Implement events one by one** -- For each event:
   a. Identify the exact code location where the trigger condition occurs.
   b. Add the tracking call with the correct event name.
   c. Attach all required properties with correct types.
   d. Handle edge cases (null values, missing data, async operations).
6. **Add property validation** -- Implement client-side validation for enum properties.
   Log warnings for unexpected values rather than silently dropping.
7. **Handle consent** -- Ensure tracking calls respect user consent preferences. Do not
   fire events if consent has not been granted (see setup-consent-mode).
8. **Test locally** -- Use the analytics debug panel or network inspector to verify each
   event fires correctly with the right properties. Check for:
   - Correct event name and casing.
   - All required properties present.
   - Correct property types (string vs. number).
   - Event fires exactly once per trigger (no duplicates).
9. **Code review** -- Submit a pull request with the tracking implementation. Reviewer
   must check against the tracking spec for completeness and correctness.
10. **Deploy to staging** -- Push to staging environment and validate events flow to the
    analytics platform.
11. **Hand off to QA** -- Notify the QA tracking task owner that implementation is ready
    for validation.

## Deliverable
- Pull request(s) with tracking implementation code.
- Local testing evidence (screenshots or logs of debug panel).
- Staging deployment confirmation.
- List of implemented events cross-referenced against the tracking spec.

## Quality Gate
- [ ] Every event in the spec is implemented.
- [ ] Event names match the taxonomy exactly (case-sensitive).
- [ ] All required properties are attached with correct types.
- [ ] No duplicate events fire for a single user action.
- [ ] Consent mode is respected (no tracking without consent).
- [ ] Code review is approved by at least one reviewer.
- [ ] Events are verified in staging analytics platform.
- [ ] No performance degradation introduced (page load, app size).

## Registry Update
- Update `event-registry` status for each event from `planned` to `implemented`.
- Record implementation date and PR link in the event entry.
- Log task completion in `task-log` with PR links and event count.

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
- **Must-pass checklists:** `checklists/instrumentation/tag-manager-qa.md`, `checklists/instrumentation/data-layer-contract-qa.md`, `checklists/instrumentation/consent-mode-tracking-qa.md`
- **Gate enforcement:** Deliverable cannot be published or shared outside the squad until the gate passes.

### Registry Updates on Completion
- Update `data/registries/event-registry.yaml` with task outcome, date, and artifact links.

### Cross-References
- **Frameworks:** [instrumentation-layer](../../frameworks/instrumentation-layer.md)
- **Checklists:** [instrumentation/tag-manager-qa](../../checklists/instrumentation/tag-manager-qa.md), [instrumentation/data-layer-contract-qa](../../checklists/instrumentation/data-layer-contract-qa.md), [instrumentation/consent-mode-tracking-qa](../../checklists/instrumentation/consent-mode-tracking-qa.md)
- **Templates:** [outputs/tracking-spec](../../templates/outputs/tracking-spec.md)
- **Workflows:** [tracking-implementation-workflow](../../workflows/tracking-implementation-workflow.md)
