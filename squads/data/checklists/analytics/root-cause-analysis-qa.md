# Root Cause Analysis QA Checklist

## Purpose

Apply structured root cause analysis (RCA) to metric movements, data quality incidents, and performance degradations. This gate ensures that the team moves beyond symptoms to true causes using the 5 Whys method adapted for data and analytics contexts.

---

## Checklist Items

### 1. The Problem Statement Is Specific and Measurable

- **Pass:** The RCA starts with a precise problem statement: "DAU dropped 12% between March 3 and March 7, concentrated in the Android segment, compared to the same period last week."
- **Fail:** The problem statement is vague: "engagement is down" or "something looks off in the dashboard."

### 2. At Least Five Successive Whys Are Asked

- **Pass:** The investigation chains at least five causal layers. Example: Why did DAU drop? -> Android sessions declined. Why? -> App crash rate spiked. Why? -> SDK update introduced a memory leak. Why was it deployed? -> No canary rollout. Why? -> Canary process was skipped due to deadline pressure.
- **Fail:** Investigation stops at the first plausible cause ("crash rate went up") without asking what caused the cause.

### 3. Each Why Is Supported by Data

- **Pass:** Every causal link in the chain is backed by a data check, log analysis, or code review -- not speculation. When data is unavailable, the gap is explicitly noted and a recommendation to instrument it is made.
- **Fail:** The causal chain is a narrative constructed in a meeting room without anyone verifying the links.

### 4. Multiple Causal Branches Are Explored

- **Pass:** The RCA acknowledges that multiple factors may contribute. At least two branches of the why-tree are explored before converging on the primary root cause.
- **Fail:** Only the most obvious branch is followed, and contributing factors are ignored.

### 5. The Root Cause Is Actionable

- **Pass:** The identified root cause is something the team can fix, prevent, or mitigate. If it is external (e.g., "Google algorithm change"), the RCA identifies the internal vulnerability that made the impact severe.
- **Fail:** The root cause is a shrug: "users just behave differently now" with no deeper investigation.

### 6. Corrective Actions Are Defined With Owners and Deadlines

- **Pass:** The RCA output includes at least one corrective action (fix the immediate issue) and one preventive action (prevent recurrence). Each has an owner and a deadline.
- **Fail:** The RCA is a document that identifies the cause but proposes no action, or actions have no owners.

### 7. Similar Past Incidents Are Referenced

- **Pass:** The team searches the incident/RCA log for similar past events. If the same root cause has appeared before, the RCA escalates the preventive action priority.
- **Fail:** The same root cause triggers an RCA for the third time without anyone noticing the pattern.

### 8. RCA Is Reviewed and Archived

- **Pass:** The completed RCA is reviewed by at least one person not involved in the investigation, then stored in a searchable archive with tags (metric affected, root cause category, date).
- **Fail:** The RCA lives in a private document or Slack thread that no one can find later.

---

## Cross-References

- [Anomaly Investigation](anomaly-investigation.md) -- RCA is the deep-dive phase after an anomaly is confirmed.
- [Metric Drift Detection](metric-drift-detection.md) -- Gradual drift may need RCA when the cause is not immediately obvious.
- [Data Debt Audit](../governance/data-debt-audit.md) -- Recurring root causes indicate systemic data debt.
