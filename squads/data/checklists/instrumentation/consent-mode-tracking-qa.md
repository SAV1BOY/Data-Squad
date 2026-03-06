# Consent Mode Tracking QA Checklist

## Purpose

Verify that consent management integration (Google Consent Mode, custom consent signals, or CMP-driven gating) correctly controls data collection, and that the team understands and compensates for data loss introduced by consent restrictions.

---

## Checklist Items

### 1. Consent State Is Accurately Detected

- **Pass:** The consent management platform (CMP) reliably communicates user consent state (granted, denied, not yet chosen) to the tag management layer. State is verified in GTM Preview mode or equivalent for all three states.
- **Fail:** Consent state is hardcoded, defaults to granted, or is not detected before tags fire.

### 2. Tags Respect Consent State Before Firing

- **Pass:** Analytics and advertising tags only fire when the corresponding consent category is granted. When denied, tags either do not load or fire in cookieless/consent-mode-restricted fashion per platform spec.
- **Fail:** Tags fire regardless of consent state, or all tags are blocked even when consent is granted for specific categories.

### 3. Consent Mode Parameters Are Correctly Set

- **Pass:** Google Consent Mode parameters (analytics_storage, ad_storage, ad_user_data, ad_personalization) reflect the user's actual choices. Default and update commands are both implemented.
- **Fail:** Parameters are missing, always set to "granted", or do not update when the user changes preferences.

### 4. Data Loss Is Quantified

- **Pass:** The team knows the consent opt-in rate by region and traffic source. The percentage of untracked sessions due to consent denial is measured and reported monthly.
- **Fail:** No one knows how much data is lost to consent, or the assumption is "it doesn't matter."

### 5. Modeling and Compensation Are Applied Where Appropriate

- **Pass:** Google's behavioral modeling (or equivalent statistical methods) is enabled to estimate conversions from unconsented users. Modeled data is clearly labeled in reports and not mixed with observed data without disclosure.
- **Fail:** No compensation is applied, or modeled data is presented as observed data without distinction.

### 6. Consent Banner UX Does Not Introduce Bias

- **Pass:** The consent banner loads before any tags fire. Banner placement, timing, and wording have been reviewed for dark pattern compliance and do not disproportionately affect specific user segments.
- **Fail:** The banner loads after tags have already fired, or the design manipulates users toward accepting.

### 7. Consent Preferences Are Persisted and Honored on Return

- **Pass:** Returning users' consent choices are stored (cookie, local storage, or server-side) and reapplied without re-prompting, unless legally required. Clearing cookies resets consent state correctly.
- **Fail:** Users are re-prompted every visit, or their previous denial is ignored on subsequent sessions.

### 8. Regional Compliance Variations Are Handled

- **Pass:** Consent behavior adapts to the user's jurisdiction (e.g., GDPR in EU, LGPD in Brazil, CCPA in California). Geo-detection is tested for accuracy with VPN-based verification.
- **Fail:** A single global consent configuration is applied regardless of jurisdiction, or geo-detection is absent.

---

## Cross-References

- [Tag Manager QA](tag-manager-qa.md) -- Tag firing logic must integrate with consent state.
- [Server-Side Tracking QA](server-side-tracking-qa.md) -- Server-side events must also carry consent signals.
- [LGPD Compliance Check](../security-privacy/lgpd-compliance-check.md) -- Consent is a core LGPD requirement.
- [PII Audit](../security-privacy/pii-audit.md) -- Consent scope must cover PII collection.
