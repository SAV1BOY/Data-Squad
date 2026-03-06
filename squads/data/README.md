# Data Squad

> Data + Analytics + Growth Metrics + Customer Success Metrics + Community Metrics

**Mission:** Transform raw data into executable decisions with full traceability.

---

## Quick Start (7 Days)

1. Read `ARCHITECTURE.md` to understand the system
2. Read `docs/getting-started.md` for onboarding
3. Review `agents/` to understand who does what
4. Check `config.yaml` to see how tasks route to agents, frameworks, and checklists
5. Pick your first task from `tasks/` and follow the workflow

---

## The Squad (7 Agents)

| Agent | Domain | Superpower |
|-------|--------|------------|
| Data Chief | Orchestration | Decides what to measure (and what not to) |
| Avinash Kaushik | Measurement | DMMM, See-Think-Do-Care, metrics that matter |
| Peter Fader | Customer Value | CLV, value segmentation, customer centricity |
| Sean Ellis | Growth | PMF, experiments, North Star, activation |
| Wes Kao | Strategy | Rigorous thinking, prioritization, learning velocity |
| Nick Mehta | Customer Success | Health scores, NRR/GRR, expansion, digital CS |
| David Spinks | Community | Orbit model, contribution paths, community ROI |

---

## Directory Map

| Directory | Files | What's Inside |
|-----------|-------|---------------|
| `agents/` | 7 | Agent personas with HRM activation prompts |
| `frameworks/` | 85+ | Mental models: universal, agent-specific, reference, stack, applied |
| `checklists/` | 110+ | Quality gates: macro deliverables, agent schools, domains |
| `templates/` | 50+ | Deliverable templates: briefs, outputs, reports, plans |
| `tasks/` | 65+ | Executable task definitions across 11 domains |
| `reference/` | 90+ | Books, standards, tools, schemas, psychology, industries |
| `workflows/` | 20 | End-to-end playbooks |
| `docs/` | 18 | Squad documentation |
| `voice/` | 22+ | Tone profiles, language guides, calibration |
| `phrases/` | 18 | Standardized language blocks |
| `lib/` | 40+ | Components, patterns, utilities, SQL, taxonomies |
| `scripts/` | 14 | Automation: validation, analysis, reporting, alerting |
| `data/` | 50+ | Registries, metrics, experiments, models, alerts |
| `swipe/` | 30+ | Best-in-class examples by category |
| `archive/` | 20+ | Iconic analytics, evolution, failures |
| `authority/` | 13 | Thought leadership, workshops |
| `projects/` | 40+ | 7 project types with numbered phases |

---

## How It Works

```
Task -> config.yaml (routing) -> Agents + Frameworks + Checklists -> Template -> Registry -> Metrics
```

1. A task arrives (from any squad or internal)
2. `config.yaml` routes it to the right agents, frameworks, and checklists
3. Agents execute using frameworks as mental models
4. Output passes through quality gate checklists (RalphLoop)
5. Deliverable is formatted using templates
6. Decision and learning are recorded in `data/registries/`
7. Impact is tracked in `data/metrics/`

---

## Principles

1. **Decision Over Dashboard** -- Dashboards exist to decide, not to decorate
2. **Single Source of Truth** -- One metric, one definition, one owner
3. **Experiment Before Opinion** -- Test before you opine
4. **Prove or Kill** -- No zombie metrics, no vanity dashboards
5. **Data Quality First** -- Bad data = bad decisions = bad outcomes

---

## Cross-Squad Integration

This squad integrates with: Traffic, Copy, Brand, Design, Movement, Storytelling.
See `config.yaml > cross_squad` for full bidirectional handoff mapping.

---

## The "So What?" Test

Every output must answer:
1. **So what?** -- What does this mean for the business?
2. **Now what?** -- What action should we take?
3. **Then what?** -- How will we know if the action worked?

---

*Version 2.0.0 | See ARCHITECTURE.md for full system documentation*
