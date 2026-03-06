# Task: Build Event Taxonomy
> Agent(s): Data Engineer, Data Analyst, Product Manager
> Frameworks: Event Taxonomy Framework, Naming Convention Standard
> Checklists: taxonomy-completeness-checklist, naming-convention-checklist
> Template: event-taxonomy-template
> Registry: event-registry

## Objective
Design a structured, consistent event taxonomy that defines every tracked user action, its
properties, and naming conventions, ensuring clean and usable analytics data from day one.

## Prerequisites
- Product feature map or user journey map is available.
- Key metrics and KPIs are identified (ideally from the KPI tree).
- Analytics tool(s) are selected (e.g., Amplitude, Mixpanel, Segment).
- Engineering team is available for feasibility review.

## Steps
1. **Audit existing events** -- If tracking already exists, export the current event list.
   Categorize events as: keep, rename, merge, or deprecate.
2. **Map user journeys** -- Document the primary user journeys (onboarding, core loop,
   upgrade, etc.). Identify the key actions at each stage.
3. **Define naming convention** -- Establish the pattern. Recommended:
   `Object Action` (e.g., `Button Clicked`, `Form Submitted`).
   Document casing rules, word separators, and reserved prefixes.
4. **Create event categories** -- Group events into logical categories:
   - Lifecycle events (signup, login, logout)
   - Feature events (grouped by product area)
   - Transaction events (purchase, subscription change)
   - System events (error, notification received)
5. **Define each event** -- For every event, document:
   - Event name (following convention)
   - Description and trigger condition
   - Category
   - Properties (name, type, required/optional, example values)
   - Platform(s) where it fires
6. **Define global properties** -- Specify properties attached to every event (user ID,
   session ID, timestamp, platform, app version, etc.).
7. **Define user properties** -- List user-level properties that should be set/updated
   (plan type, signup date, company ID, etc.).
8. **Create property value enums** -- For properties with controlled vocabularies, define the
   allowed values explicitly. No free-text where enums are possible.
9. **Validate against KPIs** -- Cross-reference the taxonomy with every metric in the KPI
   tree. Confirm that all metrics can be calculated from the defined events.
10. **Review with engineering** -- Walk through the taxonomy with the engineering team.
    Confirm feasibility, identify implementation complexity, and estimate effort.
11. **Publish taxonomy** -- Add all events to the event registry. Distribute the taxonomy
    document to all stakeholders.

## Deliverable
A complete event taxonomy document containing:
- Naming convention specification.
- Full event catalog (50-200 events typically) with properties.
- Global and user property definitions.
- Category groupings.
- KPI coverage matrix showing which events feed which metrics.

## Quality Gate
- [ ] Naming convention is documented and consistently applied.
- [ ] Every event has a description, trigger condition, and properties.
- [ ] All property types are specified (string, number, boolean, enum).
- [ ] Global properties are defined and attached to all events.
- [ ] Every KPI tree metric can be calculated from taxonomy events.
- [ ] No duplicate or overlapping events exist.
- [ ] Engineering has reviewed and confirmed feasibility.
- [ ] Taxonomy covers all primary user journeys.

## Registry Update
- Add all events to `event-registry` with full property schemas.
- Link events to metrics in `metric-registry` via `source_events` field.
- Log task completion in `task-log` with taxonomy version number.
