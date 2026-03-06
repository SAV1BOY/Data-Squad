# Event Naming Standard

## Purpose

Consistent event naming ensures reliable analytics, makes tracking plans understandable, and prevents data fragmentation. This standard applies to all product analytics events across all platforms (web, mobile, server-side).

## Naming Format

### Event Names

```
verb_noun
```

- Use `snake_case` for all event names.
- Start with a **verb** (what the user or system did).
- Follow with a **noun** (what was acted upon).
- Keep it to 2-4 words maximum.

### Approved Verbs

Use these standardized verbs consistently. Do not invent new verbs when an existing one applies.

| Verb | Meaning | Example Events |
|------|---------|---------------|
| `view` | User saw something (passive) | `view_page`, `view_product`, `view_dashboard` |
| `click` | User clicked a specific element | `click_cta`, `click_nav_item`, `click_banner` |
| `submit` | User submitted a form or input | `submit_signup_form`, `submit_payment`, `submit_search` |
| `start` | User began a process | `start_onboarding`, `start_checkout`, `start_trial` |
| `complete` | User finished a process | `complete_onboarding`, `complete_purchase`, `complete_lesson` |
| `add` | User added something | `add_to_cart`, `add_payment_method`, `add_team_member` |
| `remove` | User removed something | `remove_from_cart`, `remove_payment_method` |
| `create` | User created a new entity | `create_project`, `create_report`, `create_workspace` |
| `update` | User modified an existing entity | `update_profile`, `update_settings`, `update_subscription` |
| `delete` | User deleted an entity | `delete_project`, `delete_account` |
| `share` | User shared content | `share_report`, `share_link`, `share_invite` |
| `download` | User downloaded something | `download_report`, `download_app` |
| `upload` | User uploaded something | `upload_file`, `upload_avatar` |
| `search` | User performed a search | `search_product`, `search_help` |
| `filter` | User applied a filter | `filter_results`, `filter_dashboard` |
| `toggle` | User toggled a setting | `toggle_notification`, `toggle_dark_mode` |
| `dismiss` | User dismissed a prompt or modal | `dismiss_banner`, `dismiss_tooltip` |
| `error` | An error occurred | `error_payment`, `error_api`, `error_validation` |
| `receive` | System delivered something to user | `receive_notification`, `receive_email` |
| `expand` | User expanded a section | `expand_details`, `expand_sidebar` |
| `collapse` | User collapsed a section | `collapse_details`, `collapse_sidebar` |

### Nouns

- Use the singular form: `product`, not `products`.
- Use the most specific noun that is still general enough to be reusable: `signup_form` rather than `homepage_signup_form_v2`.
- Common nouns: `page`, `product`, `cart`, `order`, `subscription`, `profile`, `settings`, `notification`, `report`, `project`, `workspace`, `file`, `search`, `result`.

## Event Properties

### Property Naming

- Use `snake_case` for all property names.
- Be descriptive: `product_name`, not `name`; `button_location`, not `location`.
- Use consistent property names across events. If `product_id` appears in one event, use `product_id` (not `item_id` or `sku`) in all events.

### Standard Properties (Include on Every Event)

| Property | Type | Description |
|----------|------|-------------|
| `event_timestamp` | ISO 8601 string | When the event occurred (UTC) |
| `user_id` | string | Authenticated user identifier (null if anonymous) |
| `anonymous_id` | string | Device/session identifier for anonymous users |
| `session_id` | string | Current session identifier |
| `platform` | enum | `web`, `ios`, `android`, `server` |
| `app_version` | string | Application version (semver) |
| `page_url` | string | Current page URL (web only, strip PII from query params) |
| `screen_name` | string | Current screen name (mobile only) |

### Common Optional Properties

