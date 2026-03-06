# Server-Side Tracking QA Checklist

## Purpose

Validate that server-side tracking (Conversions API, server-side GTM, or custom HTTP forwarding) is reliable, deduplicated, and performant. This gate prevents double-counting, data loss, and unacceptable latency in server-to-server event pipelines.

---

## Checklist Items

### 1. Event Deduplication Is Functional

- **Pass:** A shared event ID is sent from both client-side and server-side paths. The destination platform (Meta CAPI, Google Ads, etc.) correctly deduplicates, verified by checking event match rates and total counts against a known baseline.
- **Fail:** The same conversion is counted twice, or dedup keys are missing/mismatched between client and server events.

### 2. User Match Quality Meets Platform Thresholds

- **Pass:** Event Match Quality (EMQ) or equivalent score is above platform-recommended minimums (e.g., EMQ >= 6.0 for Meta). Hashed PII fields (email, phone) are populated on at least 80% of authenticated events.
- **Fail:** EMQ is below threshold, or hashed identifiers are missing on most events, resulting in poor match rates.

### 3. End-to-End Latency Is Acceptable

- **Pass:** Server-side events arrive at the destination within 5 minutes of the user action under normal load. P95 latency is monitored and alerted.
- **Fail:** Events are delayed beyond the platform's attribution window, or latency is unmeasured.

### 4. Failure Handling and Retry Logic Exists

- **Pass:** Failed API calls are retried with exponential backoff. After max retries, events are written to a dead-letter queue for manual inspection. Retry storms are prevented with circuit breakers.
- **Fail:** Failed events are silently dropped, or retries run unbounded causing upstream pressure.

### 5. Payload Schema Matches Platform Specification

- **Pass:** Every required field per the destination API spec is present and correctly typed. Optional fields that improve match quality (e.g., fbp, fbc cookies) are included when available.
- **Fail:** Required fields are missing, types are wrong (e.g., sending string instead of float for value), or deprecated fields are still sent.

### 6. Throughput Is Tested Under Peak Load

- **Pass:** Load testing confirms the server-side endpoint handles at least 2x expected peak QPS without errors or queue buildup. Autoscaling triggers are validated.
- **Fail:** No load test has been run, or the system degrades under expected peak traffic.

### 7. Monitoring and Alerting Are Active

- **Pass:** Dashboards track event volume, error rate, latency, and match quality. Alerts fire when error rate exceeds 1% or volume drops more than 20% compared to the same hour last week.
- **Fail:** No monitoring exists, or alerts are not configured for key failure modes.

### 8. Data Parity Between Client and Server Paths

- **Pass:** A reconciliation report compares client-side and server-side event counts daily. Discrepancies above 5% trigger investigation.
- **Fail:** No reconciliation exists, or known discrepancies are ignored.

---

## Cross-References

- [Tag Manager QA](tag-manager-qa.md) -- Client-side tags must send the same event ID used for deduplication.
- [Consent Mode Tracking QA](consent-mode-tracking-qa.md) -- Server-side events must still respect user consent signals.
- [Event Backfill and Migration](event-backfill-and-migration.md) -- Migrating from client-only to server-side requires backfill planning.
