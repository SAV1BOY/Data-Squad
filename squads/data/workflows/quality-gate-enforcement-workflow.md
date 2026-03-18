# Quality Gate Enforcement Workflow

## Purpose
Enforce the HRM 5-level quality gate cascade on every Data Squad deliverable. This workflow provides the step-by-step operational procedure that agents and data-chief follow from task completion through registry update and learning capture.

## Trigger
- An agent completes a unit of work (analysis, model, report, tracking spec, experiment, dashboard, metric definition)
- A previously failed deliverable has been reworked and is ready for re-validation
- A cross-squad deliverable is ready for handoff

## Agents Involved
- **Producing agent(s):** The agent(s) who completed the work (any of: avinash-kaushik, peter-fader, sean-ellis, wes-kao, nick-mehta, david-spinks)
- **data-chief:** Final squad-level authority for L3 gate and cross-squad L4 exit gate
- **Receiving squad chief:** For L4 entry gate (when applicable)

## Prerequisites
- Task has been assigned through `config.yaml` routing with defined agents, frameworks, checklists, and templates
- Agent has access to the relevant checklists from `checklists/` directory
- Output artifact is in the correct template format from `templates/`

---

## Step 1: Agent Completes Work

1. The producing agent finishes the deliverable according to the task definition in `config.yaml`.
2. The agent confirms the output uses the correct template from `templates/`.
3. The agent documents any assumptions, caveats, or limitations within the output artifact.
4. The agent records the data sources, time ranges, and methodology used.

**Output of this step:** A draft deliverable ready for self-validation.

---

## Step 2: Agent Self-Validates (Level 1 Gate)

5. The producing agent identifies which agent-specific checklists apply from their `checklists/` subdirectory (e.g., `checklists/kaushik/`, `checklists/fader/`, `checklists/ellis/`, `checklists/kao/`, `checklists/mehta/`, `checklists/spinks/`).
6. The agent also identifies which task-level checklists apply from the `config.yaml` routing entry for the current task.
7. The agent runs through each checklist item, recording pass/fail/caveat for every item.
8. The agent applies the "So What?" test: So what? (meaning for business), Now what? (action to take), Then what? (how to verify the action worked).
9. If all checklist items pass → proceed to Step 3 (if multi-agent) or Step 4 (if single-agent).
10. If any checklist item fails → the agent enters the self-correction loop:
    - Identify the root cause of the failure.
    - Correct the output.
    - Re-run the failed checklist items.
    - Maximum 2 self-correction iterations.
11. If the output still fails after 2 iterations → escalate to data-chief with a description of the blocking issue.

**Output of this step:** L1-passed deliverable with completed checklist results, or escalation to data-chief.

---

## Step 3: Team Coordination Gate (Level 2 — Multi-Agent Tasks Only)

12. Check `config.yaml` routing for the current task. If the task lists 2 or more agents → this step applies. If only 1 agent → skip to Step 4.
13. The lead agent (first agent listed in the routing) collects all L1-passed outputs from contributing agents.
14. The lead agent checks cross-agent consistency:
    - Do all agents use the same metric definitions?
    - Do all agents use the same time ranges and segmentation criteria?
    - Do all agents use consistent terminology?
15. The lead agent checks logical coherence:
    - Do the individual outputs tell a consistent story when combined?
    - Are there contradictions between agent conclusions?
16. The lead agent checks coverage completeness:
    - Has every agent addressed their assigned portion?
    - Are there gaps between agent scopes?
17. If all checks pass → mark as L2-passed and proceed to Step 4.
18. If any check fails → identify the weakest output and return it to the responsible agent for L1 rework with specific feedback on what needs alignment.
19. Maximum 2 coordination cycles. If unresolved → data-chief intervenes directly.

**Output of this step:** L2-passed combined deliverable, or data-chief intervention.

---

## Step 4: Squad Chief Review (Level 3 Gate)

20. data-chief receives the L1-passed (or L2-passed) deliverable.
21. data-chief applies the **mandatory gates** from `config.yaml quality_gates.mandatory`:
    - `metric-definition-quality` — Are all metrics properly defined?
    - `data-quality-quality` — Is the underlying data trustworthy?
    - `exec-report-quality` — Is the output decision-ready?
22. data-chief identifies and applies the **per-domain gates** from `config.yaml quality_gates.per_domain` based on the deliverable type (definition, instrumentation, analysis, experimentation, growth, retention, customer_success, community, visualization, governance).
23. data-chief confirms the appropriate **RalphLoop gates** (G1-G5) have been applied:
    - G1 (Definition): `metric-definition-quality`, `kpi-tree-quality`
    - G2 (Instrumentation): `tracking-plan-quality`, `instrumentation/tag-manager-qa`
    - G3 (Quality): `data-quality-quality`, `alerting-quality`
    - G4 (Insight): `cohort-analysis-quality`, `experiment-analysis-quality`
    - G5 (Decision + Registry): `exec-report-quality` + required registry updates
