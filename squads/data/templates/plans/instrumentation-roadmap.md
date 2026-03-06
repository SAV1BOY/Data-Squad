# Instrumentation Roadmap

> Use this template to plan the rollout of analytics instrumentation across
> your product and marketing surfaces. Prioritize by business impact.

---

## 1. Roadmap Overview

**Roadmap Name:** [Descriptive name]
**Owner:** [Name, Team]
**Date Created:** [YYYY-MM-DD]
**Time Horizon:** [e.g., "Q2-Q3 2026 (6 months)"]
**Status:** [Planning / Active / Complete]

_Example:_
**Roadmap Name:** Product Analytics Instrumentation Roadmap - H1 2026
**Owner:** Sarah Kim, Analytics + Dev Patel, Engineering
**Date Created:** 2026-03-06
**Time Horizon:** Q2-Q3 2026 (Apr - Sep)
**Status:** Planning

---

## 2. Current State [REQUIRED]

### Instrumentation Coverage

| Surface / Area              | Current Coverage | Events Tracked | Key Gaps                         | Priority |
|-----------------------------|-----------------|----------------|----------------------------------|----------|
| [e.g., "Marketing site"]  | [Full/Partial/None]| [#]          | [e.g., "No form interactions"]  | [H/M/L]  |
| [e.g., "Onboarding"]      | [Full/Partial/None]| [#]          | [e.g., "Steps 4-6 missing"]    | [H/M/L]  |
| [e.g., "Core product"]    | [Full/Partial/None]| [#]          | [e.g., "Feature usage gaps"]   | [H/M/L]  |

_Example:_

| Surface / Area        | Coverage | Events | Key Gaps                           | Priority |
|-----------------------|----------|--------|------------------------------------|----------|
| Marketing site        | Partial  | 8      | No form interactions, no scroll depth | Medium |
| Signup flow           | Full     | 6      | None                               | --       |
| Onboarding wizard     | Partial  | 4      | Steps 4-6 missing, no abandonment  | High     |
| Core product (web)    | Partial  | 22     | Feature usage patchy, no errors    | High     |
| Core product (mobile) | None     | 0      | Entire mobile app uninstrumented   | High     |
| Billing / upgrade     | Partial  | 5      | No checkout funnel, no plan comparison | Medium |
| Help center           | None     | 0      | No analytics installed             | Low      |
| Email campaigns       | Full     | 12     | None                               | --       |

### Current Tech Stack

| Layer              | Tool                | Status   | Notes                          |
|--------------------|---------------------|----------|--------------------------------|
| Collection (web)   | [e.g., "Segment"]  | [Status] | [Notes]                        |
| Collection (mobile)| [e.g., "None"]     | [Status] | [Notes]                        |
| Storage            | [e.g., "BigQuery"] | [Status] | [Notes]                        |
| Transformation     | [e.g., "dbt"]      | [Status] | [Notes]                        |
| Visualization      | [e.g., "Looker"]   | [Status] | [Notes]                        |

---

## 3. Prioritized Instrumentation Plan [REQUIRED]

### Phase 1: [Date Range] - [Theme]

**Goal:** [What this phase achieves]
**Business Justification:** [Why this phase matters]

| # | Surface / Feature         | Events to Add                    | Est. Events | Effort | Dependencies        | Owner    |
|---|---------------------------|----------------------------------|-------------|--------|---------------------|----------|
| 1 | [e.g., "Onboarding"]    | [e.g., "Steps 4-6, abandonment"]| [#]         | [S/M/L]| [Dependencies]      | [Name]   |
| 2 | [e.g., "Core features"] | [e.g., "Feature usage tracking"]| [#]         | [S/M/L]| [Dependencies]      | [Name]   |

_Example:_

### Phase 1: Apr 1 - May 15 - Critical Funnel Coverage

**Goal:** Complete instrumentation of the signup-to-activation funnel
**Business Justification:** Cannot measure activation improvements without full funnel visibility

| # | Surface / Feature     | Events to Add                       | Est. Events | Effort | Deps           | Owner     |
|---|-----------------------|-------------------------------------|-------------|--------|----------------|-----------|
| 1 | Onboarding (steps 4-6)| step_completed, step_skipped, abandonment | 4      | S      | Spec approval  | Dev Patel |
| 2 | Core feature usage    | feature_used, feature_error, first_use    | 8      | M      | Feature list   | Dev Patel |
| 3 | Billing/upgrade flow  | checkout_started, plan_compared, checkout_completed | 5 | S   | Stripe webhooks| Mia Wong  |

### Phase 2: [Date Range] - [Theme]

**Goal:** [What this phase achieves]

| # | Surface / Feature         | Events to Add                    | Est. Events | Effort | Dependencies        | Owner    |
|---|---------------------------|----------------------------------|-------------|--------|---------------------|----------|
| 1 | [Surface]                 | [Events]                         | [#]         | [S/M/L]| [Dependencies]      | [Name]   |

_Example:_

### Phase 2: May 16 - Jul 15 - Mobile and Marketing

**Goal:** Instrument mobile app and close marketing site gaps

| # | Surface / Feature     | Events to Add                          | Est. Events | Effort | Deps            | Owner     |
|---|-----------------------|----------------------------------------|-------------|--------|-----------------|-----------|
| 1 | Mobile app (iOS+Android)| Full mobile event parity with web    | 25          | L      | Mobile SDK setup| Dev Patel |
| 2 | Marketing site forms  | form_viewed, form_started, form_submitted | 6        | S      | GTM access      | Tom Lee   |
| 3 | Marketing scroll/engage| scroll_depth, cta_clicked, video_played | 5         | S      | GTM access      | Tom Lee   |

### Phase 3: [Date Range] - [Theme]

**Goal:** [What this phase achieves]

| # | Surface / Feature         | Events to Add                    | Est. Events | Effort | Dependencies        | Owner    |
|---|---------------------------|----------------------------------|-------------|--------|---------------------|----------|
| 1 | [Surface]                 | [Events]                         | [#]         | [S/M/L]| [Dependencies]      | [Name]   |

_Example:_

### Phase 3: Jul 16 - Sep 30 - Advanced and Operational

**Goal:** Add error tracking, performance monitoring, and help center analytics

| # | Surface / Feature     | Events to Add                      | Est. Events | Effort | Deps          | Owner     |
|---|-----------------------|------------------------------------|-------------|--------|---------------|-----------|
| 1 | Error tracking        | error_occurred, error_dismissed    | 4           | M      | Error service | Dev Patel |
| 2 | Performance           | page_load_time, api_response_time  | 3           | M      | RUM setup     | Dev Patel |
| 3 | Help center           | article_viewed, search_performed, feedback_given | 5 | S    | Analytics install | Tom Lee |

---

## 4. Naming Convention [REQUIRED]

All events must follow this naming convention.

**Format:** `[object]_[action]` (snake_case, lowercase)
**Property Format:** snake_case, lowercase
**Enum Values:** lowercase, underscore-separated

**Common Objects:** page, form, feature, onboarding, checkout, search, error
**Common Actions:** viewed, started, completed, clicked, submitted, failed, skipped

_Example Event Names:_
- `onboarding_step_completed`
- `feature_used`
- `checkout_started`
- `form_submitted`
- `error_occurred`

---

## 5. QA and Validation Process

| Step | Activity                                    | Owner       | Timing                |
|------|---------------------------------------------|-------------|------------------------|
| 1    | [e.g., "Spec review and approval"]         | [Analytics] | [Before implementation]|
| 2    | [e.g., "Implementation in staging"]        | [Eng]       | [During sprint]       |
| 3    | [e.g., "QA validation in staging"]         | [Analytics] | [Post-implementation] |
| 4    | [e.g., "Production deploy + smoke test"]   | [Eng]       | [Deploy day]          |
| 5    | [e.g., "Volume validation (T+1)"]         | [Analytics] | [Day after deploy]    |

---

## 6. Success Metrics

| Metric                          | Current | Target (End of Roadmap) |
|---------------------------------|---------|-------------------------|
| Total events tracked            | [#]     | [#]                     |
| Instrumentation coverage (%)    | [%]     | [%]                     |
| Surfaces fully instrumented     | [#/#]   | [#/#]                   |
| Event naming compliance         | [%]     | [%]                     |
| Avg time from spec to production| [days]  | [days]                  |

_Example:_

| Metric                          | Current | Target  |
|---------------------------------|---------|---------|
| Total events tracked            | 57      | 120     |
| Instrumentation coverage        | 45%     | 90%     |
| Surfaces fully instrumented     | 2/8     | 7/8     |
| Naming convention compliance    | 68%     | 100%    |
| Avg spec-to-production time     | 18 days | 7 days  |

---

## 7. Risks and Dependencies

| Risk / Dependency                      | Impact | Mitigation                             |
|----------------------------------------|--------|----------------------------------------|
| [e.g., "Eng sprint capacity"]         | [H/M/L]| [e.g., "Pre-allocate 20% of sprint"] |
| [e.g., "Mobile SDK selection delay"]  | [H/M/L]| [e.g., "Evaluate in Phase 1"]        |

---

## 8. Timeline Summary

```
Apr          May          Jun          Jul          Aug          Sep
|--- Phase 1: Critical Funnel ---|
                         |--- Phase 2: Mobile + Marketing ---|
                                                 |--- Phase 3: Advanced ---|
```

---

## Review Log

| Date     | Reviewer | Changes                                    |
|----------|----------|--------------------------------------------|
| [Date]   | [Name]   | [e.g., "Initial roadmap created"]         |
| [Date]   | [Name]   | [e.g., "Updated after Phase 1 review"]    |
