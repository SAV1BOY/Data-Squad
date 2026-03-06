# Product-Market Fit Analysis Workflow

## Purpose
Assess product-market fit through a combination of survey data, quantitative usage metrics, segment analysis, and iterative testing to determine where the product resonates and where it falls short.

## Trigger
- Pre-launch PMF assessment for a new product or major feature
- Quarterly PMF health check
- Retention metrics suggest PMF erosion
- Expansion into a new market or customer segment

## Agents Involved
- **Retention Strategist**: Leads PMF assessment and action planning
- **Analytics Architect**: Builds quantitative models and segment analysis
- **Experiment Strategist**: Designs validation tests for PMF hypotheses
- **Insight Narrator**: Synthesizes findings and communicates to leadership

## Steps

### Phase 1: Survey (Days 1-7)
1. **Retention Strategist** designs the PMF survey using the Sean Ellis test: "How would you feel if you could no longer use this product?" with options Very Disappointed, Somewhat Disappointed, Not Disappointed.
2. **Retention Strategist** defines the survey audience: active users within the last 14 days who have used the product at least twice.
3. **Analytics Architect** deploys the survey through the in-product survey tool and monitors response rates.
4. **Retention Strategist** targets a minimum of 100 responses per segment for statistical reliability.
5. **Retention Strategist** collects and codes open-ended responses: what would they miss, what would they switch to, who benefits most.

### Phase 2: Quantitative Analysis (Days 8-12)
6. **Analytics Architect** computes retention curves by cohort and compares to PMF benchmarks (D30 > 25% for consumer, D30 > 60% for B2B SaaS).
7. **Analytics Architect** analyzes engagement depth: frequency of use, feature breadth, time spent, and core action completion rates.
8. **Analytics Architect** identifies the "aha moment" candidates: which early actions correlate most strongly with long-term retention?
9. **Retention Strategist** triangulates survey results with quantitative data: do "Very Disappointed" users show distinct behavioral patterns?
10. **Analytics Architect** computes the PMF score: percentage of "Very Disappointed" respondents (target: >40%).

### Phase 3: Segment Analysis (Days 13-16)
11. **Retention Strategist** segments PMF scores by customer attributes: company size, use case, industry, acquisition channel, geography.
12. **Analytics Architect** identifies high-PMF segments (>40% Very Disappointed) and low-PMF segments (<25%).
13. **Retention Strategist** profiles the high-PMF segment: who are they, what do they value, how do they use the product differently?
14. **Retention Strategist** identifies the gap between high-PMF and low-PMF segments: what is missing for the latter group?

### Phase 4: Action Planning (Days 17-19)
15. **Retention Strategist** defines the PMF strategy: double down on high-PMF segments, improve or deprioritize low-PMF segments.
16. **Retention Strategist** proposes specific actions: product improvements for gap segments, acquisition focus on high-PMF profiles, messaging adjustments.
17. **Experiment Strategist** designs experiments to test the top 2 PMF improvement hypotheses.
18. **Insight Narrator** prepares the PMF report: score, segment breakdown, action plan, and experiment designs.

### Phase 5: Retest (60-90 days after actions)
19. **Retention Strategist** reruns the PMF survey on the same audience criteria.
20. **Analytics Architect** compares before/after PMF scores by segment.
21. **Retention Strategist** evaluates which actions moved the needle and which did not.
22. **Insight Narrator** publishes the PMF update report with trend analysis.
23. **Retention Strategist** updates the action plan based on retest results.

## Inputs
- Survey tool access and in-product deployment capability
- User behavioral data (engagement, retention, feature usage)
- Customer attributes for segmentation
- PMF benchmarks for the business model

## Outputs
- PMF survey results with coded open-ended responses
- PMF score (% Very Disappointed) overall and by segment
- High-PMF and low-PMF segment profiles
- Action plan with experiment designs
- Retest comparison report

## Quality Gates

| Gate | Criteria | Owner |
|------|----------|-------|
| G1: Sample Adequate | Minimum 100 responses per analyzed segment | Retention Strategist |
| G2: Triangulated | Survey results corroborated by quantitative behavioral data | Analytics Architect |
| G3: Segments Distinct | High-PMF and low-PMF segments have statistically different profiles | Analytics Architect |
| G4: Actions Testable | Top 2 actions have experiment designs with measurable outcomes | Experiment Strategist |
| G5: Retest Executed | PMF resurveyed within 90 days of action implementation | Retention Strategist |

## Registry Updates
- **Metric Registry**: Register PMF score with calculation method, survey methodology, and benchmarks.
- **Segment Registry**: Document high-PMF and low-PMF segment definitions.
- **Experiment Registry**: Log PMF improvement experiments.
- **Insight Registry**: Record PMF findings, segment profiles, and trend data.
