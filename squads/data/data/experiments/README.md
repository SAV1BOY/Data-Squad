# Experiments

This directory contains experiment designs, analysis reports, and results for all A/B tests and controlled experiments.

## Purpose

Experimentation is the primary method for establishing causal relationships between product changes and metric outcomes. This directory holds the full lifecycle documentation for each experiment, from initial hypothesis through final results and learnings.

## What Goes Here

- Experiment design documents specifying hypothesis, metrics, sample size, and duration
- Pre-registration documents locking the analysis plan before results are observed
- Interim check reports (for monitoring, not early decision-making)
- Final analysis reports with statistical results and interpretation
- Post-experiment summaries documenting what was learned and what action was taken

## Subdirectories

- `backlog/` - Experiment ideas and proposals that have not yet started
- `running/` - Experiments currently in progress with their design documents
- `completed/` - Finished experiments with full analysis and results

## Conventions

- Name files with the experiment ID from the registry: `EXP-001-onboarding-simplification.md`
- Every experiment must have a design document before launch
- All experiments must run for a minimum of 14 days (see DEC-003)
- Move files between subdirectories as the experiment progresses through its lifecycle
- Record results in both this directory (detailed) and the experiment registry (summary)
- Even failed or inconclusive experiments must have a completed write-up documenting learnings
