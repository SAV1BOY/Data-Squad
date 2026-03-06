# Experiment Results Communication

> Use this template to communicate experiment results to stakeholders.
> This is the non-technical version for decision-makers. Keep it concise and actionable.

---

## Experiment: [Title]

**ID:** [EXP-YYYY-NNN]
**Run Period:** [Start] to [End] ([# days])
**Owner:** [Name, Team]
**Report Date:** [YYYY-MM-DD]

---

## Result: [WINNER / NO WINNER / INCONCLUSIVE / KILLED]

---

## 1. What We Tested [REQUIRED]

**Change Made:** [1-2 sentences describing what was different in the treatment]
**Why We Tested It:** [1-2 sentences on the hypothesis and business motivation]

_Example:_
**Change Made:** We added a step-by-step progress bar to the onboarding wizard, showing users which step they were on and how many remained (e.g., "Step 2 of 5").
**Why We Tested It:** 38% of users who started onboarding abandoned before completing it. Exit surveys cited "not knowing how long it takes" as the second most common reason. We hypothesized that showing progress would reduce abandonment.

---

## 2. What Happened [REQUIRED]

| Metric                    | Without Change (Control) | With Change (Treatment) | Difference     | Confident? |
|---------------------------|--------------------------|--------------------------|----------------|------------|
| [Primary metric]          | [value]                  | [value]                  | [+/- with %]   | [Yes/No]   |
| [Secondary metric 1]     | [value]                  | [value]                  | [+/- with %]   | [Yes/No]   |
| [Secondary metric 2]     | [value]                  | [value]                  | [+/- with %]   | [Yes/No]   |
| [Guardrail metric]       | [value]                  | [value]                  | [+/- with %]   | [Safe?]    |

_Example:_

| Metric                    | Control | Treatment | Difference         | Confident? |
|---------------------------|---------|-----------|---------------------|-----------|
| Onboarding completion rate | 67.8%  | 74.1%     | +6.3pp (+9.3%)     | Yes       |
| Avg time to complete       | 4.3min | 3.8min    | -0.5min (-12%)     | Yes       |
| 7-day activation rate      | 41.8%  | 44.2%     | +2.4pp (+5.7%)     | Not yet   |
| Step skip rate (guardrail) | 11.8%  | 12.4%     | +0.6pp (safe)      | Safe      |

**Plain Language:** [2-3 sentences summarizing in non-technical terms]

_Example:_
**Plain Language:** Adding the progress bar increased onboarding completion by 6.3 percentage points, which is statistically significant. Users also completed onboarding 30 seconds faster on average. There was a small directional improvement in 7-day activation, but we do not yet have enough data to be confident in that. No negative side effects were observed.

---

## 3. Business Impact [REQUIRED]

**If we ship this to everyone:**
- [Impact statement 1, e.g., "~132 additional users will complete onboarding each week"]
- [Impact statement 2, e.g., "Projected ~55 additional activations per week based on current rates"]
- [Impact statement 3, e.g., "Estimated $X additional MRR per month from improved conversion"]

_Example:_
**If we ship this to everyone:**
- ~132 additional users will complete onboarding each week (based on ~2,100 new users/week)
- Projected ~55 additional activated users per week (at current 42% activation rate)
- Estimated ~$4,400/month additional MRR from incremental conversions (at $80 avg MRR)
- Annual revenue impact: ~$53K ARR

---

## 4. What We Learned

**Key Learnings:**
- [Learning 1, e.g., "Progress indicators reduce anxiety in multi-step flows"]
- [Learning 2, e.g., "Effect was strongest for Starter plan users (+8.4pp vs +2.4pp for Pro)"]
- [Learning 3, e.g., "Mobile users showed smaller lift, suggesting mobile-specific optimization opportunity"]

**Surprises:**
- [Anything unexpected, e.g., "Users actually completed faster, suggesting the progress bar reduced exploration/confusion, not just abandonment"]

---

## 5. Segment Performance

Did the change work equally well for everyone?

| Segment          | Control | Treatment | Lift    | Notes                         |
|------------------|---------|-----------|---------|-------------------------------|
| [Segment 1]      | [%]     | [%]       | [+/- pp]| [Notes]                       |
| [Segment 2]      | [%]     | [%]       | [+/- pp]| [Notes]                       |

_Example:_

| Segment          | Control | Treatment | Lift    | Notes                          |
|------------------|---------|-----------|---------|--------------------------------|
| Desktop          | 70.2%   | 76.8%     | +6.6pp  | Strongest performance          |
| Mobile           | 58.4%   | 63.1%     | +4.7pp  | Still significant, room to grow|
| Starter plan     | 62.1%   | 70.5%     | +8.4pp  | Biggest absolute lift          |
| Pro plan         | 74.8%   | 77.2%     | +2.4pp  | Already high; smaller lift     |

---

## 6. Recommendation [REQUIRED]

**Decision:** [Ship / Iterate / Revert / Further test]

**Rationale:** [2-3 sentences]

**Conditions / Caveats:**
- [e.g., "Monitor activation rate for 4 weeks post-ship to confirm downstream impact"]
- [e.g., "Consider mobile-specific optimization as a follow-up experiment"]

_Example:_
**Decision:** Ship to 100% of web users.

**Rationale:** The treatment achieved a 6.3pp improvement on the primary metric with high statistical confidence and no guardrail violations. The effect is consistent across segments. The projected business impact ($53K ARR) justifies immediate rollout.

**Conditions / Caveats:**
- Monitor 7-day activation rate for 4 weeks post-ship to confirm the directional improvement holds
- Mobile lift was smaller; design a follow-up experiment for mobile-specific progress indicator
- Track long-term retention of the improved cohorts to validate quality of incremental completions

---

## 7. Next Steps

| # | Action                                        | Owner        | Due Date   |
|---|-----------------------------------------------|--------------|------------|
| 1 | [e.g., "Ship treatment to 100%"]             | [Name]       | [Date]     |
| 2 | [e.g., "Set up post-ship monitoring"]        | [Name]       | [Date]     |
| 3 | [e.g., "Design mobile follow-up experiment"] | [Name]       | [Date]     |
| 4 | [e.g., "Update experiment knowledge base"]   | [Name]       | [Date]     |

---

## 8. Technical Details (for data team reference)

**Sample Size:** [Control: #, Treatment: #]
**Statistical Test:** [e.g., "Two-proportion z-test"]
**Power:** [e.g., "80% at alpha 0.05"]
**SRM Check:** [e.g., "p=0.94, no issue"]
**Analysis Notebook:** [Link]
**Dashboard:** [Link]
