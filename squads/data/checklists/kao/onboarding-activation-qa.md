# Onboarding Activation QA

## Purpose

Quality-assure the onboarding experience for clarity, feedback loops, and micro-victories that move users toward activation. Kao emphasizes that onboarding is not a tour of features but a guided path to the user's first meaningful win. This checklist audits whether onboarding achieves that purpose.

---

## Checklist Items

### 1. The First-Run Experience Has a Clear Goal
- **Pass:** The onboarding flow has one primary objective: get the user to their first meaningful outcome (aligned with the validated aha moment). Every screen and step serves this goal.
- **Fail:** Onboarding tries to show all features, resulting in a 15-step tour that teaches everything and achieves nothing.

### 2. Clarity Beats Cleverness in Copy and UI
- **Pass:** Onboarding instructions are written at a 6th-grade reading level. Each step tells the user exactly what to do and why. No jargon, no ambiguity.
- **Fail:** Onboarding uses product jargon, assumes prior knowledge, or prioritizes brand voice over clarity.

### 3. Micro-Victories Are Designed Into the Flow
- **Pass:** Users experience at least one small win within the first 2 minutes (e.g., "You created your first project!" or "Here's your first insight"). These victories build momentum.
- **Fail:** The user must complete a long setup before experiencing any value, creating an "investment before payoff" problem.

### 4. Progress Is Visible
- **Pass:** Users can see how far they have come and how much remains (progress bar, step indicator, checklist). This reduces anxiety and increases completion.
- **Fail:** Users have no sense of progress, leading to drop-off from uncertainty ("how much more of this is there?").

### 5. Feedback Is Immediate
- **Pass:** Every user action during onboarding receives immediate, visible feedback (confirmation message, animation, state change). The user is never left wondering "did that work?"
- **Fail:** Actions produce no visible response, or feedback is delayed, making the experience feel broken.

### 6. The Critical Path Has No Unnecessary Steps
- **Pass:** Each step in the onboarding flow has been evaluated: "Does removing this step prevent the user from reaching the aha moment?" Unnecessary steps have been removed.
- **Fail:** Onboarding includes steps that serve the company (e.g., marketing opt-in, profile completion) but do not help the user reach value.

### 7. Error States Are Handled Gracefully
- **Pass:** When a user makes a mistake or encounters an error during onboarding, the error message explains what happened and how to fix it. Recovery is easy.
- **Fail:** Errors produce generic messages ("Something went wrong") or, worse, silently fail with no indication.

### 8. Onboarding Works Across Key Platforms
- **Pass:** The onboarding experience is tested and functional on the top 2-3 platforms/devices that new users actually use (verified by data). Mobile and desktop experiences are both addressed.
- **Fail:** Onboarding is designed for desktop only while 60% of new users arrive on mobile, or vice versa.

### 9. Drop-Off Points Are Measured and Investigated
- **Pass:** Each onboarding step has a measured completion rate. Steps with drop-off above 20% are flagged for investigation and improvement.
- **Fail:** Onboarding completion is measured as a single number with no step-level visibility.

### 10. Onboarding Is Iterated Based on Data
- **Pass:** The onboarding flow has been updated at least once in the last quarter based on drop-off data, user feedback, or experiment results. It is treated as a living system.
- **Fail:** Onboarding was designed at launch and has not been touched since, despite changes in the product and user base.

---

## Cross-References

- [Growth Strategy Clarity](growth-strategy-clarity.md) -- onboarding is often the highest-leverage area
- [Learning Loop Integrity](learning-loop-integrity.md) -- onboarding changes should follow the learning loop
- [Messaging to Metric Alignment](messaging-to-metric-alignment.md) -- onboarding messaging must connect to activation metrics
- [Kao Rigorous Thinking Audit](kao-rigorous-thinking-audit.md) -- onboarding changes need causal reasoning, not just correlation
