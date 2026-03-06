# CLV Modeling - Data Preparation

## Phase Objective

Transform raw transactional, behavioral, and demographic data into a clean, validated, feature-rich dataset ready for CLV model training. Data preparation is the most time-consuming phase of any modeling project and has the largest impact on model quality. Garbage in produces garbage out regardless of algorithm sophistication.

## Prerequisites

- Approved CLV brief from Phase 00 with defined use case, time horizon, and revenue components
- Access to all data sources identified in the data inventory
- SQL access to the data warehouse for extraction and transformation
- Understanding of the business rules that govern transactions (refunds, credits, free trials)
- Data quality assessment confirming minimum viability for modeling

## Steps

1. **Extract the Core Transaction Dataset**: Pull the complete transaction history for all customers within the analysis window. Each record should include customer identifier, transaction date, transaction amount, product or plan type, and transaction type (new purchase, renewal, upgrade, downgrade, refund). Verify that the extraction matches known financial totals by reconciling aggregate revenue against finance reports.

2. **Clean Customer Identifiers**: Ensure each customer has a single, stable identifier across all transactions. Resolve common issues: customers with multiple accounts, merged accounts where transaction history spans two IDs, and test or internal accounts that should be excluded. Build a customer ID mapping table that resolves all duplicates and aliases to a canonical identifier.

3. **Handle Data Quality Issues**: Address the specific quality issues identified in the brief phase. Remove or correct outlier transactions (negative amounts, impossibly large values, transactions on dates before the company existed). Handle missing values by determining whether they are missing at random or systematically. Flag and exclude customers with clearly erroneous data rather than imputing values that could distort the model.

4. **Apply Business Rules**: Implement the business logic that determines valid revenue. Subtract refunds and credits from the associated transactions. Handle free trials by determining whether trial-period activity counts toward CLV (it should not for revenue but may provide behavioral features). Apply proration rules for mid-cycle upgrades and downgrades. Ensure that revenue recognition timing matches the CLV definition agreed upon in the brief.

5. **Build RFM Features**: Calculate Recency (time since last transaction), Frequency (number of transactions in a defined period), and Monetary value (average transaction amount) for each customer. These three features form the foundation of most CLV models. Calculate variants such as time between transactions (inter-purchase time), frequency trend (is the customer buying more or less often), and monetary trend (is the average transaction value increasing or decreasing).

6. **Engineer Behavioral Features**: Create features from product usage and engagement data that may predict future value. Examples include login frequency, feature adoption breadth, time spent in product, support ticket volume, NPS scores, and referral activity. For each behavioral feature, calculate the value at a point-in-time that precedes the prediction window to avoid data leakage. Aggregate behaviors into meaningful windows (last 30 days, last 90 days, lifetime).

7. **Engineer Demographic and Firmographic Features**: Encode customer attributes such as industry, company size, geography, acquisition channel, and acquisition date. Handle categorical variables appropriately: one-hot encode low-cardinality categories, target-encode high-cardinality categories, and consider grouping rare categories into an "other" bucket. Convert date-based features into useful derivatives like customer tenure, day of week of first purchase, and season of acquisition.

8. **Create the Modeling Dataset**: Assemble the final dataset with one row per customer and columns for all features plus the target variable (actual CLV over the defined time horizon). Split the dataset into training, validation, and test sets using time-based splits rather than random splits. The training set should contain customers whose outcomes are fully observed, the validation set should contain the next time period, and the test set should contain the most recent period.

9. **Validate the Dataset**: Perform final validation checks on the assembled dataset. Verify that no future information leaks into feature calculations. Check feature distributions for anomalies. Confirm that the target variable distribution is reasonable (no impossible values, appropriate shape). Calculate summary statistics for all features and document the dataset's characteristics for reproducibility.

## Deliverables

- Cleaned transaction dataset with reconciliation against financial reports
- Customer ID mapping table resolving duplicates and aliases
- Data quality issue log with resolution actions taken
- Feature engineering documentation describing each feature's calculation and rationale
- Final modeling dataset with train/validation/test splits
- Dataset summary statistics report covering all features and the target variable
- Data dictionary defining every column in the modeling dataset

## Quality Gate

Data preparation is complete when all of the following conditions are met:

- Transaction data reconciles against finance-reported revenue within 2% tolerance
- Customer ID deduplication is complete with no remaining ambiguous records
- All business rules (refunds, credits, prorations) have been applied and validated
- RFM features, behavioral features, and demographic features are calculated and documented
- Train/validation/test split uses time-based boundaries with no temporal leakage
- No feature contains information from after the prediction window cutoff
- Dataset summary statistics show no anomalous distributions or impossible values
- The data dictionary is complete and every column is documented

## Next Phase

Proceed to **02-modeling.md** (Modeling) to select the appropriate CLV modeling method, fit the model, and validate its predictions.
