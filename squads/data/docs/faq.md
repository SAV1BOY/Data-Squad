# Frequently Asked Questions

## Purpose

This FAQ collects questions that new and existing team members commonly ask. If you ask a question and the answer is not here, add it after you get the answer. This document grows from real questions, not hypothetical ones.

---

## Getting Started

### Q: What should I do on my first day?
Follow the getting-started.md guide. Day 1 focuses on getting your tools set up. Do not try to do analysis work until your access is confirmed and working. The most common first-day frustration is trying to be productive before tools are ready.

### Q: Who is my buddy and what do I ask them?
Your buddy is assigned by the avinash-kaushik on your first day. Ask them anything you would feel awkward asking in a group: "How do I connect to the warehouse?", "Where is this table?", "Is this query correct?" There are no dumb questions during onboarding.

### Q: How long until I am expected to work independently?
The onboarding workflow targets independence by day 30. This means you can execute a standard workflow without additional scaffolding. It does not mean you know everything. Asking questions after day 30 is expected and encouraged.

### Q: What if I disagree with how something is done here?
Good. Fresh perspectives are valuable. Raise it in the weekly sync or in a 1:1 with the peter-fader. If you have a concrete proposal (not just a complaint), even better. Changes to processes follow the contribution-guide.md.

---

## Data and Metrics

### Q: Two dashboards show different numbers for the same metric. Which one is right?
Check the metric registry first. The registry has the official definition and the reference query. Run the reference query and compare. If both dashboards differ from the registry, both are wrong. Report the discrepancy to the avinash-kaushik.

### Q: How do I create a new metric?
Follow the definitions-guide.md. In short: check for duplicates, draft the 10-field definition, write a reference query, validate it, get avinash-kaushik approval, and register it. Do not start using a metric in dashboards before it is registered.

### Q: What is the difference between a metric and a KPI?
In our vocabulary, a metric is any quantitative measure with an official definition. A KPI (Key Performance Indicator) is a metric that has been selected as a target for a specific period or team. All KPIs are metrics, but not all metrics are KPIs.

### Q: Can I use a metric I found in someone else's query?
Only if it is in the registry. Queries found in someone's personal workspace may use outdated definitions, incorrect filters, or non-standard calculations. Always verify against the registry before adopting a metric.

---

## Experiments

### Q: Can I peek at experiment results early?
No. The experimentation-handbook.md is explicit about this. Early results are noise. If you need to check that the experiment is running correctly (events firing, assignment working), check operational metrics, not outcome metrics.

### Q: What if my experiment did not reach significance?
That is a valid result. "No detectable effect" means the change did not move the metric by the minimum detectable effect or more. Document it, learn from it, and move to the next hypothesis. Do not extend the experiment to fish for significance.

### Q: How do I get an experiment prioritized?
Add it to the experiment backlog with a clear hypothesis, expected impact, and ICE score. Experiments are prioritized during the monthly experiment portfolio review. High-impact, high-confidence, low-effort experiments get priority.

### Q: What if an experiment shows a negative result on the primary metric but positive on a secondary metric?
The primary metric determines the decision. If the primary metric is negative or flat, the experiment fails unless there is a compelling reason to reconsider (which requires re-running as a new experiment with the secondary metric as primary). Do not cherry-pick secondary wins to justify shipping.

---

## Workflows and Process

### Q: Do I really have to follow the workflow for a quick analysis?
If the analysis will be shared with anyone outside the squad, yes. The quality gates exist because past quick analyses contained errors that damaged trust. If the analysis is purely for your own exploration, you can skip the formal workflow but still validate your numbers.

### Q: What if a quality gate reviewer is unavailable?
Notify the workflow owner. Any agent with the required skills can substitute as a reviewer, but the original reviewer remains accountable. If no substitute is available within the gate's time limit, escalate in the weekly sync.

### Q: How do I request data from the Data Squad?
Use the intake form. Include: your name, your squad, the question you need answered, the decision it will inform, and your deadline. Do not use Slack DMs or hallway requests. See cross-squad-integration-guide.md for details.

### Q: Can I skip the RalphLoop for urgent requests?
Only with peter-fader approval. Fast-tracked deliverables still pass through all 5 gates but with compressed timelines. The fast-track is documented and reviewed within 1 week. This is rare and should not become a habit.

---

## Tools and Technical

### Q: Which BI tool should I use for a new dashboard?
Use the squad's standard BI tool (specified during onboarding). Do not create dashboards in alternative tools unless there is a documented reason and avinash-kaushik approval. Multiple tools create maintenance burden and inconsistency.

### Q: Can I create tables in the warehouse?
Yes, in your personal schema for exploration. For tables that others will use, follow the naming conventions and get avinash-kaushik approval before promoting to a shared schema. Tables in shared schemas must have documentation.

### Q: How do I handle sensitive data in my analysis?
Follow privacy-and-data-ethics.md. Key rules: use pseudonymized data when possible, never put PII in dashboards, do not export data to local machines, and document the legal basis for any analysis using personal data.

### Q: Where do I save my work?
Analysis code and queries go in the squad repository under the appropriate folder. Do not save work only in your personal workspace where others cannot find it. If an analysis is worth doing, it is worth making accessible.

---

## Contributing to This FAQ

When you encounter a question that is not covered here:
1. Get the answer from the appropriate source (documentation, agent, or discussion).
2. Add the question and answer to the relevant section of this document.
3. Follow the contribution-guide.md for submitting the update.
4. Keep answers concise and direct. Link to detailed documentation rather than duplicating it here.
