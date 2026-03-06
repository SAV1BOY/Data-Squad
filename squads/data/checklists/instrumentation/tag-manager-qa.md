# Tag Manager QA Checklist

## Purpose

Validate that Google Tag Manager (or equivalent SDK-based tag management) is correctly configured, tested, and deployed. This gate prevents broken events, version conflicts, and environment leaks from reaching production.

---

## Checklist Items

### 1. Event Inventory Matches Tracking Plan

- **Pass:** Every event in the tracking plan has a corresponding tag in GTM, and no orphan tags exist without a documented purpose.
- **Fail:** Events are missing from GTM, or tags exist that are not in the tracking plan.

### 2. Trigger Conditions Are Specific and Scoped

- **Pass:** Each trigger fires only on the intended page/action. Regex patterns, URL matches, and element selectors are validated against staging.
- **Fail:** Triggers use overly broad conditions (e.g., "All Pages" for a section-specific event) or fire on unintended routes.

### 3. Variable Extraction Is Accurate

- **Pass:** Data layer variables, DOM scraping variables, and custom JS variables return correct values verified via GTM Preview mode on at least three distinct user flows.
- **Fail:** Variables return undefined, wrong types, or stale values from previous page states.

### 4. Container Version Control Is Enforced

- **Pass:** Only named, annotated versions are published. The latest published version matches the version documented in the release log.
- **Fail:** Versions are published without names/notes, or the live version does not match the release record.

### 5. Environment Separation Is Active

- **Pass:** Dev, staging, and production environments use distinct GTM environment snippets. Tags with third-party pixels do not fire in non-production environments.
- **Fail:** Production container runs in staging, or staging-only tags leak into production.

### 6. Tag Firing Order and Dependencies Are Correct

- **Pass:** Tags that depend on prior data (e.g., enhanced ecommerce requires product data) use tag sequencing or firing priority. No race conditions observed in Preview mode.
- **Fail:** Dependent tags fire before their prerequisites, causing missing or null parameters.

### 7. Error Handling and Fallback Behavior

- **Pass:** Custom HTML tags include try/catch blocks. Tag failure does not block page rendering or other tags. Errors are logged to a monitoring endpoint.
- **Fail:** A single tag error cascades, blocks page load, or silently drops data without any alert.

### 8. Page Performance Impact Is Within Budget

- **Pass:** GTM container load adds less than 100ms to LCP on 75th percentile connections. Total tag execution time stays under 200ms.
- **Fail:** Container or tag execution exceeds performance budgets, causing visible UX degradation.

---

## Cross-References

- [Data Layer Contract QA](data-layer-contract-qa.md) -- Ensures the data layer feeding GTM variables is well-defined.
- [Consent Mode Tracking QA](consent-mode-tracking-qa.md) -- Tags must respect consent state before firing.
- [Server-Side Tracking QA](server-side-tracking-qa.md) -- Some tags may be migrated server-side; verify parity.
