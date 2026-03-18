# Product-Market Fit Analysis Workflow

## Purpose
Assess product-market fit through a combination of survey data, quantitative usage metrics, segment analysis, and iterative testing to determine where the product resonates and where it falls short.

## Trigger
- Pre-launch PMF assessment for a new product or major feature
- Quarterly PMF health check
- Retention metrics suggest PMF erosion
- Expansion into a new market or customer segment

## Agents Involved
- **sean-ellis**: Leads PMF assessment and action planning
- **avinash-kaushik**: Builds quantitative models and segment analysis
- **sean-ellis**: Designs validation tests for PMF hypotheses
- **wes-kao**: Synthesizes findings and communicates to leadership

## Steps

### Phase 1: Survey (Days 1-7)
1. **sean-ellis** designs the PMF survey using the Sean Ellis test: "How would you feel if you could no longer use this product?" with options Very Disappointed, Somewhat Disappointed, Not Disappointed.
2. **sean-ellis** defines the survey audience: active users within the last 14 days who have used the product at least twice.
3. **avinash-kaushik** deploys the survey through the in-product survey tool and monitors response rates.
4. **sean-ellis** targets a minimum of 100 responses per segment for statistical reliability.
5. **sean-ellis** collects and codes open-ended responses: what would they miss, what would they switch to, who benefits most.

### Phase 2: Quantitative Analysis (Days 8-12)
6. **avinash-kaushik** computes retention curves by cohort and compares to PMF benchmarks (D30 > 25% for consumer, D30 > 60% for B2B SaaS).
7. **avinash-kaushik** analyzes engagement depth: frequency of use, feature breadth, time spent, and core action completion rates.
8. **avinash-kaushik** identifies the "aha moment" candidates: which early actions correlate most strongly with long-term retention?
9. **sean-ellis** triangulates survey results with quantitative data: do "Very Disappointed" users show distinct behavioral patterns?
10. **avinash-kaushik** computes the PMF score: percentage of "Very Disappointed" respondents (target: >40%).

### Phase 3: Segment Analysis (Days 13-16)
11. **sean-ellis** segments PMF scores by customer attributes: company size, use case, industry, acquisition channel, geography.
12. **avinash-kaushik** identifies high-PMF segments (>40% Very Disappointed) and low-PMF segments (<25%).
13. **sean-ellis** profiles the high-PMF segment: who are they, what do they value, how do they use the product differently?
14. **sean-ellis** identifies the gap between high-PMF and low-PMF segments: what is missing for the latter group?

### Phase 4: Action Planning (Days 17-19)
15. **sean-ellis** defines the PMF strategy: double down on high-PMF segments, improve or deprioritize low-PMF segments.
16. **sean-ellis** proposes specific actions: product improvements for gap segments, acquisition focus on high-PMF profiles, messaging adjustments.
17. **sean-ellis** designs experiments to test the top 2 PMF improvement hypotheses.
18. **wes-kao** prepares the PMF report: score, segment breakdown, action plan, and experiment designs.

### Phase 5: Retest (60-90 days after actions)
19. **sean-ellis** reruns the PMF survey on the same audience criteria.
20. **avinash-kaushik** compares before/after PMF scores by segment.
21. **sean-ellis** evaluates which actions moved the needle and which did not.
22. **wes-kao** publishes the PMF update report with trend analysis.
23. **sean-ellis** updates the action plan based on retest results.

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
| G1: Sample Adequate | Minimum 100 responses per analyzed segment | sean-ellis |
| G2: Triangulated | Survey results corroborated by quantitative behavioral data | avinash-kaushik |
| G3: Segments Distinct | High-PMF and low-PMF segments have statistically different profiles | avinash-kaushik |
| G4: Actions Testable | Top 2 actions have experiment designs with measurable outcomes | sean-ellis |
| G5: Retest Executed | PMF resurveyed within 90 days of action implementation | sean-ellis |

## Registry Updates
- **Metric Registry**: Register PMF score with calculation method, survey methodology, and benchmarks.
- **Segment Registry**: Document high-PMF and low-PMF segment definitions.
- **Experiment Registry**: Log PMF improvement experiments.
- **Insight Registry**: Record PMF findings, segment profiles, and trend data.
