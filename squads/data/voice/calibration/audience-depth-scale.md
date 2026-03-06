# Audience Depth Scale

## Purpose

This scale calibrates communication depth based on the seniority and role of the audience. The same finding requires different framing, detail level, and action orientation depending on whether the reader is a junior analyst or a C-level executive.

## The Scale

### Level 1: Junior Analyst / New Team Member

**What they need**: Full context, methodology, learning opportunities
**Detail level**: Maximum — show the work, explain the reasoning
**Assumed knowledge**: Basic SQL, fundamental metrics, general business context
**Action expectation**: Execute specific tasks, learn the approach

**Communication pattern**:
- Explain the why behind the analysis, not just the what
- Include step-by-step methodology
- Define metrics and terms on first use
- Provide links to documentation and source queries
- Suggest follow-up explorations for learning

**Example**: "We are looking at 7-day retention for the February cohort. Retention means the percentage of users who signed up in February and returned at least once within 7 days. Here is the query I used, and here is why I filtered for activated users only — it removes noise from users who never completed onboarding. The result is 38%. Last month it was 41%. The next step is to break this down by acquisition channel to see where the drop is concentrated."

### Level 2: Senior Analyst / Data Team Peer

**What they need**: Methodology validation, edge cases, technical precision
**Detail level**: High — focus on methodology choices and their implications
**Assumed knowledge**: Statistical methods, data model, business metrics, tooling
**Action expectation**: Review, challenge, extend the analysis

**Communication pattern**:
- Lead with the finding and methodology in parallel
- Highlight judgment calls and trade-offs in the approach
- Note known limitations and potential confounders
- Skip basic definitions; use standard notation
- Invite peer challenge

**Example**: "7-day retention for the Feb cohort dropped to 38% from 41% (Jan). I used the activated-user definition (onboarding step 3+), joining events to the sessions table on user_id. Note: the mobile SDK had a 6-hour tracking gap on Feb 12-13 which may undercount mobile sessions by ~2%. Channel breakdown suggests the drop is concentrated in paid search (32% vs 39% prior). Worth checking if the landing page change on Feb 5 is a confounder."

### Level 3: Head of / Director Level

**What they need**: Interpreted findings, business implications, resource decisions
**Detail level**: Medium — findings with enough context to make decisions
**Assumed knowledge**: Key metrics, team priorities, strategic context
**Action expectation**: Make decisions, allocate resources, set priorities

**Communication pattern**:
- Lead with the business implication
- Provide 2-3 supporting data points
- Connect to current priorities or OKRs
- Recommend a course of action with trade-offs
- Keep methodology in the appendix

**Example**: "Retention dropped 3 points this month, concentrated in paid search users. This puts us at risk of missing our Q1 retention target. The likely cause is the landing page change shipped Feb 5, which reduced onboarding completion by 15%. Recommendation: revert the change and A/B test the new version properly. Expected recovery: 2-3 weeks."

### Level 4: C-Level / Executive

**What they need**: The headline, the business impact, the decision required
**Detail level**: Minimal — one key finding, one implication, one action
**Assumed knowledge**: Company strategy, market context, financial targets
**Action expectation**: Approve direction, unblock resources, set strategic priorities

**Communication pattern**:
- One sentence: what happened
- One sentence: what it means for the business
- One sentence: what we recommend
- Stop. Answer questions if asked.

**Example**: "Retention is down 3 points, putting $1.2M in annual revenue at risk. Root cause identified and fix is ready to deploy. We recommend shipping the fix this week — no additional resources needed."

## Quick Reference Matrix

| Dimension | Junior Analyst | Senior Analyst | Director | C-Level |
|---|---|---|---|---|
| Detail level | Full | High | Medium | Minimal |
| Methodology | Explained | Referenced | Appendix | Omitted |
| Definitions | Included | Assumed | Assumed | Assumed |
| Action framing | Task | Review | Decision | Approval |
| Length | Long | Medium | Short | 3 sentences |
| Caveats | Educational | Technical | Business-relevant only | Only if decision-altering |

## Cross-References

- **Exec Tone**: See `voice/language-guides/exec-tone.md`
- **Analyst Tone**: See `voice/language-guides/analyst-tone.md`
- **Educator Tone**: See `voice/tone-profiles/educator.md`
- **Technical Depth Scale**: See `voice/calibration/technical-depth-scale.md`
