# NRR/GRR Definition and Reconciliation

## Purpose

Ensure Net Revenue Retention (NRR) and Gross Revenue Retention (GRR) are consistently defined, accurately calculated, and reconciled against financial records. Following Nick Mehta's emphasis on retention as the core SaaS health metric, this checklist prevents the common problem of different teams reporting different retention numbers from different definitions.

---

## Checklist Items

### 1. NRR and GRR Definitions Are Written and Shared
- **Pass:** Both NRR and GRR have formal written definitions including: the cohort definition, the time window, what counts as expansion, contraction, and churn, and how mid-period changes are handled. These definitions are accessible to all teams.
- **Fail:** Definitions are informal, vary by team, or live only in one analyst's head.

### 2. NRR and GRR Formulas Are Documented
- **Pass:** The exact formulas are documented: GRR = (Beginning ARR - Downgrades - Churn) / Beginning ARR. NRR = (Beginning ARR + Expansions - Downgrades - Churn) / Beginning ARR. Edge cases are specified.
- **Fail:** Formulas are assumed to be known but never written down, leading to inconsistent implementations.

### 3. Churn Definition Is Unambiguous
- **Pass:** "Churn" is precisely defined: is it contract cancellation, non-renewal, revenue dropping to zero, or below a threshold? The definition handles partial churn, pauses, and seasonal contracts.
- **Fail:** "Churn" means different things to sales (lost logo), finance (lost revenue), and CS (disengaged account).

### 4. Expansion Revenue Is Properly Attributed
- **Pass:** Expansion revenue (upsell, cross-sell, price increases, seat additions) is identified and attributed correctly. Timing rules are clear (e.g., expansion counts in the period the revenue starts).
- **Fail:** Expansion revenue is mixed with new business revenue, or price increases are conflated with organic expansion.

### 5. Contraction Is Separately Tracked
- **Pass:** Downgrades, seat reductions, and plan decreases are tracked separately from churn, allowing the team to distinguish between partial and total loss.
- **Fail:** Contraction is lumped with churn, making it impossible to tell whether customers are leaving entirely or just reducing usage.

### 6. Financial Reconciliation Is Performed
- **Pass:** The retention metrics produced by the CS or analytics team are reconciled against the finance team's revenue numbers at least quarterly. Discrepancies within 2% are acceptable; larger gaps are investigated.
- **Fail:** CS reports NRR of 115% while finance shows different numbers, and nobody investigates.

### 7. Cohort Timing Is Consistent
- **Pass:** The cohort window (monthly, quarterly, annual) is consistent across reports and time periods. If annual NRR is reported, the cohort basis is the same every year.
- **Fail:** Cohort definitions shift between reports, making trend analysis unreliable.

### 8. Logo Retention Is Tracked Alongside Revenue Retention
- **Pass:** Both logo (customer count) retention and revenue retention are reported together, revealing whether retention is concentrated (a few large accounts masking many small churns).
- **Fail:** Only NRR is reported, hiding that 30% of logos churned but were offset by expansion from remaining accounts.

### 9. Segmented Retention Is Available
- **Pass:** NRR and GRR are available by segment (customer size, industry, cohort vintage, product line) to identify pockets of weakness or strength.
- **Fail:** Only company-wide NRR/GRR is available, hiding segment-level problems.

### 10. Retention Metrics Are Reported to the Board
- **Pass:** NRR and GRR are standing items in board reporting with consistent definitions, trend data, and segment breakdowns.
- **Fail:** Retention metrics are internal-only, or they appear in board decks inconsistently with shifting definitions.

---

## Cross-References

- [Health Score Design](health-score-design.md) -- health scores should predict retention
- [CS Early Warning System](cs-early-warning-system.md) -- early warnings should prevent NRR decline
- [Expansion Playbook Audit](expansion-playbook-audit.md) -- expansion drives NRR above 100%
- [Mehta Customer Outcome Audit](mehta-customer-outcome-audit.md) -- customer outcomes drive retention
