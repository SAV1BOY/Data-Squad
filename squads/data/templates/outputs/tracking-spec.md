# Tracking Specification

> This template defines the complete specification for analytics events.
> Each event must have a name, trigger, properties, and example payload.
> Use this as the source of truth between analytics and engineering.

---

## 1. Spec Overview

**Feature / Area:** [What feature or area these events cover]
**Spec Owner:** [Name, Team]
**Engineering Owner:** [Name, Team]
**Date Created:** [YYYY-MM-DD]
**Spec Version:** [e.g., "v1.0"]
**Status:** [Draft / In Review / Approved / Implemented / Deprecated]

_Example:_
**Feature / Area:** Onboarding Wizard (Steps 1-6)
**Spec Owner:** Sarah Kim, Analytics
**Engineering Owner:** Dev Patel, Frontend Engineering
**Date Created:** 2026-03-06
**Spec Version:** v1.0
**Status:** In Review

---

## 2. Naming Convention

All events in this spec follow this convention:

**Format:** `[object]_[action]` (snake_case, lowercase)
**Examples:** `onboarding_started`, `onboarding_step_completed`, `plan_selected`

**Property Naming:** snake_case, lowercase
**Enum Values:** lowercase, underscore-separated (e.g., `pro_plan`, `annual_billing`)

---

## 3. Event Specifications

### Event: [event_name]

**Version:** [e.g., "v1.0"]
**Trigger:** [Exact user action or system event that fires this]
**Where:** [Page/screen/component where this fires]
**Destinations:** [e.g., "Segment -> BigQuery, Amplitude"]

**Properties:**

| Property Name     | Type    | Required | Description                          | Enum Values / Format          |
|-------------------|---------|----------|--------------------------------------|-------------------------------|
| [e.g., "step_number"]| [e.g., "integer"]| [Yes/No]| [e.g., "Current wizard step (1-6)"]| [e.g., "1, 2, 3, 4, 5, 6"]|
| [e.g., "step_name"]  | [e.g., "string"] | [Yes/No]| [e.g., "Human-readable step name"] | [e.g., "profile, team, integrations..."]|

**Example Payload:**
```json
{
  "event": "[event_name]",
  "properties": {
    "property_1": "value",
    "property_2": 123
  }
}
```

---

### EXAMPLE - Event: onboarding_started

**Version:** v1.0
**Trigger:** User clicks the "Get Started" button on the welcome screen
**Where:** `/welcome` page, "Get Started" CTA button
**Destinations:** Segment -> BigQuery, Amplitude

**Properties:**

| Property Name   | Type    | Required | Description                        | Enum Values / Format                |
|-----------------|---------|----------|------------------------------------|--------------------------------------|
| plan_type       | string  | Yes      | User's current plan                | free_trial, starter, pro, business   |
| signup_source   | string  | Yes      | How the user signed up             | organic, referral, paid, partner     |
| user_id         | string  | Yes      | Unique user identifier             | UUID format                          |
| session_id      | string  | Yes      | Current session identifier         | UUID format                          |
| has_team        | boolean | No       | Whether user has created a team    | true, false                          |

**Example Payload:**
```json
{
  "event": "onboarding_started",
  "user_id": "usr_abc123",
  "timestamp": "2026-03-06T14:32:00Z",
  "properties": {
    "plan_type": "free_trial",
    "signup_source": "organic",
    "user_id": "usr_abc123",
    "session_id": "sess_xyz789",
    "has_team": false
  }
}
```

---

### EXAMPLE - Event: onboarding_step_completed

**Version:** v1.0
**Trigger:** User completes any step in the onboarding wizard (step content saved successfully)
**Where:** `/onboarding/step-{n}` pages
**Destinations:** Segment -> BigQuery, Amplitude

**Properties:**

| Property Name     | Type    | Required | Description                          | Enum Values / Format                        |
|-------------------|---------|----------|--------------------------------------|----------------------------------------------|
| step_number       | integer | Yes      | Current step (1-6)                   | 1, 2, 3, 4, 5, 6                            |
| step_name         | string  | Yes      | Human-readable step name             | profile, team, integrations, workspace, invite, review |
| duration_sec      | float   | Yes      | Seconds spent on this step           | >= 0                                         |
| fields_completed  | integer | No       | Number of optional fields filled     | >= 0                                         |
| skipped           | boolean | Yes      | Whether user skipped this step       | true, false                                  |

**Example Payload:**
```json
{
  "event": "onboarding_step_completed",
  "user_id": "usr_abc123",
  "timestamp": "2026-03-06T14:34:22Z",
  "properties": {
    "step_number": 2,
    "step_name": "team",
    "duration_sec": 142.3,
    "fields_completed": 3,
    "skipped": false
  }
}
```

---

## 4. Event Summary Table

Quick reference of all events in this spec.

| Event Name                  | Trigger Summary                    | # Properties | Version | Status      |
|-----------------------------|------------------------------------|-------------|---------|-------------|
| [e.g., "onboarding_started"]| [e.g., "Clicks Get Started"]     | [#]         | [v#]    | [Status]    |
| [e.g., "onboarding_step_completed"]| [e.g., "Completes a step"]| [#]         | [v#]    | [Status]    |

_Example:_

| Event Name                  | Trigger Summary            | # Properties | Version | Status      |
|-----------------------------|----------------------------|-------------|---------|-------------|
| onboarding_started          | Clicks "Get Started"       | 5           | v1.0    | Approved    |
| onboarding_step_completed   | Completes any wizard step  | 5           | v1.0    | Approved    |
| onboarding_completed        | Finishes all steps         | 4           | v1.0    | In Review   |
| onboarding_abandoned        | Leaves mid-wizard (timeout)| 3           | v1.0    | In Review   |

---

## 5. Version History

| Version | Date       | Author   | Changes                                    |
|---------|------------|----------|--------------------------------------------|
| v1.0    | [Date]     | [Name]   | [e.g., "Initial spec"]                   |
| v1.1    | [Date]     | [Name]   | [e.g., "Added skipped property to step event"]|

_Example:_

| Version | Date       | Author     | Changes                                     |
|---------|------------|------------|---------------------------------------------|
| v1.0    | 2026-03-06 | Sarah Kim  | Initial onboarding event spec               |
| v1.1    | 2026-03-10 | Sarah Kim  | Added `skipped` property to step_completed  |

---

## 6. QA Checklist

Before marking implementation as complete:

- [ ] All events fire on correct triggers (test each manually)
- [ ] All required properties are populated (no nulls)
- [ ] Property values match expected enums/formats
- [ ] Events appear in Segment debugger with correct schema
- [ ] Events flow to all destinations (BigQuery, Amplitude, etc.)
- [ ] Timestamps are in UTC ISO 8601 format
- [ ] No PII is sent in event properties (verify against privacy policy)
- [ ] Volume matches expected range (not duplicated, not missing)

---

## 7. Implementation Notes

Add any context engineering needs for implementation.

- [e.g., "Use Segment analytics.track() for all events"]
- [e.g., "session_id should persist across page navigations within the wizard"]
- [e.g., "duration_sec is calculated client-side from step mount to submit"]
- [e.g., "Abandoned event fires via 30-min inactivity timeout, not on page unload"]
