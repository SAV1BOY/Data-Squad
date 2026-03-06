# Workshop Kit: Dashboard Design Best Practices

## Workshop Overview

**Duration:** 3 hours
**Audience:** Analysts, data engineers, product managers, and anyone who builds or commissions dashboards
**Group size:** 8-16 participants
**Prerequisite:** Familiarity with at least one BI tool (Looker, Tableau, Power BI, Metabase)
**Goal:** Participants leave able to design dashboards that drive decisions, not just display data

## Facilitator Preparation

### Materials Needed
- Whiteboard or collaborative digital canvas (Miro, FigJam)
- Printed copies of 3 "before" dashboards from your organization (real, anonymized if needed)
- Dashboard design template (one per participant)
- Access to BI tool for live redesign exercise
- Timer for exercises

### Pre-Workshop Preparation
- Select 3 real dashboards that are actively used but have design problems (too many metrics, unclear purpose, poor layout)
- Prepare a "model dashboard" that demonstrates best practices
- Identify 2-3 real decisions that should be informed by dashboards but currently are not
- Collect 5 screenshots of well-designed dashboards from other organizations for inspiration

## Session Plan

### Module 1: Dashboards That Drive Decisions (45 minutes)

**Opening provocation (10 min):**
Show two dashboards side by side:
- Dashboard A: 25 metrics, 8 charts, 3 filters, no annotations, generic title ("Marketing Dashboard")
- Dashboard B: 3 metrics, 2 charts, clear title ("Weekly Acquisition Health: Are We On Track for Q2 Target?"), annotated with context

Ask: "Which dashboard would help you make a decision in 30 seconds?" Discuss why.

**The decision-first design principle (15 min):**

Every dashboard should answer one of these questions:
1. **Are we on track?** (Performance dashboards -- compare actuals to targets)
2. **What changed?** (Monitoring dashboards -- highlight anomalies and changes)
3. **Where should we focus?** (Diagnostic dashboards -- segment data to find leverage points)
4. **What happened?** (Investigation dashboards -- flexible exploration for ad-hoc questions)

Each type has different design requirements. Mixing types creates confusion.

**The dashboard brief (20 min):**

Introduce the dashboard brief -- a one-page document completed before any dashboard is built:

| Element | Question | Example |
|---|---|---|
| Decision | What decision does this dashboard inform? | Should we adjust our paid acquisition budget? |
| Audience | Who will use this dashboard? | Marketing Director + Performance Marketing Manager |
| Cadence | How often will it be checked? | Weekly (Monday morning) |
| Actions | What actions might result from this dashboard? | Shift budget between channels, pause underperforming campaigns |
| Metrics | What 3-5 metrics are needed to inform this decision? | CAC by channel, ROAS, spend vs. budget, lead quality score |
| Context | What comparison or context makes the metrics interpretable? | Target, prior period, channel benchmark |

**Exercise:** Have each participant complete a dashboard brief for a real dashboard they need (or one they want to redesign). Review 2-3 as a group.

### Module 2: Visual Design Principles (45 minutes)

**The 5-second rule (10 min):**
A dashboard should communicate its main message within 5 seconds. If a viewer cannot understand the key takeaway at a glance, the design has failed. Demonstrate with examples -- show dashboards for exactly 5 seconds, then ask participants what they took away.

**Seven design principles (25 min):**

**Principle 1: Information hierarchy**
The most important metric should be the most visually prominent element. Use size, position (top-left gets the most attention), and color to establish hierarchy.

**Principle 2: Context over numbers**
A number without context is meaningless. Every metric should be accompanied by at least one of: target/goal, prior period comparison, trend over time, or benchmark.

**Principle 3: Progressive disclosure**
Lead with the summary (3-5 top-level metrics), then offer the ability to drill into detail. Not every viewer needs every detail; let them choose their depth.

**Principle 4: Consistent color encoding**
Use color consistently and sparingly:
- Green = good / on track / above target
- Red = bad / off track / below target
- Gray = neutral / context / historical
- One accent color for the element you want to draw attention to

Do not use color for decoration. Every color should encode meaning.

