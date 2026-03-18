# HRM Quality Gate Cascade

## Purpose

This document defines the 5-level quality gate cascade that governs every Data Squad deliverable from individual agent output to HRM Chief review. The cascade ensures that no output reaches a stakeholder, another squad, or a strategic decision-maker without passing through the appropriate validation levels. This is the operational bridge between the RalphLoop 5-gate system (G1-G5) and the HRM organizational hierarchy.

## Why 5 Levels

The RalphLoop gates (G1-G5) define **what** quality checks run. The HRM cascade defines **who** validates at each organizational layer and **when** escalation is required. Together they form a complete quality enforcement system: RalphLoop gates are the checklists; the HRM cascade is the chain of accountability.

---

## Level 1 — Agent Individual Gate

**Trigger:** An agent completes any unit of work (analysis, model, checklist, report section, tracking spec, experiment design).

**Who validates:** The agent who produced the output.

**What is checked:**
- Agent-specific checklists from the agent's checklist directory:
  - `checklists/kaushik/` — DMMM measurement model audit, metrics-that-matter filter, see-think-do-care mapping, dashboard storytelling audit, web analytics quality
  - `checklists/fader/` — CLV modeling audit, value segmentation audit, whale curve audit, discount rate and horizon check, heterogeneity audit
  - `checklists/ellis/` — North Star metric audit, PMF survey quality, activation loop debug, growth lever audit
  - `checklists/kao/` — Growth strategy clarity, messaging-to-metric alignment, constraint-led prioritization, onboarding activation QA
  - `checklists/mehta/` — Health score design, expansion playbook audit
  - `checklists/spinks/` — Community loop design, community impact attribution, engagement signal quality
- Minimum quality bar: every required field in the checklist is completed, no critical items are left unresolved, output passes the "So What?" test (So what? Now what? Then what?)
- Output artifact is in the correct template format from `templates/`

**Pass action:** Agent marks output as "L1-passed" and passes to the next level (L2 if multi-agent, L3 if single-agent task).

**Fail action:** Agent enters a self-correction loop. The agent re-examines the failed checklist items, corrects the output, and re-validates. Maximum 2 self-correction iterations. If the output still fails after 2 iterations, the agent escalates to data-chief with a description of what is blocking resolution.

**Max loops:** 2 self-correction iterations before escalation.

**Registry update:** None at this level. Registry updates happen at L3 or above.

---

## Level 2 — Team/Swarm Coordination Gate

**Trigger:** A task involves 2 or more agents collaborating on a single deliverable. Examples: `design-experiment` (sean-ellis + wes-kao + data-chief), `retention-diagnostics` (peter-fader + nick-mehta + data-chief), `activation-audit` (sean-ellis + wes-kao + avinash-kaushik).

**Who validates:** The lead agent on the task (first agent listed in `config.yaml` routing) performs coordination validation. data-chief reviews when listed as an agent on the task.

**What is checked:**
- **Cross-agent consistency:** Do the outputs from different agents use the same metric definitions, time ranges, segmentation criteria, and terminology?
- **Logical coherence:** Do the individual agent outputs tell a consistent story when combined? Are there contradictions between agent conclusions?
- **Coverage completeness:** Has every agent addressed their assigned portion of the deliverable? Are there gaps between agent scopes?
- **Handoff integrity:** Did each agent's L1-passed output arrive with the correct checklist sign-offs?

**Pass action:** Lead agent marks the combined output as "L2-passed" and forwards to data-chief for L3 review.

**Fail action:** The lead agent identifies the weakest agent output (the one causing inconsistency or the gap). That specific agent's output is returned for rework at L1. The agent re-enters the L1 self-correction loop with specific feedback on what needs alignment. The team gate is re-run after the rework.

**Max loops:** 2 coordination cycles. If the team cannot achieve coherence after 2 cycles, data-chief intervenes directly to mediate and resolve the inconsistency.

**Registry update:** None. Registry updates happen at L3.

---

## Level 3 — Squad Chief Gate (Final Squad Gate)

**Trigger:** Any deliverable is ready for final squad-level approval. This gate runs for every output regardless of whether it passed through L2.

**Who validates:** data-chief.

**What is checked:**

1. **Mandatory gates** (from `config.yaml quality_gates.mandatory`):
   - `metric-definition-quality` — Is every metric properly defined with owner, formula, source, and caveats?
   - `data-quality-quality` — Is the underlying data trustworthy, complete, and fresh?
   - `exec-report-quality` — Is the output decision-ready with clear "so what" and recommended action?

