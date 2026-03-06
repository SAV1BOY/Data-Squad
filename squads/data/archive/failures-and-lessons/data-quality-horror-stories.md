# Data Quality Horror Stories: When Bad Data Led to Bad Decisions

## Context

Data quality failures are the silent killers of data-driven organizations. Unlike experimentation errors (which are at least about the right data), data quality failures mean that the underlying data itself is wrong, incomplete, duplicated, or misleading. Decisions made on bad data are not just suboptimal -- they can be confidently, systematically wrong.

These failures are underreported because they are embarrassing, often discovered long after the damage is done, and difficult to attribute to specific business losses. This case study documents real patterns of data quality failure, their downstream consequences, and the systems that prevent them.

## What Happened

### Horror Story 1: The Timezone That Ate $2 Million in Ad Spend

**What happened:** A growth marketing team at a mobile gaming company was optimizing ad campaigns based on a real-time dashboard showing cost per acquisition (CPA) by hour and channel. The dashboard showed that their TikTok campaigns were dramatically outperforming other channels between 2am and 6am, with CPA 70% below average. The team shifted $2 million in monthly budget toward TikTok late-night placements.

**The data quality issue:** The attribution data from their mobile measurement partner used UTC timestamps, but the dashboard was displaying them labeled as the company's local timezone (PST). The "2am-6am" window in the dashboard was actually 10am-2pm UTC -- peak performance hours in Asian markets where TikTok had strong reach. The team was not discovering a late-night arbitrage opportunity; they were misreading the clock.

**The damage:** When the timezone error was discovered 6 weeks later, the team had overspent on misallocated campaigns while under-investing in channels and time slots that were genuinely underperforming. Estimated waste: $800,000 in suboptimal allocation.

**Root cause:** No automated validation that timestamp timezones were consistent across data sources. The engineer who built the pipeline used UTC; the analyst who built the dashboard assumed local time. Neither documented their assumption.

### Horror Story 2: The Duplicate Customers That Inflated CLV by 40%

**What happened:** A subscription e-commerce company calculated customer lifetime value as a core metric for acquisition budget decisions. The CLV model showed that their average customer was worth $340 over 24 months, justifying a CAC of up to $170. Based on this, they aggressively scaled paid acquisition.

**The data quality issue:** The customer database had a 23% duplication rate. When customers changed email addresses, moved, or used different payment methods, the system created new customer records. The CLV model was attributing a single loyal customer's purchases across 2-3 records, making each record appear less valuable but the "average" appear stable. More critically, the deduplicated reality showed that 30% of "customers" were actually return visits of existing customers counted as new acquisitions.

**The damage:** True CLV was approximately $240 (not $340), and true new customer acquisition was 30% lower than reported. The company had been overspending on acquisition by approximately $1.2 million per quarter, acquiring fewer genuinely new customers than their metrics suggested.

**Root cause:** No identity resolution system. Customer records were matched only on exact email address. No probabilistic matching on name, address, phone, or payment method.

### Horror Story 3: The Survivorship Bias in Churn Analysis

**What happened:** A SaaS company analyzed churn to identify its causes and build a predictive model. The data team pulled all customers who had been active for at least 6 months and analyzed which features they used, how often they logged in, and their support ticket patterns. The resulting model identified that customers who used Feature X were 50% less likely to churn.

**The data quality issue:** The analysis only included customers who survived 6 months. Customers who churned in the first 5 months -- a large and important group -- were excluded from the dataset entirely. Feature X was an advanced feature that only engaged, long-tenure customers used. The model was not detecting that Feature X prevented churn; it was detecting that customers who survive long enough to find Feature X are inherently less likely to churn.

**The damage:** The product team invested a quarter of engineering capacity into promoting Feature X during onboarding. New users were pushed toward a complex feature before they understood the basics. Onboarding completion rates dropped 15%, and 30-day churn actually increased.

**Root cause:** The analyst who pulled the data made an understandable but catastrophic sample selection error. There was no data review process to catch selection bias before the analysis influenced product decisions.

### Horror Story 4: The ETL Pipeline That Silently Dropped Records

**What happened:** A fintech company's daily ETL pipeline processed transaction data from their payment processor. For 11 months, the pipeline ran successfully every night, populating dashboards that showed steady revenue growth.

**The data quality issue:** A code change in month 3 introduced a bug in the error handling logic. Transactions that failed an API validation check (a timeout during enrichment) were silently dropped instead of being retried or logged. The drop rate was approximately 3-5% of daily transactions, varying with API response times. Higher traffic periods had more timeouts, meaning the busiest days had the worst data completeness.

