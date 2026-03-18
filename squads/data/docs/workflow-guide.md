# Workflow Execution Guide

## Purpose

This guide explains how to execute Data Squad workflows properly: how to start them, how to navigate quality gates, how to handle exceptions, and how to close them cleanly. Every workflow in the squad follows the same structural principles even though the specific steps differ.

## Anatomy of a Workflow

Every Data Squad workflow contains the same sections:

1. **Trigger:** What event starts the workflow. Never start a workflow without a clear trigger.
2. **Agents Involved:** Which roles participate and in what capacity.
3. **Steps:** Numbered, with an owner assigned to each step. Steps are grouped into phases.
4. **Inputs/Outputs:** What goes in and what comes out.
5. **Quality Gates:** Checkpoints that must be passed before moving to the next phase.
6. **Registry Updates:** What must be recorded when the workflow completes.

## How to Start a Workflow

Step 1: Identify the trigger. Every workflow document lists its triggers explicitly. If you are unsure whether a situation warrants a particular workflow, check the trigger list. If none match, this may not be the right workflow.

Step 2: Check prerequisites. Before starting, verify that the required inputs are available. Missing inputs cause workflows to stall mid-execution. Common prerequisites include: data access, stakeholder availability, registry entries, and tool access.

Step 3: Notify the involved agents. Do not assume agents know a workflow has started. Send a brief message in the #data-squad channel: "Starting [workflow name], triggered by [trigger]. [Agent roles] will be needed in phases [X, Y]."

Step 4: Create a tracking entry. Log the workflow start in the squad's tracking system with: workflow name, trigger, start date, expected completion date, and primary owner.

## How to Navigate Quality Gates

Quality gates are non-negotiable checkpoints. A workflow cannot proceed past a gate until the gate criteria are met.

**Passing a gate:**
- The gate owner reviews the deliverable against the stated criteria.
- If all criteria are met, the owner records the pass with date and any notes.
- The workflow proceeds to the next phase.

**Failing a gate:**
- The gate owner documents specifically which criteria were not met.
- The deliverable is returned to the responsible agent with clear remediation instructions.
- The agent fixes the issues and resubmits.
- There is no limit on resubmissions, but if a gate fails twice on the same criteria, escalate to the squad lead for a process review.

**Gate timing:**
- Each gate has a maximum review time (typically 1 business day).
- If the reviewer cannot complete the review within the time limit, they must communicate a revised timeline.
- Overdue gate reviews are flagged in the weekly sync.

## How to Handle Exceptions

Not every situation fits neatly into a workflow. Here is how to handle common exceptions:

**Workflow does not match the situation:** If the trigger matches but the steps do not fit, adapt the workflow. Document the adaptation and the reason. After completing the workflow, propose a workflow update if the adaptation is likely to recur.

**Urgent request that cannot wait for gates:** In genuine emergencies (data incident affecting customers, board request with a same-day deadline), the peter-fader can authorize a fast-track. Fast-tracked deliverables still go through gates but with a compressed timeline (hours instead of days). The fast-track is documented, and a retrospective review happens within 1 week.

**Agent unavailable:** If the assigned agent for a step is unavailable, the workflow owner identifies a substitute. Any agent can execute any step if they have the required skills, but the original agent remains accountable for quality.

**Workflow stalls:** If a workflow has no progress for 3 business days, the primary owner escalates in the weekly sync. Common causes: blocked on external dependency, scope creep, or unclear next step.

## How to Close a Workflow

Step 1: Complete all registry updates. Every workflow specifies which registries to update. This is not optional. Undocumented work is lost work.

Step 2: Record the outcome. In the tracking system, update the workflow entry with: completion date, deliverables produced, decisions made, and any follow-up actions.

Step 3: Archive artifacts. Store all working documents, queries, and intermediate results in the squad repository under the appropriate folder.

Step 4: Notify stakeholders. If the workflow produced a deliverable for someone outside the squad, confirm receipt and schedule the feedback collection.

Step 5: Reflect briefly. In 2-3 sentences, note what went well and what could be improved. This feeds into the quarterly retrospective.

## Workflow Inventory

The full list of workflows is maintained in the `squads/data/workflows/` directory. Each workflow is a standalone document. Workflows reference each other when handoffs are needed (e.g., the churn investigation workflow may trigger the experiment cycle workflow for an intervention test).

## Continuous Improvement

Workflows are living documents. If you find a step that consistently causes friction, a gate that catches the same issue repeatedly, or a phase that takes longer than expected, propose an improvement. Updates to workflows go through a lightweight review by the avinash-kaushik and are documented in the change log.