| Property | Type | When to Include |
|----------|------|-----------------|
| `product_id` | string | Any product-related event |
| `product_name` | string | Any product-related event |
| `product_category` | string | Any product-related event |
| `product_price` | number | Any event involving product price |
| `currency` | string (ISO 4217) | Any event involving money |
| `order_id` | string | Any order-related event |
| `order_total` | number | Purchase and checkout events |
| `quantity` | integer | Cart and purchase events |
| `search_query` | string | Search events |
| `search_results_count` | integer | Search result events |
| `referrer` | string | Navigation and landing events |
| `utm_source` | string | Campaign-attributed events |
| `utm_medium` | string | Campaign-attributed events |
| `utm_campaign` | string | Campaign-attributed events |
| `experiment_id` | string | Events during an active experiment |
| `variant_id` | string | Events during an active experiment |
| `button_text` | string | Click events |
| `button_location` | string | Click events (e.g., `header`, `sidebar`, `footer`) |
| `error_message` | string | Error events |
| `error_code` | string | Error events |

### Property Value Conventions

- **Enums:** Use lowercase snake_case: `credit_card`, `bank_transfer`, `pix`.
- **Booleans:** Use `true`/`false`, not `0`/`1` or `yes`/`no`.
- **Currency amounts:** Always in the smallest currency unit (cents) as integers, OR as decimal with exactly 2 places. Document which convention you use and be consistent.
- **Timestamps:** Always ISO 8601 in UTC: `2025-03-15T14:30:00Z`.
- **IDs:** Always strings, even if they look numeric, to prevent type coercion issues.
- **Null vs. absent:** If a property does not apply, omit it entirely. Do not send `null` or empty strings.

## Event Categories

Organize events into logical categories for easier management in your tracking plan:

| Category | Description | Example Events |
|----------|-------------|---------------|
| **Lifecycle** | Account creation, authentication | `create_account`, `complete_login`, `start_trial` |
| **Navigation** | Moving through the product | `view_page`, `click_nav_item`, `search_product` |
| **Engagement** | Core product interactions | `create_project`, `share_report`, `upload_file` |
| **Commerce** | Purchasing and transactions | `add_to_cart`, `start_checkout`, `complete_purchase` |
| **Subscription** | Subscription management | `start_trial`, `update_subscription`, `complete_cancellation` |
| **Growth** | Invitations, referrals, sharing | `share_invite`, `complete_referral` |
| **System** | Errors, notifications, background | `error_payment`, `receive_notification` |

## Platform-Specific Rules

### Web

- `view_page` fires on every route change (SPA) or page load (MPA).
- Include `page_url`, `page_title`, and `referrer`.
- Strip PII from URLs before sending (email addresses in query params, etc.).

### Mobile (iOS / Android)

- `view_screen` fires on every screen appearance.
- Include `screen_name` and `screen_class`.
- Track `app_open` and `app_background` for session analysis.
- Include `os_version` and `device_model` as user properties, not event properties.

### Server-Side

- Use for events that do not originate from user interaction: `complete_payment` (webhook), `receive_subscription_renewal`.
- Always include the `user_id`. Server-side events without a user association are rarely useful.
- Set `platform` to `server`.

## Versioning

- Do NOT version event names: `complete_purchase_v2` is forbidden.
- If an event's meaning changes, create a new event with a new name and deprecate the old one.
- If only properties change, update the tracking plan and add a changelog entry.
- Old events remain in the warehouse but are excluded from new analyses after deprecation.

## Anti-Patterns

| Bad | Problem | Good |
|-----|---------|------|
| `pageView` | camelCase, generic | `view_page` |
| `btn_click` | Abbreviation, no noun context | `click_cta` |
| `user_did_something` | Vague | `complete_onboarding` |
| `Homepage - Banner Click` | Spaces, dashes, page-specific | `click_banner` with `page_location: homepage` |
| `purchase` | No verb | `complete_purchase` |
| `addToCartClicked` | camelCase, redundant "clicked" | `add_to_cart` |
| `event_v3_final_FINAL` | Versioned, chaotic | `submit_order` with proper docs |
| `track_everything` | Kitchen-sink event | Separate specific events |

## Implementation Checklist

- [ ] Event names follow `verb_noun` format in `snake_case`.
- [ ] Only approved verbs are used (or new verbs are proposed and approved).
- [ ] Standard properties are included on every event.
- [ ] Property values follow the value conventions.
- [ ] No PII is included in event properties (or it is flagged and handled per privacy standards).
- [ ] Events are documented in the tracking plan with description, properties, and example payload.
- [ ] QA has verified events fire correctly on all platforms.
- [ ] New events are reviewed by the analytics team before shipping to production.