2. **Per-domain gates** (from `config.yaml quality_gates.per_domain`, applied based on deliverable type):
   - Definition: `kpi-tree-quality`, `event-taxonomy-quality`
   - Instrumentation: `tracking-plan-quality`, `instrumentation/tag-manager-qa`
   - Analysis: `cohort-analysis-quality`, `segmentation-quality`
   - Experimentation: `experiment-design-quality`, `experiment-analysis-quality`
   - Growth: `activation-funnel-quality`, `ellis/north-star-metric-audit`
   - Retention: `retention-quality`, `ltv-clv-model-quality`
   - Customer Success: `cs-health-score-quality`, `nrr-grr-quality`
   - Community: `community-metrics-quality`, `spinks/community-loop-design`
   - Visualization: `dashboard-quality`
   - Governance: `governance/metric-governance`, `privacy-and-compliance-quality`

3. **RalphLoop gate alignment:** data-chief confirms the appropriate RalphLoop gates (G1-G5) have been applied based on the deliverable's stage in the data lifecycle.

4. **Strategic alignment:** Does the output support current squad priorities and OKRs? Does it contradict or duplicate existing registered analyses?

5. **Registry readiness:** Are all required registry updates prepared (decision-registry, metric-registry, experiment-registry, lessons-learned-registry as applicable)?

**Pass criteria:** All mandatory checklists pass. All applicable per-domain checklists pass. Output is decision-ready (passes the "So What?" test). Registry updates are prepared.

**Pass action:** data-chief marks output as "L3-approved." Registry updates are executed. If the output is for internal use only (no cross-squad handoff), it is delivered to the stakeholder. If cross-squad handoff is needed, it proceeds to L4.

**Fail action:** data-chief returns the output to the responsible agent with specific feedback identifying which checklist items failed and why. The agent re-enters the L1 loop (or L2 if multi-agent) with the chief's feedback. Maximum 2 rework loops at L3. If the output fails after 2 rework loops, data-chief either descopes the deliverable, reassigns to a different agent, or escalates to L5 for strategic guidance.

**Max loops:** 2 rework iterations.

**Registry update:** On pass — decision-registry, metric-registry, experiment-registry, lessons-learned-registry, and any domain-specific registries are updated per `config.yaml` routing rules.

---

## Level 4 — Cross-Squad Handoff Gate

**Trigger:** A deliverable is intended for another squad (traffic, copy, brand, design, movement, or storytelling) as defined in `config.yaml cross_squad`.

**Who validates:**
- **Exit gate (data squad side):** data-chief validates outbound deliverable.
- **Entry gate (receiving squad side):** The receiving squad's chief validates inbound deliverable.

**What is checked:**

### Exit Gate (data-chief validates before handoff)
- Output meets the receiving squad's documented contract (see `cross-squad-integration-guide.md` and `config.yaml cross_squad`)
- Deliverable includes all required components:
  - Executive summary (3 sentences: question, answer, recommended action)
  - Methodology section (data sources, time ranges, assumptions)
  - Limitations section (what is not covered, where data may be incomplete)
  - Next steps with proposed owners
- Handoff format matches the receiving squad's expected format
- `cross-squad-data-request-quality` checklist passes
- Output is placed in the correct destination path per `config.yaml cross_squad`

### Entry Gate (receiving squad validates after handoff)
- Receiving squad confirms the deliverable is interpretable and actionable
- Receiving squad confirms data definitions match their understanding
- Receiving squad confirms no conflicts with their existing data or analyses

### Handoff Contracts by Squad

| Receiving Squad | Data Squad Provides | Format/Destination |
|-----------------|--------------------|--------------------|
| Traffic | Attribution reports, incrementality results, audience segments | traffic/data/, traffic/frameworks/, traffic/tasks/ |
| Copy | Conversion metrics, funnel dropoff insights | copy/data/, copy/tasks/ |
| Brand | Brand health metrics, brand search trends | brand/data/, brand/reference/ |
| Design | HEART metrics, feature adoption data | design/data/metrics/, design/tasks/ |
| Movement | Movement health score, community ROI | movement/data/metrics/, movement/reports/ |
| Storytelling | Data narratives, proof points | storytelling/data/, storytelling/reference/ |

**Pass action:** Deliverable is formally handed off. Both squads acknowledge the handoff. data-chief logs the handoff in `data/registries/decision-registry`.

**Fail action — Exit gate failure:** data-chief returns deliverable to the responsible agent for remediation. The agent re-enters L1/L2/L3 as needed to address the gap.

**Fail action — Entry gate failure:** Receiving squad returns the deliverable to data-chief with specific issues. data-chief triages and assigns remediation to the responsible agent. If the disagreement is about data definitions or methodology, data-chief mediates directly with the receiving squad's chief.

**Max loops:** 2 remediation cycles. If unresolved after 2 cycles, both squad chiefs escalate to L5.

