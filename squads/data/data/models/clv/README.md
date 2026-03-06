# CLV Models

This subdirectory contains detailed documentation, training reports, and calibration history for Customer Lifetime Value models.

## Purpose

CLV models estimate the total revenue a customer will generate, enabling informed decisions about acquisition spending, segmentation, and customer success investment. This directory holds the technical depth behind the summary entries in clv-registry.yaml.

## What Goes Here

- Model specification documents with full methodology, feature lists, and assumptions
- Training and validation reports with performance metrics and diagnostics
- Calibration reports comparing predicted vs. actual CLV for matured cohorts
- Sensitivity analyses showing how CLV estimates change with key assumption shifts
- Model comparison reports when evaluating new approaches
- Implementation notes for how CLV scores are computed and delivered downstream

## Conventions

- Name files with the model version: `clv-v2-cohort-training-report.md`
- Document all assumptions explicitly; CLV models are only as good as their assumptions
- Recalibrate against actuals at least quarterly
- Track prediction accuracy by segment since aggregate accuracy can mask segment-level errors
- When deprecating a model version, document why and link to the replacement
