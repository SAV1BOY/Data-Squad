# Data Quality Remediation - Prioritization

## Phase Objective

Rank all identified data quality issues by their business impact and remediation feasibility to determine the optimal fix sequence. Not all quality issues are equally important, and fixing them all simultaneously is impossible. This phase ensures that limited remediation resources are directed at the issues that cause the most harm to decision-making, reporting accuracy, and operational efficiency.

## Prerequisites

- Comprehensive quality issue inventory from Phase 00 with severity and volume data
- Understanding of which reports, dashboards, and decisions depend on each data source
- Stakeholder input on which quality problems are causing the most operational pain
- Estimated remediation effort for common issue types (from engineering or data team assessment)
- Business impact framework or methodology for quantifying data quality costs

## Steps

1. **Assess Business Impact for Each Issue**: For every quality issue in the inventory, evaluate the downstream business impact. Determine which reports, dashboards, KPIs, and business decisions are affected. Quantify the impact where possible: revenue miscounted due to duplicate transactions, customer counts inflated due to identity duplication, conversion rates distorted due to missing events, or operational decisions delayed due to data latency. Where quantification is difficult, use a structured rating scale (critical impact: affects executive decisions or customer-facing metrics; high: affects department-level reporting; medium: affects team-level analysis; low: affects internal tooling only).

2. **Map Issue Dependencies**: Identify which issues are interdependent. Some issues are root causes that create cascading quality problems downstream. Fixing the root cause resolves multiple symptoms. For example, a customer identity deduplication problem in the source system may cause accuracy issues in the analytics warehouse, inconsistency issues in the CRM, and completeness issues in the marketing platform. Map these dependency chains so that root causes are prioritized over symptoms.

3. **Estimate Remediation Effort**: For each issue, estimate the effort required to fix it. Categorize fixes by type: configuration changes (low effort, can be done in hours), data cleanup scripts (medium effort, days to develop and validate), pipeline refactoring (high effort, weeks of engineering work), source system changes (very high effort, requires cross-team coordination and possibly vendor involvement). Include both the initial fix effort and the ongoing maintenance effort.

4. **Calculate Priority Score**: Combine business impact and remediation effort into a priority score for each issue. A common framework is Impact divided by Effort, producing a benefit-to-cost ratio. High-impact, low-effort issues rank highest (quick wins). Low-impact, high-effort issues rank lowest. Document the scoring methodology transparently so stakeholders understand why certain issues are prioritized over others.

5. **Group Issues into Remediation Waves**: Organize prioritized issues into remediation waves that can be executed sequentially. Wave 1 contains quick wins: high-impact issues with low remediation effort that can be resolved within 1-2 weeks. Wave 2 contains medium-effort issues that require dedicated sprint work over 2-4 weeks. Wave 3 contains complex issues requiring cross-team coordination and potentially months of effort. Each wave should deliver measurable quality improvements upon completion.

6. **Identify Issues That Cannot Be Fixed**: Some quality issues have root causes outside the organization's control (third-party data feeds with poor quality, legacy systems that cannot be modified, regulatory constraints that prevent data correction). For these issues, document the limitation, design workarounds (quality filters, imputation strategies, disclosure notes on affected reports), and escalate to leadership if the unfixable issue has critical business impact.

7. **Quantify the Cost of Inaction**: For issues that stakeholders may resist investing in, calculate the ongoing cost of not fixing the problem. This includes the time analysts spend manually correcting data, the risk of incorrect business decisions made on flawed data, the revenue lost due to miscalculated metrics (overcounting churn, undercounting conversions), and the trust erosion when stakeholders discover data inconsistencies.

8. **Build the Remediation Roadmap**: Create a timeline that maps remediation waves to calendar periods with assigned resources. Define clear milestones for each wave: issues fixed, quality metrics improved, stakeholder sign-off obtained. Include checkpoint reviews between waves to assess progress, adjust priorities based on new information, and communicate results to stakeholders.

9. **Obtain Stakeholder Commitment**: Present the prioritization, remediation roadmap, and resource requirements to decision-makers. Include the cost of inaction analysis to justify investment. Secure commitment for engineering resources, data team time, and source system owner cooperation. Without explicit resource commitment, remediation plans become shelf-ware.

## Deliverables

- Business impact assessment for every quality issue with quantified or rated downstream effects
- Issue dependency map showing root causes and cascading symptoms
- Remediation effort estimates for all issues categorized by fix type
- Priority scorecard ranking all issues by impact-to-effort ratio
- Remediation wave plan organizing issues into sequenced groups
- Unfixable issue register with documented limitations and designed workarounds
- Cost of inaction analysis for high-impact unresolved issues
- Remediation roadmap with timeline, milestones, and resource assignments
- Stakeholder commitment document with approved resources and accountability

## Quality Gate

Prioritization is complete when all of the following conditions are met:

- Every issue in the quality inventory has a business impact rating and remediation effort estimate
- Dependency mapping has identified root cause issues that create cascading downstream problems
- Issues are ranked by priority score and the methodology is documented and transparent
- At least 3 remediation waves are defined with clear scope, timeline, and success criteria
- Unfixable issues are documented with approved workarounds
- The cost of inaction has been calculated for all critical and high-impact issues
- The remediation roadmap has been reviewed and approved by engineering and data team leads
- Resource commitment has been obtained from all teams needed for Wave 1 execution

## Next Phase

Proceed to **02-fix.md** (Fix) to implement corrections for each prioritized issue type according to the remediation wave plan.