**Registry update:** Handoff logged in decision-registry with receiving squad, deliverable type, and acceptance status.

---

## Level 5 — HRM Chief Gate

**Trigger:** One or more of the following conditions is met:
- Output affects a strategic decision that spans 3 or more squads
- Output contradicts an existing organizational-level decision or metric definition
- L3 or L4 rework loops have been exhausted without resolution
- A cross-squad dispute about data definitions, methodology, or priority cannot be resolved at the squad-chief level
- Output will be presented to executive leadership or external stakeholders
- A data quality incident affects multiple squads simultaneously

**Who validates:** HRM Chief (organizational-level authority above all squad chiefs).

**What is checked:**
- **Organizational alignment:** Does the output support the organization's strategic objectives, not just the Data Squad's?
- **Cross-squad coherence:** Is the output consistent with what other squads are reporting? Are there conflicting narratives?
- **Resource allocation implications:** Does the recommended action require resources from squads that have not been consulted?
- **Risk assessment:** Does the output create reputational, financial, or operational risk if acted upon?
- **Precedent setting:** Does this decision set a precedent that affects future work across the organization?

**Pass action:** HRM Chief approves the output. data-chief proceeds with delivery or handoff. The decision is logged with HRM-level approval notation.

**Fail action:** HRM Chief returns the output to data-chief with strategic feedback. data-chief adjusts scope, methodology, or recommendation based on the feedback and re-enters L3. If the feedback requires input from other squads, data-chief coordinates through L4 handoff gates.

**Max loops:** 1 rework cycle at L5. If the output still does not meet HRM Chief standards after 1 rework, the HRM Chief either descopes the initiative or convenes a cross-squad working group to resolve.

**Registry update:** HRM-level decisions are logged in decision-registry with an `hrm-approved` tag and the strategic rationale.

---

## Cascade Flow Summary

```
Agent completes work
        |
        v
[Level 1: Agent Individual Gate]
  - Agent self-validates using agent-specific checklists
  - Max 2 self-correction loops
  - Pass → Is this a multi-agent task?
        |
   +----+----+
   |         |
  Yes        No
   |         |
   v         |
[Level 2: Team Coordination Gate]   |
  - Lead agent checks cross-agent   |
    consistency and coherence        |
  - Max 2 coordination cycles       |
  - Pass ↓                          |
        |                           |
        +---------------------------+
        |
        v
[Level 3: Squad Chief Gate]
  - data-chief validates using mandatory + per-domain gates
  - RalphLoop gate alignment check
  - Max 2 rework loops
  - Registry updates on pass
  - Pass → Is this a cross-squad deliverable?
        |
   +----+----+
   |         |
  Yes        No → Deliver to stakeholder
   |
   v
[Level 4: Cross-Squad Handoff Gate]
  - Exit gate: data-chief validates contract compliance
  - Entry gate: receiving squad validates usability
  - Max 2 remediation cycles
  - Pass → Does this affect strategic/multi-squad decisions?
        |
   +----+----+
   |         |
  Yes        No → Handoff complete
   |
   v
[Level 5: HRM Chief Gate]
  - Organizational alignment review
  - Cross-squad coherence check
  - Max 1 rework cycle
  - Pass → Deliver with HRM approval
```

---

## Rework Loop Limits

| Level | Max Loops | On Exhaustion |
|-------|-----------|---------------|
| L1 — Agent | 2 self-corrections | Escalate to data-chief |
| L2 — Team | 2 coordination cycles | data-chief intervenes directly |
| L3 — Chief | 2 rework iterations | Descope, reassign, or escalate to L5 |
| L4 — Cross-Squad | 2 remediation cycles | Both chiefs escalate to L5 |
| L5 — HRM | 1 rework cycle | Descope or convene cross-squad working group |

**Total maximum iterations for a single deliverable:** 9 (2+2+2+2+1). In practice, most deliverables pass at L1 and L3 without rework. L2 applies only to multi-agent tasks. L4 applies only to cross-squad deliverables. L5 is rare.

---

## Related Documents

- [Inter-Agent Handoff Protocol](inter-agent-handoff-protocol.md) — How work transitions between agents within the squad
- [Quality Gate Enforcement Workflow](../workflows/quality-gate-enforcement-workflow.md) — Step-by-step enforcement procedure
- [RalphLoop Quality Workflow](../workflows/ralphloop-quality-workflow.md) — The 5-gate quality system (G1-G5)
- [Cross-Squad Integration Guide](cross-squad-integration-guide.md) — How the Data Squad works with other squads
- [Agent Roles Guide](agent-roles-guide.md) — Agent responsibilities and escalation paths
- `config.yaml` — Routing brain with quality gate definitions

---

*Last updated: 2026-03-18 | Maintained by: data-chief*
