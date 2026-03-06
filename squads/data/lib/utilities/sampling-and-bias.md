# Sampling and Bias Guide

Common biases in data analysis and practical mitigations. Understanding these biases is essential for producing trustworthy insights.

---

## Selection Bias

**What it is:** The sample is not representative of the population because of how subjects were selected.

**Examples:**
- Analyzing only users who responded to a survey (respondents differ from non-respondents).
- Studying feature adoption only among power users who opted into a beta.
- Measuring "average session duration" but excluding sessions under 1 second (which removes a meaningful population of bounces).

**How to detect:**
- Compare the demographics/characteristics of your sample to the full population.
- Check if your inclusion criteria systematically exclude a subgroup.

**Mitigation:**
- Use the full population when possible.
- When sampling, use random sampling with documented methodology.
- Report the sampling frame alongside results: "This analysis covers users who completed onboarding (62% of all signups)."
- Weight results to match the population distribution if sampling was non-random.

---

## Survivorship Bias

**What it is:** Analyzing only the subjects that "survived" a selection process, ignoring those that dropped out.

**Examples:**
- "Our average customer has been with us for 3 years" — because the ones who churned at 3 months are not in the dataset.
- "Users who completed the tutorial have 2x retention" — users who would have retained anyway are more likely to complete the tutorial.
- Analyzing only successful experiments to learn "what works."

**How to detect:**
- Ask: "Who is missing from this dataset, and why?"
- Look for a denominator problem: are you dividing by survivors instead of the original cohort?

**Mitigation:**
- Always start from the original cohort and track attrition explicitly.
- Use intent-to-treat analysis in experiments (include all randomized users, not just those who engaged with the treatment).
- Include failed experiments in reviews to learn from them.

---

## Simpson's Paradox

**What it is:** A trend that appears in several groups reverses when the groups are combined, because of a lurking variable.

**Classic example:**
- Treatment A has a higher success rate than Treatment B in both mild and severe cases.
- But when combined, Treatment B has a higher overall success rate — because Treatment B was disproportionately given to mild cases.

**How to detect:**
- Whenever you see an aggregate result, break it down by key dimensions (segment, platform, region).
- If the sub-group results tell a different story from the aggregate, investigate.

**Mitigation:**
- Always report segment-level results alongside aggregates.
- Use regression or stratified analysis to control for confounders.
- Be skeptical of aggregate comparisons across groups with different compositions.

---

## Confirmation Bias

**What it is:** Interpreting data in a way that confirms pre-existing beliefs, or selectively reporting supporting evidence.

**Examples:**
- Running multiple statistical tests and reporting only the one that is significant.
- Choosing a time window where the metric looks good.
- Dismissing negative experiment results as "data quality issues" without investigation.

**Mitigation:**
- Pre-register hypotheses and success criteria before analyzing data (see experiment one-pager).
- Report all results, including nulls and negatives.
- Have a peer review the analysis before presenting to stakeholders.
- Apply multiple comparison corrections when running multiple tests.

---

## Look-Ahead Bias (Data Leakage)

**What it is:** Using information from the future to make predictions or evaluate past performance.

**Examples:**
- Building a churn model that includes "days since last activity" calculated as of today, then applying it to predict churn 6 months ago.
- Evaluating a recommendation algorithm using data that was not available at the time the recommendation was made.
- Filtering a cohort based on a condition that depends on future behavior.

**Mitigation:**
- Always define your analysis from the perspective of a point in time.
- Use only data that would have been available at the decision point.
- In SQL, ensure your WHERE clause and feature calculations respect the temporal boundary.

---

## Sampling Methodology

When you must sample (dataset too large, need for speed, cost constraints):

### Simple Random Sampling

Every member of the population has an equal chance of selection.

```sql
SELECT * FROM users
WHERE RAND() < 0.01  -- 1% sample
ORDER BY RAND()
LIMIT 10000;
```

**Use when:** Population is homogeneous, or you do not need precision within subgroups.

### Stratified Sampling

Sample proportionally (or equally) from each stratum.

```sql
WITH ranked AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY segment ORDER BY RAND()) AS rn,
         COUNT(*) OVER (PARTITION BY segment) AS segment_size
  FROM users
)
SELECT * FROM ranked
WHERE rn <= GREATEST(100, segment_size * 0.01);  -- at least 100 per segment, or 1%
```

**Use when:** You need reliable estimates within subgroups (e.g., by region, plan type).

### Systematic Sampling

Select every Nth record.

**Use when:** Data is ordered without cyclical patterns and you need a quick, reproducible sample.

**Caution:** If the data has a periodic pattern aligned with N, the sample will be biased.

---

## Bias Checklist

Before finalizing any analysis, ask:

| Question                                          | Bias Risk                 |
|---------------------------------------------------|---------------------------|
| Who is excluded from this dataset?                | Selection bias            |
| Am I only looking at survivors?                   | Survivorship bias         |
| Does the aggregate hide sub-group differences?    | Simpson's paradox         |
| Did I choose the time window after seeing the data?| Confirmation bias        |
| Am I using future data to explain past events?    | Look-ahead bias           |
| Is my sample representative of the full population?| Sampling bias            |
| Did I run multiple tests and pick the best one?   | Multiple comparisons      |
| Am I assuming correlation means causation?        | Confounding variables     |

---

## Reporting Transparency

When presenting results, disclose:

1. **Population:** Who is included and excluded, and why.
2. **Time range:** Start and end dates, and why that range was chosen.
3. **Sample size:** N for each group or segment.
4. **Known biases:** Which biases you considered and how you addressed them.
5. **Limitations:** What this analysis cannot tell you.
