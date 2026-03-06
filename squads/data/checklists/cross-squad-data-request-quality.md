# Cross-Squad Data Request Quality Checklist

> Gate type: Pre-delivery
> Owner: Data Chief
> Applies to: Any data request received from or delivered to another squad, team, or department

## Purpose

Cross-squad data requests are where ambiguity thrives. A vague request produces a deliverable that does not answer the real question; an undocumented deadline leads to silent misses; a format mismatch causes rework. This gate ensures every cross-squad data exchange has a clear scope, a realistic deadline, and a format that the requester can actually use -- reducing ping-pong and building trust between squads.

## Checklist Items

1. - [ ] **Request has a written brief** -- The request is documented in a ticket, form, or shared document -- not just a Slack DM or hallway conversation.
   - Pass criteria: A written request exists with a unique identifier (ticket number, doc link) that both parties can reference.
   - Fail signal: The request lives only in a Slack thread that will be lost in scroll-back.
   - Action if fail: Ask the requester to submit via the standard intake channel (ticket system, request form). Offer to help draft it.

2. - [ ] **Business question stated, not just data ask** -- The request explains why the data is needed and what decision it will inform, not just which tables or columns to pull.
   - Pass criteria: The brief includes a "Why" section (e.g., "We need to decide whether to expand the beta program to Enterprise accounts").
   - Fail signal: Request says "Please pull all user events for Q1" with no context on the decision.
   - Action if fail: Ask the requester "What decision will this data inform?" and document the answer before starting work.

3. - [ ] **Scope boundaries defined** -- The request specifies date range, user segments, geographies, product lines, or other filters that bound the deliverable.
   - Pass criteria: Explicit filters stated (e.g., "Active users, US and Brazil, Jan-Mar 2026, Pro plan only").
   - Fail signal: "All the data" or no filters specified, leading to an unmanageable scope.
   - Action if fail: Propose reasonable boundaries based on the business question and confirm with the requester.

4. - [ ] **Output format agreed** -- The deliverable format (dashboard, CSV, slide, table in a shared doc) is agreed upon before work begins.
   - Pass criteria: Format specified in the brief; both parties agree it fits the use case.
   - Fail signal: Data team builds a dashboard; requester wanted a CSV for their own analysis.
   - Action if fail: Confirm the desired format. If there is a mismatch, negotiate before starting work.

5. - [ ] **Deadline is realistic and acknowledged** -- A delivery date is agreed upon that accounts for the data team's current workload and the complexity of the request.
   - Pass criteria: Deadline stated in the brief; data team has confirmed it is achievable given current priorities.
   - Fail signal: Requester expects delivery "by EOD" for a complex analysis, or no deadline is set and the request lingers.
   - Action if fail: Propose a realistic deadline. If the requester's timeline is urgent, discuss scope reduction or prioritization trade-offs.

6. - [ ] **Metric definitions aligned** -- Key metrics in the request use the same definitions as the data team's canonical definitions, or differences are explicitly reconciled.
   - Pass criteria: Metrics referenced in the request are mapped to the data team's glossary; any custom definitions are documented.
   - Fail signal: Requester says "active users" meaning DAU; data team delivers MAU. Numbers do not match expectations.
   - Action if fail: Share the canonical metric definition and confirm alignment before pulling data.

7. - [ ] **Privacy and access requirements checked** -- The data requested does not include PII that the requesting squad should not have, and access controls are appropriate.
   - Pass criteria: PII fields reviewed against the requester's data access level; unnecessary PII excluded or masked.
   - Fail signal: Raw customer emails delivered to a squad that does not need them for their stated purpose.
   - Action if fail: Remove or mask PII. If PII is essential, confirm the requester has the appropriate access and a valid reason.

8. - [ ] **Delivery includes a data dictionary** -- The deliverable is accompanied by a brief description of each column, metric, or dimension included.
   - Pass criteria: A data dictionary (even a few-line description in the delivery message) explains non-obvious fields.
   - Fail signal: A CSV with columns like "val_1," "flag_x," or "amt" is delivered with no explanation.
   - Action if fail: Add column descriptions before delivery. A simple table in the delivery message is sufficient.

9. - [ ] **Requester confirms receipt and usability** -- After delivery, the requester confirms they received the data and it answers their question.
   - Pass criteria: Requester replies with a confirmation or follow-up within 3 business days.
   - Fail signal: Data delivered and the ticket is closed without requester feedback; the data may not have been useful.
   - Action if fail: Follow up with the requester. Do not close the ticket until they confirm usability.

10. - [ ] **Reusability assessed** -- If this request is likely to recur, the data team evaluates whether to automate it as a self-serve dataset or dashboard.
    - Pass criteria: Recurring requests (3+ times) are flagged for productization; a note is added to the backlog.
    - Fail signal: The same manual pull is done every month without anyone considering automation.
    - Action if fail: Add a backlog item to evaluate self-serve options for recurring requests.

11. - [ ] **Level of effort logged** -- The time spent on the request is recorded for capacity planning and workload visibility.
    - Pass criteria: Hours or effort estimate logged in the ticket or time-tracking system.
    - Fail signal: Cross-squad requests consume significant time but are invisible in capacity planning.
    - Action if fail: Log the effort. Use the data in quarterly capacity reviews to justify headcount or process changes.

12. - [ ] **SLA expectations set** -- Standard response times are communicated based on request complexity (e.g., simple pull = 2 days, complex analysis = 2 weeks).
    - Pass criteria: SLA tiers documented and shared with requesting squads; this request's tier is stated in the brief.
    - Fail signal: Every request is treated as urgent, or no SLA exists and delivery times are unpredictable.
    - Action if fail: Publish SLA tiers and classify this request into the appropriate tier.

## Cross-References

- See `data-quality-quality.md` for the quality checks applied to data before it is delivered cross-squad.
- See `privacy-and-compliance-quality.md` for privacy requirements when sharing data across teams.
- See `exec-report-quality.md` for format standards when the cross-squad deliverable is an executive summary.
