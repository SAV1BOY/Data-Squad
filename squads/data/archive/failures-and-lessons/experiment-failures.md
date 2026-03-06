# Experiments Gone Wrong: Peeking, Wrong Metrics, Contamination, and Underpowered Tests

## Context

Running experiments is easy. Running them correctly is surprisingly hard. The gap between "we A/B tested it" and "we have valid causal evidence" is enormous, and most organizations fall into the gap without realizing it. The result is confident but wrong conclusions that drive product and business decisions in the wrong direction.

This case study catalogs the most common and damaging experimentation failures, drawn from real-world examples across the tech and business landscape. Each failure mode is described with its mechanism, real-world impact, and concrete prevention strategies.

## What Happened

### Failure 1: Peeking (The Most Common and Damaging Error)

**What it is:** Checking experiment results before the pre-determined sample size or runtime is reached and making decisions based on what you see.

**Why it is devastating:** Under standard frequentist testing, a p-value of 0.05 means a 5% false positive rate at the planned analysis time. But if you check daily and stop when you see significance, the actual false positive rate can exceed 30%. You are essentially running multiple tests and stopping at the first favorable result.

**Real-world example:** A major e-commerce company ran an experiment on a new checkout flow. The team checked results daily. On day 4, the new flow showed a statistically significant 3.2% improvement in conversion rate (p = 0.03). The team shipped the change. Over the following quarter, conversion rates showed no improvement. A post-mortem revealed that the day-4 result was a false positive driven by weekend traffic patterns. The true effect was approximately zero.

**How common it is:** Surveys of experimentation practitioners consistently find that 50-70% of teams check results before the planned end date. Most do not apply corrections for multiple looks.

**Prevention:**
- Use sequential testing methods (always-valid p-values, confidence sequences) that are designed for continuous monitoring
- Lock experiment dashboards until the planned analysis date
- If you must monitor, use group sequential designs with pre-specified interim analyses and alpha spending functions
- Educate stakeholders that "early significance" is not real significance

### Failure 2: Choosing the Wrong Success Metric

**What it is:** Optimizing for a metric that does not actually represent the business outcome you care about.

**Real-world example:** A social media platform ran experiments optimizing for "time spent in app," their declared north star metric. An experiment showed that adding autoplay to video content increased time spent by 8%. The team shipped the feature. Six months later, a long-term analysis showed that while time spent increased, daily active user retention decreased by 2%. Users were spending more time per session but visiting less frequently -- they were binge-watching and then burning out. The net effect on total engagement was negative.

**Another example:** A SaaS company optimized their onboarding experiment for "completed onboarding flow" -- the percentage of users who finished all onboarding steps. A simplified flow increased completion from 45% to 72%. However, the simplified flow skipped key setup steps (connecting integrations, inviting team members) that were critical for long-term retention. The team celebrated the onboarding improvement while 90-day retention quietly declined.

**Prevention:**
- Define a hierarchy of metrics: primary (what you optimize for), secondary (what you hope improves), and guardrail (what must not get worse)
- Always include a long-term outcome metric as a guardrail, even if the experiment is too short to measure it directly
- Validate that your primary metric is a reliable predictor of long-term business outcomes before using it as an experiment target

### Failure 3: Sample Contamination and Spillover

**What it is:** Treatment and control groups affecting each other, violating the Stable Unit Treatment Value Assumption (SUTVA) that is foundational to causal inference.

**Real-world example:** A messaging app tested a new group chat feature. Users were randomly assigned to treatment (new feature) and control (old feature). But group chats contain multiple users. When a treatment-group user used the new feature in a group chat, control-group users experienced it too. The experiment showed no difference between groups -- because the control group was effectively treated. The actual effect of the feature was positive, but the contaminated experiment missed it entirely.

**Another example:** A ride-sharing company tested a driver incentive program. Treatment-group drivers received bonuses, which attracted them to specific geographic areas. This reduced driver supply in areas served by control-group drivers, making the control group's metrics artificially worse. The experiment overstated the incentive program's effect because the control group was harmed by the treatment group's behavior.

**Prevention:**
- Identify potential contamination pathways before launching: shared resources, network effects, marketplace dynamics, shared physical spaces
- Use cluster randomization (randomize by geography, network cluster, or market) to contain spillover within clusters
- Monitor for contamination by comparing control group outcomes to pre-experiment baselines (if the control group worsens, contamination may be occurring)
- In marketplace experiments, use switchback designs or synthetic control methods

### Failure 4: Underpowered Tests (Detecting Nothing and Calling It "No Effect")

