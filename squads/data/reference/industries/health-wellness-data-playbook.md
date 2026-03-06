# Health & Wellness Data Playbook

## Overview

Health and wellness analytics operates at the intersection of clinical outcomes,
user engagement, regulatory compliance, and commercial viability. Data teams must
navigate strict privacy requirements (HIPAA, LGPD, GDPR), work with sensitive
personal health information, and measure outcomes that unfold over months or
years. The stakes are high — poor data can lead to bad health outcomes, not just
bad business decisions.

---

## Core Metrics

### Patient / User Outcome Metrics

**Clinical Outcome Measures:** Condition-specific metrics that track whether the
intervention is working. Examples:
- HbA1c reduction (diabetes management)
- PHQ-9 score change (mental health)
- BMI change (weight management)
- Blood pressure trends (cardiovascular health)

These metrics require careful statistical handling: regression to the mean,
selection bias (sicker patients are more likely to engage), and measurement
timing all affect interpretation.

**Patient-Reported Outcomes (PROs):** Self-reported health status, symptom
severity, quality of life, and functional capacity. PROs capture the patient
experience that clinical measures may miss. Standardized instruments (SF-36,
EQ-5D) enable benchmarking.

**Adherence Rate:** Percentage of users following the prescribed regimen
(medication, exercise, therapy sessions) over a defined period. Adherence is
the most common bottleneck in health interventions — a product that works
perfectly but has 20% adherence has 20% effectiveness.

### Engagement Metrics

**Active Days Per Week:** Number of days per week the user interacts with the
platform. In health apps, consistency matters more than intensity. Track the
distribution, not just the average — a user active 7 days in week 1 and 0
days in weeks 2-4 is not the same as one active 3 days per week consistently.

**Session Completion Rate:** Percentage of started health activities (workouts,
meditation sessions, therapy modules) that are completed. Partial completion
should be tracked separately — a user who completes 80% of a workout is very
different from one who opens the app and closes it.

**Feature Utilization by Outcome Impact:** Which features correlate with better
health outcomes? This is the critical analysis: not just what users use, but
what usage patterns predict better results.

### Business Metrics

**LTV (Lifetime Value):** Revenue per user over their lifetime on the platform.
In health/wellness, LTV has two components:
- Direct revenue (subscription, per-visit fees, co-pays)
- Indirect value (reduced healthcare costs for payers, employer productivity)

**Cost Per Outcome:** Total cost (acquisition, operations, clinical staff) divided
by number of users achieving a meaningful health outcome. This is the metric
that payers and employers care about most.

**Net Promoter Score (NPS):** In health, NPS correlates strongly with perceived
outcome improvement. Segment by condition, outcome achievement, and tenure.

### Regulatory Metrics

**Data Breach Incidents:** Number of security incidents involving protected
health information. Target: zero. Track near-misses as a leading indicator.

**Consent Compliance Rate:** Percentage of active users with valid, current
consent for data processing. Must be 100% — partial compliance is non-compliance.

**Regulatory Reporting Timeliness:** Percentage of required regulatory reports
submitted on time and without errors. Varies by jurisdiction and product
classification.

---

## Key Analytical Patterns

### Adherence Curve Analysis

Plot adherence over time from enrollment:
- When does the steepest drop-off occur? (typically weeks 2-4)
- What interventions (reminders, coaching, incentives) bend the curve?
- Do users who maintain adherence past a certain threshold have significantly
  better outcomes? (the "adherence cliff")
- Segment by condition severity, demographics, and acquisition channel.

### Outcome Attribution

The hardest analytical challenge in health: did the product cause the outcome,
or would the patient have improved anyway? Approaches:
- Propensity score matching against non-users (if data available)
- Dose-response analysis (do users who engage more have proportionally better
  outcomes?)
- Wait-list control designs (randomize timing of access)
- Pre-post analysis with appropriate controls for regression to the mean

### Payer Value Analysis

If selling to insurers, employers, or health systems, the data story must
demonstrate economic value:
- Reduction in emergency department visits
- Reduction in hospitalization days
- Reduction in medication costs
- Improvement in employee productivity / reduced absenteeism
- ROI calculation: savings generated vs. program cost

---

## Common Pitfalls

1. **Survivorship bias in outcome reporting.** Users who drop out (often the
   sickest or least motivated) are excluded from outcome analyses, making
   results look better than reality. Always report outcomes for the full
   enrolled population, not just completers.
2. **Confusing engagement with outcomes.** A user who logs meals every day
   but does not improve their diet is engaged but not benefiting. Engagement
   is a means, not an end.
3. **Regression to the mean.** Patients often enroll when symptoms are worst.
   Natural regression means some improvement would occur without intervention.
   Control for this in outcome analyses.
4. **Privacy violations in analytics.** Aggregating health data can still
   create re-identification risk in small populations. Apply k-anonymity or
   differential privacy when reporting on small cohorts.
5. **Ignoring social determinants.** Health outcomes are strongly influenced by
   socioeconomic factors. A product that works for affluent, tech-savvy users
   may fail for underserved populations. Segment outcomes by demographics.

---

## Cross-References

- **Retention Quality Checklist** (`checklists/retention-quality.md`) — Adherence is health-specific retention.
- **Activation Funnel Quality Checklist** (`checklists/activation-funnel-quality.md`) — Health onboarding funnels.
- **Experiment Design Quality Checklist** (`checklists/experiment-design-quality.md`) — Clinical study design parallels.
- **Base Rate Neglect** (`reference/psychology/base-rate-neglect.md`) — Critical in interpreting health outcome data.

---

*Version: 1.0 | Last updated: 2026-03-06*
