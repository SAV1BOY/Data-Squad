# Data Quality Remediation Pattern

A systematic process for handling data quality issues: detect, diagnose, fix, validate, and monitor. Designed to minimize the blast radius and prevent recurrence.

---

## The Five Phases

```
DETECT --> DIAGNOSE --> FIX --> VALIDATE --> MONITOR
```

---

## Phase 1: Detect

Data quality issues surface through multiple channels. Build detection into each:

### Automated Detection

| Method                     | What It Catches                          | Implementation                            |
|---------------------------|------------------------------------------|-------------------------------------------|
| Schema validation         | Missing columns, type changes, new unexpected columns | Run on every pipeline load           |
| Null rate checks          | Spike in null/missing values             | Alert if null rate exceeds historical P95 |
| Volume checks             | Row count anomalies (too many, too few)  | Alert if count deviates > 2 stddev from trailing 7-day avg |
| Freshness checks          | Stale data, late-arriving tables         | Alert if table not updated within SLA     |
| Distribution checks       | Value distribution shifts                | Compare current distribution to baseline using KS test or chi-squared |
| Uniqueness checks         | Duplicate primary keys                   | Assert uniqueness on key columns          |
| Referential integrity     | Orphaned foreign keys                    | Join check between fact and dimension tables |
| Range checks              | Values outside valid range               | Assert min/max boundaries on numeric fields |

### Human Detection

- Analyst notices "something looks off" in a dashboard.
- Stakeholder reports a number that contradicts their understanding.
- Data review during experiment analysis reveals inconsistencies.

**Rule:** All human-detected issues should be filed as incidents using the same intake process as automated detections, so they are tracked and resolved systematically.

---

## Phase 2: Diagnose

### Triage

Within 1 hour of detection, classify the issue:

| Severity | Criteria                                          | Response Time |
|----------|---------------------------------------------------|---------------|
| P0       | Affects L0/L1 metrics or revenue-critical systems | Immediate     |
| P1       | Affects L2 metrics or multiple dashboards          | Within 4 hours|
| P2       | Affects L3 metrics or single consumer              | Within 1 day  |
| P3       | Cosmetic or low-impact                             | Within 1 week |

### Root Cause Investigation

Use this diagnostic checklist:

| Check                              | How                                        | Common Findings                      |
|------------------------------------|--------------------------------------------|--------------------------------------|
| When did it start?                 | Compare data quality metrics over time      | Correlates with a deployment or config change |
| Is it source or transformation?    | Check raw data vs. transformed data         | Schema change at source              |
| Is it isolated or widespread?      | Check across segments, dimensions, time     | Only affects one region or platform  |
| Did anything change upstream?      | Review deploy logs, config changes, vendor updates | Third-party API change          |
| Is the pipeline running correctly? | Check orchestrator logs for errors or delays | Timeout or resource exhaustion      |
| Is it a known pattern?            | Check post-mortem archive for similar issues | Recurring issue with a known fix     |

### Impact Assessment

Document the blast radius:

| Dimension              | Assessment                                     |
|------------------------|------------------------------------------------|
| Time range affected    | _e.g., Data from Feb 10-14 is impacted_        |
| Tables affected        | _List all affected tables_                      |
| Metrics affected       | _List all metrics derived from affected tables_ |
| Dashboards affected    | _List dashboards showing incorrect data_        |
| Decisions at risk      | _Any decisions made using the bad data?_        |
| External exposure      | _Was bad data sent to customers, partners, or regulators?_ |

---

## Phase 3: Fix

### Fix Categories

| Fix Type            | When to Use                              | Approach                                |
|--------------------|------------------------------------------|------------------------------------------|
| Source fix          | The issue originated in the source system | Coordinate with the source team to fix and backfill |
| Pipeline fix       | Transformation logic is wrong             | Fix the transformation, reprocess affected data |
| Backfill           | Historical data is incorrect              | Run a targeted backfill for the affected time range |
| Manual correction  | Small, one-time issue                     | Apply a manual patch with full documentation |
| Exclusion          | Bad data cannot be corrected              | Exclude affected records and document the gap |

### Fix Execution Checklist

- [ ] Document the fix before applying it (what will change, what time range, what tables).
- [ ] Test the fix in a non-production environment if possible.
- [ ] Apply the fix during a low-traffic window if it affects live data.
- [ ] Notify downstream consumers that data will be reprocessed.
- [ ] Preserve the original (bad) data in a backup or audit table before overwriting.

---

## Phase 4: Validate

After the fix is applied, validate that the issue is resolved and no new issues were introduced.

### Validation Checks

| Check                              | Method                                      |
|------------------------------------|---------------------------------------------|
| Issue is resolved                  | Re-run the original detection check; it should pass |
| No regression                      | Run full data quality suite on affected tables |
| Metrics are correct                | Compare key metrics before and after fix against expected values |
| Downstream consumers are healthy   | Check dashboards and reports that consume the fixed data |
| Backfill is complete               | Verify row counts and value distributions for the backfilled time range |

### Sign-Off

The fix is not complete until:
1. The analyst who diagnosed the issue confirms the validation checks pass.
2. The metric owner confirms the metric values look correct.
3. The incident is updated with the resolution details.

---

## Phase 5: Monitor

Prevent recurrence by adding permanent monitoring:

### New Checks to Add

| What Happened                     | Monitoring to Add                            |
|-----------------------------------|----------------------------------------------|
| Schema changed at source          | Schema change detection alert                |
| Null rate spiked                  | Null rate threshold alert on the specific column |
| Duplicate records appeared        | Uniqueness assertion on primary key          |
| Volume dropped unexpectedly       | Volume anomaly detection with day-of-week seasonality |
| Values went out of range          | Range assertion with documented boundaries    |

### Post-Incident Actions

- [ ] File a post-mortem if severity was P0 or P1 (see post-mortem pattern).
- [ ] Add the root cause to the team's "known failure modes" document.
- [ ] Update runbooks with the diagnostic and fix steps.
- [ ] Schedule a review of related tables for similar latent issues.
- [ ] Communicate resolution to all affected stakeholders.

---

## Data Quality Incident Log

Maintain a running log of all data quality incidents:

| Date       | Severity | Description              | Root Cause         | Time to Detect | Time to Fix | Recurrence? |
|------------|----------|--------------------------|--------------------| ---------------|-------------|-------------|
| 2026-02-14 | P1       | Null user_ids in events  | SDK bug in v3.2    | 4 hours        | 8 hours     | No          |
| 2026-02-20 | P2       | Duplicate orders         | Retry logic error  | 1 day          | 2 hours     | Yes (3rd time)|
| 2026-03-01 | P0       | Revenue table not updated| Airflow OOM        | 15 min         | 45 min      | No          |

Review this log monthly to identify patterns and systemic improvements.
