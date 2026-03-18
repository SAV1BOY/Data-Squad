# Data Quality Triad: Completeness, Accuracy, Freshness

> Foundational data quality dimensions with operational monitoring

---

## Overview

The Data Quality Triad defines the three most critical dimensions of data quality for
analytics and decision-making: Completeness (is all expected data present?), Accuracy
(does the data reflect reality?), and Freshness (is the data current enough for the
decision at hand?). This framework provides definitions, measurement approaches, and
monitoring runbooks for each dimension, enabling data teams to move from reactive
firefighting to proactive quality management.

---

## When to Use

- When building or auditing a data quality monitoring system.
- When data consumers report "I don't trust the data" but cannot articulate why.
- When defining SLAs between data producers and data consumers.
- When onboarding a new data source and need to establish quality baselines.
- When investigating why a dashboard or model produced unexpected results.

---

## Core Concept

### The Three Dimensions

| Dimension       | Definition                                           | Key Question                   |
|-----------------|------------------------------------------------------|--------------------------------|
| **Completeness**| All expected records and fields are present          | Is anything missing?           |
| **Accuracy**    | Values correctly represent the real-world entity     | Is anything wrong?             |
| **Freshness**   | Data is available within the expected time window    | Is anything late?              |

### Why These Three?

Other quality dimensions exist (consistency, uniqueness, validity, etc.), but
Completeness, Accuracy, and Freshness are the minimum viable set. If data is complete,
accurate, and fresh, most analytical use cases are well-served. Failures in any one
dimension can invalidate decisions.

---

## Steps / Process

### Completeness

**Definition:** Every expected row and every expected field value is present.

**Types of Incompleteness:**
- Missing rows (events not captured, ETL dropped records).
- Missing fields (nulls, empty strings where values are expected).
- Missing time periods (a full day of data absent).

**Monitoring Approach:**
1. **Row count checks:** Compare row counts to expected baselines (historical average,
   source system count). Alert on deviations > X%.
2. **Null rate checks:** For critical columns, measure null/empty rates. Alert when
   null rate exceeds threshold.
3. **Schema checks:** Verify expected columns exist and have expected data types.
4. **Referential integrity:** Foreign keys resolve to valid records in parent tables.

**Runbook: Completeness Alert Fired**
1. Check the source system: is it generating data normally?
2. Check the ETL pipeline: did a job fail or produce partial output?
3. Check for schema changes in the source that broke the pipeline.
4. If data is recoverable, trigger a backfill. If not, document the gap and notify
   downstream consumers.

### Accuracy

**Definition:** Data values truthfully represent the real-world entities and events.

**Types of Inaccuracy:**
- Incorrect values (wrong amount, wrong timestamp, wrong category).
- Duplicate records (same event recorded twice).
- Stale references (customer moved but address not updated).

**Monitoring Approach:**
1. **Distribution checks:** Compare value distributions to historical baselines.
   Alert on sudden shifts in mean, median, variance, or percentiles.
2. **Cross-source reconciliation:** Compare totals between source systems and the
   data warehouse (e.g., billing system revenue vs. warehouse revenue).
3. **Duplicate detection:** Count records with identical natural keys.
4. **Business rule validation:** Apply domain rules (e.g., order amount > 0, end
   date > start date).
5. **Anomaly detection:** Statistical or ML-based anomaly detection on key metrics.

**Runbook: Accuracy Alert Fired**
1. Identify the specific records or values that are anomalous.
2. Trace back to the source system: is the source accurate?
3. Check for recent code changes in the ETL pipeline.
4. If the source is wrong, escalate to the source system owner.
5. If the pipeline introduced the error, fix and reprocess.

### Freshness

**Definition:** Data is available to consumers within the expected time after the
real-world event occurred.

**Measurement:**
- **Pipeline freshness:** Time between the last successful pipeline run completion and
  now.
- **Data freshness:** Max event timestamp in the table vs. current time.
- **End-to-end latency:** Time from event occurrence to availability in the
  consumer-facing system.

**Monitoring Approach:**
1. **Freshness SLA check:** Define an SLA for each table (e.g., "data no older than
   4 hours"). Alert when the SLA is breached.
2. **Pipeline completion monitoring:** Track ETL job completion times. Alert on jobs
   that have not completed by expected time.
3. **Staleness detection:** Check the max timestamp of each table on a schedule.

**Runbook: Freshness Alert Fired**
1. Check the pipeline scheduler: is the job running?
2. Check for upstream dependencies that are delayed.
3. Check compute resources: is the job running slowly due to resource contention?
4. If the delay is expected (maintenance window), communicate ETA to consumers.
5. If unexpected, investigate and resolve. Notify downstream consumers of the delay.

---

## Inputs / Outputs

### Inputs
| Input                          | Source                          |
|--------------------------------|---------------------------------|
| Source system metadata         | Source system owners             |
| Historical data profiles       | Data profiling tools             |
| SLA requirements               | Data consumers                  |
| Pipeline execution logs        | Orchestration tool (Airflow etc)|

### Outputs
| Output                         | Consumer                        |
|--------------------------------|---------------------------------|
| Quality monitoring dashboards  | Data team, data consumers       |
| Alert notifications            | On-call data engineer           |
| Quality incident reports       | Data governance team            |
| SLA compliance reports         | Leadership, data consumers      |

---

## Pitfalls

1. **Monitoring without action.** Alerts that fire but are ignored erode trust. Every
   alert must have an owner and a runbook.

2. **Binary quality.** Data quality is not "good" or "bad" -- it is a spectrum. Define
   acceptable thresholds for each dimension.

3. **Ignoring freshness requirements.** A perfectly accurate table that is 48 hours
   stale is useless for real-time decisions.

4. **Over-alerting.** Too many alerts cause alert fatigue. Tune thresholds to minimize
   false positives while catching real issues.

5. **Quality checks only at ingestion.** Data can degrade at any pipeline stage.
   Monitor at source, after transformation, and at the consumption layer.

6. **No ownership.** Every data asset needs a quality owner. Without ownership,
   nobody investigates alerts.

7. **Not communicating quality status.** Consumers need to know the current quality
   state. Embed quality indicators in dashboards and catalogs.

---

## Cross-References

- [RalphLoop Data Ops](ralphloop-data-ops.md) -- Quality gates within the data ops
  lifecycle.
- [Data Mesh Principles](data-mesh-principles.md) -- Domain ownership of data quality.
- [Experiment Framework](experiment-framework.md) -- Data quality is a prerequisite
  for trustworthy experiments.
- [Instrumentation Layer](instrumentation-layer.md) -- Where completeness and accuracy
  issues often originate.
- [Governance Layer](governance-layer.md) -- Organizational framework for quality
  management.

---

## Used By

| Task | Agents | Path |
|------|--------|------|
| analytics-audit | avinash-kaushik, data-chief | `tasks/analysis/analytics-audit.md` |
| data-quality-review | data-chief, avinash-kaushik | `tasks/review/data-quality-review.md` |
| data-pipeline-health-check | avinash-kaushik, data-chief | `tasks/operations/data-pipeline-health-check.md` |
| alert-threshold-calibration | avinash-kaushik | `tasks/operations/alert-threshold-calibration.md` |
| privacy-impact-assessment | data-chief, avinash-kaushik | `tasks/operations/privacy-impact-assessment.md` |

**Workflows:** data-quality-review, data-pipeline-health-check