**Principle 5: Chart type matches data type**
| Data Type | Recommended Chart | Avoid |
|---|---|---|
| Trend over time | Line chart | Pie chart |
| Comparison across categories | Bar chart (horizontal for many categories) | 3D charts |
| Part of a whole | Stacked bar or 100% bar | Pie chart (except 2-3 segments) |
| Single metric status | Big number with context | Gauge chart (hard to read) |
| Correlation | Scatter plot | Dual-axis charts (misleading) |

**Principle 6: Annotation and storytelling**
Add text annotations to charts that explain the "why" behind notable data points. A chart with the annotation "Spike on March 15 due to product launch campaign" is 10x more useful than the same chart without context.

**Principle 7: Eliminate chartjunk**
Remove anything that does not communicate information: 3D effects, decorative gridlines, unnecessary legends, borders around every element, gradient fills. Every pixel should earn its place.

**Exercise (10 min):** Show 5 dashboard screenshots. For each, have participants identify which principles are violated and how they would fix them. Discuss as a group.

### Module 3: Hands-On Dashboard Redesign (60 minutes)

**The redesign challenge (60 min):**

Divide participants into teams of 3-4. Give each team one of the "before" dashboards selected during preparation.

**Step 1 (10 min):** Complete a dashboard brief for the dashboard. Who uses it? What decision does it inform? What metrics actually matter?

**Step 2 (10 min):** On paper or whiteboard, sketch a new layout. No tools yet -- just boxes representing metrics and charts, arranged according to the information hierarchy.

**Step 3 (25 min):** Build the redesigned dashboard in your BI tool (or create a high-fidelity mockup if tool access is limited).

**Step 4 (15 min):** Each team presents their redesign. They must explain:
- What decision the dashboard serves
- Why they chose these metrics and this layout
- What they removed from the original and why

Group feedback using the 7 principles as a rubric.

### Module 4: Dashboard Maintenance and Governance (30 minutes)

**The dashboard lifecycle (15 min):**

Dashboards are not fire-and-forget. Introduce the lifecycle:

1. **Brief**: Document purpose, audience, and metrics before building
2. **Build**: Create the dashboard following design principles
3. **Review**: Have a colleague test whether the dashboard communicates its message in 5 seconds
4. **Launch**: Announce the dashboard, train the audience, document in the dashboard catalog
5. **Monitor**: Track usage (views per week). Dashboards with zero views for 60 days should be flagged.
6. **Maintain**: Update definitions, fix data issues, adjust as business needs change
7. **Retire**: Archive dashboards that no longer serve a decision. Retirement is not failure -- it is hygiene.

**Dashboard governance agreements (15 min):**

Facilitate a group discussion to establish team agreements:
- Who can create shared dashboards? (Certification process?)
- Where are dashboards cataloged? (Central registry?)
- How are metric definitions enforced? (Modeling layer?)
- What is the review process for new dashboards?
- How often are existing dashboards audited?
- What triggers dashboard retirement?

Document agreements and assign an owner for implementation.

## Post-Workshop Resources

### Dashboard Design Checklist
- [ ] Dashboard brief is completed and approved by the audience
- [ ] No more than 5-7 metrics on a single dashboard view
- [ ] Every metric has context (target, trend, or comparison)
- [ ] Information hierarchy is clear (most important = most prominent)
- [ ] Color is used consistently and meaningfully
- [ ] Chart types match data types
- [ ] Key data points are annotated with context
- [ ] The dashboard communicates its main message in 5 seconds
- [ ] A non-expert can understand the dashboard without verbal explanation
- [ ] Dashboard owner and last-reviewed date are displayed

### Recommended Reading
- Stephen Few, "Information Dashboard Design" (the foundational text)
- Cole Nussbaumer Knaflic, "Storytelling with Data" (visualization principles)
- Edward Tufte, "The Visual Display of Quantitative Information" (theory and philosophy)

## Measuring Workshop Impact

**Immediate:** Post-workshop survey on confidence in dashboard design
**30-day:** Number of dashboards redesigned using the framework
**90-day:** Dashboard audit results (% of dashboards with briefs, % meeting the 5-second rule, % with documented owners)
**6-month:** Stakeholder survey on dashboard usefulness (1-5 scale comparing pre and post workshop)
