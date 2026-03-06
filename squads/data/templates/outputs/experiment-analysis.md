# Experiment Results Analysis

> Use this template to document the statistical analysis of an experiment.
> This is the analytical companion to the experiment one-pager.

---

## 1. Experiment Summary

**Experiment:** [Title]
**ID:** [EXP-YYYY-NNN]
**Analyst:** [Name, Team]
**Analysis Date:** [YYYY-MM-DD]
**Run Period:** [Start date] to [End date] ([# days])
**Verdict:** [Winner / No Winner / Inconclusive / Killed]

_Example:_
**Experiment:** Onboarding Progress Bar
**ID:** EXP-2026-014
**Analyst:** Sarah Kim, Product Analytics
**Analysis Date:** 2026-03-06
**Run Period:** 2026-02-10 to 2026-03-03 (21 days)
**Verdict:** Winner - Treatment outperformed on primary metric, no guardrails breached

---

## 2. Sample and Validity Checks

| Check                        | Result        | Pass? |
|------------------------------|---------------|-------|
| Total sample size            | [e.g., "6,842 users (3,418 control / 3,424 treatment)"]| [Yes/No]|
| Sample ratio mismatch (SRM)  | [e.g., "p=0.94, ratio 49.96/50.04"]| [Yes/No]|
| Minimum sample reached       | [e.g., "Target 3,200/arm, achieved 3,418/arm"]| [Yes/No]|
| Minimum duration met         | [e.g., "21 days >= 14-day minimum"]| [Yes/No]|
| Pre-experiment balance       | [e.g., "No significant differences in pre-period metrics"]| [Yes/No]|

_Example:_

| Check                        | Result                                      | Pass? |
|------------------------------|---------------------------------------------|-------|
| Total sample size            | 6,842 users (3,418 control / 3,424 treatment)| Yes  |
| Sample ratio mismatch (SRM)  | p=0.94, ratio 49.96% / 50.04%              | Yes   |
| Minimum sample reached       | 3,418 per arm (target: 3,200)               | Yes   |
| Minimum duration met         | 21 days (target: 14 days)                    | Yes   |
| Pre-experiment balance       | No significant pre-period differences (all p>0.3) | Yes |

---

## 3. Primary Metric Results [REQUIRED]

**Metric:** [Name]
**Statistical Method:** [e.g., "Two-proportion z-test" or "Welch's t-test"]

| Variant    | Value     | Lift vs Control | 95% CI            | p-value | Significant? |
|------------|-----------|-----------------|--------------------|---------|--------------|
| Control    | [value]   | --              | --                 | --      | --           |
| Treatment  | [value]   | [+/- %]         | [lower, upper]     | [p]     | [Yes/No]     |

_Example:_

| Variant    | Value  | Lift vs Control | 95% CI           | p-value | Significant? |
|------------|--------|-----------------|-------------------|---------|--------------|
| Control    | 67.8%  | --              | --                | --      | --           |
| Treatment  | 74.1%  | +6.3pp (+9.3%)  | [+3.8pp, +8.8pp] | 0.0003  | Yes          |

**Interpretation:** [Plain-language summary of the result]

_Example:_
**Interpretation:** The progress bar treatment increased onboarding completion rate by 6.3 percentage points (from 67.8% to 74.1%), statistically significant at p=0.0003. The 95% confidence interval [+3.8pp, +8.8pp] is entirely above our MDE of +5pp, giving us high confidence this is a meaningful improvement.

---

## 4. Secondary Metric Results

| Metric                    | Control  | Treatment | Lift        | 95% CI            | p-value | Significant? |
|---------------------------|----------|-----------|-------------|--------------------|---------|--------------|
| [e.g., "Time to complete"]| [value] | [value]   | [+/- %]     | [lower, upper]     | [p]     | [Yes/No]     |
| [e.g., "7-day activation"]| [value] | [value]   | [+/- %]     | [lower, upper]     | [p]     | [Yes/No]     |

_Example:_

| Metric                | Control  | Treatment | Lift         | 95% CI           | p-value | Sig? |
|-----------------------|----------|-----------|--------------|-------------------|---------|------|
| Avg time to complete  | 4.3 min  | 3.8 min   | -0.5min(-12%)| [-0.8, -0.2 min]  | 0.002   | Yes  |
| 7-day activation rate | 41.8%    | 44.2%     | +2.4pp(+5.7%)| [-0.3pp, +5.1pp]  | 0.08    | No   |

---

## 5. Guardrail Metric Results

| Metric                   | Control  | Treatment | Change      | Threshold       | Breached? |
|--------------------------|----------|-----------|-------------|-----------------|-----------|
| [e.g., "Skip rate"]    | [value]  | [value]   | [change]    | [e.g., "<+5pp"]| [Yes/No]  |
| [e.g., "Page load p95"]| [value]  | [value]   | [change]    | [e.g., "<2.3s"]| [Yes/No]  |

_Example:_

| Metric              | Control | Treatment | Change       | Threshold    | Breached? |
|---------------------|---------|-----------|--------------|--------------|-----------|
| Step skip rate      | 11.8%   | 12.4%     | +0.6pp       | <+5pp        | No        |
| Page load p95       | 1.82s   | 1.85s     | +30ms        | <2.3s        | No        |

---

## 6. Segment Analysis

Did the treatment effect vary across key segments?

| Segment           | Control | Treatment | Lift     | p-value | Notable?                      |
|-------------------|---------|-----------|----------|---------|-------------------------------|
| [e.g., "Desktop"]| [value] | [value]   | [lift]   | [p]     | [Notes]                       |
| [e.g., "Mobile"] | [value] | [value]   | [lift]   | [p]     | [Notes]                       |

_Example:_

| Segment          | Control | Treatment | Lift    | p-value | Notable?                  |
|------------------|---------|-----------|---------|---------|---------------------------|
| Desktop          | 70.2%   | 76.8%     | +6.6pp  | 0.001   | Consistent with overall   |
| Mobile           | 58.4%   | 63.1%     | +4.7pp  | 0.04    | Smaller lift, still significant |
| Starter plan     | 62.1%   | 70.5%     | +8.4pp  | 0.001   | Largest lift segment      |
| Pro plan         | 74.8%   | 77.2%     | +2.4pp  | 0.22    | Not significant alone     |

---

## 7. Conclusion and Recommendation [REQUIRED]

**Verdict:** [Winner / No Winner / Inconclusive / Killed]

**Recommendation:** [Ship / Iterate / Revert / Further test]

**Rationale:**
[2-3 sentences explaining the recommendation with reference to the data]

**Estimated Impact at Scale:**
[Project what shipping this would mean for the business]

_Example:_
**Verdict:** Winner

**Recommendation:** Ship treatment to 100% of web users.

**Rationale:**
The progress bar increased onboarding completion by +6.3pp (p=0.0003) with no guardrail breaches. The effect was consistent across desktop and mobile segments. The secondary lift in activation rate (+2.4pp) is directionally positive but needs more data to confirm.

**Estimated Impact at Scale:**
At current signup volume (~2,100 new users/week), shipping this would result in ~132 additional onboarding completions per week, translating to an estimated ~55 additional activations per week based on current completion-to-activation rates.

---

## 8. Follow-Up Actions

- [ ] [e.g., "Ship treatment to 100% (Eng: Dev Patel, target: Mar 10)"]
- [ ] [e.g., "Monitor activation rate for 4 weeks post-ship"]
- [ ] [e.g., "Design follow-up experiment for mobile-specific optimization"]
- [ ] [e.g., "Log learnings in experiment knowledge base"]

---

## 9. Appendix

**Data Source:** [e.g., "BigQuery: analytics.fct_experiment_exposures"]
**Analysis Notebook:** [Link]
**Dashboard:** [Link to experiment monitoring dashboard]
**Statistical Notes:** [Any additional methodological details]
