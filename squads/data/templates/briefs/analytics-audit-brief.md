# Analytics Audit Brief

> Use this template to define the scope and objectives of an analytics audit.
> Fill in each section, replacing the example content with your specifics.
> Sections marked [REQUIRED] must be completed before kickoff.

---

## 1. Audit Title [REQUIRED]

**Title:** [Descriptive name for this audit]

_Example:_
**Title:** Q1 2026 Website Analytics Audit - Lead Generation Funnel

---

## 2. Scope [REQUIRED]

Define what is included and excluded from this audit.

**In Scope:**
- [Platform / property to audit, e.g., "Marketing website (www.acme.com)"]
- [Specific area, e.g., "Lead generation funnel from landing page to demo request"]
- [Tools under review, e.g., "Google Analytics 4, Segment, HubSpot"]

**Out of Scope:**
- [What is explicitly excluded, e.g., "Mobile app analytics"]
- [e.g., "Paid media platform-side tracking"]

_Example:_
**In Scope:**
- Marketing website (www.acme.com) lead generation funnel
- GA4, Segment, and HubSpot tracking
- All form submission events and page-level engagement

**Out of Scope:**
- Mobile app analytics (separate audit planned for Q2)
- Paid media platform pixels (Google Ads, Meta)

---

## 3. Current State Assessment [REQUIRED]

Describe what you know about the current analytics setup before the audit begins.

**Tracking Tools in Use:**
- [Tool 1 - purpose, e.g., "GA4 - web analytics"]
- [Tool 2 - purpose, e.g., "Segment - event collection"]

**Known Issues:**
- [Issue 1, e.g., "Duplicate page_view events on SPA transitions"]
- [Issue 2, e.g., "Form submission event missing on /contact page"]

**Last Audit Date:** [Date or "Never"]

**Data Governance Status:** [Describe who owns tracking, naming conventions, docs]

_Example:_
**Tracking Tools in Use:**
- GA4 - web analytics, implemented via GTM
- Segment - event collection for product analytics
- HubSpot - form tracking and CRM attribution

**Known Issues:**
- Duplicate page_view events on SPA route changes
- No consistent naming convention across GA4 and Segment
- UTM parameters lost on redirect through SSO

**Last Audit Date:** 2025-06-15
**Data Governance Status:** No formal owner; marketing and engineering both push changes ad hoc.

---

## 4. Audit Objectives [REQUIRED]

What should this audit achieve? List specific, measurable objectives.

- [ ] [Objective 1, e.g., "Identify all broken or missing events in the lead funnel"]
- [ ] [Objective 2, e.g., "Validate data accuracy between GA4 and Segment"]
- [ ] [Objective 3, e.g., "Produce a prioritized remediation backlog"]
- [ ] [Objective 4, e.g., "Document current tracking architecture"]

_Example:_
- [ ] Identify all broken or missing events in the lead generation funnel
- [ ] Validate data match rates between GA4, Segment, and HubSpot (target: <5% variance)
- [ ] Produce a prioritized remediation backlog with effort estimates
- [ ] Document the current tracking architecture in a shareable diagram

---

## 5. Stakeholders [REQUIRED]

| Role              | Name            | Team         | Involvement Level       |
|-------------------|-----------------|--------------|-------------------------|
| Audit Lead        | [Name]          | [Team]       | Owns execution          |
| Executive Sponsor | [Name]          | [Team]       | Approves scope/results  |
| Data Engineering  | [Name]          | [Team]       | Technical access/fixes  |
| Marketing Ops     | [Name]          | [Team]       | Provides context        |
| Consumer          | [Name]          | [Team]       | Receives findings       |

_Example:_

| Role              | Name            | Team         | Involvement Level       |
|-------------------|-----------------|--------------|-------------------------|
| Audit Lead        | Sarah Chen      | Data & Analytics | Owns execution      |
| Executive Sponsor | Mark Liu        | Marketing    | Approves scope/results  |
| Data Engineering  | Dev Patel       | Engineering  | Technical access/fixes  |
| Marketing Ops     | Jamie Torres    | Marketing    | Provides context        |
| Consumer          | Lisa Huang      | Growth       | Receives findings       |

---

## 6. Timeline [REQUIRED]

| Phase                | Start Date  | End Date    | Deliverable                      |
|----------------------|-------------|-------------|----------------------------------|
| Discovery & Access   | [Date]      | [Date]      | Access confirmed, tools inventory |
| Data Collection      | [Date]      | [Date]      | Raw audit data gathered           |
| Analysis             | [Date]      | [Date]      | Findings documented               |
| Review & Prioritize  | [Date]      | [Date]      | Prioritized remediation backlog   |
| Readout              | [Date]      | [Date]      | Stakeholder presentation          |

_Example:_

| Phase                | Start Date  | End Date    | Deliverable                      |
|----------------------|-------------|-------------|----------------------------------|
| Discovery & Access   | 2026-03-09  | 2026-03-13  | Access confirmed, tools inventory |
| Data Collection      | 2026-03-16  | 2026-03-20  | Raw audit data gathered           |
| Analysis             | 2026-03-23  | 2026-03-27  | Findings documented               |
| Review & Prioritize  | 2026-03-30  | 2026-04-01  | Prioritized remediation backlog   |
| Readout              | 2026-04-03  | 2026-04-03  | Stakeholder presentation          |

---

## 7. Success Criteria

How will you know this audit was successful?

- [Criterion 1, e.g., "100% of funnel events validated with pass/fail status"]
- [Criterion 2, e.g., "Remediation backlog accepted by engineering within 1 week"]
- [Criterion 3, e.g., "Stakeholders report increased confidence in data accuracy"]

---

## 8. Risks and Dependencies

| Risk / Dependency                        | Mitigation                              |
|------------------------------------------|-----------------------------------------|
| [e.g., "Limited access to GTM container"]| [e.g., "Request access in discovery"]   |
| [e.g., "Key stakeholder on PTO week 2"] | [e.g., "Front-load their input"]        |

---

## Approval

| Role              | Name   | Date       | Signature |
|-------------------|--------|------------|-----------|
| Audit Lead        |        |            |           |
| Executive Sponsor |        |            |           |
