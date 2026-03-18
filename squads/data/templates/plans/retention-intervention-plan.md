# Retention Intervention Plan

> Use this template to plan targeted interventions for at-risk user segments.
> Covers segment identification, intervention design, timeline, success metrics, and monitoring.

---

## Plan Overview [REQUIRED]

**Plan ID:** [RI-YYYY-NNN]
**Title:** [e.g., "Q2 2026 At-Risk SMB Retention Interventions"]
**Owner:** [Name, Role]
**Created:** [YYYY-MM-DD]
**Target Launch:** [YYYY-MM-DD]
**Status:** [Planning / Active / Monitoring / Complete]

---

## 1. At-Risk Segments [REQUIRED]

### Segment Definitions

| Segment                  | Definition                               | Size   | Current Retention | Revenue at Risk |
|--------------------------|------------------------------------------|--------|-------------------|-----------------|
| [e.g., "Dormant SMB"]   | [e.g., "SMB users, no login in 14+ days"]| [#]    | [e.g., "42% D30"] | [e.g., "$18K MRR"]|
| [e.g., "Low adopters"]  | [e.g., "Used <2 features in last 30 days"]| [#]   | [e.g., "55% D30"] | [e.g., "$9K MRR"] |
| [e.g., "Downgrade risk"]| [e.g., "Usage dropped >40% MoM"]        | [#]    | [e.g., "61% D30"] | [e.g., "$14K MRR"]|

### Risk Signals

| Signal                   | Weight   | Data Source                    |
|--------------------------|----------|--------------------------------|
| [e.g., "Login frequency drop"]| [High]| [e.g., "Product analytics"]   |
| [e.g., "Support ticket volume"]| [Medium]| [e.g., "Zendesk"]           |
| [e.g., "Feature adoption breadth"]| [High]| [e.g., "Event tracking"]   |
| [e.g., "NPS score decline"]| [Medium]| [e.g., "Survey platform"]     |

---

## 2. Intervention Types [REQUIRED]

| # | Intervention             | Target Segment         | Channel              | Trigger                         |
|---|--------------------------|------------------------|----------------------|---------------------------------|
| 1 | [e.g., "Re-engagement email sequence"]| [Dormant SMB]| [e.g., "Email"]     | [e.g., "No login for 7 days"]  |
| 2 | [e.g., "Feature discovery nudge"]| [Low adopters]    | [e.g., "In-app"]    | [e.g., "Used <2 features"]     |
| 3 | [e.g., "CSM outreach call"]| [Downgrade risk]      | [e.g., "Phone/email"]| [e.g., "Usage drop >40%"]      |
| 4 | [e.g., "Personalized onboarding replay"]| [Low adopters]| [e.g., "Email + in-app"]| [e.g., "Skipped onboarding steps"]|

### Intervention Details

For each intervention, document:

**Intervention [#]:** [Name]
- **Objective:** [What behavior change are you trying to drive?]
- **Message / Content:** [Summary of the communication or experience]
- **Audience Size:** [Estimated number of users]
- **Frequency:** [e.g., "One-time / 3-email sequence over 7 days"]
- **Fallback:** [What happens if the user does not respond?]

---

## 3. Timeline [REQUIRED]

| Phase                    | Activities                               | Start Date     | End Date       | Owner   |
|--------------------------|------------------------------------------|----------------|----------------|---------|
| Design                   | [Define segments, design interventions]  | [YYYY-MM-DD]   | [YYYY-MM-DD]   | [Name]  |
| Build                    | [Create content, set up triggers]        | [YYYY-MM-DD]   | [YYYY-MM-DD]   | [Name]  |
| Test                     | [QA triggers, validate segments]         | [YYYY-MM-DD]   | [YYYY-MM-DD]   | [Name]  |
| Soft launch              | [Launch to 10% of segment]              | [YYYY-MM-DD]   | [YYYY-MM-DD]   | [Name]  |
| Full launch              | [Expand to 100% of segment]            | [YYYY-MM-DD]   | [YYYY-MM-DD]   | [Name]  |
| Monitor and optimize     | [Track results, iterate]                | [YYYY-MM-DD]   | [YYYY-MM-DD]   | [Name]  |
| Review                   | [Final analysis and recommendations]    | [YYYY-MM-DD]   | [YYYY-MM-DD]   | [Name]  |

---

## 4. Success Metrics [REQUIRED]

### Primary Metrics

| Metric                   | Baseline       | Target         | Measurement Window |
|--------------------------|----------------|----------------|--------------------|
| [e.g., "D30 retention"] | [e.g., "42%"]  | [e.g., "50%"]  | [e.g., "60 days post-launch"] |
| [e.g., "Churn rate"]    | [e.g., "8.2%"] | [e.g., "6.5%"] | [e.g., "90 days post-launch"] |

### Secondary Metrics

| Metric                   | Baseline       | Target         |
|--------------------------|----------------|----------------|
| [e.g., "Feature adoption breadth"]| [e.g., "1.8 features"]| [e.g., "3.0 features"]|
| [e.g., "Login frequency"]| [e.g., "2x/week"]| [e.g., "4x/week"]|
| [e.g., "Re-engagement rate"]| [e.g., "N/A (new)"]| [e.g., "25% of dormant users return"]|

### Guardrail Metrics

- [e.g., "Unsubscribe rate must not exceed 2%"]
- [e.g., "Support ticket volume must not increase by more than 10%"]
- [e.g., "NPS must remain stable or improve"]

---

## 5. Monitoring Approach [REQUIRED]

| Monitoring Activity      | Frequency      | Owner          | Tool / Dashboard     |
|--------------------------|----------------|----------------|----------------------|
| Intervention delivery rates| [e.g., "Daily"]| [Name]        | [e.g., "Email platform dashboard"]|
| Segment size tracking    | [e.g., "Weekly"]| [Name]        | [e.g., "Looker dashboard"]|
| Retention metric tracking| [e.g., "Weekly"]| [Name]        | [e.g., "BigQuery + Looker"]|
| Guardrail metric review  | [e.g., "Weekly"]| [Name]        | [e.g., "Automated alerts"]|
| Cohort analysis          | [e.g., "Bi-weekly"]| [Name]     | [e.g., "Notebook / Looker"]|

### Escalation Triggers

| Trigger                  | Threshold                                | Action                         |
|--------------------------|------------------------------------------|--------------------------------|
| [e.g., "Unsubscribe spike"]| [e.g., ">3% in any 7-day window"]     | [e.g., "Pause email sequence"] |
| [e.g., "No improvement"]| [e.g., "Retention flat after 30 days"]   | [e.g., "Redesign intervention"]|
| [e.g., "Negative feedback"]| [e.g., ">5 complaints in a week"]      | [e.g., "Review messaging"]    |

---

## 6. Risks and Mitigations

| Risk                                    | Likelihood | Impact  | Mitigation                        |
|-----------------------------------------|-----------|---------|-----------------------------------|
| [e.g., "Intervention fatigue"]         | [H/M/L]   | [H/M/L] | [e.g., "Frequency caps per user"] |
| [e.g., "Segment overlap with other campaigns"]| [H/M/L]| [H/M/L]| [e.g., "Coordinate with marketing"]|
| [e.g., "Trigger data delayed"]         | [H/M/L]   | [H/M/L] | [e.g., "Buffer time in trigger logic"]|

---

## 7. Approval

| Role              | Name | Date | Status             |
|-------------------|------|------|--------------------|
| Plan Owner        |      |      | Submitted          |
| Analytics Lead    |      |      | Pending / Approved |
| Product Lead      |      |      | Pending / Approved |
| CS Lead           |      |      | Pending / Approved |
