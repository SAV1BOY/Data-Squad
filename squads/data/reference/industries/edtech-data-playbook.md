# EdTech Data Playbook

## Overview

EdTech analytics must balance engagement metrics with learning outcomes —
a distinction that separates it from most other industries. A user spending
more time on a platform could mean deep learning or confused frustration.
The best EdTech data teams build metrics that correlate with actual learning,
not just platform interaction, while acknowledging that measuring learning
is inherently hard.

---

## Core Metrics

### Engagement Metrics

**Active Learning Time:** Time spent on activities that demonstrate learning
(completing exercises, watching lessons to completion, writing responses) vs.
passive time (browsing, idle time on pages). Raw session duration is misleading
without this distinction.

**Session Frequency:** How often users return. In EdTech, consistent frequency
(e.g., 3x per week) matters more than total time. Spaced repetition research
shows that distributed practice outperforms massed practice.

**Content Engagement Rate:** Percentage of available content consumed by a
user within a course or program. Distinguish between linear progression and
selective engagement — both can be healthy depending on the product.

### Learning Outcome Metrics

**Completion Rate:** Percentage of users who complete a course, module, or
program. This is EdTech's most-tracked metric, but it must be contextualized:
- Completion rate by course difficulty and length
- Completion rate by learner segment (self-paced vs. cohort-based)
- Partial completion milestones (how far do non-completers get?)

**Assessment Scores:** Pre-test vs. post-test score improvement (learning
gain). This is the closest proxy for actual learning, but requires well-
designed assessments that measure understanding, not just recall.

**Skill Acquisition / Certification Rate:** Percentage of enrolled users who
achieve a defined competency milestone. More meaningful than completion for
professional education.

**Learning Velocity:** Time to reach competency milestones. Faster is not
always better — it depends on the learning domain and assessment quality.

### Business Metrics

**NPS (Net Promoter Score):** Willingness to recommend. In EdTech, NPS
correlates with perceived learning value, not just product quality. Segment
by completers vs. non-completers — the gap is informative.

**LTV (Lifetime Value):** Revenue per learner over their lifetime on the
platform. In subscription EdTech, this follows SaaS patterns. In course-based
EdTech, it depends on repeat purchases and upsell to higher-tier programs.

**Refund Rate:** Percentage of purchases refunded. In course-based EdTech,
refund windows are often 7-30 days. Track refund timing — early refunds
suggest expectation mismatch; late refunds suggest content quality issues.

**Referral Rate:** Percentage of new users acquired through referrals from
existing users. EdTech has naturally high word-of-mouth potential when
outcomes are strong.

---

## Key Analytical Patterns

### Completion Funnel Analysis

Map the dropout curve across a course or program:
- Where do users drop off? (typically after module 1-2)
- Is there a "commitment point" after which completion rates rise sharply?
- Do specific content types (video vs. text vs. exercise) have different
  dropout rates?
- How do cohort-based programs compare to self-paced?

### Engagement-Outcome Correlation

The most important analysis in EdTech: which engagement patterns actually
predict better learning outcomes? This requires:
- Defining a valid outcome measure (assessment scores, skill application)
- Correlating engagement behaviors with outcomes
- Testing for causality (does more practice cause better outcomes, or do
  motivated students both practice more and score higher?)

### Cohort-Based Learning Analysis

Group learners by enrollment date and track:
- Completion rate curves (what % complete by week 1, 2, 4, 8?)
- Learning gain by cohort
- Retention beyond the first course (do completers come back for more?)
- Revenue per cohort at different time horizons

---

## Common Pitfalls

1. **Conflating engagement with learning.** High session time may indicate
   confusion, not deep engagement. Always pair engagement metrics with
   outcome measures.
2. **Ignoring non-completers.** Students who complete 60% of a course may
   have achieved their learning goal. Treating all non-completion as failure
   misrepresents the product's value.
3. **Assessment quality as an afterthought.** If assessments are poorly
   designed, all outcome metrics built on them are meaningless. Invest in
   assessment validity.
4. **Survivorship bias in NPS.** Users who dropped out early never see the
   NPS survey. Reported NPS is biased toward satisfied completers.
5. **Optimizing for completion at the expense of learning.** Making courses
   easier increases completion rates but may decrease learning gains. These
   metrics can be in tension.

---

## Cross-References

- **Activation Funnel Quality Checklist** (`checklists/activation-funnel-quality.md`) — First-lesson engagement and aha moment.
- **Retention Quality Checklist** (`checklists/retention-quality.md`) — Learner retention and re-enrollment.
- **Cognitive Load in Dashboards** (`reference/psychology/cognitive-load-in-dashboards.md`) — Applies to both dashboards and course design.
- **Narrative Fallacy in Data** (`reference/psychology/narrative-fallacy-in-data.md`) — Stories about "engaged learners" without outcome data.

---

*Version: 1.0 | Last updated: 2026-03-06*
