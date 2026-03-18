# Kaushik 10/90 Rule

## Overview

The 10/90 Rule is Avinash Kaushik's investment principle for analytics: for every $100 you spend on
analytics, $10 should go to tools and $90 should go to people. The rule is a direct challenge to the
widespread organizational belief that buying better tools will produce better insights. Kaushik
argues that the bottleneck in analytics is never the software -- it is the human capacity to ask the
right questions, interpret data correctly, and communicate insights that drive action.

This framework addresses the persistent failure mode where organizations invest millions in analytics
platforms and then staff them with one junior analyst who generates automated reports nobody reads.

## Origin

Articulated by **Avinash Kaushik** across multiple publications and speaking engagements, most
prominently in *Web Analytics: An Hour a Day* and his blog *Occam's Razor*. The rule emerged from
Kaushik's direct observation of enterprise analytics programs. He noted that organizations spending
$5 million on tools and $500,000 on people consistently underperformed organizations spending
$500,000 on tools and $2 million on people.

## Core Model

### The Investment Ratio

| Component | Allocation | Purpose |
|-----------|------------|---------|
| Tools | 10% | Data collection, storage, processing, visualization |
| People | 90% | Analysis, interpretation, experimentation, communication, action |

### Why 10% for Tools Is Sufficient

Modern analytics tools are remarkably capable and increasingly affordable. Google Analytics, open
source experimentation platforms, and commodity data warehouses can handle the technical requirements
of most organizations. The marginal value of moving from a good tool to a great tool is far smaller
than the marginal value of adding a skilled analyst.

Tools are necessary but not sufficient. They produce data. Data is not insight. The transformation
from data to insight to action requires human judgment, domain expertise, and communication skill.

### What the 90% Buys

The people investment encompasses multiple roles and capabilities:

**Analysis talent:** People who can move beyond reporting to generate genuine insights. Analysts who
ask "why" after every "what" and "so what" after every "why."

**Experimentation capability:** People who design, execute, and interpret A/B tests and other
controlled experiments. Testing requires statistical literacy and experimental design skill.

**Data science depth:** People who can build models, perform segmentation analysis, and identify
patterns that descriptive analytics cannot reveal.

**Communication and storytelling:** People who can translate data findings into business narratives
that drive executive action. The best analysis in the world is worthless if it sits in a spreadsheet.

**Business acumen:** People who understand the business context deeply enough to know which questions
matter. A technically brilliant analyst without business understanding will optimize the wrong things.

### The Multiplier Effect

A skilled analyst with a mediocre tool will produce more business value than a mediocre analyst with
a world-class tool. This is because:

1. Good analysts ask better questions (tools cannot generate questions)
2. Good analysts identify what data is missing (tools only process what they have)
3. Good analysts communicate findings persuasively (tools produce charts, not narratives)
4. Good analysts connect analysis to decisions (tools have no concept of organizational context)
5. Good analysts know when to distrust the data (tools process garbage as reliably as gold)

## Application Steps

### Step 1: Audit Current Spend
Calculate your actual tool-to-people ratio. Include all analytics platform licenses, data warehouse
costs, visualization tools, survey tools, and testing platforms. Then calculate fully loaded cost of
all analytics personnel (salary, benefits, training, management overhead).

### Step 2: Assess Tool Utilization
For every analytics tool in your stack, determine what percentage of its capabilities you actually
use. Most organizations use less than 20% of any given tool's features. This reveals over-investment
in tool capability that is never accessed.

### Step 3: Assess People Utilization
For every analytics person, determine what percentage of their time is spent on reporting (pulling
numbers) versus analysis (generating insights) versus communication (driving action). If reporting
dominates, you have a people quality or structure problem.

### Step 4: Identify the Binding Constraint
Ask: "If we had one more skilled analyst, what questions could we answer that we cannot today?"
Then ask: "If we had one more tool, what questions could we answer?" The first list is almost
always longer and more valuable.

### Step 5: Reallocate Incrementally
You cannot flip the ratio overnight. Start by redirecting the next dollar of analytics investment
toward people. Freeze tool expansion until you have maximized utilization of current tools. Invest
in training for existing analysts before hiring new ones.

### Step 6: Change the Conversation
When stakeholders request new tools, redirect to outcomes: "What decision will this tool help you
make?" Often the answer reveals that the problem is not tool capability but analytical capacity.

