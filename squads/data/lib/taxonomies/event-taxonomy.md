# Event Naming Taxonomy

A standardized system for naming, structuring, and versioning analytics events across all platforms and products.

---

## Naming Convention

### Format: `{verb}_{noun}`

Events use past tense to indicate that the action has occurred.

| Component | Rules                                          | Examples                    |
|-----------|-------------------------------------------------|-----------------------------|
| Verb      | Past tense, lowercase, describes the user action | `viewed`, `clicked`, `completed`, `submitted`, `started` |
| Noun      | Singular, lowercase, describes the object acted upon | `page`, `button`, `form`, `purchase`, `onboarding` |

### Examples

| Event Name               | Description                                        |
|--------------------------|----------------------------------------------------|
| `viewed_page`            | User loaded a page                                 |
| `clicked_button`         | User clicked a UI button                           |
| `completed_purchase`     | User completed a purchase transaction              |
| `submitted_form`         | User submitted a form                              |
| `started_onboarding`     | User began the onboarding flow                     |
| `completed_onboarding`   | User finished the onboarding flow                  |
| `created_project`        | User created a new project                         |
| `invited_teammate`       | User sent a team invitation                        |
| `upgraded_plan`          | User upgraded their subscription plan              |
| `triggered_error`        | An error occurred during a user action             |

### Prohibited Patterns

| Pattern             | Why                                          | Use Instead              |
|---------------------|----------------------------------------------|--------------------------|
| `pageView`          | CamelCase is inconsistent                    | `viewed_page`            |
| `click`             | Not past tense; ambiguous without object     | `clicked_button`         |
| `user_signup`       | Noun-noun; no verb                           | `completed_signup`       |
| `homepage_view`     | Location in the name; use properties instead | `viewed_page` with `page_name: 'homepage'` |
| `btn_click_cta`     | Abbreviations are ambiguous                  | `clicked_button` with `button_name: 'cta_primary'` |

---

## Standard Properties

Every event must include these base properties:

### Required Properties (All Events)

| Property          | Type     | Description                                | Example                |
|-------------------|----------|--------------------------------------------|------------------------|
| `event_name`      | string   | The event name per naming convention        | `viewed_page`          |
| `event_timestamp` | datetime | When the event occurred (ISO 8601, UTC)     | `2026-02-14T14:30:00Z` |
| `user_id`         | string   | Authenticated user identifier (null if anonymous) | `usr_abc123`     |
| `anonymous_id`    | string   | Device/session identifier for anonymous users | `anon_xyz789`       |
| `session_id`      | string   | Session identifier                          | `sess_def456`          |
| `platform`        | string   | Client platform                             | `web`, `ios`, `android`|
| `app_version`     | string   | Application version                         | `3.2.1`                |
| `event_version`   | string   | Version of this event's schema              | `1.0`                  |

### Recommended Properties (When Applicable)

| Property          | Type     | Applicable Events           | Description                    |
|-------------------|----------|-----------------------------|--------------------------------|
| `page_name`       | string   | `viewed_page`               | Name of the page viewed        |
| `page_url`        | string   | `viewed_page`               | Full URL                       |
| `referrer_url`    | string   | `viewed_page`               | Previous page URL              |
| `button_name`     | string   | `clicked_button`            | Identifier for the button      |
| `form_name`       | string   | `submitted_form`            | Identifier for the form        |
| `item_id`         | string   | Commerce events             | Product or item identifier     |
| `revenue_amount`  | number   | `completed_purchase`        | Transaction amount             |
| `currency`        | string   | `completed_purchase`        | ISO 4217 currency code         |
| `error_type`      | string   | `triggered_error`           | Classification of the error    |
| `error_message`   | string   | `triggered_error`           | Human-readable error message   |
| `experiment_id`   | string   | All events during experiments | Active experiment identifier  |
| `variant_id`      | string   | All events during experiments | Assigned variant               |

---

## Event Categories

Group events into categories for organization and governance:

| Category        | Prefix Convention  | Examples                                        | Governance Level |
|-----------------|--------------------|-------------------------------------------------|------------------|
| Navigation      | `viewed_`, `navigated_` | `viewed_page`, `navigated_tab`              | Standard         |
| Interaction     | `clicked_`, `toggled_`, `selected_` | `clicked_button`, `toggled_setting` | Standard         |
| Lifecycle       | `started_`, `completed_`, `abandoned_` | `started_onboarding`, `completed_signup` | Strict    |
| Transaction     | `completed_`, `refunded_` | `completed_purchase`, `refunded_order`     | Strict           |
| System          | `triggered_`, `received_` | `triggered_error`, `received_notification` | Standard         |
| Engagement      | `shared_`, `rated_`, `reviewed_` | `shared_content`, `rated_product`     | Standard         |

**Governance levels:**
- **Strict:** Changes require data team review and approval. Breaking changes require a version bump.
- **Standard:** Changes require data team notification. New properties can be added without a version bump.

---

## Versioning Rules

### When to Version an Event

| Change                              | Version Bump | Action Required                         |
|--------------------------------------|-------------|------------------------------------------|
| Adding a new optional property       | No          | Document the addition in the changelog   |
| Adding a new required property       | Minor       | Update all clients; backfill if possible |
| Removing a property                  | Major       | Deprecation window (30 days minimum)     |
| Changing a property type             | Major       | Deprecation window                       |
| Changing the event name              | Major       | Create new event; deprecate old one      |
| Changing the meaning of a property   | Major       | Deprecation window                       |

### Version Format

Use `event_version` property: `MAJOR.MINOR`

- **v1.0:** Initial event definition.
- **v1.1:** Added optional `referrer_url` property.
- **v2.0:** Changed `revenue` from cents (integer) to dollars (float). Breaking change.

### Migration Process

1. Ship the new version alongside the old version.
2. Update consumers to read the new version.
3. After 30 days, stop sending the old version.
4. Document the migration in the event changelog.

---

## Event Catalog Entry

Every event must be registered in the event catalog:

| Field              | Value                                          |
|--------------------|------------------------------------------------|
| Event Name         | `completed_purchase`                           |
| Category           | Transaction                                    |
| Description        | Fired when a user completes a purchase         |
| Version            | 2.0                                            |
| Required Properties| event_name, event_timestamp, user_id, item_id, revenue_amount, currency |
| Optional Properties| coupon_code, payment_method, is_first_purchase |
| Platforms          | web, ios, android                              |
| Owner              | Commerce team                                  |
| Created            | 2025-06-01                                     |
| Last Modified      | 2026-01-15                                     |
