# Healthtech Benchmarks

## Overview

Healthtech analytics must balance product engagement metrics with clinical outcomes and regulatory compliance. Unlike consumer tech, "more engagement" is not always better — the goal is effective engagement that improves health outcomes. Benchmarks span digital health apps, telehealth platforms, remote patient monitoring, and clinical decision support. Sources include Rock Health, IQVIA, Evidation Health, and published clinical studies.

---

## Patient Engagement

### Digital Health App Engagement

| Metric | Bottom Quartile | Median | Top Quartile |
|--------|----------------|--------|--------------|
| D30 retention | 5% | 12% | 22% |
| Monthly active usage (of enrolled) | 20% | 35% | 55% |
| Average sessions per active user/week | 1.5 | 3.0 | 5.0 |
| Feature completion rate (care plan steps) | 25% | 45% | 65% |

Engagement in health apps typically follows a "motivation decay" curve that is steeper than consumer apps. Interventions (coaching messages, provider check-ins, incentives) at day 7, 14, and 30 can flatten the retention curve by 15-25%.

### Patient Portal Engagement

- Registration rate (of eligible patients): median 40-55%, top quartile 70%.
- Monthly active users (of registered): median 15-25%.
- Message utilization (patients who send at least one message): median 20-30%.
- Appointment scheduling via portal: median 10-20% of total appointments.

---

## Clinical Outcome Metrics

### Outcome Measurement Approaches

| Approach | Description | Typical Measurement Interval |
|----------|-------------|----------------------------|
| PROs (Patient-Reported Outcomes) | Self-reported health status, symptoms, quality of life | Baseline, 30, 90, 180 days |
| Clinical endpoints | Lab values, vital signs, hospitalizations | Per clinical protocol |
| Behavioral proxies | Medication adherence, exercise frequency, diet logging | Continuous |
| Utilization metrics | ER visits, hospitalizations, readmissions | 30, 90, 365 days |

### Clinical Benchmark Ranges

| Condition Area | Key Metric | Without Digital Intervention | With Digital Intervention |
|---------------|-----------|---------------------------|--------------------------|
| Diabetes (Type 2) | HbA1c reduction | 0.2-0.5% | 0.5-1.2% |
| Hypertension | BP reduction (systolic) | 2-5 mmHg | 5-12 mmHg |
| Mental health | PHQ-9 improvement | 2-4 points | 4-8 points |
| MSK (musculoskeletal) | Pain score reduction | 10-15% | 20-40% |
| Weight management | % body weight loss (12 wk) | 1-3% | 3-7% |

These ranges represent typical outcomes in clinical studies. Actual results depend heavily on program design, population acuity, and engagement intensity.

---

## Medication Adherence

### Adherence Rates by Condition

| Condition | Typical Adherence Rate | Digital Intervention Impact |
|-----------|----------------------|---------------------------|
| Hypertension | 50-60% | +10-20 percentage points |
| Diabetes | 55-65% | +10-15 percentage points |
| Mental health (SSRI) | 40-55% | +8-15 percentage points |
| Statins | 45-60% | +8-12 percentage points |
| Chronic pain | 50-65% | +5-10 percentage points |

Adherence measurement methods: pharmacy refill data (PDC - Proportion of Days Covered), self-report, smart pill bottle sensors, claims data. PDC >= 80% is the standard threshold for "adherent."

---

## Telehealth Utilization

### Utilization Metrics

| Metric | Pre-COVID Baseline | Current Median | Top Quartile |
|--------|-------------------|---------------|--------------|
| % visits via telehealth | 1-3% | 15-25% | 35-45% |
| No-show rate (telehealth) | — | 7-12% | 4-7% |
| No-show rate (in-person) | — | 15-22% | 10-15% |
| Patient satisfaction (telehealth) | — | 80-85% | 90%+ |
| Average visit duration | — | 12-18 minutes | 10-14 minutes |

Telehealth reduces no-show rates by 40-50% compared to in-person visits. This alone justifies investment in telehealth infrastructure for many practices.

### Appropriate Use Thresholds

Not all visits are appropriate for telehealth. Regulatory and clinical guidelines suggest telehealth is appropriate for: follow-up visits (85-90%), mental health (90-95%), medication management (80-85%), initial consultations (40-60%), acute care triage (50-70%).

---

## Regulatory Thresholds

### Key Compliance Metrics

| Metric | Regulatory Context | Threshold |
|--------|-------------------|-----------|
| HIPAA breach notification | HHS/OCR | Report within 60 days for breaches affecting 500+ individuals |
| Adverse event reporting | FDA (SaMD) | Report serious events within 30 days (or 5 days if remedial action needed) |
| Data retention | HIPAA | Minimum 6 years for covered entities |
| Audit trail completeness | 21 CFR Part 11 | 100% of data modifications must be logged |
| Uptime (for clinical tools) | Internal SLA | 99.9% for clinical decision support; 99.5% for patient-facing |

### FDA Software as Medical Device (SaMD)

Products that provide clinical decision support, diagnosis, or treatment recommendations may be regulated as SaMD. Key analytics considerations:
- Track clinical accuracy metrics (sensitivity, specificity, PPV, NPV) continuously.
- Monitor for algorithmic drift: model performance may degrade as population characteristics shift.
- Maintain version-controlled audit trails of all algorithm changes.

---

## Common Pitfalls

1. **Optimizing for engagement over outcomes.** More app opens do not equal better health. Measure clinical endpoints alongside engagement.
2. **Ignoring selection bias in outcome reporting.** Engaged patients have better outcomes regardless of the intervention. Use matched controls or RCTs.
3. **Treating HIPAA compliance as a one-time checkbox.** Compliance requires continuous monitoring, training, and audit.
4. **Benchmarking against consumer app retention.** Healthtech has fundamentally different usage patterns. A patient who uses a diabetes app 3x/week is highly engaged.
5. **Not measuring time-to-value for providers.** If clinicians spend more time on the platform than they save, adoption will fail regardless of patient outcomes.

---

## Cross-References

- **Health & Wellness Data Playbook** (`reference/industries/health-wellness-data-playbook.md`) — Full analytics playbook.
- **Privacy Regulations Summary** (`reference/standards/privacy-regulations-summary.md`) — HIPAA and data privacy.

---

*Version: 1.0 | Last updated: 2026-03-18*
