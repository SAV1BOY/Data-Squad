# Inter-Agent Handoff Protocol

## Purpose

This document defines how work transitions between agents within the Data Squad. Every handoff carries a structured payload, passes through a validation checkpoint, and is traceable. Handoffs without proper artifacts are rejected. This protocol prevents dropped context, duplicated work, and quality gaps between agent boundaries.

---

## Handoff Payload

Every agent-to-agent handoff must include the following three components. A handoff missing any component is rejected and returned to the sending agent.

### 1. Output Artifact
The completed work product from the sending agent. Must be:
- In the correct template format from `templates/`
- Complete (no placeholder sections, no "TBD" fields)
- Self-contained (a reader should not need to ask the sending agent for clarification)

### 2. Quality Checklist Result
The agent's Level 1 gate sign-off (see `quality-gate-cascade.md`). Must include:
- Which agent-specific checklists were applied (with file paths from `checklists/`)
- Pass/fail status for each checklist item
- Any items that passed with caveats (documented)
- Number of self-correction iterations used (0, 1, or 2)

### 3. Context Brief
A structured summary enabling the receiving agent to pick up the work without a synchronous conversation:
- **Task objective:** What is the business question or decision this work supports?
- **What was done:** Summary of the sending agent's contribution (3-5 sentences)
- **What is needed next:** What the receiving agent is expected to do with this output
- **Assumptions made:** Any assumptions the receiving agent should be aware of or challenge
- **Open questions:** Unresolved issues the receiving agent may need to address
- **Time sensitivity:** Deadline or urgency context

---

## Agent-to-Agent Handoff Matrix

The matrix below defines which agents hand off to which agents and the typical nature of the handoff. Agents not connected in this matrix can still hand off to each other, but must route through data-chief for coordination.

| From | To | Typical Handoff |
|------|----|-----------------|
| sean-ellis | avinash-kaushik | Experiment design → measurement plan and tracking spec |
| sean-ellis | wes-kao | Growth analysis → strategic narrative and prioritization |
| sean-ellis | peter-fader | Activation/retention experiment → CLV impact assessment |
| avinash-kaushik | sean-ellis | Measurement data → experiment analysis input |
| avinash-kaushik | wes-kao | Dashboard/analysis output → storytelling and exec communication |
| avinash-kaushik | peter-fader | Cohort data → CLV modeling input |
| avinash-kaushik | data-chief | Any validated analysis → chief review |
| peter-fader | nick-mehta | CLV segments → CS health score design and expansion targeting |
| peter-fader | data-chief | CLV models, segmentation → chief review and strategic decisions |
| peter-fader | wes-kao | Customer value findings → strategic narrative |
| nick-mehta | peter-fader | CS health data → retention/churn analysis input |
| nick-mehta | david-spinks | CS engagement signals → community health correlation |
| nick-mehta | data-chief | CS health scores, expansion analysis → chief review |
| david-spinks | peter-fader | Community engagement data → community member CLV analysis |
| david-spinks | nick-mehta | Community health signals → CS health score input |
| david-spinks | data-chief | Community scorecard → chief review |
| wes-kao | data-chief | Strategic narrative, prioritization → chief review and approval |
| wes-kao | sean-ellis | Prioritized growth levers → experiment backlog |
| data-chief | any agent | Task assignment, rework feedback, strategic direction |

---

## Common Handoff Paths

### Path 1: Experiment Cycle
```
sean-ellis (experiment design)
    → avinash-kaushik (measurement plan + tracking)
    → sean-ellis (experiment execution + analysis)
    → wes-kao (results narrative + strategic implications)
    → data-chief (approval + registry update)
```

### Path 2: Customer Value Analysis
```
avinash-kaushik (data collection + quality validation)
    → peter-fader (CLV modeling + segmentation)
    → nick-mehta (CS health score alignment)
    → wes-kao (executive narrative)
    → data-chief (approval + registry update)
```

### Path 3: Growth Diagnostics
```
sean-ellis (growth lever analysis + PMF)
    → wes-kao (constraint-led prioritization + spiky POV)
    → avinash-kaushik (measurement plan for top lever)
    → data-chief (approval + registry update)
```

### Path 4: Community Impact
```
david-spinks (community health + engagement signals)
    → peter-fader (community member CLV + value segmentation)
    → nick-mehta (CS overlap analysis)
    → wes-kao (community ROI narrative)
    → data-chief (approval + registry update)
```

