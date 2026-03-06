# Event Taxonomy Quality Checklist
> Gate type: Pre-delivery
> Owner: Kaushik
> Applies to: Event naming conventions, property schemas, and taxonomy governance documents

## Purpose
A consistent event taxonomy prevents data fragmentation, reduces analyst confusion, and ensures reliable downstream reporting. This gate validates that every event name, property, and version follows a coherent system that scales as the product grows and that ownership and compatibility rules are explicit.

## Checklist Items

1. - [ ] **Naming pattern enforcement** -- All events follow a single declared pattern (e.g., Object_Action or subject.verb).
   - Pass criteria: A regex or grammar rule is documented and every event name in the taxonomy matches it.
   - Fail signal: Multiple naming styles coexist; no formal pattern declared.
   - Action if fail: Declare the canonical pattern, retrofit non-compliant names, and publish the rule.

2. - [ ] **Verb standardisation** -- A controlled vocabulary of verbs is defined and no synonyms are used.
   - Pass criteria: A verb list exists (e.g., viewed, clicked, submitted, created); no event uses an unlisted verb.
   - Fail signal: Synonyms like "pressed" and "clicked" or "completed" and "finished" both appear.
   - Action if fail: Consolidate synonyms into canonical verbs and update affected events.

3. - [ ] **Property naming consistency** -- Properties use the same casing and delimiter rules as events and never collide across events.
   - Pass criteria: All properties follow documented casing (snake_case or camelCase); no two events use the same property name for different meanings.
   - Fail signal: Mixed casing across properties; semantic collisions detected (e.g., "plan" meaning subscription plan in one event and experiment plan in another).
   - Action if fail: Rename colliding properties with qualifying prefixes and enforce casing via linter.

4. - [ ] **Property type contracts** -- Each property has a declared type and the taxonomy specifies allowed values for enums.
   - Pass criteria: Type column filled for every property; enum properties list all valid values.
   - Fail signal: Types listed as "any" or "varies"; enum values undocumented.
   - Action if fail: Define strict types and enumerate valid values; add schema validation to ingestion pipeline.

5. - [ ] **Versioning scheme** -- The taxonomy includes a versioning policy that defines when a version bump occurs.
   - Pass criteria: Version rules documented (e.g., adding a required property = minor bump, renaming an event = major bump); current version number visible.
   - Fail signal: No version number; changes made in place without version tracking.
   - Action if fail: Introduce semantic versioning for the taxonomy and backfill a version log.

6. - [ ] **Backward compatibility rules** -- The taxonomy states how old consumers are supported when changes occur.
   - Pass criteria: Compatibility policy documented (e.g., old property names aliased for N days; breaking changes require migration window).
   - Fail signal: No compatibility policy; changes deployed without consumer notification.
   - Action if fail: Draft a compatibility policy with deprecation windows and consumer notification steps.

7. - [ ] **Event ownership** -- Every event has a named owner (team or individual) responsible for its accuracy.
   - Pass criteria: Owner column populated for every event; owners have acknowledged responsibility.
   - Fail signal: Owner column empty or set to a generic "engineering" label.
   - Action if fail: Assign specific owners per event and confirm via sign-off.

8. - [ ] **Namespace and grouping** -- Events are organised into logical groups or namespaces (e.g., onboarding, checkout, engagement).
   - Pass criteria: Every event belongs to exactly one namespace; namespace list documented with descriptions.
   - Fail signal: Events ungrouped or arbitrarily grouped without documented rationale.
   - Action if fail: Define namespace categories based on product domains and assign each event.

9. - [ ] **Reserved words and conflicts** -- The taxonomy lists reserved words that must not be used as event or property names.
   - Pass criteria: Reserved word list published (e.g., "event", "timestamp", "user_id"); no taxonomy entry uses a reserved word.
   - Fail signal: No reserved word list; conflicts with destination-tool reserved fields possible.
   - Action if fail: Compile reserved words from all downstream tools and check the taxonomy against them.

10. - [ ] **Discovery and searchability** -- The taxonomy is stored in a searchable, centralised location accessible to all teams.
    - Pass criteria: Taxonomy hosted in a tool (spreadsheet, schema registry, data catalogue) with search capability; URL shared in onboarding docs.
    - Fail signal: Taxonomy lives in a local file, a wiki page nobody can find, or multiple conflicting copies exist.
    - Action if fail: Migrate to a single searchable source and deprecate other copies.

11. - [ ] **Automated validation** -- A CI or ingestion-layer check validates incoming events against the taxonomy schema.
    - Pass criteria: Validation script or schema check exists; non-compliant events are logged or rejected.
    - Fail signal: No automated validation; compliance relies entirely on manual review.
    - Action if fail: Implement JSON Schema or equivalent validation at the ingestion layer.

12. - [ ] **Change review process** -- Taxonomy changes require a review from the taxonomy owner before merge.
    - Pass criteria: Pull-request or change-request workflow documented; recent changes show review approvals.
    - Fail signal: Changes committed without review; no approval trail.
    - Action if fail: Gate taxonomy file changes behind a required reviewer in the repository or document tool.

## Cross-References
- [Tracking Plan Quality Checklist](tracking-plan-quality.md)
- [Analytics Audit Quality Checklist](analytics-audit-quality.md)
- [Dashboard Quality Checklist](dashboard-quality.md)
