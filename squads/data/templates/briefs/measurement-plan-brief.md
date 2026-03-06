# Measurement Plan Brief

> Use this template to kick off a measurement plan project.
> A measurement plan connects business objectives to the data you need to collect.
> Fill in each section; replace examples with your specifics.

---

## 1. Project Context [REQUIRED]

**Project Name:** [Name of the initiative requiring measurement]
**Requestor:** [Name and team]
**Date:** [YYYY-MM-DD]
**Priority:** [High / Medium / Low]

_Example:_
**Project Name:** Self-Serve Onboarding Redesign Measurement Plan
**Requestor:** Priya Sharma, Product
**Date:** 2026-03-06
**Priority:** High

---

## 2. Business Objectives [REQUIRED]

What business outcomes should this measurement plan support? Be specific and tie each to a measurable result.

| # | Business Objective                               | How We Know It's Working                    |
|---|--------------------------------------------------|---------------------------------------------|
| 1 | [e.g., "Increase self-serve activation rate"]    | [e.g., "% of signups completing setup +10%"]|
| 2 | [e.g., "Reduce time-to-value for new users"]    | [e.g., "Median days to first value event"]  |
| 3 | [e.g., "Decrease support tickets from onboarding"]| [e.g., "Onboarding-related tickets -20%"]  |

_Example:_

| # | Business Objective                            | How We Know It's Working                     |
|---|-----------------------------------------------|----------------------------------------------|
| 1 | Increase self-serve activation rate           | % of signups completing setup rises from 32% to 42% |
| 2 | Reduce time-to-value for new users            | Median days to first value event drops from 5 to 3   |
| 3 | Decrease support burden from onboarding       | Onboarding-tagged tickets decrease 20% QoQ           |

---

## 3. Channels and Touchpoints [REQUIRED]

List all channels and touchpoints that need measurement coverage.

| Channel / Touchpoint      | Current Tracking Status | Notes                           |
|---------------------------|------------------------|---------------------------------|
| [e.g., "Marketing site"] | [Tracked / Partial / None] | [e.g., "GA4 only, no Segment"]|
| [e.g., "In-app onboarding"]| [Tracked / Partial / None] | [e.g., "Some events exist"]  |
| [e.g., "Email sequences"]  | [Tracked / Partial / None] | [e.g., "HubSpot clicks only"]|

_Example:_

| Channel / Touchpoint      | Current Tracking Status | Notes                          |
|---------------------------|------------------------|--------------------------------|
| Marketing site            | Partial                | GA4 page views only            |
| In-app onboarding wizard  | Partial                | Step 1-3 tracked, 4-6 missing  |
| Welcome email sequence    | Tracked                | HubSpot open/click rates       |
| Help center               | None                   | No analytics installed         |

---

## 4. Events Needed [REQUIRED]

List the events that must be instrumented. Use a consistent naming convention.

| Event Name                  | Trigger Description                        | Key Properties                          | Priority |
|-----------------------------|--------------------------------------------|-----------------------------------------|----------|
| [e.g., "onboarding_started"]| [e.g., "User clicks 'Get Started'"]       | [e.g., "plan_type, source, user_id"]   | P0       |
| [e.g., "onboarding_step_completed"]| [e.g., "User completes a wizard step"]| [e.g., "step_number, step_name, duration_sec"]| P0 |
| [e.g., "onboarding_abandoned"]| [e.g., "User leaves wizard without completing"]| [e.g., "last_step, session_duration"]| P1    |

_Example:_

| Event Name                  | Trigger Description                        | Key Properties                          | Priority |
|-----------------------------|--------------------------------------------|-----------------------------------------|----------|
| onboarding_started          | User clicks "Get Started" button           | plan_type, signup_source, user_id       | P0       |
| onboarding_step_completed   | User completes any wizard step             | step_number, step_name, duration_sec    | P0       |
| onboarding_completed        | User finishes all wizard steps             | total_duration_sec, steps_skipped       | P0       |
| onboarding_abandoned        | User leaves wizard mid-flow (30min timeout)| last_step, session_duration, user_id    | P1       |
| first_value_event           | User performs core action for first time   | action_type, days_since_signup          | P0       |

---

## 5. See-Think-Do-Care (STDC) Framework Mapping

Map your measurement to the customer journey stages.

| Stage | User Intent                | Key Metrics                              | Events Used               |
|-------|----------------------------|------------------------------------------|---------------------------|
| SEE   | [Awareness / Discovery]    | [e.g., "Impressions, site visits"]      | [e.g., "page_view"]      |
| THINK | [Consideration / Research] | [e.g., "Signups, content engagement"]   | [e.g., "signup_started"] |
| DO    | [Action / Conversion]      | [e.g., "Activation rate, first value"]  | [e.g., "onboarding_completed"]|
| CARE  | [Loyalty / Advocacy]       | [e.g., "Retention, NPS, referrals"]     | [e.g., "referral_sent"]  |

---

## 6. Success Criteria [REQUIRED]

How will you validate the measurement plan itself is working?

- [ ] [e.g., "All P0 events firing within 2 weeks of implementation"]
- [ ] [e.g., "Data matches between Segment and warehouse within 1% variance"]
- [ ] [e.g., "Dashboard built and reviewed by stakeholders within 1 month"]
- [ ] [e.g., "First insight delivered using new data within 6 weeks"]

---

## 7. Data Destinations

Where should collected data flow?

| Destination            | Purpose                          | Owner           |
|------------------------|----------------------------------|-----------------|
| [e.g., "BigQuery"]    | [e.g., "Central warehouse"]     | [e.g., "Data Eng"]|
| [e.g., "Amplitude"]   | [e.g., "Product analytics"]     | [e.g., "Product"] |
| [e.g., "HubSpot"]     | [e.g., "Marketing attribution"] | [e.g., "Mkt Ops"] |

---

## 8. Dependencies and Risks

| Dependency / Risk                          | Owner        | Mitigation                          |
|--------------------------------------------|--------------|-------------------------------------|
| [e.g., "Engineering sprint capacity"]     | [Name]       | [e.g., "Pre-align with EM"]       |
| [e.g., "Third-party SDK limitations"]     | [Name]       | [e.g., "Test in staging first"]   |

---

## 9. Timeline

| Milestone                    | Target Date | Owner   |
|------------------------------|-------------|---------|
| Brief approved               | [Date]      | [Name]  |
| Tracking spec finalized      | [Date]      | [Name]  |
| Implementation complete      | [Date]      | [Name]  |
| QA and validation            | [Date]      | [Name]  |
| Dashboard / reporting live   | [Date]      | [Name]  |

---

## Approval

| Role       | Name | Date | Status            |
|------------|------|------|--------------------|
| Requestor  |      |      | Pending / Approved |
| Data Lead  |      |      | Pending / Approved |
| Eng Lead   |      |      | Pending / Approved |
