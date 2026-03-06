# Post-Mortem Pattern

A structured approach for conducting post-mortems on experiments, data incidents, and metric anomalies. Focuses on learning and prevention, not blame.

---

## Core Principles

1. **Blameless.** Post-mortems examine systems and processes, not individuals.
2. **Timely.** Conduct within 5 business days of the event while context is fresh.
3. **Action-oriented.** Every post-mortem must produce specific, assigned, time-bound actions.
4. **Shared.** Post-mortems are published to the team and accessible to the organization.

---

## Template

### Header

| Field              | Value                                      |
|--------------------|--------------------------------------------|
| **Title**          | _Short, descriptive title_                 |
| **Type**           | Experiment / Data Incident / Metric Anomaly|
| **Date of Event**  | _When it started_                          |
| **Date of Detection** | _When it was noticed_                   |
| **Date of Resolution** | _When it was fully resolved_            |
| **Severity**       | Low / Medium / High / Critical             |
| **Author**         | _Person who wrote the post-mortem_         |
| **Participants**   | _People involved in response and review_   |

### Executive Summary

Two to three sentences maximum. What happened, what was the impact, and is it resolved?

> On Feb 14, a deployment introduced a payment processing regression that caused a 2.3pp drop in checkout conversion for 4 hours, resulting in an estimated $42K in lost revenue. The issue was detected by automated alerting, rolled back within 38 minutes, and fully resolved. A permanent fix was deployed the following day.

### Timeline

Present in chronological order with timestamps:

| Time (UTC)  | Event                                              | Actor           |
|-------------|-----------------------------------------------------|-----------------|
| 14:22       | Deployment v2.4.1 pushed to production              | Deploy pipeline |
| 14:30       | Stripe timeout errors begin appearing in logs        | System          |
| 14:35       | Checkout error rate alert fires (threshold: 2.0%)    | Monitoring      |
| 14:38       | On-call engineer acknowledges alert                  | J. Smith        |
| 14:42       | Engineer identifies v2.4.1 as likely cause           | J. Smith        |
| 14:48       | Rollback decision made                               | J. Smith + Lead |
| 14:52       | Rollback initiated                                   | J. Smith        |
| 15:08       | Rollback complete; error rate returning to baseline  | System          |
| 15:30       | Incident declared resolved; post-mortem scheduled    | Lead            |
| Next day 10:00 | Permanent fix deployed with corrected timeout config | Payment team |

### Impact Assessment

| Dimension          | Measurement                                |
|--------------------|--------------------------------------------|
| Duration           | 38 minutes (detection to rollback complete)|
| Users Affected     | ~2,400 checkout attempts during the window |
| Failed Transactions| ~290 (12% of attempts)                     |
| Revenue Impact     | ~$42K estimated lost revenue               |
| Data Impact        | None; all events were logged correctly     |
| Customer Comms     | No external communication required         |

### Root Cause Analysis

Use the "5 Whys" technique:

1. **Why did checkout fail?** Stripe API calls were timing out.
2. **Why were they timing out?** The timeout configuration was changed from 10s to 1s.
3. **Why was the timeout changed?** A config refactor bundled the timeout change with unrelated updates.
4. **Why was the bundled change not caught?** The config change was not covered by existing tests.
5. **Why were there no tests?** Timeout values were treated as infrastructure config, not application logic.

**Root cause:** The timeout value was treated as infrastructure configuration and excluded from the application test suite, allowing a regression to pass code review and automated testing.

### Contributing Factors

- The config refactor PR was large (47 files) which made thorough review difficult.
- Staging environment does not simulate Stripe latency realistically (always responds in < 100ms).
- No integration test validates payment flow end-to-end with realistic latency.

### What Went Well

- Alerting detected the issue within 5 minutes.
- On-call engineer acknowledged and began investigation within 3 minutes.
- Rollback was executed cleanly and resolved the issue.
- All events were logged, so no data was lost.

### What Could Be Improved

- Detection could have been faster with a real-time error rate monitor (vs. 5-minute aggregation).
- The deploy-to-detection gap (8 minutes) could be shortened with canary deployments.
- The root cause was preventable with a test.

### Action Items

| Action                                          | Owner       | Deadline     | Priority |
|-------------------------------------------------|-------------|-------------|----------|
| Add integration test for payment timeout config | Payment team| 2026-03-01  | High     |
| Add Stripe latency simulation to staging env    | Platform    | 2026-03-15  | Medium   |
| Enforce max PR size (< 20 files) for config changes | Eng Lead | 2026-03-01 | Medium  |
| Reduce error rate alert window from 5min to 1min| Data team   | 2026-02-28  | High     |
| Implement canary deployments for payment service| Platform    | 2026-04-01  | Low      |

### Lessons Learned

Summarize in a format that can be shared broadly:

1. Configuration values that affect user-facing behavior should be tested like application code.
2. Large PRs reduce review effectiveness. Keep config changes in dedicated, small PRs.
3. Staging environments should simulate production conditions, including third-party latency.

---

## Post-Mortem for Experiments

When an experiment produces unexpected or negative results, use a lighter version:

| Section               | Content                                          |
|-----------------------|--------------------------------------------------|
| Hypothesis            | What we believed would happen                    |
| Actual Result         | What actually happened (with data)               |
| Why It Differed       | Root cause of the divergence from hypothesis     |
| What We Learned       | Insight gained, even from a negative result      |
| Next Steps            | Iterate, pivot, or abandon (with reasoning)      |
| Shared With           | Teams who should know about this learning        |

---

## Follow-Up Process

- Action items are tracked in the team's issue tracker with a `post-mortem` label.
- Post-mortem author checks action completion at the 30-day mark.
- Unresolved actions are escalated to the team lead.
- Post-mortems are reviewed in quarterly retrospectives to identify recurring themes.
