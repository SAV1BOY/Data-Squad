# Data Request Pattern

A standard process for submitting, triaging, fulfilling, and closing data requests to ensure clarity, quality, and efficient use of analyst time.

---

## The Problem

Without a standard process, data requests arrive via Slack DMs, hallway conversations, and vague emails. Analysts waste time clarifying requirements, requesters wait without visibility, and there is no record of what was delivered or learned.

## Request Submission

### Required Fields

Every data request must include:

| Field                | Description                                              | Example                                      |
|----------------------|----------------------------------------------------------|----------------------------------------------|
| **Requester**        | Who is asking                                            | Sarah Kim, Growth PM                         |
| **Business Question**| The question in plain language, not a data specification | "Are users who complete onboarding within 24 hours more likely to convert to paid?" |
| **Decision Context** | What decision will this data inform                      | "Whether to invest engineering resources in shortening the onboarding flow" |
| **Deadline**         | When the decision needs to be made                       | March 15 (product planning meeting)          |
| **Priority**         | Requester's assessment (High/Medium/Low)                 | Medium                                       |
| **Desired Format**   | How the output should be delivered                       | "A few key numbers I can put in a slide" or "Dashboard I can share with the team" |

### Optional But Helpful Fields

| Field                | Description                                              |
|----------------------|----------------------------------------------------------|
| **Hypotheses**       | What the requester expects to find                       |
| **Prior Work**       | Links to related analyses or dashboards                  |
| **Audience**         | Who will see the output beyond the requester             |
| **Known Data Sources**| If the requester knows which tables or systems are relevant |

### Submission Channel

- Use a dedicated intake form or issue template (Jira, Linear, Asana, or a simple Google Form).
- Slack messages and emails are not valid request channels. Redirect requesters to the intake form.
- The form should enforce required fields; do not accept incomplete submissions.

---

## Triage

Within 1 business day of submission, the data team triages the request:

### Triage Decision Matrix

| Criteria                          | Self-Serve              | Quick Answer (< 2 hours) | Analysis (2+ hours)     | Project (1+ weeks)      |
|-----------------------------------|-------------------------|---------------------------|-------------------------|-------------------------|
| Existing dashboard answers it     | Redirect to dashboard   | —                         | —                       | —                       |
| Simple query, no interpretation   | —                       | Assign to analyst         | —                       | —                       |
| Requires analysis and narrative   | —                       | —                         | Assign + scope           | —                       |
| Requires new data, modeling, etc. | —                       | —                         | —                       | Scope as project         |

### Triage Response

Respond to the requester with:

1. **Acknowledgment:** "We received your request."
2. **Classification:** Quick answer, analysis, or project.
3. **Estimated delivery date:** Based on current queue and complexity.
4. **Assigned analyst:** Who will be working on it.
5. **Clarifying questions:** If any required information is missing or ambiguous.

---

## Scoping (for Analysis and Project requests)

Before starting work, the analyst and requester align on scope:

### Scope Document

| Field                | Agreed Value                                          |
|----------------------|-------------------------------------------------------|
| **Core Question**    | Restated by the analyst to confirm understanding      |
| **In Scope**         | Specific metrics, segments, time ranges               |
| **Out of Scope**     | What this analysis will NOT cover                     |
| **Methodology**      | Approach the analyst plans to take                    |
| **Assumptions**      | Known limitations or assumptions                      |
| **Output Format**    | Deliverable type (memo, dashboard, deck, spreadsheet) |
| **Review Checkpoint**| Date for a mid-point check-in (for projects)          |
| **Final Deadline**   | Agreed delivery date                                  |

The requester must confirm the scope before the analyst begins work. This prevents scope creep and misaligned expectations.

---

## Execution

### Analyst Workflow

1. **Explore:** Understand the data landscape. Identify relevant tables, check data quality.
2. **Analyze:** Run the analysis per the scoped methodology.
3. **Validate:** Apply sanity checks (see sanity-checks utility). Cross-reference with known benchmarks.
4. **Narrate:** Write findings in plain language. Lead with the answer, then supporting evidence.
5. **Review:** Have a peer review the query logic and interpretation before delivery.

### Mid-Point Check-In (Projects Only)

At the agreed checkpoint:
- Share preliminary findings with the requester.
- Confirm the direction is still relevant (business context may have changed).
- Adjust scope if needed.

---

## Delivery

### Output Structure

Regardless of format, every deliverable should include:

1. **Answer first:** The one-sentence answer to the business question.
2. **Key findings:** 3-5 bullet points with the most important insights.
3. **Methodology:** Brief description of how the analysis was done.
4. **Caveats:** Known limitations, data quality issues, or assumptions.
5. **Recommended actions:** What the requester should do with this information.
6. **Appendix:** Detailed tables, queries, or methodology notes for those who want to dig deeper.

---

## Feedback Loop

After delivery, close the loop:

| Step                         | Timing          | Purpose                                      |
|------------------------------|-----------------|-----------------------------------------------|
| Requester confirms receipt   | Within 1 day    | Ensure the deliverable was received and opened|
| Requester provides feedback  | Within 1 week   | Was the question answered? Was the format useful? |
| Decision outcome shared      | When decision is made | Did the data inform the decision? How?    |
| Analyst retrospective        | Monthly         | Review fulfilled requests: patterns, efficiency, quality |

### Feedback Questions

1. Did the deliverable answer your business question? (Yes / Partially / No)
2. Was the format useful for your audience? (Yes / No — suggest improvement)
3. Was it delivered on time? (Yes / No)
4. What would you change about the process?

---

## Anti-Patterns

| Anti-Pattern                    | Problem                                    | Fix                                           |
|---------------------------------|--------------------------------------------|-----------------------------------------------|
| "Can you just pull..."          | Vague requests waste analyst time           | Redirect to intake form with required fields  |
| Scope creep via Slack           | "One more thing" expands work without agreement | All scope changes go through the scope doc |
| Data dump with no narrative     | Requester cannot interpret raw numbers      | Always include a narrative and recommendation |
| No feedback loop                | Analyst never knows if the work was useful  | Require feedback as part of the closing process|
| FIFO queue only                 | Urgent requests get stuck behind low-priority ones | Triage with priority; reserve capacity for urgent |
