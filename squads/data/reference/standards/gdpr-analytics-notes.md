# GDPR Impact on Tracking and Analytics

## Overview

The General Data Protection Regulation (GDPR) is the European Union's data protection law, effective since May 2018. It applies whenever you process personal data of individuals in the EU/EEA, regardless of where your company is based. For analytics teams, GDPR fundamentally changes how you collect, store, and use behavioral data.

## What Counts as Personal Data in Analytics

GDPR has a broad definition of personal data: any information relating to an identified or identifiable natural person.

**Clearly personal:**
- Email, name, phone number, address
- IP address (even dynamic IPs, per CJEU ruling)
- Cookie identifiers and device IDs
- User IDs that link to a profile

**Often overlooked as personal:**
- Client IDs in Google Analytics (the _ga cookie)
- Advertising identifiers (GAID, IDFA)
- Hashed or pseudonymized identifiers (still personal data under GDPR)
- Behavioral data that, combined with other data, could identify someone
- Location data at granular levels

**Not personal (and therefore not subject to GDPR):**
- Truly anonymous aggregate statistics where re-identification is not reasonably possible
- Data about companies (B2B), unless it relates to an individual within the company

## Legal Bases for Analytics

### Consent (Article 6(1)(a))

- Required for: third-party cookies, advertising pixels, cross-site tracking.
- Must be freely given, specific, informed, and unambiguous.
- Pre-ticked boxes do not constitute valid consent (Planet49 ruling).
- Cookie walls ("accept or leave") are generally not considered free consent.
- Consent must be as easy to withdraw as to give.

### Legitimate Interest (Article 6(1)(f))

- May apply to: first-party analytics, security logging, fraud detection.
- Requires a three-part test (Legitimate Interest Assessment):
  1. Is there a legitimate interest? (Yes, understanding product usage is legitimate.)
  2. Is the processing necessary for that interest? (Could you achieve the goal with less data?)
  3. Does it override the individual's rights? (Consider expectations, impact, safeguards.)
- Document your LIA. Regulators may ask for it.

### Contract Performance (Article 6(1)(b))

- Applies when analytics is genuinely necessary to provide the contracted service.
- Very narrow interpretation by regulators. "We want to improve the product" is not contract performance.

## Consent Implementation for Analytics

### Before Consent

When a user from the EU/EEA arrives and has not yet given consent:

1. No third-party cookies may be set.
2. No marketing/advertising pixels may fire.
3. GA4 in basic mode (consent mode with analytics_storage denied) can still collect aggregated, cookieless pings for modeling.
4. Essential cookies (authentication, security) may be set without consent.

### After Consent is Granted

1. Fire all consented tracking tags.
2. GA4 consent mode updates to analytics_storage granted.
3. Third-party pixels fire based on specific consent categories (analytics, marketing, personalization).
4. Record the consent: timestamp, policy version, categories consented to.

### After Consent is Withdrawn

1. Stop setting non-essential cookies.
2. Stop firing non-essential tracking.
3. Consider whether existing data must be deleted (depends on the legal base it was collected under).

### Google Consent Mode v2

Google requires consent mode v2 for ads serving in the EEA since March 2024:

- `ad_storage`: Controls advertising cookies.
- `analytics_storage`: Controls analytics cookies.
- `ad_user_data`: Controls sending user data to Google for ads.
- `ad_personalization`: Controls ad personalization.

Configure these in GTM with your CMP integration.

## Data Minimization in Practice

### What to Stop Collecting

Review your tracking plan and remove:

- Full IP addresses (GA4 anonymizes by default, but check other tools).
- Precise geolocation when city-level is sufficient.
- User-agent strings (collect parsed browser/OS instead).
- Form field contents in event tracking (accidental PII capture).
- Email addresses in URLs (common in email click tracking).
- Query parameters containing PII.

### What to Anonymize

- Truncate IPs to /24 (remove last octet).
- Hash user identifiers with a salt before sending to third-party tools.
- Strip PII from page URLs and referrers before they reach analytics.

### What to Aggregate

- If you only need counts, do not store individual events.
- Use data warehouse aggregation to create summary tables and drop raw event data after processing.

## Data Subject Rights and Analytics

### Right of Access (Article 15)

- Users can request all personal data you hold, including analytics data.
- You need to be able to export a user's event history from your analytics tools.

### Right to Erasure (Article 17)

- Users can request deletion of their personal data.
- This includes data in GA4, Mixpanel, Amplitude, your warehouse, backups, etc.
- GA4: Use the User Deletion API or the admin UI.
- Mixpanel: Use the GDPR API endpoints.
- BigQuery: Run DELETE statements on user-level tables.

### Right to Object (Article 21)

- Users can object to processing based on legitimate interest.
- If a user objects, you must stop processing unless you can demonstrate compelling legitimate grounds.

## International Data Transfers

Analytics data often flows to the US (Google, Amplitude, Mixpanel servers).

- Since Schrems II, transfers to the US require adequate safeguards.
- The EU-US Data Privacy Framework (DPF) provides a legal basis for transfers to DPF-certified companies.
- Standard Contractual Clauses (SCCs) are the fallback for non-DPF companies.
- Consider EU-based data residency options where available (GA4 does not currently offer this for all features).

## Tool-Specific GDPR Notes

| Tool | Key GDPR Feature | Action Required |
|------|------------------|-----------------|
| GA4 | Consent mode, data retention settings, User Deletion API | Configure consent mode, set retention to 2 months, enable IP anonymization |
| GTM | Consent-aware tag firing | Set up consent categories, block tags until consent |
| Mixpanel | EU data residency, GDPR API | Enable EU residency, implement deletion endpoints |
| Amplitude | EU data center option, user deletion | Use EU data center, configure retention |
| Segment | Privacy Portal, suppression | Implement user deletion and suppression flows |
| BigQuery | EU dataset location, column-level security | Store EU data in EU regions, encrypt PII columns |

## Cookie Audit Checklist

Perform this audit quarterly:

- [ ] List all cookies set by your site (use browser dev tools or a scanner).
- [ ] Categorize each cookie: strictly necessary, analytics, marketing, personalization.
- [ ] Verify no non-essential cookies are set before consent.
- [ ] Confirm consent banner accurately describes each cookie category.
- [ ] Test consent withdrawal flow end-to-end.
- [ ] Verify cookie lifetimes comply with ePrivacy guidelines (13 months max recommended).
- [ ] Check that third-party scripts respect consent signals.

## Common Pitfalls

1. **Server-side tracking to bypass consent.** GDPR regulates data processing, not the collection method. Server-side tracking still requires a legal base.
2. **Assuming GA4 is GDPR-compliant out of the box.** You must configure consent mode, retention, and possibly server-side tagging.
3. **Ignoring the ePrivacy Directive.** GDPR is about data processing; ePrivacy is about cookies/tracking specifically. Both apply.
4. **Not auditing third-party scripts.** Each marketing pixel you add is a data processor you are responsible for.
5. **Collecting data "for future use."** Data minimization means you should only collect what you currently need.
6. **Over-relying on anonymization claims.** If there is any reasonable possibility of re-identification, the data is still personal.

## Enforcement Examples

- **Google Analytics (Austria, France, Italy, 2022):** DPAs found GA (Universal Analytics) transfers to the US violated GDPR post-Schrems II.
- **Criteo (France, 2023):** EUR 40 million fine for failing to verify consent before processing data for advertising.
- **Meta (Ireland, 2023):** EUR 1.2 billion fine for EU-US data transfers without adequate safeguards.

These cases demonstrate that analytics and ad-tech are active enforcement areas. Take compliance seriously.
