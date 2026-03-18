# RalphLoop/Kaizen Continuous Improvement Guide

## What is RalphLoop

RalphLoop is the Data Squad's continuous improvement cycle. It is named after the principle that every output generates a learning that improves the next output. No deliverable is complete until the squad has extracted and registered the lesson it taught.

The cycle has 5 stages: **Diagnose, Correct, Verify, Learn, Register**. Skipping a stage breaks the loop.

---

## The 5 Stages

### Stage 1 — Diagnose

Identify what went wrong or what could be better. Use checklists to pinpoint the exact gap.

- Run the applicable checklist from `checklists/` -- agent-specific (`checklists/kaushik/`, `checklists/fader/`, `checklists/ellis/`, `checklists/kao/`, `checklists/mehta/`, `checklists/spinks/`) or domain-specific (`checklists/analytics/`, `checklists/experimentation/`, `checklists/governance/`).
- Record: which item failed, what the standard was, and what the actual output was.
- If ambiguous, default to mandatory gates: `metric-definition-quality`, `data-quality-quality`, `exec-report-quality`.

### Stage 2 — Correct

Apply the fix. Use the relevant framework to guide the correction -- do not improvise without a framework.

- Reference the task's assigned frameworks from `config.yaml` routing (e.g., `frameworks/kpi-tree.md`, `frameworks/experiment-framework.md`).
- Apply the correction to the specific artifact, not the entire deliverable.
- If the correction requires another agent, follow `docs/inter-agent-handoff-protocol.md`.

### Stage 3 — Verify

Re-run the quality gate. The corrected output must pass the same checklist that caught the issue.

- Use the same checklist from Stage 1. If multiple checklists failed, run all of them.
- Verification is performed by the producing agent (L1) or lead agent (L2).
- If verification fails, return to Stage 1. This counts as one rework loop.

### Stage 4 — Learn

Extract the lesson. Answer three questions:

1. **What pattern caused the issue?** Data quality gap, metric misunderstanding, missing checklist item, framework gap, or handoff failure?
2. **Is it systemic or one-off?** Could the same issue recur on the next similar task?
3. **What would have prevented it?** Better checklist item, framework update, process change, or training?

### Stage 5 — Register

Record the learning in `data/registries/`. If the learning changes a standard, update the relevant doc or checklist.

- Primary destination: `data/registries/lessons-learned-registry.yaml`
- Entry format: date, task, agent, issue, resolution, systemic (yes/no), action taken.
- If systemic: create a follow-up action and assign an owner.

## Integration with Quality Gates

RalphLoop triggers whenever any quality gate (G1-G5) fails during the cascade. See `docs/quality-gate-cascade.md`.

- **G1 — Definition** fails → Focus on metric and KPI definition artifacts.
- **G2 — Instrumentation** fails → Focus on tracking plans and event taxonomy.
- **G3 — Quality** fails → Focus on data completeness, accuracy, and freshness.
- **G4 — Insight** fails → Focus on analysis methodology and experiment rigor.
- **G5 — Decision + Registry** fails → Focus on executive readiness and registry completeness.

**Rework loop limits:** Maximum 2 loops per gate level. If 2 loops fail, escalate to the next cascade level (L1 → L2 → L3 → L4 → L5). Escalation is not failure -- it is the system working as designed.

## Kaizen Cadence

### Per-Task
RalphLoop runs after every task completion, regardless of whether a gate failed. Even a clean pass produces a learning.

### Weekly
data-chief reviews new entries in `data/registries/lessons-learned-registry.yaml` during the Tuesday squad sync. Look for patterns: same checklist items failing repeatedly, one agent hitting the same issue.

### Monthly
Squad retrospective dedicated to systemic improvements. Review all systemic entries from the past month. Assign owners and deadlines for framework or checklist updates.

### Quarterly
Framework and checklist updates based on accumulated learnings. Update `config.yaml` routing if new checklists or frameworks have been created. Archive resolved systemic issues.

## Registry Updates

All learnings are recorded in `data/registries/`. Primary registry:

- **`data/registries/lessons-learned-registry.yaml`** — Every RalphLoop cycle produces an entry here.
- `data/registries/decision-registry` — If the learning led to a decision change.
- `data/registries/metric-registry` — If a metric definition was corrected.
- `data/registries/experiment-registry` — If an experiment methodology was revised.

### Entry Format

```yaml
- date: "2026-03-18"
  task: "run-cohort-analysis"
  agent: "peter-fader"
  issue: "Cohort boundaries did not align with billing cycles"
  resolution: "Added billing-cycle alignment check to cohort-analysis-quality checklist"
  systemic: true
  action_taken: "Updated checklists/cohort-analysis-quality.md"
```

## Anti-Patterns

1. **Skipping the Register step.** If a learning is not recorded, it does not exist.
2. **Treating rework as punishment.** RalphLoop is the squad's competitive advantage. Rework is investment.
3. **Not updating frameworks when systemic issues are found.** Same issue three times without a framework change means the process is broken.
4. **Running more than 2 loops without escalating.** The limit exists because the problem is above that level's authority.
5. **Logging vague lessons.** "Be more careful" is not a lesson. "Add a freshness check to cohort-analysis-quality" is.

---

## Related Documents

- [Quality Gate Cascade](quality-gate-cascade.md) — The 5-level validation cascade
- [RalphLoop Quality Workflow](../workflows/ralphloop-quality-workflow.md) — The 5-gate system (G1-G5)
- [Quality Gate Enforcement Workflow](../workflows/quality-gate-enforcement-workflow.md) — Gate enforcement procedure
- [Inter-Agent Handoff Protocol](inter-agent-handoff-protocol.md) — Corrections between agents
- `config.yaml` — Routing brain with gate and registry definitions

---

*Last updated: 2026-03-18 | Maintained by: data-chief*
