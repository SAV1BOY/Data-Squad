# Metric Scoring Rubric

A 1-5 scale rubric for evaluating metric quality across six dimensions. Use this to audit existing metrics, evaluate proposed metrics, and prioritize metric improvement work.

---

## Dimensions

### 1. Clarity of Definition

Can anyone in the organization understand what this metric measures without asking the owner?

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | No written definition exists. Meaning is tribal knowledge.              |
| 2     | Definition exists but is ambiguous or uses undefined terms.              |
| 3     | Definition is written clearly but omits edge cases or exclusions.        |
| 4     | Definition is clear, includes exclusions, and has examples.              |
| 5     | Definition is crystal clear, includes edge cases, examples, and a plain-language summary accessible to non-technical stakeholders. |

### 2. Actionability

Can a team take a specific action based on this metric's movement?

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | No one knows what to do when this metric changes.                       |
| 2     | Vague actions ("investigate further") but no specific playbook.          |
| 3     | Actions are defined for some thresholds (e.g., "if it drops below X, investigate"). |
| 4     | Clear actions for each threshold level, with owners and timelines.       |
| 5     | Automated action triggers, documented runbooks, and proven response playbook with historical effectiveness data. |

### 3. Data Quality

How reliable is the underlying data?

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | Data source is unknown or untrusted. No quality checks.                 |
| 2     | Data source is known but has frequent issues. Manual quality checks.     |
| 3     | Data source is generally reliable. Basic automated checks (nulls, volume). |
| 4     | Data source is reliable with comprehensive automated checks. Issues are rare and resolved quickly. |
| 5     | Data source is highly reliable with full lineage, automated checks, alerting, and documented SLAs. Quality incidents are post-mortem'd and learnings are applied. |

### 4. Ownership

Is there a clear, accountable owner?

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | No owner assigned. Nobody maintains the metric.                         |
| 2     | Owner is assigned on paper but does not actively maintain the metric.    |
| 3     | Owner actively monitors the metric and responds to issues.              |
| 4     | Owner monitors, maintains documentation, and communicates changes.       |
| 5     | Owner proactively reviews the metric quarterly, updates targets, communicates with stakeholders, and drives action on metric movements. |

### 5. Alignment

Does this metric connect to business objectives and the KPI tree?

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | Metric has no connection to any business objective. It exists "because we can." |
| 2     | Loose connection to a business objective but the relationship is not documented. |
| 3     | Metric is part of the KPI tree and its driver relationship is documented. |
| 4     | Metric is in the KPI tree with quantified sensitivity analysis (how much does it impact the parent?). |
| 5     | Metric is tightly integrated into the KPI tree, has quantified impact, is used in planning and target-setting, and has been validated against business outcomes. |

### 6. Accessibility

Can stakeholders find and use this metric easily?

| Score | Criteria                                                                 |
|-------|--------------------------------------------------------------------------|
| 1     | Metric is only available by asking an analyst to run a query.            |
| 2     | Metric is in a dashboard but the dashboard is hard to find or rarely updated. |
| 3     | Metric is in a well-maintained dashboard that stakeholders know about.   |
| 4     | Metric is in the catalog, easily discoverable, with self-serve breakdowns and filters. |
| 5     | Metric is in the catalog with self-serve access, automated delivery (email/Slack digests), and integrated into decision-making workflows (reviews, planning). |

---

## Scoring Summary

| Dimension          | Score (1-5) | Weight | Weighted Score |
|--------------------|-------------|--------|----------------|
| Clarity            |             | 20%    |                |
| Actionability      |             | 25%    |                |
| Data Quality       |             | 20%    |                |
| Ownership          |             | 10%    |                |
| Alignment          |             | 15%    |                |
| Accessibility      |             | 10%    |                |
| **Total**          |             |        | **/5.00**      |

### Interpretation

| Total Score | Grade | Interpretation                                              |
|-------------|-------|-------------------------------------------------------------|
| 4.5 - 5.0   | A     | Excellent. Model metric. Use as a reference for others.     |
| 3.5 - 4.4   | B     | Good. Minor improvements needed. Production-ready.          |
| 2.5 - 3.4   | C     | Adequate. Usable but has significant gaps to address.       |
| 1.5 - 2.4   | D     | Poor. Should not be relied upon for decisions until improved.|
| 1.0 - 1.4   | F     | Failing. Retire or rebuild from scratch.                    |

---

## Usage

- Score all L0 and L1 metrics quarterly.
- Score L2 and L3 metrics semi-annually.
- New metrics must score at least a B (3.5) before being added to production dashboards.
- Metrics scoring D or F should have an improvement plan or be deprecated (see metric deprecation pattern).
- Track scores over time to measure the health of the metric portfolio.
