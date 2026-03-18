# Retention Deep-Dive Brief

> Use this brief to scope and kick off a retention analysis.
> Aligns stakeholders on the retention definition, cohorts under study, hypotheses, and expected outputs.

---

## 1. Analysis Overview [REQUIRED]

**Brief ID:** [RET-YYYY-NNN]
**Title:** [Descriptive name, e.g., "Q1 2026 Onboarding Cohort Retention Analysis"]
**Requestor:** [Name, Team]
**Analyst:** [Name]
**Date Submitted:** [YYYY-MM-DD]
**Target Completion:** [YYYY-MM-DD]
**Status:** [Draft / Approved / In Progress / Complete]

---

## 2. Product and Segment Focus [REQUIRED]

**Product / Feature Area:** [e.g., "Core platform" or "Mobile app" or "Pro tier"]

**Segment Focus:**

| Segment Dimension        | Value / Filter                           |
|--------------------------|------------------------------------------|
| [e.g., "Plan type"]     | [e.g., "Pro and Business plans only"]    |
| [e.g., "Geography"]     | [e.g., "US and Canada"]                 |
| [e.g., "Cohort window"]  | [e.g., "Users who signed up Jan-Mar 2026"]|
| [e.g., "Exclusions"]    | [e.g., "Internal users, test accounts"]  |

---

## 3. Retention Definition [REQUIRED]

| Field                    | Value                                    |
|--------------------------|------------------------------------------|
| Retention Event          | [e.g., "Logged in and performed at least 1 key action"] |
| Key Action Definition    | [e.g., "Created a project, sent a message, or exported a report"] |
| Measurement Window       | [e.g., "Day 1, Day 7, Day 14, Day 30, Day 60, Day 90"] |
| Cohort Granularity       | [e.g., "Weekly signup cohorts"]          |
| Retention Type           | [e.g., "Classic / Rolling / Bracket"]    |

---

## 4. Comparison Cohorts [REQUIRED]

| Cohort                   | Definition                               | Purpose                        |
|--------------------------|------------------------------------------|--------------------------------|
| [e.g., "Q1 2026"]       | [e.g., "Signups Jan 1 - Mar 31, 2026"]  | [e.g., "Primary analysis"]     |
| [e.g., "Q4 2025"]       | [e.g., "Signups Oct 1 - Dec 31, 2025"]  | [e.g., "Quarter-over-quarter"] |
| [e.g., "Q1 2025"]       | [e.g., "Signups Jan 1 - Mar 31, 2025"]  | [e.g., "Year-over-year"]       |

---

## 5. Hypotheses [REQUIRED]

State what you expect to find and why. These guide the analysis direction.

| # | Hypothesis                                                | Rationale                                    |
|---|-----------------------------------------------------------|----------------------------------------------|
| 1 | [e.g., "Day-7 retention improved due to new onboarding"] | [e.g., "Onboarding redesign shipped in Jan"] |
| 2 | [e.g., "Mobile users retain worse than desktop"]          | [e.g., "Mobile app has fewer features"]      |
| 3 | [e.g., "Users from paid channels retain lower than organic"]| [e.g., "Lower intent signal"]              |

---

## 6. Analysis Outputs [REQUIRED]

**Deliverables:**
- [ ] Retention curves by cohort (overall and by segment)
- [ ] Day-N retention table with statistical comparisons
- [ ] Drop-off analysis identifying where users churn
- [ ] Feature usage correlation with retention
- [ ] Recommendations for product and growth teams

**Output Format:** [e.g., "Google Slides deck + supporting Looker dashboard"]

---

## 7. Data Sources

| Source                   | Table / Event                            | Notes                          |
|--------------------------|------------------------------------------|--------------------------------|
| [e.g., "Segment"]       | [e.g., "user_signed_up, session_started"]| [e.g., "Primary event source"] |
| [e.g., "BigQuery"]      | [e.g., "analytics.user_actions"]         | [e.g., "Key action tracking"]  |
| [e.g., "Stripe"]        | [e.g., "subscriptions"]                 | [e.g., "Plan type data"]       |

---

## 8. Stakeholders

| Name                     | Role                  | Involvement                    |
|--------------------------|-----------------------|--------------------------------|
| [Name]                   | [e.g., "VP Product"]  | [e.g., "Sponsor, reviews final output"] |
| [Name]                   | [e.g., "PM, Growth"]  | [e.g., "Provides context, co-designs"] |
| [Name]                   | [e.g., "Data Analyst"] | [e.g., "Performs the analysis"] |

---

## 9. Approval

| Role              | Name | Date | Status             |
|-------------------|------|------|--------------------|
| Requestor         |      |      | Submitted          |
| Analytics Lead    |      |      | Pending / Approved |
| Sponsor           |      |      | Pending / Approved |
