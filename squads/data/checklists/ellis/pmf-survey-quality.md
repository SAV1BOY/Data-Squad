# PMF Survey Quality

## Purpose

Audit the Product-Market Fit survey methodology, following Sean Ellis's approach. The canonical question -- "How would you feel if you could no longer use this product?" -- is deceptively simple but frequently misapplied. This checklist validates that PMF measurement is methodologically sound, free of bias, and properly interpreted.

---

## Checklist Items

### 1. The Core PMF Question Is Asked Correctly
- **Pass:** The survey includes Ellis's canonical question with the standard response options: "Very disappointed," "Somewhat disappointed," "Not disappointed," and "I no longer use this product."
- **Fail:** The question is reworded, the scale is altered, or the question is embedded in a satisfaction survey where framing effects contaminate it.

### 2. The Survey Targets the Right Users
- **Pass:** The survey is sent to users who have experienced the core value proposition -- typically those who have used the product at least twice in the last two weeks (or equivalent activation threshold).
- **Fail:** The survey goes to all registered users, including those who signed up but never activated, diluting the signal.

### 3. Sample Size Is Sufficient
- **Pass:** At least 40-50 responses are collected, allowing a meaningful percentage calculation. For segmented analysis, each segment has at least 30 responses.
- **Fail:** The survey has fewer than 30 total responses, making percentage calculations unreliable.

### 4. Response Bias Is Acknowledged and Mitigated
- **Pass:** The team recognizes that respondents skew toward more engaged users. Response rate is tracked. Non-response analysis is performed (comparing respondents vs. non-respondents on usage metrics).
- **Fail:** The team assumes the sample is representative without checking, or the response rate is below 5% with no discussion of bias.

### 5. The 40% Threshold Is Applied with Context
- **Pass:** The 40% "very disappointed" benchmark is used as a directional signal, not a binary pass/fail. Trend over time and comparison across segments provide more insight than any single number.
- **Fail:** The team fixates on hitting exactly 40% without looking at trends, segments, or the qualitative data.

### 6. Qualitative Follow-Up Questions Are Included
- **Pass:** The survey includes open-ended questions: "What is the primary benefit you receive?" and "What type of person do you think would benefit most?" These responses are analyzed and coded.
- **Fail:** Only the quantitative question is asked, missing the qualitative signal that explains the number.

### 7. Segmented Analysis Is Performed
- **Pass:** PMF scores are calculated per user segment (use case, persona, acquisition channel, geography) to identify where PMF is strongest and where it is weakest.
- **Fail:** Only an aggregate score is reported, hiding that PMF may be strong for one persona and weak for another.

### 8. Results Inform Product Strategy
- **Pass:** PMF survey results are reviewed in product planning meetings. Segments with high PMF get investment; segments with low PMF get investigation or deprioritization.
- **Fail:** The survey is a vanity exercise. Results are shared in a slide but do not influence product decisions.

### 9. The Survey Is Repeated on a Regular Cadence
- **Pass:** The survey is run at least quarterly (or after significant product changes) to track PMF trajectory over time.
- **Fail:** The survey was run once and never repeated, providing a snapshot but no trend.

### 10. Survey Fatigue Is Managed
- **Pass:** The same user is not surveyed more than once per quarter. Survey length is under 5 minutes. Invitation copy is respectful of the user's time.
- **Fail:** Users are surveyed repeatedly, the survey is long, or the invitation is aggressive, damaging response quality and user goodwill.

---

## Cross-References

- [North Star Metric Audit](north-star-metric-audit.md) -- PMF informs which NSM to pursue
- [Activation Loop Debug](activation-loop-debug.md) -- low PMF may signal an activation problem
- [Growth Experiment Velocity](growth-experiment-velocity.md) -- PMF findings should feed the experiment backlog
- [Ellis Growth Lever Audit](ellis-growth-lever-audit.md) -- PMF strength determines which growth lever to pull
