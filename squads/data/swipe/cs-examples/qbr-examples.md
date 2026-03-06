# QBR Examples with Data-Driven Stories

Real-world Quarterly Business Review examples that use data to tell compelling stories and drive action.

---

## 1. Amplitude - "Value Realized" QBR Framework

**Company/Context:** Amplitude (2020). The CS team redesigned their QBR from a feature-usage recap to a "value realized" narrative tied to the customer's original business objectives.

**What They Did:**
- QBR structure (4 slides):
  1. **Your Goals Recap**: Restate the objectives from onboarding (e.g., "Reduce time-to-insight for product decisions from 5 days to 1 day").
  2. **Progress Against Goals**: Data showing current state vs. goal. "Average time from question to data-backed answer: 1.8 days (down from 5.2 days at start). 64% of the way to your goal."
  3. **Usage That Drives Value**: Specific features tied to outcomes. "Teams using Behavioral Cohorts make decisions 3x faster than those using basic event counts. Your adoption of Cohorts: 45% of analysts."
  4. **Next Quarter Plan**: Actions to close the remaining gap, with specific milestones.
- Every data point was sourced from the customer's own product usage, not benchmarks.

**Metrics Used:** Goal attainment rate, time-to-insight, feature adoption correlated with outcomes, analyst-level usage distribution, quarter-over-quarter improvement.

**What Worked:** Tying every metric to the customer's stated goals prevented the QBR from becoming a "look how much you use us" vanity exercise. When a customer's exec asked "why do we pay for this?", the CSM could point to the specific goal progress slide.

**What Failed:** Some customers didn't have clearly defined goals from onboarding. Retroactively defining goals felt forced. The fix: mandatory goal-setting in onboarding, with the QBR template pre-populated from those goals.

**Lessons:** QBRs must connect usage to business outcomes, not just report usage. Goals must be defined at onboarding and tracked systematically. "Value realized" framing makes renewals easier.

**Application to Data Squad:** Build QBR templates that require onboarding goals as inputs. Every usage metric shown must connect to a business outcome. Remove any metric that doesn't answer "so what?"

---

## 2. Gainsight - Benchmarking QBR

**Company/Context:** Gainsight (2021). The CS team added industry benchmarking to QBRs, showing customers how they compared to peers.

**What They Did:**
- QBR included a "Benchmark" section comparing the customer to anonymized peers (same industry, similar company size, similar product tier).
- Benchmark metrics: health score percentile, feature adoption breadth vs. peers, time-to-value vs. peers, NPS vs. industry average, CSM engagement frequency vs. peers.
- Presented as: "Your team's feature adoption breadth is in the 72nd percentile for B2B SaaS companies your size. You're above average but below the top quartile. Here's what top-quartile companies do differently: [specific features]."
- Included a "peer improvement" trajectory: "Over the last 2 quarters, you've moved from the 55th to the 72nd percentile."

**Metrics Used:** Percentile rankings vs. peer cohort, feature-specific adoption comparisons, trajectory (percentile change over time), peer best practices.

**What Worked:** Benchmarking created competitive motivation. Customers who saw they were below the 50th percentile were 3x more likely to adopt recommended features in the following quarter. The trajectory metric (improvement over time) kept above-average customers motivated.

**What Failed:** Early benchmarks used all customers, not peers. A 10-person startup being compared to a 1000-person enterprise was meaningless. Segmenting by company size and industry made benchmarks credible.

**Lessons:** Benchmarking in QBRs works when the peer group is credible (same industry, similar size). Include trajectory, not just snapshot percentile. Below-median customers are motivated by competition; above-median customers are motivated by trajectory.

**Application to Data Squad:** Where client data allows, build peer benchmarking into QBR templates. Ensure peer groups are credible. Use benchmarking as a feature-adoption motivator.

---

## 3. HubSpot - "Story Arc" QBR

**Company/Context:** HubSpot (2020). The CS team structured QBRs as narratives with a deliberate story arc: situation, complication, resolution.

**What They Did:**
- QBR as a 3-act story:
  1. **Situation** (where you are): "Your marketing team generated 2,400 MQLs this quarter, up 18% from last quarter. Your CRM has 12,000 active contacts."
  2. **Complication** (the challenge): "However, MQL-to-SQL conversion dropped from 22% to 15%. Your sales team is receiving more leads but closing fewer. The gap costs an estimated $180K in unrealized pipeline per quarter."
  3. **Resolution** (the plan): "We recommend implementing lead scoring in Marketing Hub (you're licensed but not using it). Companies your size using lead scoring see 25% higher MQL-to-SQL conversion. Here's a 4-week implementation plan."
- Each section backed by the customer's own data, with the complication section quantifying the business impact of the gap.

**Metrics Used:** MQLs, MQL-to-SQL conversion, estimated pipeline impact, feature utilization vs. license, projected improvement from feature adoption.

**What Worked:** The story arc format made QBRs memorable and action-driving. The complication section (quantified business impact) created urgency. CSMs reported that customers were 2x more likely to act on QBR recommendations when presented as a narrative vs. a metrics table.

**What Failed:** Some CSMs struggled to find a genuine "complication" for healthy accounts. Forcing a problem narrative when there wasn't one felt manipulative. For healthy accounts, the framework was adapted to "Situation, Opportunity, Plan" -- celebrating wins and showing the next growth opportunity.

**Lessons:** QBRs as narratives (not data dumps) drive action. Quantify the business impact of gaps to create urgency. Adapt the narrative structure for healthy accounts (opportunity, not complication).

**Application to Data Squad:** Train CS teams on narrative QBR structures. The complication/opportunity must be quantified in business terms (dollars, time, headcount). Provide different narrative templates for at-risk vs. healthy accounts.

---

## 4. Slack - Executive Sponsor QBR

**Company/Context:** Slack (2021). The enterprise CS team built a separate QBR format for executive sponsors (VP+ level) that differed from the operational QBR delivered to admins.

**What They Did:**
- Executive QBR (2 slides only):
  1. **Business Impact Summary**: "Slack has reduced your average internal response time from 4 hours (email baseline) to 22 minutes. Based on 3,200 daily active users and average response volume, this represents approximately 850 recovered productive hours per week, valued at $2.1M annually."
  2. **Strategic Alignment**: "Your org is in the top 15% of Slack enterprise customers for cross-departmental collaboration. Recommendation: expand Slack Connect to 3 key vendor relationships to extend this advantage externally."
- No feature usage data. No adoption metrics. No training recommendations. Just business impact and strategic direction.
- The operational QBR (for admins) was a separate, more detailed session.

**Metrics Used:** Business impact metrics (time saved, productivity gained, dollar value), strategic positioning vs. peers, expansion opportunity sizing.

**What Worked:** Splitting the QBR into exec and operational versions solved the chronic problem of QBRs that satisfied neither audience. Exec sponsors stopped skipping QBRs when the content was strategic and concise. Admin engagement improved when their QBR wasn't diluted by high-level strategy.

**What Failed:** Calculating business impact required assumptions (value of an employee hour, baseline email response time) that some execs challenged. Pre-aligning assumptions with the exec sponsor before the QBR prevented surprises.

**Lessons:** Executive QBRs and operational QBRs should be separate meetings with different content. Exec QBRs: business impact in dollars and strategic direction (2 slides max). Operational QBRs: adoption, training, optimization. Pre-align business impact assumptions.

**Application to Data Squad:** Build two QBR templates: executive (2 slides, dollar impact, strategic direction) and operational (detailed adoption and optimization). Never combine them.
