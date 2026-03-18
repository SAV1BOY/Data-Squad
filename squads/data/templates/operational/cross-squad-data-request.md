# Cross-Squad Data Request

> Use this template when one squad needs data, analysis, or a data asset from another squad.
> Ensures clear communication of requirements, SLAs, and quality expectations across squad boundaries.

---

## 1. Request Overview [REQUIRED]

**Request ID:** [XDR-YYYY-NNN]
**Date Submitted:** [YYYY-MM-DD]
**Status:** [Submitted / Accepted / In Progress / In Review / Delivered / Closed]

---

## 2. Requesting Squad [REQUIRED]

| Field                    | Value                                    |
|--------------------------|------------------------------------------|
| Squad Name               | [e.g., "Growth"]                         |
| Requester                | [Name, Role]                             |
| Requester Contact        | [Slack handle or email]                  |
| Sponsor                  | [Name, Role - person who approved the request] |

---

## 3. Providing Squad [REQUIRED]

| Field                    | Value                                    |
|--------------------------|------------------------------------------|
| Squad Name               | [e.g., "Data & Analytics"]               |
| Handoff Contact          | [Name, Role]                             |
| Contact Channel          | [e.g., "Slack #data-requests"]           |

---

## 4. Data Needed [REQUIRED]

**Description:** [2-3 sentences describing what data is needed and why]

**Specific Requirements:**

| Requirement              | Detail                                   |
|--------------------------|------------------------------------------|
| Data Type                | [e.g., "Dataset / Report / Dashboard / Metric definition"] |
| Scope / Population       | [e.g., "All active users, last 90 days"] |
| Granularity              | [e.g., "User-level / Daily / Weekly"]    |
| Key Fields Needed        | [List the specific fields or dimensions] |
| Time Range               | [e.g., "Jan 1 - Mar 15, 2026"]          |
| Output Format            | [e.g., "BigQuery table / CSV / API endpoint / Dashboard"] |
| Refresh Cadence          | [e.g., "One-time / Daily / Weekly"]      |

---

## 5. SLA and Timeline [REQUIRED]

| Milestone                | Date           | Notes                    |
|--------------------------|----------------|--------------------------|
| Request submitted        | [YYYY-MM-DD]   |                          |
| Request acknowledged     | [YYYY-MM-DD]   | [Within 2 business days] |
| Scoping complete         | [YYYY-MM-DD]   |                          |
| First draft delivered    | [YYYY-MM-DD]   |                          |
| Final delivery           | [YYYY-MM-DD]   |                          |
| Feedback / sign-off      | [YYYY-MM-DD]   |                          |

**Hard Deadline?** [Yes / No] - [If yes, explain why: e.g., "Board meeting on 2026-04-01"]

---

## 6. Quality Requirements [REQUIRED]

| Quality Dimension        | Requirement                              |
|--------------------------|------------------------------------------|
| Completeness             | [e.g., "No more than 2% null values in key fields"] |
| Accuracy                 | [e.g., "Revenue figures must tie to finance actuals within 1%"] |
| Freshness                | [e.g., "Data no older than 24 hours at time of delivery"] |
| Consistency              | [e.g., "Metric definitions must match company KPI glossary"] |
| Documentation            | [e.g., "Schema, methodology, and known limitations documented"] |

---

## 7. Business Context

**What decision does this inform?**
[Describe the decision or initiative that depends on this data.]

**What happens if this is delayed?**
[Impact of late delivery on the requesting squad's work.]

**Related requests or dependencies:**
- [e.g., "Depends on XDR-2026-004 being completed first"]
- [e.g., "None"]

---

## 8. Acceptance Criteria [REQUIRED]

The request is fulfilled when:
- [ ] Data matches the scope and time range specified
- [ ] Output format matches the requested format
- [ ] Quality requirements are met and validated
- [ ] Documentation is provided (schema, methodology, limitations)
- [ ] Requesting squad has confirmed receipt and usability

---

## 9. Sign-Off

| Role                     | Name           | Date       | Status              |
|--------------------------|----------------|------------|---------------------|
| Requesting Contact       |                |            | Submitted           |
| Providing Contact        |                |            | Accepted / Declined |
| Requesting Sponsor       |                |            | Approved            |
| Requesting Contact       |                |            | Delivery Confirmed  |
