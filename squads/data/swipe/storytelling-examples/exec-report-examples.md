# Executive Report Examples

Real-world executive report formats that communicate data insights effectively to senior leadership.

---

## 1. Amazon - "Six-Page Memo" Data Format

**Company/Context:** Amazon (ongoing practice). Amazon's executive meetings use 6-page narrative memos instead of slide decks. Data teams adapted this format for analytical reports.

**What They Did:**
- Structure of a data-driven 6-page memo:
  1. **Executive Summary** (1 paragraph): The single most important finding and recommended action. "Customer acquisition cost has increased 34% YoY while lifetime value has declined 12%, compressing our LTV:CAC ratio from 4.2x to 2.8x. We recommend shifting $15M from paid acquisition to retention programs."
  2. **Context**: What question was asked, why now, what data was used.
  3. **Findings** (2-3 pages): Detailed analysis with inline charts (not appendix). Each finding structured as: observation, evidence, implication.
  4. **Alternatives Considered**: What other explanations or approaches were evaluated and why they were rejected.
  5. **Recommendation**: Specific actions with expected impact, timeline, and success metrics.
  6. **Appendix**: Methodology, data sources, limitations.
- The memo is read silently for 20 minutes at the start of the meeting, then discussed.

**Metrics Used:** Varies by report. The format emphasizes narrative flow with embedded data, not dashboards or dense tables.

**What Worked:** The silent reading period forced executives to engage with the full analysis before reacting. Discussion quality improved dramatically compared to slide presentations where executives interrupted at slide 3.

**What Failed:** Data teams initially wrote memos that read like academic papers -- dense, passive voice, and burying the conclusion on page 5. Training on "lead with the answer, then support it" and "write in active voice" improved readability.

**Lessons:** Narrative formats force deeper analytical thinking than slide decks. Lead with the answer. Include alternatives considered to show rigor. Silent reading prevents premature interruption.

**Application to Data Squad:** For high-stakes analytical deliverables, consider the narrative memo format. Lead with the recommendation, support with evidence, include alternatives considered. Use this for annual strategy analyses, not weekly updates.

---

## 2. Stripe - "Weekly Business Review" One-Page Format

**Company/Context:** Stripe (2020). The data team designed a one-page weekly business review that could be consumed in under 5 minutes.

**What They Did:**
- One-page format with 4 sections:
  1. **Headline Metrics** (top strip): 5 KPIs with week-over-week and year-over-year change, color-coded (green/yellow/red based on plan attainment). TPV, revenue, new merchants, merchant churn, API uptime.
  2. **This Week's Story** (left half): A 3-paragraph narrative explaining the single most important thing that happened this week. Not a list of everything, but the one thing leadership should know.
  3. **Watch List** (right half, top): 3-5 emerging signals that might become next week's story. Each with a one-sentence description and the team monitoring it.
  4. **Scorecard** (right half, bottom): Quarterly goal progress bars for each major initiative, updated weekly.
- Distributed via email at 8 AM Monday. No meeting required unless an item on the Watch List escalated.

**Metrics Used:** 5 headline KPIs, quarterly goal attainment, watch list items with severity rating.

**What Worked:** "This Week's Story" was the breakthrough. Instead of listing 20 metrics, forcing the team to identify the single most important narrative created clarity. Leadership read the one-pager in 3 minutes and knew exactly where to focus.

**What Failed:** Early versions had "This Week's Story" written as a metric recap ("revenue was $X, up Y%"). Rewriting as a narrative ("Our largest merchant segment is accelerating payment volume, driven by holiday preparation -- 3 weeks earlier than last year") made it informative and forward-looking.

**Lessons:** Weekly exec reports should have a single narrative focus, not a comprehensive metric listing. The "Watch List" concept prevents surprises by socializing emerging signals early. No meeting should be required for a routine update.

**Application to Data Squad:** Build weekly one-pager templates with: headline KPIs, one narrative story, a watch list, and goal progress. Train analysts to write narratives, not metric recaps.

---

## 3. Shopify - "Merchant Health" Quarterly Board Report

**Company/Context:** Shopify (2020). The data team created the quarterly board-level report on merchant ecosystem health.