### Path 5: Dashboard Build
```
data-chief (scope + requirements)
    → avinash-kaushik (data source validation + dashboard spec)
    → wes-kao (storytelling audit + clarity review)
    → data-chief (approval + registry update)
```

### Path 6: Retention Diagnostics
```
peter-fader (cohort analysis + churn modeling)
    → nick-mehta (CS health correlation + intervention design)
    → sean-ellis (retention experiment design)
    → data-chief (approval + registry update)
```

---

## Validation at Each Transition Point

When a receiving agent accepts a handoff, they perform the following checks before beginning their own work:

1. **Payload completeness:** All three handoff components are present (output artifact, checklist result, context brief).
2. **L1 gate verification:** The sending agent's checklist results show a pass. If the checklist shows unresolved critical items, the handoff is rejected.
3. **Input fitness:** The output artifact is usable as input for the receiving agent's task. Data formats match expectations. Required fields are populated.
4. **Assumption review:** The receiving agent reviews stated assumptions and flags any they disagree with before proceeding.
5. **Scope confirmation:** The "what is needed next" section aligns with what the receiving agent understands their role to be.

**If validation fails:** The receiving agent returns the handoff to the sending agent with a specific description of what is missing or incorrect. This counts as a fail at the sending agent's L1 gate, and the sending agent re-enters their self-correction loop.

---

## Anti-Patterns

The following behaviors are explicitly prohibited. data-chief monitors for these patterns and intervenes when detected.

| Anti-Pattern | Why It Is Harmful | Prevention |
|--------------|-------------------|------------|
| **Skipping agents in a path** | Missing an agent means missing their domain expertise and quality gate. An experiment analyzed without measurement validation (skipping kaushik) may have faulty data. | Follow the routing in `config.yaml`. If an agent seems unnecessary, discuss with data-chief before skipping. |
| **Bypassing L1 gates** | Passing unchecked work to the next agent shifts the quality burden downstream and increases rework. | Every handoff must include the checklist result. Receiving agents reject handoffs without it. |
| **Verbal-only handoffs** | Context is lost, assumptions are unrecorded, and there is no audit trail. | All handoffs use the structured payload. No exceptions. |
| **Circular handoffs** | Agent A hands to Agent B who hands back to Agent A without resolution, creating infinite loops. | Maximum 2 round-trips between any two agents. After that, data-chief intervenes. |
| **Scope creep in handoffs** | Sending agent adds requests beyond the original task scope in the "what is needed next" section. | The receiving agent validates scope against the original task definition. Out-of-scope requests go to data-chief for prioritization. |
| **Partial handoffs** | Sending agent hands off incomplete work hoping the receiving agent will finish it. | Output artifacts must be complete per the template. No "TBD" fields. |

---

## Escalation to data-chief

A handoff is escalated to data-chief when any of the following occurs:

1. **Repeated rejection:** A handoff between two agents has been rejected and resubmitted 2 times without resolution.
2. **Scope dispute:** The sending and receiving agents disagree about what the receiving agent should do with the output.
3. **Quality dispute:** The receiving agent believes the sending agent's L1 gate pass was incorrect (the output has quality issues the checklist should have caught).
4. **Routing uncertainty:** An agent is unsure which agent should receive their output next.
5. **Priority conflict:** The receiving agent does not have capacity to accept the handoff within the required timeline.

**data-chief resolution options:**
- Mediate the dispute and provide a binding decision
- Reassign the work to a different agent
- Adjust the task scope or timeline
- Absorb the handoff validation personally and pass work forward

---

## Related Documents

- [HRM Quality Gate Cascade](quality-gate-cascade.md) — The 5-level cascade that governs all quality validation
- [Quality Gate Enforcement Workflow](../workflows/quality-gate-enforcement-workflow.md) — Step-by-step enforcement procedure
- [Agent Roles Guide](agent-roles-guide.md) — Agent responsibilities and domain authority
- [Cross-Squad Integration Guide](cross-squad-integration-guide.md) — Handoffs to other squads (Level 4 gate)
- `config.yaml` — Routing definitions that determine agent involvement per task

---

*Last updated: 2026-03-18 | Maintained by: data-chief*
