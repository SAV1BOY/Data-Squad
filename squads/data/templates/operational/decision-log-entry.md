# Decision Log Entry

> Use this template to record a data-informed decision. Maintaining a decision log
> builds institutional memory and enables retrospectives on decision quality.
> One entry per decision.

---

## Decision: [Title]

**Decision ID:** [DEC-YYYY-NNN]
**Date:** [YYYY-MM-DD]
**Decision Maker:** [Name, Role]
**Status:** [Proposed / Decided / Implemented / Reversed]

---

## 1. Context [REQUIRED]

**What question or problem prompted this decision?**
[2-3 sentences describing the situation that required a decision]

**Why now?**
[Why this decision needed to be made at this time]

_Example:_
**What question or problem prompted this decision?**
Mid-market churn rose to 4.8% in February (vs 4.0% target), with three cancellations citing missing Salesforce integration. The product roadmap has the Salesforce integration scheduled for Q3 2026, but the churn impact suggests earlier action is needed.

**Why now?**
Each month of delay represents an estimated $5K-8K in preventable churn. Q2 roadmap finalization deadline is March 15.

---

## 2. Options Considered [REQUIRED]

| Option                                | Pros                              | Cons                                | Est. Impact            |
|---------------------------------------|-----------------------------------|-------------------------------------|------------------------|
| [Option A - e.g., "Accelerate to Q2"]| [e.g., "Addresses root cause"]   | [e.g., "Displaces other roadmap items"]| [e.g., "-1pp churn"]|
| [Option B - e.g., "Keep in Q3"]      | [e.g., "No roadmap disruption"]  | [e.g., "3-4 more months of churn"] | [e.g., "~$20K MRR at risk"]|
| [Option C - e.g., "Build workaround"]| [e.g., "Faster, lower effort"]   | [e.g., "Partial solution"]         | [e.g., "-0.5pp churn"]|

_Example:_

| Option                           | Pros                           | Cons                              | Est. Impact            |
|----------------------------------|--------------------------------|-----------------------------------|------------------------|
| A: Accelerate SF integration to Q2 | Addresses root cause directly | Delays reporting dashboard rebuild | -1pp MM churn         |
| B: Keep SF integration in Q3     | No roadmap disruption          | ~$20K additional churned MRR      | No churn improvement   |
| C: Build Zapier workaround       | Fast (2 weeks), low effort     | Partial solution, maintenance debt| -0.3pp MM churn        |

---

## 3. Data and Evidence [REQUIRED]

What data informed this decision? Be specific with sources and numbers.

| Evidence                                  | Source              | Confidence    |
|-------------------------------------------|---------------------|---------------|
| [e.g., "3 churns cited SF integration"]  | [e.g., "Exit surveys + CSM notes"]| [High/Med/Low]|
| [e.g., "12 at-risk accounts mention SF"] | [e.g., "CS health scores + tickets"]| [High/Med/Low]|
| [e.g., "SF is #1 requested integration"] | [e.g., "Feature request votes"]| [High/Med/Low]|

_Example:_

| Evidence                                          | Source                    | Confidence |
|---------------------------------------------------|---------------------------|------------|
| 3 mid-market cancellations cited SF integration   | Exit surveys + CSM notes  | High       |
| 12 current accounts flagged SF as blocking issue  | CS health score reviews   | High       |
| Salesforce is #1 feature request (142 votes)      | Product feedback board    | High       |
| Mid-market accounts w/ SF have 18% higher retention | Internal analysis (n=180)| Medium    |
| Competitor X launched SF integration in Jan 2026  | Competitive intel         | High       |

---

## 4. Decision Made [REQUIRED]

**Decision:** [Clear statement of what was decided]
**Chosen Option:** [A / B / C / Modified]

**Rationale:** [2-3 sentences explaining why this option was chosen over alternatives]

**Dissenting Views:** [Note any disagreements and from whom, or "None"]

_Example:_
**Decision:** Accelerate the Salesforce integration from Q3 to Q2 2026, targeting April 30 delivery.
**Chosen Option:** A (Accelerate to Q2)

**Rationale:** The data shows clear causal link between missing SF integration and mid-market churn. At $5-8K/month in preventable churn, the 3-month acceleration pays for itself within the quarter. The displaced dashboard rebuild can move to Q3 with acceptable impact (manual reporting continues).

**Dissenting Views:** VP Product noted the dashboard rebuild delay will frustrate internal stakeholders. Mitigated by committing to Q3 delivery and providing a manual report in the interim.

---

## 5. Expected Outcomes

| Outcome                                | Metric                  | Expected Value      | Measurement Date |
|----------------------------------------|-------------------------|---------------------|------------------|
| [e.g., "Reduced mid-market churn"]    | [e.g., "MM churn rate"]| [e.g., "-1pp"]     | [Date]           |
| [e.g., "At-risk account retention"]   | [e.g., "Save rate"]   | [e.g., "60%"]      | [Date]           |

_Example:_

| Outcome                         | Metric              | Expected      | Measure By  |
|---------------------------------|----------------------|---------------|-------------|
| Reduced mid-market churn        | Monthly MM churn rate | 4.8% -> 3.8% | 2026-07-31  |
| At-risk accounts retained       | Save rate on SF flagged accounts | 60% | 2026-06-30 |
| Increased MM customer satisfaction | NPS for MM segment | +5 points    | 2026-07-31  |

---

## 6. Implementation

| Action                                | Owner        | Due Date   | Status      |
|---------------------------------------|--------------|------------|-------------|
| [e.g., "Reprioritize Q2 roadmap"]   | [Name]       | [Date]     | [Status]    |
| [e.g., "Kick off SF integration"]   | [Name]       | [Date]     | [Status]    |
| [e.g., "Notify at-risk customers"]  | [Name]       | [Date]     | [Status]    |

_Example:_

| Action                              | Owner           | Due Date   | Status      |
|-------------------------------------|-----------------|------------|-------------|
| Update Q2 roadmap (move SF up)      | VP Product      | 2026-03-15 | Done        |
| Assign engineering team             | Eng Manager     | 2026-03-18 | In Progress |
| Notify 12 at-risk accounts of ETA   | CS team         | 2026-03-20 | Not Started |
| Ship Salesforce integration         | Engineering     | 2026-04-30 | Not Started |
| Measure churn impact at 90 days     | Analytics       | 2026-07-31 | Not Started |

---

## 7. Retrospective (Fill In Later)

**Date Reviewed:** [YYYY-MM-DD]
**Actual Outcome:** [What actually happened]
**Decision Quality:** [Good / Acceptable / Poor]
**Lessons Learned:** [What would you do differently?]

_Example:_
**Date Reviewed:** [To be filled at 2026-07-31]
**Actual Outcome:** [Pending]
**Decision Quality:** [Pending]
**Lessons Learned:** [Pending]

---

## Approvals

| Role            | Name | Date | Approved? |
|-----------------|------|------|-----------|
| Decision Maker  |      |      |           |
| Data Lead       |      |      |           |
| Stakeholder     |      |      |           |
