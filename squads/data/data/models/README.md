# Models

This directory contains documentation, specifications, and performance tracking for predictive and analytical models.

## Purpose

Models transform raw data into actionable predictions and scores. This directory holds the detailed documentation for each model including methodology, training data, performance benchmarks, and calibration history. The registries (clv-registry.yaml, cs-health-registry.yaml) provide the summary; this directory provides the depth.

## What Goes Here

- Model specification documents describing methodology, features, and assumptions
- Training and validation reports with performance metrics
- Calibration history and drift monitoring results
- Feature importance analyses and model interpretability documentation
- Model comparison reports when evaluating alternatives
- Deployment and integration documentation

## Subdirectories

- `clv/` - Customer Lifetime Value models and analyses
- `churn/` - Churn prediction models
- `propensity/` - Propensity models (upgrade, feature adoption, referral likelihood)

## Conventions

- Name files with the model name and version: `clv-v2-cohort-specification.md`
- Every model must document its assumptions, limitations, and known failure modes
- Track model performance over time with regular calibration checks
- When a new model version supersedes an old one, keep the old documentation for reference
- Include reproducibility information: training data snapshot, random seed, hyperparameters
- Flag any model that has not been recalibrated in the last 90 days for review
