# Ellis PMF Framework

## Overview

The Sean Ellis Product-Market Fit (PMF) framework provides a quantitative method for measuring
whether a product has achieved product-market fit. The centerpiece is a survey question -- "How
would you feel if you could no longer use this product?" -- with a specific threshold (40%
responding "Very disappointed") that indicates PMF. The framework goes beyond the binary question
of "do we have PMF?" to include qualitative follow-up, segmentation, and iterative use as a
diagnostic tool throughout the product development process.

## Origin

Developed by **Sean Ellis**, who coined the term "growth hacking" and served as the first marketer
at Dropbox, LogMeIn, and Eventbrite. Ellis created the survey after observing that successful
products consistently had a passionate core of users, while unsuccessful products had lukewarm
widespread usage. He tested the survey across hundreds of startups and identified the 40% threshold
empirically: products above 40% "very disappointed" consistently found sustainable growth, while
those below struggled regardless of marketing investment.

## Core Model

### The Core Survey Question

**"How would you feel if you could no longer use [product]?"**

Response options:
1. Very disappointed
2. Somewhat disappointed
3. Not disappointed (it is not really that useful)

### The 40% Threshold

If 40% or more of surveyed users select "Very disappointed," the product has likely achieved PMF.
This threshold is empirical, not theoretical -- it emerged from Ellis's analysis of hundreds of
products.

**Below 25%:** PMF is distant. Fundamental product changes needed.
**25-40%:** Approaching PMF. Targeted improvements can close the gap.
**40%+:** PMF achieved. Growth investment is likely to yield returns.
**60%+:** Strong PMF. Product has intense core value.

### Essential Follow-Up Questions

The core question provides a score. The follow-up questions provide actionable insight:

**Question 2: "What type of people do you think would most benefit from [product]?"**
Reveals the user's mental model of the ideal customer. Often more accurate than internal assumptions.

**Question 3: "What is the main benefit you receive from [product]?"**
Reveals the core value proposition in the user's own words. Often different from what the team
assumed the value proposition was.

**Question 4: "How can we improve [product] for you?"**
Provides a prioritized improvement roadmap. Weight responses by whether they come from "very
disappointed" users (your core) or "somewhat disappointed" users (your growth opportunity).

### Segmentation Analysis

The aggregate PMF score is a starting point. The real insight comes from segmentation:

**By user persona:** Different user types may have dramatically different PMF scores. A product
with 35% aggregate PMF might have 65% among power users and 15% among casual users. This reveals
who the product truly serves.

**By acquisition channel:** Users from different channels may have different expectations and
different PMF scores. Organic users often score higher than paid acquisition users.

**By use case:** If the product serves multiple use cases, PMF may be strong for one use case and
weak for another. This guides feature prioritization.

**By tenure:** How does PMF change with usage duration? If PMF increases with tenure, you have an
activation challenge. If it decreases, you may have a retention problem.

**By feature usage:** Correlate PMF score with feature adoption. Which features are used by the
"very disappointed" segment that are not used by the "not disappointed" segment?

## Application Steps

### Step 1: Identify the Right Survey Population
Survey users who have experienced the core value of the product. Do not survey users who signed up
yesterday. A good rule: users who have used the product at least twice in the last two weeks, or
who have completed the core action at least once. The goal is to survey people who have enough
experience to have an informed opinion.

### Step 2: Deploy the Survey
Use an in-app survey tool to reach users in context. Email surveys have lower response rates and
selection bias. Aim for at least 100 responses for statistical stability, with 200+ preferred for
segmentation.

### Step 3: Calculate the Score
The PMF score is the percentage of respondents who select "Very disappointed." Do not combine
"Very" and "Somewhat" disappointed -- the distinction is critical.

### Step 4: Analyze the "Very Disappointed" Segment
These are your core users. Understand them deeply:
- Who are they? (Role, company size, use case)
- What benefit do they cite?
- How do they describe the ideal user?
- What improvements do they request?

### Step 5: Analyze the "Somewhat Disappointed" Segment
These users see value but are not committed. They represent the growth frontier:
- What is missing for them that the "very disappointed" users have found?
- Are they using the product differently?
- Could targeted improvements convert them to "very disappointed"?

### Step 6: Build the Improvement Roadmap
Use the "somewhat disappointed" segment's feedback to identify changes that would deepen their
engagement. Prioritize changes that address common themes without compromising what the "very
disappointed" users love.

### Step 7: Re-Survey After Changes
The PMF survey is not a one-time exercise. Re-run it after significant product changes to track
movement. A rising PMF score validates the improvement direction.

## Key Distinctions

- **PMF is not a binary state.** It exists on a spectrum. 40% is a threshold for "likely sufficient
  to support growth," not a magical transition point.
- **"Very disappointed" is the only category that matters.** "Somewhat disappointed" is lukewarm
  attachment. It does not indicate the kind of value that drives retention and word-of-mouth.
- **PMF for a segment is not PMF for a market.** A product with 70% PMF among a tiny niche and 10%
  in the broader market has niche PMF. This can be a valid starting point but is not the same as
  broad PMF.
- **PMF can be lost.** Market changes, competitive entry, or product degradation can erode PMF.
  Ongoing measurement is necessary.
- **PMF is necessary but not sufficient for growth.** A product can have strong PMF and still fail
  to grow because of distribution, pricing, or market size issues.

## Pitfalls

1. **Surveying the wrong users.** New sign-ups who have not experienced core value will dilute the
   score. Survey users who have had sufficient exposure to form an opinion.
2. **Low sample size.** With fewer than 50 responses, the confidence interval is too wide for
   meaningful conclusions. Target 100+ responses.
3. **Ignoring the qualitative data.** The PMF score is a headline number. The real value is in the
   open-ended responses that explain why users feel the way they do.
4. **Optimizing for the metric instead of the insight.** Gaming the survey (selecting only known
   fans, biasing the sample) destroys the diagnostic value.
5. **Treating the 40% threshold as absolute.** The threshold is a guideline, not a law. Context
   matters. A product in a highly competitive market with many substitutes might need higher PMF.
6. **Running the survey once.** PMF is dynamic. Running the survey quarterly provides a trend line
   that is far more valuable than a single data point.
7. **Not segmenting results.** Aggregate scores hide segment-level variation that is essential for
   strategic decision-making.

## Cross-References

- **Ellis Growth Equation** -- PMF is a prerequisite for the growth equation. Without PMF, growth
  investments in reach, activation, and revenue are premature.
- **Ellis Activation and Aha Moment** -- The aha moment is the experiential manifestation of PMF.
  Users who reach the aha moment are more likely to be "very disappointed" without the product.
- **Ellis High-Tempo Testing** -- Once PMF is established, high-tempo testing becomes the mechanism
  for accelerating growth. Before PMF, testing should focus on improving the core product.
- **Fader Customer Base Audit** -- The audit's retention dynamics dimension reveals whether PMF is
  translating into sustained customer relationships.
- **Kao Rigorous Thinking** -- The PMF framework exemplifies rigorous thinking: quantifying a
  qualitative concept, setting falsifiable thresholds, and building systematic follow-up.
- **Mehta Outcome-Based CS** -- In SaaS, PMF is reflected in whether customers achieve their
  desired outcomes. Outcome-based CS provides ongoing PMF validation.