24. data-chief evaluates strategic alignment: Does the output support current priorities? Does it contradict existing analyses?
25. data-chief confirms registry updates are prepared.
26. If all checks pass → mark as L3-approved. Execute registry updates. Proceed to Step 5 (if cross-squad) or Step 6 (if internal).
27. If any check fails → return to the responsible agent with specific feedback:
    - Which checklist items failed
    - Why they failed
    - What the expected correction is
28. The agent re-enters L1 (or L2 if multi-agent) with the chief's feedback.
29. Maximum 2 rework loops at L3. If unresolved → data-chief descopes, reassigns, or escalates to L5 (HRM Chief).

**Output of this step:** L3-approved deliverable with registry updates executed, or rework/escalation.

---

## Step 5: Cross-Squad Handoff Gate (Level 4 — Cross-Squad Deliverables Only)

30. Check if the deliverable is intended for another squad per `config.yaml cross_squad`. If not → skip to Step 6.
31. data-chief performs the **exit gate**:
    - Verify deliverable meets the receiving squad's contract (per `cross-squad-integration-guide.md`)
    - Confirm deliverable includes: executive summary, methodology, limitations, next steps
    - Run `cross-squad-data-request-quality` checklist
    - Confirm output is placed in the correct destination path
32. If exit gate passes → hand off to the receiving squad.
33. The receiving squad's chief performs the **entry gate**:
    - Confirm deliverable is interpretable and actionable
    - Confirm data definitions match their understanding
    - Confirm no conflicts with their existing data
34. If both gates pass → handoff is complete. Log in decision-registry. Proceed to Step 6.
35. If exit gate fails → return to responsible agent for remediation through L1/L2/L3.
36. If entry gate fails → receiving squad returns deliverable to data-chief with specific issues. data-chief triages and assigns remediation.
37. Maximum 2 remediation cycles. If unresolved → both squad chiefs escalate to L5.

**Output of this step:** Completed cross-squad handoff logged in registry, or escalation.

---

## Step 6: Registry Update

38. Confirm all required registry updates have been executed (this should have happened at L3, but verify):
    - `data/registries/decision-registry` — Decision made, rationale, owner, date
    - `data/registries/metric-registry` — Any new or changed metric definitions
    - `data/registries/experiment-registry` — Experiment results and status (if applicable)
    - `data/registries/lessons-learned-registry` — Key learnings from the work
    - Domain-specific registries as applicable (`clv-registry`, `segment-registry`, `cs-health-registry`, `community-registry`, `event-registry`, `dashboard-registry`, `data-quality-registry`)
39. Verify registry entries include: date, author, deliverable reference, gate sign-off level (L1/L2/L3/L4/L5), and status.
40. If any registry updates are missing → complete them before proceeding.

**Output of this step:** All registries updated and verified.

---

## Step 7: RalphLoop Learning Capture

41. The producing agent documents what was learned during the work:
    - **What worked:** Methods, data sources, or approaches that proved effective
    - **What did not work:** Approaches tried and abandoned, with reasons
    - **What was surprising:** Unexpected findings that may inform future work
    - **What to do differently:** Process improvements for similar future tasks
42. If any quality gate failed during the cascade, document:
    - Which gate failed and why
    - How many rework iterations were needed
    - What the root cause was
    - How to prevent the same failure in future work
43. Update `data/registries/lessons-learned-registry` with the learning capture.
44. If the learning suggests a checklist improvement → file a checklist update request with data-chief.
45. If the learning suggests a process improvement → data-chief adds it to the quarterly data review agenda.

**Output of this step:** Learning capture registered, process improvement candidates identified.

---

## Inputs
- Completed deliverable from the producing agent
- Task definition from `config.yaml` routing
- Agent-specific and task-level checklists from `checklists/`
- Current squad priorities and OKRs
- Cross-squad contracts from `config.yaml cross_squad` (if applicable)

## Outputs
- L3-approved (or L4/L5-approved) deliverable
- Gate sign-off record with level achieved
- Updated registries (decision, metric, experiment, lessons-learned, domain-specific)
- Learning capture entry
- Process improvement candidates (if any)

## Quality Gate Summary

| Step | Gate Level | Owner | Max Loops | Fail Escalation |
|------|-----------|-------|-----------|-----------------|
| 2 | L1 — Agent | Producing agent | 2 | data-chief |
| 3 | L2 — Team | Lead agent | 2 | data-chief intervention |
| 4 | L3 — Chief | data-chief | 2 | Descope/reassign/L5 |
| 5 | L4 — Cross-Squad | data-chief + receiving chief | 2 | L5 escalation |
| — | L5 — HRM | HRM Chief | 1 | Descope/working group |

## Escalation
- If a deliverable fails the same gate 3 times across its lifecycle: data-chief conducts a root cause analysis and may reassign the task or revise the quality criteria.
- If gate enforcement creates a delivery bottleneck: data-chief reviews whether the gate criteria are appropriately calibrated and adjusts if needed.
- Time-sensitive deliverables: data-chief can run L1 and L3 concurrently for urgent items, but cannot skip gates entirely.

---

*Last updated: 2026-03-18 | Maintained by: data-chief*