## Signs Your Organization Has It Backwards

### Tool-Heavy Symptoms
- You have more analytics tools than analysts
- Dashboard creation is the primary analytics activity
- Reports are generated on schedule regardless of whether anyone reads them
- Tool vendor relationships are managed more carefully than analyst career paths
- New tool purchases are celebrated; analyst promotions are invisible
- You know your tool costs to the dollar but cannot articulate your analytics team's top 3 insights
  from last quarter
- Stakeholders say "we need a tool for that" when they mean "we need someone to figure that out"

### Data-Rich, Insight-Poor Symptoms
- Dashboards show what happened but never why
- No one can name a business decision that changed because of analytics in the last quarter
- Analytics is reactive (answering questions) rather than proactive (surfacing opportunities)
- The analytics team is measured by report delivery, not business impact
- Executives make decisions first and then ask analytics to validate them

### People-Investment Symptoms (The Healthy State)
- Analysts spend more time on analysis than reporting
- Analytics regularly surfaces surprising findings that change plans
- Business units compete for analytics time because it drives measurable outcomes
- The analytics team includes a range of skills (statistics, communication, domain expertise)
- Tool purchases are driven by specific analytical requirements, not vendor marketing

## Key Distinctions

- **Reporting is not analysis.** Reporting tells you what happened. Analysis tells you why it
  happened and what to do about it. Most organizations have reporting disguised as analytics.
- **Data is not insight.** A dashboard is data. "Segment X converts 3x higher when they engage
  with content Y within 48 hours of first visit" is an insight.
- **Tools are enablers, not solutions.** A tool can make analysis faster. It cannot make analysis
  happen. The decision to analyze, the framing of the question, and the communication of findings
  are human activities.
- **The 10/90 ratio is directional, not literal.** The exact ratio matters less than the principle.
  Some organizations might be 15/85 or 20/80 and be fine. The problem is organizations at 70/30
  or 80/20 in favor of tools.
- **Training counts as people investment.** Sending your team to conferences, buying them books,
  giving them time for skill development -- all of this is the 90%.

## Pitfalls

1. **Using the rule to justify under-investing in tools.** The rule does not mean tools do not
   matter. A 10% investment in tools is still a real investment. Running your analytics on broken
   or inadequate infrastructure helps no one.
2. **Hiring more people without improving analytical culture.** Adding analysts to an organization
   that does not value analysis creates frustrated analysts, not better outcomes.
3. **Confusing headcount with capability.** Five junior analysts generating reports is not the same
   as two senior analysts generating insights. Quality matters more than quantity.
4. **Ignoring tool quality entirely.** There is a minimum viable tool threshold. Below that,
   analysts spend all their time fighting the tool instead of doing analysis.
5. **Forgetting that people need development.** Hiring skilled people and then starving them of
   learning opportunities will cause attrition. The 90% includes ongoing development.
6. **Applying the rule to data engineering separately.** Data infrastructure investment (pipelines,
   warehouses, governance) is a prerequisite to analytics, not part of the 10%.
7. **Treating the rule as static.** As an organization's analytical maturity grows, the optimal
   ratio may shift. The principle remains: invest in human capability first.

## Cross-References

- **Kaushik Web Analytics 2.0** -- The four pillars require different types of human expertise.
  Voice of Customer requires survey design skill. Experimentation requires statistical literacy.
  None of these are tool problems.
- **Kaushik DMMM** -- Building a DMMM requires human judgment at every level. No tool can define
  your business objectives for you.
- **Kao Rigorous Thinking** -- Kao's emphasis on rigorous thinking is the intellectual foundation
  that the 90% investment develops. Critical thinking is a human skill.
- **Kao Learning Velocity** -- Investing in people accelerates learning velocity. Tool investment
  without people investment does not compound.
- **Ellis High-Tempo Testing** -- High-tempo testing requires skilled experimenters, not just
  testing tools. The 10/90 principle applies directly to experimentation programs.

---

## Used By

| Task | Agents | Path |
|------|--------|------|
| define-metric-officially | data-chief, avinash-kaushik | `tasks/definition/define-metric-officially.md` |
| dashboard-deprecation | avinash-kaushik, data-chief | `tasks/operations/dashboard-deprecation.md` |

**Workflows:** metric-definition, dashboard-deprecation
