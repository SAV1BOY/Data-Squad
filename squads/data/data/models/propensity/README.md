# Propensity Models

This subdirectory contains documentation and performance tracking for propensity models predicting user behaviors such as upgrade, feature adoption, or referral likelihood.

## Purpose

Propensity models predict the likelihood that a user will take a specific future action. These predictions enable targeted campaigns, personalized experiences, and efficient resource allocation by focusing efforts on users most likely to respond.

## What Goes Here

- Model specifications for each propensity type (upgrade, feature adoption, referral)
- Training data descriptions and label definitions
- Performance reports with lift charts and decile analyses
- A/B test results validating that propensity-targeted interventions outperform untargeted ones
- Use case documentation describing how each propensity score is consumed downstream
- Model refresh and retraining logs

## Conventions

- Name files with the propensity type and version: `upgrade-propensity-v1-specification.md`
- Clearly define the prediction target (what action, within what time window)
- Report lift over random selection at key percentiles (top 10%, top 20%)
- Validate propensity models with holdout experiments, not just offline metrics
- Document the business process that consumes each propensity score
- Flag models where the underlying user behavior pattern may be shifting
