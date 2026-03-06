# Technical Depth Scale

## Purpose

This scale calibrates how much technical detail to include based on the audience's technical background. The same analysis needs different levels of technical exposition for a business stakeholder, an analyst, and a data engineer.

## The Scale

### Level 1: Business — Non-Technical Stakeholders

**Audience**: Executives, PMs, marketers, CS leads, sales, community managers
**Technical assumption**: Understands basic metrics (revenue, users, conversion). No SQL, statistics, or data model knowledge.
**Goal**: Understanding and decision-making

**What to include**:
- Metric name and what it means in plain language
- The number and whether it is good, bad, or neutral
- Comparison to a benchmark, target, or prior period
- What to do about it

**What to exclude**:
- Query logic, table names, joins
- Statistical methodology details
- Data pipeline information
- Technical caveats that do not affect the conclusion

**Example**: "Customer retention improved from 85% to 89% this quarter. This means more customers are staying with us, and it puts us ahead of our annual target. The biggest improvement came from mid-market accounts after we rolled out the new onboarding program."

### Level 2: Analyst — Data-Literate Stakeholders

**Audience**: Data analysts, analytics engineers, quantitative PMs, data-savvy operators
**Technical assumption**: Understands SQL, basic statistics, metric definitions, experiment design. Familiar with the data model.
**Goal**: Validation, extension, and deeper investigation

**What to include**:
- Metric definition with the specific calculation
- Statistical measures: confidence intervals, p-values, sample sizes
- Segment breakdowns and cohort definitions
- Methodology choices and their trade-offs
- Known data quality issues affecting the analysis
- References to source tables and queries

**What to exclude**:
- Infrastructure details (cluster config, job scheduling)
- Code-level implementation unless relevant to the finding
- Exhaustive raw data tables (summarize, link to source)

**Example**: "7-day retention for the Feb 2026 cohort is 38.2% (n=14,500, 95% CI: [37.4%, 39.0%]), down from 41.1% in January. Calculated as distinct users with at least 1 session in days 1-7 post-signup, sourced from the sessions table joined to users on user_id. The paid search segment shows the largest decline (32.1% vs 38.7% prior, p<0.01). Note: mobile SDK tracking gap on Feb 12-13 may undercount mobile sessions by approximately 2%."

### Level 3: Engineer — Technical Infrastructure Audience

**Audience**: Data engineers, backend engineers, platform teams, infrastructure
**Technical assumption**: Deep technical knowledge. Understands data pipelines, schema design, query optimization, infrastructure.
**Goal**: Implementation, debugging, optimization

**What to include**:
- Table and column names, schema details
- Query performance characteristics and optimization notes
- Pipeline dependencies, job schedules, and SLAs
- Data freshness, latency, and known gaps with technical causes
- Code snippets, query plans, or configuration details as needed
- System-level implications of data changes

**What to exclude**:
- Business context beyond what is needed to understand the technical requirement
- Simplified explanations of concepts the audience already knows
- Marketing or strategic framing

**Example**: "The retention metric query is hitting a full table scan on events (2.3B rows) because the partition key is event_date but the query filters on user_created_date. Propose adding a materialized view partitioned by signup_week that pre-joins events and users. Expected query time improvement: 45min to under 2min. The sessions table has a known gap from 2026-02-12 06:00 to 2026-02-13 12:00 UTC due to a mobile SDK flush failure (incident INC-4821). Backfill completed Feb 14 but late-arriving events from that window may be misattributed."

## Depth Selection Decision Tree

1. Who is the primary audience? (Business / Analyst / Engineer)
2. What decision or action will they take based on this communication?
3. What is the minimum technical detail required for that decision?
4. Include that level. Put deeper detail in an appendix or linked document.

## Mixing Audiences

When the audience is mixed (e.g., a meeting with PMs and analysts):
- Present at the lowest common technical level (Business)
- Provide a technical appendix or follow-up for the more technical audience
- Use progressive disclosure: headline for everyone, detail for those who want it

## Cross-References

- **Audience Depth Scale**: See `voice/calibration/audience-depth-scale.md` for seniority-based calibration
- **Analyst Tone**: See `voice/language-guides/analyst-tone.md`
- **Exec Tone**: See `voice/language-guides/exec-tone.md`
- **Cross-Squad Tone**: See `voice/language-guides/cross-squad-tone.md`
- **Educator Tone**: See `voice/tone-profiles/educator.md`
