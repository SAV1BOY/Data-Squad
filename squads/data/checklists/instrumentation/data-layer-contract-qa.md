# Data Layer Contract QA Checklist

## Purpose

Ensure the front-end data layer (window.dataLayer, custom event bus, or equivalent) adheres to a documented schema contract. This gate prevents silent schema drift, missing fields, and broken downstream consumers when front-end code changes.

---

## Checklist Items

### 1. Schema Is Documented and Versioned

- **Pass:** A machine-readable schema (JSON Schema, Protobuf, or equivalent) exists for every data layer event. The schema includes a version identifier, and historical versions are preserved.
- **Fail:** The data layer structure is only documented in wiki prose, or no versioning exists.

### 2. Required Fields Are Validated at Push Time

- **Pass:** A validation layer (runtime or build-time) checks that every dataLayer.push() call includes all required fields with correct types before the event reaches tag management.
- **Fail:** Invalid or incomplete pushes are silently accepted and forwarded to downstream tags.

### 3. Enum Values Are Controlled

- **Pass:** Fields with constrained values (e.g., page_type, event_category) use an enumeration defined in the schema. New values require a schema update and review.
- **Fail:** Free-text strings are used where enums should exist, leading to variant proliferation (e.g., "homepage", "home_page", "Home").

### 4. Naming Convention Is Consistent

- **Pass:** All event names and property keys follow a single naming convention (e.g., snake_case). The convention is enforced by linting in the CI pipeline.
- **Fail:** Mixed conventions exist across events (camelCase, snake_case, kebab-case) with no enforcement.

### 5. Breaking Changes Follow a Deprecation Process

- **Pass:** Removing or renaming a field triggers a deprecation period where both old and new fields are emitted. Downstream consumers are notified and given a migration window of at least two release cycles.
- **Fail:** Fields are removed or renamed without notice, breaking downstream tags or analytics.

### 6. Contract Testing Runs in CI

- **Pass:** Automated tests in the front-end CI pipeline validate that rendered pages emit the expected data layer events with correct structure. Tests cover at least the top 5 user flows.
- **Fail:** Data layer correctness is only verified manually or not tested at all.

### 7. Nullability and Default Values Are Explicit

- **Pass:** The schema explicitly states which fields are nullable and what default values apply when data is unavailable. Consumers handle nulls gracefully.
- **Fail:** Null or undefined values appear unexpectedly, causing downstream errors or miscounts.

### 8. Cross-Platform Parity Is Verified

- **Pass:** Web, mobile (iOS/Android), and any other client surfaces emit the same logical events with the same schema. Platform-specific fields are clearly marked.
- **Fail:** The same event has different structures or field names across platforms, causing fragmented reporting.

---

## Cross-References

- [Tag Manager QA](tag-manager-qa.md) -- GTM variables consume data layer fields; schema changes impact tag configuration.
- [Event Backfill and Migration](event-backfill-and-migration.md) -- Schema version changes may require backfilling historical data.
- [Metric Governance](../governance/metric-governance.md) -- Data layer fields often feed metric definitions; changes must be coordinated.