**The damage:** Revenue was understated by approximately $4.7 million over 8 months. Forecasting models trained on the incomplete data underestimated growth trajectories. The company nearly paused a product expansion because projected revenue did not justify the investment -- but the projections were based on incomplete historical data.

**Root cause:** No row-count reconciliation between source and destination. No anomaly detection on daily record volumes. The ETL pipeline had error handling that suppressed errors rather than surfacing them.

### Horror Story 5: The A/B Test on Broken Tracking

**What happened:** A media company ran an A/B test on a new article recommendation widget. After 3 weeks, the treatment group showed a 12% increase in pages per session, a significant and exciting result. The team prepared to ship the feature.

**The data quality issue:** A quality-assurance analyst noticed that the treatment group also showed a 9% increase in average page load events per page -- not per session, per page. Investigation revealed that the new recommendation widget had a JavaScript bug that fired the page-view tracking event twice on some browsers. The "12% increase in pages per session" was actually a 12% increase in page-view events per session, driven by double-counting, not by actual increased reading.

**The damage:** Minimal, because the QA analyst caught the issue before launch. But the experiment had consumed 3 weeks of runtime and 2 weeks of engineering time, and the actual effect of the widget (with corrected tracking) was a non-significant 1.3% increase.

**Root cause:** No automated validation of tracking instrumentation before experiment launch. No comparison of client-side events to server-side page loads as a sanity check.

## Common Data Quality Failure Patterns

| Pattern | Mechanism | Detection Method |
|---|---|---|
| Timezone mismatches | Different systems use different timezone conventions | Cross-source timestamp comparison |
| Silent record loss | Pipelines drop records without logging | Source-destination row count reconciliation |
| Duplicate records | Poor identity resolution or ETL idempotency failures | Duplicate detection on key fields |
| Selection bias | Analysis excludes relevant subpopulations | Population completeness checks |
| Tracking instrumentation bugs | Events fire incorrectly (double-fires, missing events) | Automated event validation against expected patterns |
| Schema drift | Source schema changes break downstream processing | Schema change detection and alerting |
| Stale data | Pipelines fail silently and dashboards show old data | Freshness monitoring with alerts |
| Unit/currency mismatches | Different sources use different units or currencies | Automated range and distribution checks |

## Lessons

### 1. Data Quality Is Not a Technical Problem; It Is an Organizational Problem
Every horror story above involved a technical failure, but the root cause was organizational: missing processes, unclear ownership, insufficient review, or absent monitoring. Fixing data quality requires process and culture changes, not just better code.

### 2. Silent Failures Are Worse Than Loud Failures
A pipeline that crashes is annoying but safe -- someone will notice. A pipeline that runs successfully while producing wrong data is catastrophic because decisions are made on the wrong numbers with full confidence.

### 3. Row Counts Are the Most Underrated Quality Check
Simply comparing the number of records between source and destination at each pipeline stage catches a remarkable percentage of data quality issues. It is trivial to implement and should be the absolute minimum quality check.

### 4. Data Quality Checks Must Run Automatically and Continuously
Manual reviews catch errors weeks or months after they begin. Automated checks catch them on the day they start. The investment in automated data quality monitoring pays for itself within the first incident it catches.

### 5. Every Analysis Should Start with Data Validation
Before running any analysis, check: Is the data complete? Are the values in expected ranges? Are there unexpected nulls or duplicates? Is the sample representative? Spending 30 minutes on validation can save months of misdirected effort.

### 6. Track Data Quality as a Metric
Measure and report on data freshness, completeness, accuracy, and consistency. Make data quality visible to stakeholders so they can calibrate their trust in analytical outputs.

## Application to Data Squad

- **Implement automated data quality monitoring**: At minimum, monitor row counts, null rates, value distributions, and freshness for all critical data sources. Tools like Great Expectations, dbt tests, or Monte Carlo can automate this.
- **Require source-destination reconciliation**: Every pipeline should compare input and output record counts and alert on discrepancies above a threshold.
- **Build a data validation checklist for analysts**: Before any analysis, require validation of completeness, population representativeness, value ranges, and timestamp consistency.
- **Create a "data incident" process**: When data quality issues are discovered, document them with the same rigor as production outages. Track root cause, blast radius, and remediation.
- **Monitor tracking instrumentation continuously**: Compare client-side events to server-side records. Alert when ratios diverge from expected patterns.
- **Publish data quality scorecards**: For each major data source, publish a scorecard showing freshness, completeness, and known issues. This helps consumers calibrate their trust.
- **Treat timezone handling as a first-class concern**: Document the timezone convention for every data source and enforce consistency at the pipeline level.
