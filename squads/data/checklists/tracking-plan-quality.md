# Tracking Plan Quality Checklist
> Gate type: Pre-delivery
> Owner: Kaushik
> Applies to: Tracking plan documents and spreadsheets

## Purpose
A tracking plan is the single source of truth for what gets measured, how events are named, and what properties they carry. A poorly constructed tracking plan leads to inconsistent data, broken dashboards, and wasted engineering effort. This gate ensures the plan is complete, governed, and ready for implementation.

## Checklist Items

1. - [ ] **Event inventory alignment** -- Every user-facing action identified in the product spec has a corresponding event in the tracking plan.
   - Pass criteria: Side-by-side comparison of product spec actions and tracking plan events shows full coverage.
   - Fail signal: Product actions exist without a mapped event; events exist without a matching product action.
   - Action if fail: Reconcile the tracking plan with the latest product spec; add or remove events.

2. - [ ] **Naming convention compliance** -- All event names follow the agreed taxonomy (e.g., Object_Action, snake_case).
   - Pass criteria: 100% of event names pass a regex or linting check against the naming standard.
   - Fail signal: Mixed casing, inconsistent delimiters, or ad-hoc names present.
   - Action if fail: Rename non-compliant events and update the plan.

3. - [ ] **Property definitions** -- Every event lists its properties with name, type, required/optional flag, and example value.
   - Pass criteria: No event row has empty property columns; types are explicit (string, integer, boolean, array).
   - Fail signal: Properties listed as "TBD", missing types, or missing required/optional designation.
   - Action if fail: Complete property definitions with engineering input before sign-off.

4. - [ ] **UTM parameter capture** -- The plan specifies how UTM parameters are captured, stored, and associated with sessions or users.
   - Pass criteria: A dedicated section defines first-touch vs. last-touch attribution logic and storage duration.
   - Fail signal: UTMs mentioned but capture method undefined; no attribution logic stated.
   - Action if fail: Add a UTM handling section with capture method, persistence rules, and attribution model.

5. - [ ] **Identity resolution strategy** -- The plan documents how anonymous and authenticated users are linked.
   - Pass criteria: Identify/alias call placement defined; user-ID format specified; edge cases (logout, multi-device) addressed.
   - Fail signal: No mention of identity stitching or anonymous-to-known user linking.
   - Action if fail: Add identity resolution section with call placement and edge-case handling.

6. - [ ] **Platform parity** -- Events are mapped per platform (web, iOS, Android, server) with platform-specific notes.
   - Pass criteria: A platform column indicates which platforms fire each event; platform-specific properties noted.
   - Fail signal: Single generic list with no platform distinction.
   - Action if fail: Add platform columns and flag platform-specific differences.

7. - [ ] **QA test cases** -- Each event has at least one QA scenario describing the trigger action, expected payload, and validation method.
   - Pass criteria: QA column populated with trigger steps and expected output for every event.
   - Fail signal: QA column empty or says "manual test."
   - Action if fail: Write explicit QA scenarios for each event; include expected property values.

8. - [ ] **Governance and change process** -- The plan includes a version history and a defined process for requesting changes.
   - Pass criteria: Version log with date, author, and change summary; change request process documented.
   - Fail signal: No version history; changes made ad-hoc without review.
   - Action if fail: Add version log and define a change request workflow (who approves, how changes are communicated).

9. - [ ] **Data destination mapping** -- Each event specifies which downstream tools receive it (analytics, CRM, warehouse, ad platforms).
   - Pass criteria: Destination column filled for every event; integration method noted (SDK, API, CDP).
   - Fail signal: Destinations assumed or not listed.
   - Action if fail: Map each event to its destinations and confirm integration paths.

10. - [ ] **Volume and sampling estimates** -- High-frequency events have estimated daily volumes and sampling considerations.
    - Pass criteria: Top 10 events by expected volume have estimated daily counts; sampling thresholds noted.
    - Fail signal: No volume estimates; risk of quota overruns or cost surprises unaddressed.
    - Action if fail: Estimate volumes from current traffic data and flag events that may need sampling.

11. - [ ] **Deprecation flags** -- Events being phased out are marked with deprecation dates and replacement event references.
    - Pass criteria: Deprecated events have a status column entry with sunset date and successor event name.
    - Fail signal: Old events remain in the plan without status indication.
    - Action if fail: Audit for legacy events; mark deprecated ones with dates and replacements.

12. - [ ] **Stakeholder sign-off** -- Product, engineering, and analytics leads have reviewed and approved the plan.
    - Pass criteria: Sign-off log with names, roles, and dates; or approval comments in the document.
    - Fail signal: Plan shared but no explicit approval recorded.
    - Action if fail: Route the plan for formal review and collect sign-offs before implementation begins.

## Cross-References
- [Event Taxonomy Quality Checklist](event-taxonomy-quality.md)
- [Analytics Audit Quality Checklist](analytics-audit-quality.md)
- [Dashboard Quality Checklist](dashboard-quality.md)
- [Attribution Quality Checklist](attribution-quality.md)
