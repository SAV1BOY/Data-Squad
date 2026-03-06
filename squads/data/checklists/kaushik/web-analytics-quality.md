# Web Analytics Quality

## Purpose

Ensure that web analytics data is trustworthy before anyone uses it for decisions. Bad data leads to confident wrong decisions, which is worse than no data at all. This checklist covers instrumentation integrity, bot filtering, data consistency, and governance.

---

## Checklist Items

### 1. Tracking Code Is Present on All Pages
- **Pass:** An automated scan (tag auditor or crawler) confirms the analytics tag fires on 100% of production pages, including dynamic and single-page-app views.
- **Fail:** Pages are missing tracking, or tag presence has not been verified in the last 30 days.

### 2. Bot and Spider Traffic Is Filtered
- **Pass:** Known bot filtering is enabled in the analytics platform. Custom filters exclude data-center traffic, headless browsers, and known crawler user agents. Bot traffic share is monitored.
- **Fail:** Bot filtering is off, or there is no monitoring of bot traffic percentage (healthy sites see 5-15% bot share; if it is 0% or 40%, something is wrong).

### 3. Internal Traffic Is Excluded
- **Pass:** Office IP ranges, VPN endpoints, and employee devices are excluded from production reports via filters or segments.
- **Fail:** Employee browsing inflates metrics, especially on low-traffic properties where internal traffic can be a significant share.

### 4. Event Tracking Is Consistent and Documented
- **Pass:** A tracking plan (spreadsheet or tool) documents every custom event: name, category, action, label, value, and trigger condition. Naming conventions are enforced.
- **Fail:** Events are added ad hoc with inconsistent naming (e.g., "click_CTA" vs. "cta_click" vs. "CTA Click"), making analysis unreliable.

### 5. Cross-Domain and Subdomain Tracking Works
- **Pass:** If the user journey spans multiple domains or subdomains, cross-domain tracking is configured and verified with test scenarios. Session continuity is confirmed.
- **Fail:** Domain boundaries break sessions, inflating session counts and misattributing conversions.

### 6. Data Sampling Is Understood and Managed
- **Pass:** The team knows when the analytics platform applies sampling, what the sample rate is, and uses unsampled exports or BigQuery when precision matters.
- **Fail:** Reports are based on sampled data without awareness, leading to incorrect conclusions on low-volume segments.

### 7. UTM and Campaign Tagging Is Governed
- **Pass:** A UTM taxonomy is documented and enforced. Source, medium, and campaign values follow a controlled vocabulary. A URL builder tool is used.
- **Fail:** UTMs are free-text, leading to duplicates (e.g., "facebook" vs. "Facebook" vs. "fb") and broken attribution.

### 8. Conversion Tracking Reconciles with Source Systems
- **Pass:** Web analytics conversion counts are periodically compared against backend systems (CRM, payment processor, order management) and discrepancies are within 5%.
- **Fail:** Analytics says 1,000 transactions but the backend shows 850, and nobody investigates the gap.

### 9. Data Retention and Privacy Compliance Are Addressed
- **Pass:** Data retention settings align with privacy policy. Consent management (cookie banner) is functional and respects user choices. PII is not sent to analytics.
- **Fail:** Analytics collects data without consent where required, or PII (emails, names) appears in URLs or custom dimensions.

### 10. Regular Data Quality Audits Are Scheduled
- **Pass:** A monthly or quarterly audit checks for anomalies: traffic spikes/drops, referral spam, broken events, and self-referrals. Findings are documented and fixed.
- **Fail:** Data quality is only investigated when someone notices a suspicious number in a report.

---

## Cross-References

- [DMMM Measurement Model Audit](dmmm-measurement-model-audit.md) -- the DMMM is only as good as the data feeding it
- [Metrics That Matter Filter](metrics-that-matter-filter.md) -- metrics need clean data to be trustworthy
- [See-Think-Do-Care Mapping](see-think-do-care-mapping.md) -- stage-specific tracking requires solid instrumentation
- [Dashboard Storytelling Audit](dashboard-storytelling-audit.md) -- dashboards built on dirty data tell the wrong story