**What They Did:**
- Board report structure (10 slides, 30-minute presentation):
  1. **State of the Merchant**: Single slide with merchant count, GMV, and MRR, each with a trend arrow and one-sentence context.
  2. **Cohort Quality Trend**: Are newer merchant cohorts performing better or worse than older ones? 6-month GMV per merchant by quarterly cohort, with a trend line.
  3. **Geographic Expansion**: Map showing merchant density by country with growth rates. Highlight 3 fastest-growing markets.
  4. **Product Adoption Ladder**: % of merchants at each product tier (basic Shopify, Shopify, Advanced, Plus), with upgrade and downgrade flows.
  5. **Merchant Unit Economics**: CAC, LTV, and LTV:CAC by acquisition channel and merchant segment.
  6. **Competitive Landscape**: Win/loss data from merchant surveys, competitive feature gap analysis.
  7. **Risk Factors**: Top 3 risks to merchant health with quantified potential impact.
  8. **Opportunities**: Top 3 growth opportunities with estimated TAM.
  9. **Ask**: What the team needs from the board (budget, strategic direction, partnerships).
  10. **Appendix**: Detailed methodology and supplementary data.
- Every slide had exactly one takeaway, stated in the slide title (not a topic label).

**Metrics Used:** Merchant count, GMV, MRR, cohort quality, geographic distribution, product tier distribution, unit economics, competitive win rate.

**What Worked:** Using takeaway titles (e.g., "Newer cohorts are 15% more valuable at 6 months" rather than "Cohort Analysis") meant board members could read just the titles and get the full story. The "Risk Factors" slide with quantified impact prevented the board from being blindsided.

**What Failed:** The first version had 25 slides. Board members disengaged after slide 10. Compressing to 10 slides with an appendix for deep-dive questions kept attention and improved discussion quality.

**Lessons:** Board reports need takeaway titles (not topic titles), quantified risks, and strict slide limits. Include an "Ask" slide -- board meetings are not just informational, they're decisional. Cohort quality trends are the most board-relevant product metric.

**Application to Data Squad:** Use takeaway titles on every slide. Limit to 10 slides for board-level content. Always include risks (quantified) and an ask. Cohort quality trends should be in every board report.

---

## 4. Netflix - "Content Investment" Decision Report

**Company/Context:** Netflix (2019). The content strategy team produced quarterly investment reports that combined data analysis with creative judgment for content commissioning decisions.

**What They Did:**
- Report format for content investment decisions:
  1. **Performance Summary**: How did last quarter's content investments perform? Efficiency index (view-hours / cost) for each major title, compared to genre benchmark.
  2. **Portfolio Balance**: Content mix by genre, audience segment, and geography. Are we over-indexed in any area? Under-indexed?
  3. **Demand Signals**: What does viewing data, search data, and external trend data suggest about unmet demand? Specific gaps identified with estimated audience size.
  4. **Investment Thesis**: "We recommend investing $X in [genre/format] because [data-supported reason]. Expected efficiency index: Y. Comparable titles: [list with their performance]."
  5. **Risk Assessment**: What could go wrong? Historical failure rate for this genre/format. Maximum downside estimated.
  6. **Decision Required**: Approve, modify, or reject the investment thesis. Clear criteria for each option.

**Metrics Used:** Efficiency index, genre performance benchmarks, demand signals, portfolio balance metrics, comparable title performance, historical failure rates.

**What Worked:** Framing content investment as a portfolio decision (with balance, risk, and return metrics) elevated the conversation from "do we like this show?" to "does this investment improve our portfolio?" The comparable-title analysis grounded creative decisions in data.

**What Failed:** Early reports presented data and creative arguments separately. Integrating them (each creative argument supported by data, each data point interpreted through creative judgment) made the report more persuasive and led to better decisions.

**Lessons:** Investment decision reports must combine quantitative evidence with qualitative judgment. Frame decisions as portfolio choices (balance, risk, return). Always provide comparable precedents with their outcomes.

**Application to Data Squad:** For clients making investment decisions (content, features, markets), structure reports as portfolio decisions with comparables, risk quantification, and explicit decision criteria.
