# Workshop Kit: Teaching Data Literacy to Non-Analysts

## Workshop Overview

**Duration:** 3 hours (can be split into two 90-minute sessions)
**Audience:** Product managers, marketers, customer success managers, operations team members, and anyone who consumes data but does not produce it
**Group size:** 8-20 participants
**Prerequisite:** None
**Goal:** Participants leave able to read dashboards critically, ask good data questions, spot common data pitfalls, and collaborate effectively with analysts

## Facilitator Preparation

### Materials Needed
- Whiteboard or digital whiteboard
- Printed copies of 3-4 real dashboards from your organization (sanitized if needed)
- Exercise worksheets (one per participant)
- Sticky notes and markers
- Timer for exercises

### Pre-Workshop Setup
- Select 3-4 dashboards that participants actually use in their work
- Prepare 2-3 "data scenarios" based on real situations from your organization
- Identify 2-3 common data misinterpretations that have occurred in your organization (anonymized)
- Test all technology (projector, screen sharing) in advance

## Session Plan

### Module 1: Reading Data (45 minutes)

**Opening exercise (10 min):** Show a chart without labels or context. Ask participants to write down what they think it shows. Reveal the actual meaning. Discuss how interpretation changes with context. This demonstrates that data without context is meaningless.

**Concept: The anatomy of a metric (15 min)**

Every metric has four components that must be understood:
1. **Definition**: What exactly is being counted or calculated? ("Active users" means what, specifically?)
2. **Timeframe**: Over what period? (Daily, weekly, monthly, trailing 30 days?)
3. **Population**: Who is included and excluded? (All users? Paid only? New this month?)
4. **Source**: Where does the data come from? (Product events? CRM? Survey?)

**Exercise (20 min):** Give participants a real dashboard from your organization. For each metric on the dashboard, have them fill out:
- What is the definition? (If they do not know, that is a finding)
- What is the timeframe?
- Who is included?
- Where does the data come from?

Discuss as a group. The goal is to reveal that most people use dashboards without understanding these fundamentals.

### Module 2: Asking Good Data Questions (45 minutes)

**Concept: The question hierarchy (15 min)**

Not all data questions are equal. Teach the hierarchy:
1. **What happened?** (Descriptive) -- What is the number? How has it changed?
2. **Why did it happen?** (Diagnostic) -- What caused the change? What segments drove it?
3. **What will happen?** (Predictive) -- Based on trends, what do we expect?
4. **What should we do?** (Prescriptive) -- What action should we take?

Most people jump to level 4 from level 1. Rigorous analysis requires going through each level.

**The "compared to what?" exercise (10 min):**
Present statements like:
- "Our conversion rate is 3.2%"
- "We had 10,000 signups last month"
- "Customer satisfaction is 78%"

For each, ask: "Is that good or bad?" Participants will realize they cannot answer without a comparison point. Teach the four types of comparison:
- Compared to last period (trend)
- Compared to a target (goal)
- Compared to a benchmark (industry)
- Compared to a control group (experiment)

**Exercise (20 min):** Give participants a real metric change from your organization (e.g., "Retention dropped from 82% to 78%"). Have them write 5 questions they would ask an analyst to understand this change. Share and discuss. Introduce the concept of segmentation as the primary diagnostic tool.

### Module 3: Spotting Data Pitfalls (45 minutes)

**The five pitfalls every data consumer should know (20 min):**

**Pitfall 1: Correlation is not causation**
Show an example of two correlated metrics where the causal relationship is obviously absent (e.g., ice cream sales and drowning deaths -- both driven by summer). Then show a business example where the relationship is ambiguous.

**Pitfall 2: Averages hide distributions**
Show an example where the average is misleading: "Average customer spends $100/month" when the reality is 80% spend $20 and 20% spend $420. Ask: "Would you make the same decision knowing the distribution?"

**Pitfall 3: Small samples, big claims**
Present a scenario: "We surveyed 12 customers and 75% said they prefer Feature A." Discuss why this is unreliable and introduce the concept of sample size intuitively (without formulas).

**Pitfall 4: Survivorship bias**
Explain: "We analyzed our most successful customers to find what they have in common." Ask why this analysis is incomplete (it ignores unsuccessful customers who might share the same traits).

**Pitfall 5: Selection bias**
Explain: "Community members have 2x higher retention than non-members." Ask whether this proves the community causes retention or whether more engaged customers are both more likely to join the community AND more likely to retain.

**Exercise (25 min):** Present 3 real-world data claims (from news, internal reports, or industry publications). For each, have participants identify which pitfall might be present and what additional information they would need to trust the claim. Discuss as a group.

### Module 4: Collaborating with Analysts (45 minutes)

**The data request framework (15 min):**

When asking an analyst for help, provide:
1. **The decision**: What decision will this analysis inform?
2. **The deadline**: When does the decision need to be made?
3. **The context**: What do you already know? What have you already tried?
4. **The audience**: Who will see the results?
5. **The ideal output**: What format would be most useful? (Number, chart, dashboard, recommendation?)

**Exercise (15 min):** Have participants write a data request for a real question they have, using the framework above. Pair up and review each other's requests. An analyst from the team provides feedback on which requests are clear and which need refinement.

**Discussion: Building a data partnership (15 min)**

Facilitate a discussion on:
- What do analysts wish stakeholders understood about data work?
- What do stakeholders wish analysts understood about business decisions?
- What agreements can we make about how we work together?

Document the agreements as a "data working agreement" that both sides commit to.

## Post-Workshop Resources

### Quick Reference Card (distribute to all participants)

**Before using any metric, check:**
- Do I know the exact definition?
- Do I know the timeframe and population?
- Am I comparing to an appropriate benchmark?

**Before making a claim from data, check:**
- Is this correlation or causation?
- Is the sample size sufficient?
- Am I looking at the full picture (not just survivors/successes)?

**When requesting data analysis:**
- State the decision this will inform
- Provide the deadline
- Describe the context and what you already know

### Follow-Up Activities
- Schedule a 30-minute "data office hours" session 2 weeks after the workshop for questions
- Share a curated reading list (2-3 articles on each module topic)
- Create a Slack channel for data literacy questions
- Schedule a follow-up workshop in 3 months covering advanced topics (experimentation, forecasting)

## Measuring Workshop Effectiveness

**Immediate:** Post-workshop survey measuring confidence in reading data, asking questions, and spotting pitfalls (1-5 scale)
**30-day:** Survey analysts on whether data request quality has improved
**90-day:** Track whether data-related meeting time has decreased and decision velocity has increased