**What it is:** Running experiments with insufficient sample size to detect a realistic effect, then concluding "there is no effect" when the test fails to reach significance.

**Real-world example:** A B2B SaaS company with 2,000 monthly signups tested a new pricing page. They ran the test for 2 weeks (1,000 users per group) and observed a 2% improvement in conversion rate (from 10% to 10.2%) with a p-value of 0.45. The team concluded "the new pricing page has no effect" and abandoned the redesign. A power analysis revealed that detecting a 2% relative improvement with 80% power would have required 25,000 users per group -- 25 times the sample used. The experiment could not have detected the effect even if it existed.

**Why it matters:** Underpowered tests bias organizations toward the status quo. True improvements are invisible to tests that are too small, creating a systematic bias against change. This is especially pernicious because underpowered tests produce null results that look like evidence against the treatment.

**How common it is:** Academic reviews of corporate experimentation find that 40-60% of experiments are underpowered for realistic effect sizes. Many organizations have never conducted a power analysis.

**Prevention:**
- Conduct power analysis before every experiment. Determine the minimum detectable effect (MDE) at your sample size and ask "is this MDE small enough to detect effects we would care about?"
- If the required sample size exceeds what you can achieve in a reasonable timeframe, consider proxy metrics with lower variance, variance reduction techniques (CUPED), or alternative methods (quasi-experiments)
- Never interpret a non-significant result as "no effect." Report the confidence interval instead: "the effect is somewhere between -1% and +5%"
- Distinguish between "we found no effect" and "we could not detect an effect" in all reporting

### Failure 5: Multiple Testing Without Correction

**What it is:** Testing many metrics in an experiment and declaring victory on whichever one reaches significance, without adjusting for the number of comparisons.

**Real-world example:** A content platform ran an experiment on a new recommendation algorithm. The team measured 30 metrics. At p < 0.05, you would expect 1.5 metrics to appear significant by chance alone. The team found 2 significant metrics (average session depth and video completion rate) and declared the experiment a success based on these results. Neither metric was the pre-specified primary metric. The team had effectively run 30 tests and cherry-picked the winners.

**Prevention:**
- Pre-register a single primary metric before the experiment launches
- If you must test multiple metrics, apply multiple comparison corrections (Bonferroni for strict control, Benjamini-Hochberg for FDR control)
- Clearly distinguish between confirmatory analysis (pre-registered, corrected) and exploratory analysis (post-hoc, hypothesis-generating)

### Failure 6: Novelty and Primacy Effects

**What it is:** Short-term behavioral changes caused by the newness of a treatment, not by its lasting value.

**Real-world example:** A productivity app tested a redesigned dashboard. In the first two weeks, engagement with the new dashboard was 15% higher than the control. The team shipped the change. Over the following month, engagement regressed to the control level. Users had explored the new design out of curiosity, not because it was better. Meanwhile, the redesign had moved key features to less discoverable locations, causing a slow decline in feature usage that only appeared in month-two data.

**Prevention:**
- Run experiments for at least 2-4 weeks, preferably longer for major changes
- Compare the first-week effect to subsequent-week effects. If the effect decays, novelty is likely the driver.
- Maintain long-term holdout groups for major changes (keep 5-10% of users on the old experience for 3-6 months)
- For UI changes, examine not just aggregate engagement but feature-specific usage patterns

## Summary of Failure Modes

| Failure | False Positive Risk | False Negative Risk | Frequency |
|---|---|---|---|
| Peeking | Very high | Low | Very common |
| Wrong metric | Moderate | Moderate | Common |
| Contamination | Variable | High | Common in marketplaces |
| Underpowered tests | Low | Very high | Very common |
| Multiple testing | High | Low | Common |
| Novelty effects | High | Low | Common for UI changes |

## Application to Data Squad

- **Implement an experiment checklist**: Before any experiment launches, require: pre-registered primary metric, power analysis, contamination assessment, planned analysis date, and decision criteria for each outcome.
- **Build peeking protection into your tools**: Use sequential testing methods or lock experiment dashboards until the analysis date. Make it technically difficult to peek.
- **Train the team on statistical power**: Every analyst should be able to run a power analysis and interpret its results. Make power analysis a standard part of experiment planning.
- **Separate exploratory from confirmatory analysis**: Label all post-hoc findings as "hypothesis-generating" and require follow-up experiments to confirm them.
- **Default to longer experiments**: Set a minimum experiment duration of 2 weeks for any test, 4 weeks for UI changes. Include at least one full business cycle (usually one week).
- **Create an experiment post-mortem library**: Document experiments that failed, especially those that revealed invalid assumptions. These failures are the most valuable learning opportunities.
