# Churn Post-Mortem

> Use this template to analyze and document customer churn events.
> Applies to individual high-value churns or cohort churn patterns.
> Goal: understand why, prevent recurrence, and capture learnings.

---

## 1. Churn Summary [REQUIRED]

**Post-Mortem Type:** [Individual Account / Cohort / Segment]
**Date:** [YYYY-MM-DD]
**Author:** [Name, Team]
**Churn Date:** [YYYY-MM-DD]
**Review Status:** [Draft / Reviewed / Actions Assigned]

### For Individual Account:
**Account Name:** [Name]
**MRR Lost:** [$]
**Tenure:** [Months]
**Plan:** [Plan type]
**Segment:** [SMB / Mid-Market / Enterprise]
**CSM:** [Name]

### For Cohort/Segment:
**Cohort / Segment:** [Description]
**Accounts Churned:** [#]
**Total MRR Lost:** [$]
**Time Period:** [Date range]

_Example:_
**Post-Mortem Type:** Individual Account
**Date:** 2026-03-06
**Author:** Sarah Kim, Analytics
**Churn Date:** 2026-02-28
**Review Status:** Reviewed

**Account Name:** TechFlow Inc.
**MRR Lost:** $1,800
**Tenure:** 11 months
**Plan:** Pro (annual, mid-cycle cancellation)
**Segment:** Mid-Market (180 employees)
**CSM:** Jordan Lee

---

## 2. Timeline of Events [REQUIRED]

| Date       | Event                                          | Source         |
|------------|-------------------------------------------------|----------------|
| [Date]     | [e.g., "Account signed up"]                   | [e.g., "CRM"] |
| [Date]     | [e.g., "Usage declined 40% week-over-week"]   | [e.g., "Amplitude"]|
| [Date]     | [e.g., "Support ticket: integration issue"]    | [e.g., "Zendesk"]|
| [Date]     | [e.g., "Champion left the company"]           | [e.g., "LinkedIn"]|
| [Date]     | [e.g., "Cancellation request submitted"]       | [e.g., "Billing"]|

_Example:_

| Date       | Event                                         | Source        |
|------------|-----------------------------------------------|---------------|
| 2025-04-01 | Account signed (annual Pro plan)              | Salesforce    |
| 2025-04-15 | Onboarding completed, 8 users active          | Amplitude     |
| 2025-07-10 | Support ticket: "Need Salesforce integration" | Zendesk       |
| 2025-08-20 | Usage dropped 35% (8 WAU -> 5 WAU)           | Amplitude     |
| 2025-09-15 | CSM quarterly review: raised integration need | Gainsight     |
| 2025-10-01 | Champion (VP Ops) left the company            | LinkedIn/CSM  |
| 2025-11-12 | Health score dropped from 68 to 41            | Analytics     |
| 2025-12-01 | Usage dropped to 2 WAU                        | Amplitude     |
| 2026-01-15 | New VP Ops evaluated competitors              | CSM call      |
| 2026-02-15 | Cancellation request: "switching to CompetitorX" | Billing    |
| 2026-02-28 | Account churned                               | Billing       |

---

## 3. Root Cause Analysis [REQUIRED]

**Primary Root Cause:** [The main reason this churn happened]
**Contributing Factors:**

| Factor                              | Impact (H/M/L) | Preventable? | Evidence                          |
|-------------------------------------|----------------|--------------|-----------------------------------|
| [e.g., "Missing integration"]     | [H]            | [Yes]        | [e.g., "Cited in support + exit survey"]|
| [e.g., "Champion departure"]      | [M]            | [Partial]    | [e.g., "New stakeholder re-evaluated"]|
| [e.g., "Late intervention"]       | [M]            | [Yes]        | [e.g., "Health score alert came too late"]|

_Example:_

**Primary Root Cause:** Missing Salesforce integration prevented the customer from achieving their core use case (pipeline reporting from within the product).

**Contributing Factors:**

| Factor                         | Impact | Preventable? | Evidence                                    |
|--------------------------------|--------|--------------|---------------------------------------------|
| Missing Salesforce integration | High   | Yes          | Requested in July, cited in cancellation    |
| Champion departure             | Medium | Partial      | No executive sponsor; new VP re-evaluated   |
| Late CS intervention           | Medium | Yes          | Health score dropped Oct; intervention Dec  |
| No multi-threading             | Low    | Yes          | Only 1 stakeholder relationship built       |

---

## 4. Signal Review

Were there early warning signs that should have triggered intervention?

| Signal                                    | Date First Visible | Was It Detected? | Action Taken?          |
|-------------------------------------------|-------------------|------------------|------------------------|
| [e.g., "Usage decline >30%"]            | [Date]            | [Yes/No]         | [Action or "None"]     |
| [e.g., "Support ticket about competitor"]| [Date]            | [Yes/No]         | [Action or "None"]     |
| [e.g., "Health score drop"]             | [Date]            | [Yes/No]         | [Action or "None"]     |

_Example:_

| Signal                             | First Visible | Detected? | Action Taken?                  |
|------------------------------------|--------------|-----------|--------------------------------|
| Integration request (support)      | 2025-07-10   | Yes       | Logged as feature request only |
| Usage decline 35%                  | 2025-08-20   | No        | No alert configured            |
| Champion departure                 | 2025-10-01   | Yes (late)| CSM notified Nov 5 (35 days late)|
| Health score drop to 41            | 2025-11-12   | Yes       | Outreach Dec 1 (19 days delay) |
| Competitor evaluation              | 2026-01-15   | Yes       | Save attempt too late          |

---

## 5. Financial Impact

| Category                    | Amount    |
|-----------------------------|-----------|
| MRR lost                    | [$]       |
| ARR impact                  | [$]       |
| Remaining contract value    | [$]       |
| Customer acquisition cost   | [$]       |
| Total cost of churn         | [$]       |

_Example:_

| Category                    | Amount    |
|-----------------------------|-----------|
| MRR lost                    | $1,800    |
| ARR impact                  | $21,600   |
| Remaining contract value    | $3,600 (2 months left on annual) |
| Original CAC                | $2,400    |
| Estimated total cost        | $27,600   |

---

## 6. Lessons Learned [REQUIRED]

| # | Lesson                                                  | Category            |
|---|---------------------------------------------------------|---------------------|
| 1 | [e.g., "Integration requests must trigger product escalation, not just logging"]| [Process]|
| 2 | [e.g., "Usage decline alerts should fire at -25% WoW"] | [Detection]         |
| 3 | [e.g., "Multi-threading required for all MM/Enterprise accounts"]| [Relationship]|

_Example:_

| # | Lesson                                                         | Category     |
|---|----------------------------------------------------------------|--------------|
| 1 | Integration requests from paying customers need product review within 2 weeks | Process |
| 2 | Usage decline >25% WoW should trigger automated CSM alert      | Detection    |
| 3 | All mid-market accounts must have 2+ stakeholder relationships | Relationship |
| 4 | Health score drop should trigger outreach within 48 hours, not weeks | Process  |
| 5 | Champion departure is a critical risk event requiring immediate playbook | Process |

---

## 7. Action Items [REQUIRED]

| # | Action                                         | Owner        | Due Date   | Status      |
|---|------------------------------------------------|--------------|------------|-------------|
| 1 | [e.g., "Configure usage decline alerts"]      | [Name]       | [Date]     | [Not Started / In Progress / Done]|
| 2 | [e.g., "Create champion departure playbook"]  | [Name]       | [Date]     | [Status]    |
| 3 | [e.g., "Escalate SF integration to product"]  | [Name]       | [Date]     | [Status]    |

_Example:_

| # | Action                                      | Owner       | Due Date   | Status      |
|---|---------------------------------------------|-------------|------------|-------------|
| 1 | Configure -25% WoW usage decline alerts     | Data Eng    | 2026-03-15 | In Progress |
| 2 | Create champion departure playbook          | CS Ops      | 2026-03-20 | Not Started |
| 3 | Escalate Salesforce integration to Product  | CS + Product| 2026-03-10 | Done        |
| 4 | Update health score SLA: outreach within 48h| CS Ops      | 2026-03-15 | Not Started |
| 5 | Audit multi-threading across MM book        | CSMs        | 2026-03-30 | Not Started |

---

## 8. Win-Back Assessment

**Win-back feasible?** [Yes / No / Maybe]
**Conditions for win-back:** [What would need to change]
**Estimated timeline:** [When to attempt]
**Owner:** [Name]

_Example:_
**Win-back feasible?** Maybe - contingent on Salesforce integration shipping
**Conditions:** Ship SF integration + offer migration support + competitive pricing match
**Estimated timeline:** Re-engage 30 days after SF integration ships (est. Q2 2026)
**Owner:** Jordan Lee (CSM) + Sales

---

## Review and Sign-Off

| Role         | Name | Date | Reviewed? |
|--------------|------|------|-----------|
| Analyst      |      |      |           |
| CSM          |      |      |           |
| CS Leader    |      |      |           |
| Product Rep  |      |      |           |
