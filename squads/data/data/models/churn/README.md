# Churn Models

This subdirectory contains documentation, training reports, and performance tracking for churn prediction models.

## Purpose

Churn prediction models identify accounts at risk of leaving before they actually churn, enabling proactive intervention by customer success and product teams. This directory holds the technical details needed to understand, maintain, and improve these models.

## What Goes Here

- Model specification documents with feature descriptions and training methodology
- Training and validation reports with ROC curves, precision-recall analysis, and calibration plots
- Feature importance analyses explaining which signals are most predictive of churn
- Drift monitoring reports tracking model accuracy over time
- Threshold tuning analyses balancing false positive and false negative rates
- Integration documentation describing how predictions are surfaced to CS tools

## Conventions

- Name files with the model version and document type: `churn-v1-training-report.md`
- Always report both discrimination (AUC) and calibration metrics
- Track false positive rates closely since they determine CS team workload
- Retrain models at least quarterly or when performance degrades
- Document the operational definition of churn used for training labels
- Include segment-level performance breakdowns since churn patterns differ by plan tier
