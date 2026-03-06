# Contribution Guide

## Purpose

This guide explains how to contribute to the Data Squad repository: how to propose changes, what standards to follow, and how changes are reviewed and merged. The repository is the single source of truth for the squad's processes, definitions, and institutional knowledge. Keeping it accurate and current is everyone's responsibility.

## What Can Be Contributed

**Workflows:** New workflows for processes not yet documented, or improvements to existing workflows based on practical experience.

**Documentation:** New guides, updates to existing docs, FAQ additions, glossary terms, and clarifications based on common questions.

**Metric Definitions:** New metrics following the definitions-guide.md, or modifications to existing definitions with proper versioning.

**Registry Entries:** New entries or updates to the metric registry, dashboard registry, experiment registry, or data quality registry.

**Templates:** Reusable templates for common deliverables: analysis reports, experiment briefs, dashboard briefs, and stakeholder communications.

## How to Contribute

### Step 1: Check Before You Create
Search the repository for existing content on your topic. If something similar exists, modify it rather than creating a duplicate. Use the glossary to ensure your terminology is consistent.

### Step 2: Follow the Standards
- File names use kebab-case as defined in naming-conventions.md.
- Workflows include all required sections: Trigger, Agents Involved, Steps, Inputs/Outputs, Quality Gates, Registry Updates.
- Documentation is written for the target audience, not for the author. Non-analysts should understand docs aimed at them.
- No placeholders. Every section must contain substantive content. "TBD" is not acceptable in merged content.

### Step 3: Create a Branch
Create a branch from `main` with a descriptive name: `add-workflow-churn-investigation` or `update-glossary-experimentation-terms`. Do not commit directly to `main`.

### Step 4: Write the Content
Follow the existing patterns in the repository. Look at similar files for structure and tone. Key standards:
- Use Markdown formatting consistently.
- Include headers at the right level (H1 for title, H2 for major sections, H3 for subsections).
- Tables for structured information (quality gates, SLAs, role matrices).
- No emojis in committed content.
- Active voice, direct language, no unnecessary hedging.

### Step 5: Submit for Review
Open a pull request with:
- A clear title describing the change.
- A brief description of what was added or changed and why.
- Tag the appropriate reviewer based on the content type (see review assignments below).

### Step 6: Address Feedback
Reviewers may request changes. Address each comment with either a revision or an explanation of why the original content should stand. All comments must be resolved before merging.

### Step 7: Merge and Notify
Once approved, merge the PR. If the change affects other squads or active workflows, notify the relevant parties in #data-squad.

## Review Assignments

| Content Type | Primary Reviewer | Secondary Reviewer |
|-------------|-----------------|-------------------|
| Workflows | Analytics Architect | Retention Strategist |
| Metric definitions | Analytics Architect | Data Quality Sentinel |
| Documentation (process) | Insight Narrator | Analytics Architect |
| Documentation (technical) | Analytics Architect | Data Quality Sentinel |
| Registry entries | Analytics Architect | Content-specific agent |
| Templates | Insight Narrator | Relevant agent |

## Review Criteria

Reviewers check for:
1. **Accuracy:** Is the content correct? Do process descriptions match how we actually work?
2. **Completeness:** Are all required sections present? Are edge cases addressed?
3. **Consistency:** Does the content use standard terminology (glossary), follow naming conventions, and align with existing documentation?
4. **Clarity:** Can the target audience understand the content without additional context?
5. **No duplicates:** Does this content overlap with something that already exists?

## Updating Existing Content

When updating existing content:
- Use the Edit tool or equivalent to modify in place. Do not delete and recreate.
- Add a note in the change log if the update is substantive (not just fixing a typo).
- If the update changes a metric definition, follow the definitions-guide.md modification process.
- If the update changes a workflow, notify any agents who are currently executing that workflow.

## Change Log Entries

For substantive changes, add an entry to changelog.md with:
- Date of the change
- What was changed (file path and section)
- Why it was changed (one sentence)
- Who made the change

Typo fixes, formatting adjustments, and minor clarifications do not require change log entries.

## Questions

If you are unsure whether a contribution is needed or how to structure it, ask in #data-squad before investing time. A 2-minute conversation can save hours of rework.
