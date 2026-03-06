# UTM Standardization Checklist

## Purpose

Enforce consistent UTM parameter usage across all marketing channels and teams. UTM chaos -- inconsistent naming, missing parameters, duplicate conventions -- is the single biggest source of broken attribution data. This gate eliminates it.

---

## Checklist Items

### 1. UTM Taxonomy Is Documented and Centralized

- **Pass:** A single reference document defines the allowed values for utm_source, utm_medium, utm_campaign, utm_term, and utm_content. It includes a naming convention (e.g., lowercase, hyphens for spaces, no special characters) and is accessible to every team that creates links.
- **Fail:** Multiple teams maintain their own conventions, or no documentation exists.

### 2. Naming Convention Is Enforced by Tooling

- **Pass:** A URL builder tool (spreadsheet, internal app, or UTM management platform) auto-generates UTM parameters from dropdowns or validated inputs. Free-text entry is blocked for source and medium fields.
- **Fail:** Marketers type UTM parameters manually into URLs, leading to variants like "facebook", "Facebook", "fb", "FB".

### 3. utm_source and utm_medium Map to a Controlled Vocabulary

- **Pass:** utm_source values correspond to specific platforms (e.g., "google", "meta", "linkedin", "newsletter"). utm_medium values use the GA4/standard channel grouping labels (e.g., "cpc", "email", "social", "referral"). No custom medium values are created without review.
- **Fail:** utm_medium contains values like "banner_ad_2024", "social_post", or campaign names leaking into the wrong parameter.

### 4. utm_campaign Follows a Consistent Structure

- **Pass:** Campaign names follow a template: {year}-{quarter}-{initiative}-{variant} or equivalent. The structure allows for automated parsing and grouping in analytics.
- **Fail:** Campaign names are ad-hoc ("spring_sale", "john_test", "final_v2") with no parseable structure.

### 5. Internal Links Do Not Carry UTMs

- **Pass:** Links within the product (in-app banners, notification links, cross-sell widgets) use a separate internal tracking parameter (e.g., itm_source) that does not overwrite the original acquisition UTMs in analytics tools.
- **Fail:** Internal navigation links carry utm parameters, overwriting the user's original acquisition source and breaking attribution.

### 6. UTM Parameter Persistence and Session Handling Are Validated

- **Pass:** The analytics platform is configured to handle UTM parameters correctly: last-click attribution updates on new UTMs, direct visits do not overwrite existing campaign data, and session timeout rules are documented.
- **Fail:** UTM handling logic is unknown, or direct visits clear the previous campaign attribution.

### 7. Audit Runs Monthly on Active UTM Values

- **Pass:** A monthly report extracts all unique utm_source/utm_medium/utm_campaign combinations seen in the last 30 days. Non-conforming values are flagged, traced to their creator, and corrected.
- **Fail:** No audit exists; garbage UTM values accumulate in reports unchecked.

### 8. UTM Data Feeds Downstream Systems Correctly

- **Pass:** UTM parameters captured at landing are correctly propagated to the CRM, data warehouse, and attribution models. A spot-check of 20 recent conversions confirms source/medium/campaign values match the original link.
- **Fail:** UTMs are captured on the website but lost when the lead enters the CRM, or values are truncated.

---

## Cross-References

- [Multi-Touch Attribution Sanity](multi-touch-attribution-sanity.md) -- Clean UTMs are the foundation of any attribution model.
- [Tag Manager QA](../instrumentation/tag-manager-qa.md) -- GTM must correctly capture and forward UTM parameters.
- [Metric Governance](../governance/metric-governance.md) -- UTM taxonomy is a governed data standard.
