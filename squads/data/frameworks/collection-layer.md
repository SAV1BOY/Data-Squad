# Collection Layer Framework

## Overview

The Collection Layer encompasses the data engineering infrastructure that moves data from its point of capture to its point of use. This includes data pipelines, schema management, data warehousing, freshness guarantees, and the engineering practices that ensure data arrives complete, timely, and structured for analysis.

For data squads, the collection layer is the plumbing. Nobody celebrates plumbing, but when it breaks, everything stops. The collection layer determines whether analysts can trust the data they query, whether dashboards reflect current reality, and whether the organization can make timely decisions.

## Origin

Data collection and engineering as a formal discipline emerged alongside the growth of data warehousing (Kimball and Inmon in the 1990s), the big data era (Hadoop, Spark in the 2000s-2010s), and the modern data stack (cloud warehouses, ELT patterns, dbt, Fivetran in the 2010s-2020s). The collection layer has evolved from batch ETL processes running overnight to near-real-time streaming architectures.

The principles, however, remain consistent: data must be moved reliably, structured meaningfully, and delivered on time. The tools change; the requirements do not.

## Key Concepts

### Data Pipeline Architecture

A data pipeline is an automated process that extracts data from a source, transforms it, and loads it into a destination. Core patterns:

**ETL (Extract, Transform, Load)** -- Data is transformed before loading into the warehouse. Traditional approach, suitable when transformations are complex and compute is expensive.

**ELT (Extract, Load, Transform)** -- Data is loaded raw into the warehouse, then transformed in place. Modern approach, leveraging the compute power of cloud warehouses. Enables iterative transformation and historical reprocessing.

**Streaming** -- Data flows continuously rather than in batches. Suitable for real-time dashboards, alerting, and time-sensitive applications. More complex to build and maintain than batch pipelines.

Most organizations use a hybrid: streaming for real-time needs, batch ELT for analytical workloads.

### Schema Management

Schema defines the structure of data. Schema management ensures:

- **Schema evolution** -- Adding new columns, changing types, and deprecating fields without breaking downstream consumers. Tools like schema registries (for streaming) and migration frameworks (for warehouses) manage this.
- **Schema enforcement** -- Rejecting or quarantining data that does not conform to the expected schema. Without enforcement, schema drift silently corrupts data.
- **Schema documentation** -- Every table and column has a description, data type, and known relationships. Maintained as code, not as a separate document.

### Data Freshness

Freshness measures how current the data is. Different use cases require different freshness:

- **Real-time** (seconds) -- Fraud detection, live dashboards, operational alerts
- **Near-real-time** (minutes) -- Operational dashboards, experiment monitoring
- **Daily** (hours) -- Most analytical dashboards, reporting
- **Weekly/Monthly** -- Strategic reviews, board reporting

The data squad must define freshness SLAs for each data product and build monitoring to ensure SLAs are met. Stale data without a freshness indicator is dangerous because consumers assume it is current.

### Data Quality Dimensions

Quality in the collection layer spans multiple dimensions:

- **Completeness** -- Are all expected records present? Missing data is the most common quality issue.
- **Timeliness** -- Did the data arrive on schedule?
- **Accuracy** -- Do the values reflect reality? Harder to verify but critical.
- **Consistency** -- Do the same entities have the same attributes across different tables and systems?
- **Uniqueness** -- Are duplicate records prevented or flagged?

### Idempotency and Reliability

Pipelines must be idempotent: running the same pipeline twice on the same input produces the same output. This enables safe retries after failures and prevents data duplication. Idempotency is achieved through:

- Deduplication logic (using unique event IDs)
- Partition-based loading (overwrite the entire partition, not append)
- Transaction semantics (all-or-nothing loads)

### Data Modeling

The collection layer includes the transformation of raw data into analytical models. Common approaches:

**Dimensional modeling (Kimball)** -- Fact tables (events, transactions) and dimension tables (users, products, dates). Optimized for analytical queries and understandable by business users.

**Wide tables / One Big Table (OBT)** -- Denormalized tables that combine facts and dimensions. Simpler to query but can become unwieldy.

**Metrics layer** -- A semantic layer that computes metrics from underlying models, ensuring consistent calculations across tools.

The choice depends on organizational maturity, data volume, and team skills. Dimensional modeling is the most proven approach for analytical workloads.

### Monitoring and Alerting

Pipeline monitoring should cover:
- **Execution status** -- Did the pipeline run successfully? If it failed, what was the error?
- **Row counts** -- Are the expected number of records present? Significant deviations indicate data loss or duplication.
- **Freshness** -- When was the data last updated?
- **Distribution** -- Have the statistical properties of key columns changed unexpectedly? (Sudden changes in null rates, value distributions, or cardinality)

## Application to Data Squad

### Pipeline Inventory

Maintain an inventory of all data pipelines with their sources, destinations, schedules, SLAs, and owners. This is the operational backbone for troubleshooting, capacity planning, and dependency management.

### Data Quality Tests

Implement automated data quality tests that run with every pipeline execution. Use tools like dbt tests, Great Expectations, or Soda to validate:
- Not-null constraints on critical fields
- Referential integrity between tables
- Accepted value ranges
- Row count thresholds
- Freshness thresholds

### Incident Response Process

Define an incident response process for data quality issues:
1. Detection (automated monitoring alerts)
2. Triage (severity assessment, impact scope)
3. Communication (notify affected consumers)
4. Resolution (fix the root cause)
5. Post-mortem (document lessons learned, prevent recurrence)

### Self-Service Access

Provide analysts and stakeholders with well-documented, well-modeled data assets that they can query without data engineering support. This requires investment in data modeling, documentation, and access control -- but it is the key to scaling the data team's impact.

### Cost Management

Cloud data infrastructure costs can grow rapidly. Monitor and optimize:
- Query costs (expensive queries by users or dashboards)
- Storage costs (unused tables, redundant copies)
- Pipeline compute costs (over-provisioned resources, unnecessary full refreshes)

### Environment Management

Maintain separate development, staging, and production environments for data pipelines. Changes should be tested in lower environments before reaching production, just like application code.

## Pitfalls

### Building Before Defining

Building pipelines before metric definitions are stable leads to rework. Invest in the definition layer first, then instrument, then collect. The temptation to "just get the data flowing" before knowing what data matters is strong and counterproductive.

### Over-Engineering

Building a real-time streaming architecture when daily batch would suffice. Building a complex medallion architecture when a simple star schema would work. Match the infrastructure to the actual requirements, not the aspirational ones.

### Undocumented Pipelines

Pipelines built by one engineer and understood by no one else are a risk. Every pipeline should have documentation, ownership, and at least one person besides the creator who understands it.

### Ignoring Data Contracts

As the number of data producers and consumers grows, implicit assumptions about data structure become dangerous. Formalize data contracts -- explicit agreements about schema, freshness, and quality -- between producers and consumers.

### Freshness Without Indicators

If the dashboard does not show when the data was last refreshed, consumers cannot assess whether they are looking at current information. Always display freshness metadata.

## Cross-References

- **instrumentation-layer.md** -- Instrumented events are the primary input to the collection layer
- **definition-layer.md** -- Definitions determine what data needs to be collected and how it should be modeled
- **analysis-layer.md** -- Well-collected data enables the analysis layer to function effectively
- **governance-layer.md** -- Data quality, access control, and cost management are governance concerns
- **davenport-competing-on-analytics.md** -- The DELTA model's "Data" dimension is directly about collection layer maturity
- **kohavi-online-experiments.md** -- Experiment data requires reliable collection infrastructure with specific freshness and quality requirements
