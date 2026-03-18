# RalphLoop Quality Workflow

## Purpose
Enforce quality standards across all Data Squad outputs through five mandatory gates and a strict registry update protocol. Every deliverable passes through the RalphLoop before reaching stakeholders.

## Trigger
- Any Data Squad deliverable is ready for review (dashboard, analysis, experiment, metric definition, report)
- Quality gate failure requires remediation and re-review
- Quarterly quality audit of all active deliverables

## Agents Involved
- **avinash-kaushik**: Gate 1 (Data Integrity) and Gate 3 (Methodology)
- **avinash-kaushik**: Gate 2 (Validation) and continuous monitoring
- **wes-kao**: Gate 4 (Communication Quality) and stakeholder readiness
- **data-chief**: Gate 5 (Strategic Alignment) and business impact validation
- **sean-ellis**: Gate 3 co-owner for experiment-related deliverables

## The Five Gates

### Gate 1: Data Integrity (Owner: avinash-kaushik)
1. **avinash-kaushik** verifies all data sources are documented, accessible, and currently healthy.
2. **avinash-kaushik** confirms data lineage: every number in the deliverable traces back to a known source table and transformation.
3. **avinash-kaushik** checks for known data quality issues in the sources and documents any caveats.
4. **avinash-kaushik** signs off with: "Data sources verified, lineage documented, caveats noted."

**Pass criteria**: All data sources documented, lineage traceable, no unresolved critical data quality issues.
**Fail action**: Deliverable returned to author with specific data integrity gaps to resolve.

### Gate 2: Validation (Owner: avinash-kaushik)
5. **avinash-kaushik** independently reproduces key numbers using a separate query or methodology.
6. **avinash-kaushik** checks for common errors: off-by-one date ranges, incorrect joins, survivorship bias, missing NULL handling.
7. **avinash-kaushik** validates aggregation logic: totals match sums of parts, percentages sum correctly, averages are weighted appropriately.
8. **avinash-kaushik** signs off with: "Key numbers reproduced, common errors checked, aggregation validated."

**Pass criteria**: Key numbers match within 1% tolerance, no logical errors found.
**Fail action**: Specific discrepancies documented, author must fix and resubmit.

### Gate 3: Methodology (Owner: avinash-kaushik + sean-ellis)
9. **avinash-kaushik** reviews the analytical methodology: is the approach appropriate for the question?
10. **sean-ellis** reviews experiment-specific methodology: sample size, randomization, statistical tests, correction for multiple comparisons.
11. **avinash-kaushik** checks for methodological pitfalls: Simpson's paradox, confounding variables, selection bias, look-ahead bias.
12. **avinash-kaushik** signs off with: "Methodology appropriate, pitfalls addressed, limitations documented."

**Pass criteria**: Methodology matches the question, known pitfalls addressed, limitations stated explicitly.
**Fail action**: Methodology concerns documented, author must revise approach or add limitations.

### Gate 4: Communication Quality (Owner: wes-kao)
13. **wes-kao** reviews the deliverable for clarity: can a non-analyst stakeholder understand the key findings?
14. **wes-kao** checks that every chart has a title, axis labels, and a one-sentence interpretation.
15. **wes-kao** verifies that the deliverable answers the original question and includes a clear "so what" and recommended action.
16. **wes-kao** signs off with: "Clear to audience, charts labeled, actionable recommendation included."

**Pass criteria**: Deliverable is understandable by the target audience, every visual is interpreted, action is recommended.
**Fail action**: Communication gaps identified, author must revise for clarity.

### Gate 5: Strategic Alignment (Owner: data-chief)
17. **data-chief** confirms the deliverable aligns with current squad priorities and OKRs.
18. **data-chief** evaluates whether the recommended action is feasible and within the squad's sphere of influence.
19. **data-chief** checks that the deliverable does not contradict or duplicate existing analyses.
20. **data-chief** signs off with: "Aligned with priorities, actionable, no conflicts."

**Pass criteria**: Deliverable supports current priorities, recommendation is actionable, no conflicts with existing work.
**Fail action**: Alignment issues flagged, author must adjust scope or recommendation.

## Mandatory Registry Updates (Post all 5 Gates)
21. **avinash-kaushik** updates the Deliverable Registry: title, type, author, date, gate sign-offs, and status.
22. **avinash-kaushik** updates the Metric Registry if any new metrics were defined or existing definitions changed.
23. **avinash-kaushik** updates the Data Quality Log with any issues found and resolved during validation.
24. **wes-kao** updates the Knowledge Base with key learnings from the deliverable.

## Inputs
- Completed deliverable ready for review
- Original request or brief
- Current squad priorities and OKRs
- Existing registry entries for conflict checking

## Outputs
- Gate sign-off record (all 5 gates)
- Deliverable registry entry
- Updated metric registry (if applicable)
- Data quality log entries
- Knowledge base update

## Quality Gates Summary

| Gate | Owner | Pass Criteria | Max Review Time |
|------|-------|--------------|-----------------|
| G1: Data Integrity | avinash-kaushik | Sources verified, lineage documented | 1 business day |
| G2: Validation | avinash-kaushik | Numbers reproduced within 1% | 1 business day |
| G3: Methodology | avinash-kaushik + sean-ellis | Approach appropriate, pitfalls addressed | 1 business day |
| G4: Communication | wes-kao | Clear, labeled, actionable | 1 business day |
| G5: Strategic Alignment | data-chief | Aligned, feasible, no conflicts | 0.5 business day |

## Escalation
- If a deliverable fails the same gate twice: escalate to the squad lead for mediation.
- If gates take longer than the max review time: reviewer must provide a status update and revised timeline.
- If gates disagree (e.g., methodology approved but strategic alignment rejected): convene a 30-minute sync to resolve.
