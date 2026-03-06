# Retention Quality Checklist

## Purpose

This checklist ensures retention analyses are methodologically sound, distinguish
between churn types, and produce actionable insights rather than misleading
curves. Retention is the single most important long-term health metric for any
product — sloppy retention analysis leads to misallocated resources and false
confidence. Use this before presenting retention data, building churn models,
or designing retention interventions.

## When to Use

- Before presenting cohort retention curves to leadership
- When building or validating churn prediction models
- During quarterly retention reviews
- Before designing retention intervention programs
- When comparing retention across segments or products

---

## Checklist Items

### 1. Churn Types Are Explicitly Defined and Separated
- **Pass:** Voluntary churn (cancellation), involuntary churn (payment failure), and dormant churn (inactivity) are tracked and reported separately.
- **Fail:** All churn is lumped into a single number, hiding the root causes and appropriate interventions.

### 2. Survival Curves Are Constructed Correctly
- **Pass:** Kaplan-Meier or equivalent survival analysis is used, right-censoring is handled for users still active, and confidence intervals are shown.
- **Fail:** Simple percentage-remaining calculations are used without accounting for censoring, or confidence intervals are absent.

### 3. Cohort Curves Are Compared on Equal Footing
- **Pass:** Cohorts are aligned by tenure (not calendar date), sample sizes are noted, and only cohorts with sufficient maturity are compared.
- **Fail:** Immature cohorts are compared to mature ones, or cohorts of vastly different sizes are presented side-by-side without caveat.

### 4. Retention Window Is Appropriate for the Product
- **Pass:** The retention time unit (daily, weekly, monthly) matches the product's natural usage frequency. A monthly SaaS tool uses monthly retention, not daily.
- **Fail:** Daily retention is used for a product with weekly natural usage, creating artificially alarming drop-off curves.

### 5. Retention Drivers Are Identified with Causal Reasoning
- **Pass:** Correlational findings (e.g., "users who use feature X retain better") are tested for causality via experiments or quasi-experimental methods before being called "drivers."
- **Fail:** Correlations are presented as causal drivers without acknowledging selection bias (power users both use features and retain).

### 6. Churn Prediction Model Is Validated on Holdout Data
- **Pass:** The model is evaluated on out-of-time holdout data with precision, recall, and calibration metrics reported.
- **Fail:** Model accuracy is reported only on training data, or only AUC is shown without calibration analysis.

### 7. Interventions Are Tied to Specific Churn Segments
- **Pass:** Each retention intervention targets a specific churn type and user segment, with a clear hypothesis for why it will work.
- **Fail:** Generic "engagement" campaigns are proposed for all churning users regardless of churn reason.

### 8. Resurrection and Reactivation Are Tracked Separately
- **Pass:** Users who return after churning are tracked as a separate category, and their subsequent retention is monitored.
- **Fail:** Resurrected users are mixed back into active cohorts, artificially inflating retention curves.

### 9. Net Revenue Retention Is Reported Alongside Logo Retention
- **Pass:** Both user-count retention and revenue retention (including expansion/contraction) are presented for a complete picture.
- **Fail:** Only logo retention is shown, hiding revenue concentration risk or expansion revenue gains.

### 10. Benchmarks Are Industry- and Stage-Appropriate
- **Pass:** Retention benchmarks come from comparable companies (same industry, stage, business model) and sources are cited.
- **Fail:** Generic benchmarks are used ("good retention is 40% at month 1") without context for the specific business.

---

## Cross-References

- **Activation Funnel Quality Checklist** (`activation-funnel-quality.md`) — Poor activation is the leading cause of early churn.
- **LTV/CLV Model Quality Checklist** (`ltv-clv-model-quality.md`) — Retention curves are a core input to CLV models.
- **Experiment Design Quality Checklist** (`experiment-design-quality.md`) — Use when testing retention interventions.
- **Sunk Cost in Experiments** (`reference/psychology/sunk-cost-in-experiments.md`) — Avoid continuing failed retention programs due to sunk cost.
- **SaaS Data Playbook** (`reference/industries/saas-data-playbook.md`) — Industry-specific retention benchmarks and patterns.

---

*Version: 1.0 | Last updated: 2026-03-06*
