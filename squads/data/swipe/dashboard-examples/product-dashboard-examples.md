# Product Dashboard Examples

Real-world feature adoption, usage pattern, and product analytics dashboards.

---

## 1. Figma - Feature Adoption Waterfall

**Company/Context:** Figma (2021). The product team needed to track adoption of new features (Auto Layout, Variants, Interactive Components) and understand the path from awareness to habitual use.

**What They Did:**
- For each major feature release, tracked a 4-stage funnel: Exposed (saw the feature in UI), Tried (used it once), Adopted (used it in 3+ separate sessions), Habitual (used it weekly for 4+ consecutive weeks).
- Dashboard showed the waterfall for each feature, with median time between stages.
- A "feature health" summary ranked all features by their Tried-to-Habitual conversion rate.
- Segmented by user type: individual contributor, team lead, enterprise admin.

**Metrics Used:** Exposure rate, trial rate, adoption rate, habitual use rate, median time between stages, Tried-to-Habitual conversion.

**What Worked:** Variants had high Tried rate (60%) but low Habitual rate (12%), revealing a usability gap in the feature. User research confirmed the feature was powerful but the UI was confusing. A redesigned Variants panel increased habitual use to 28%.

**What Failed:** "Exposed" was initially defined as "feature visible on screen" which counted users who scrolled past it. Redefining as "hovered or clicked the feature area" made the metric meaningful.

**Lessons:** Feature adoption is not binary. Track the full journey from exposure to habit. The Tried-to-Habitual gap is where most features die.

**Application to Data Squad:** Build feature adoption waterfalls for every major release. Focus product improvements on the Tried-to-Habitual gap rather than just driving initial trial.

---

## 2. Notion - Template and Use-Case Clustering Dashboard

**Company/Context:** Notion (2021). The product team wanted to understand how different user segments actually used the product, beyond just page-creation counts.

**What They Did:**
- Clustered users by primary use case based on template usage and content patterns: Project Management, Knowledge Base, Personal Notes, Team Wiki, CRM/Database.
- Dashboard showed: cluster sizes, growth rates, retention by cluster, and "cluster migration" (users who shifted primary use case over time).
- A "use-case stacking" metric tracked how many distinct use cases each user adopted, correlated with retention.

**Metrics Used:** Cluster size, cluster growth rate, cluster-specific retention, use-case stacking count, cluster migration rate.

**What Worked:** Users with 3+ use cases had 2.5x higher 12-month retention than single-use-case users. The team built "suggested next use case" prompts that increased stacking by 20%.

**What Failed:** The clustering algorithm initially over-weighted recent activity, causing users to flip between clusters weekly. Using a 30-day rolling window stabilized classifications.

**Lessons:** Usage pattern clustering reveals segments that demographic data cannot. "Use-case stacking" is a powerful retention predictor for horizontal products.

**Application to Data Squad:** For horizontal platforms (tools that serve many use cases), cluster by behavior, not demographics. Track use-case stacking as a leading retention indicator.

---

## 3. Amplitude - Self-Serve Analytics Usage Dashboard

**Company/Context:** Amplitude (2020). The product team ate their own dog food, using Amplitude to track how customers used Amplitude itself.

**What They Did:**
- Tracked the "analytics maturity" of each customer account: Level 1 (basic event counts), Level 2 (funnel and retention analysis), Level 3 (behavioral cohorts and segmentation), Level 4 (predictive analytics and custom formulas).
- Dashboard showed: distribution of accounts across maturity levels, maturity-level progression rate, feature usage frequency by maturity level, and correlation between maturity level and renewal probability.

**Metrics Used:** Analytics maturity level distribution, level progression rate, feature usage frequency, renewal probability by maturity level, time to reach each maturity level.

**What Worked:** Level 3 accounts renewed at 95% vs. 72% for Level 1. The team built guided workflows to push Level 1 and 2 accounts toward Level 3 behaviors. CSMs were given maturity scores as the primary health signal.

**What Failed:** The maturity levels were initially defined by the product team's opinion of what "advanced" meant. Re-deriving levels from actual usage patterns (via clustering) produced levels that better predicted renewal.

**Lessons:** Product maturity models should be derived from data, not assumptions. The level that best predicts retention should be the activation target.

**Application to Data Squad:** Build product maturity models for clients' products. Use renewal/retention correlation to identify which maturity level to target. Give CSMs maturity scores as health indicators.

---

## 4. Canva - Design Completion and Sharing Dashboard

**Company/Context:** Canva (2020). The product team wanted to understand the full lifecycle of a design: creation, editing, completion, and distribution.

**What They Did:**
- Tracked design lifecycle stages: Started (opened editor), In-Progress (spent 2+ minutes editing), Completed (downloaded or marked done), Shared (sent link, published, or embedded), Reused (opened as template for new design).
- Dashboard showed: completion rate by design type (social post, presentation, document), median time to complete, share rate by design type, and "virality trigger" (what % of shared designs led to new sign-ups).
- A "design type migration" view showed how users expanded from their initial design type to others.

**Metrics Used:** Completion rate, share rate, median completion time, virality trigger rate, design type migration, reuse rate.

**What Worked:** Social media posts had the highest completion and share rates but lowest reuse. Presentations had lower completion but highest reuse (template effect). This insight drove the team to invest in presentation templates, which increased overall engagement.

**What Failed:** Counting "downloaded" as "completed" overestimated completion for designs that were downloaded but never used. Adding a "published/posted" event via integrations gave a truer completion signal.

**Lessons:** Product lifecycle tracking should extend beyond the product's own walls. Downstream events (sharing, reuse, virality) often reveal more than in-product metrics.

**Application to Data Squad:** Track the full content/creation lifecycle including post-product events. Identify which product features drive virality vs. retention vs. reuse -- they're often different features.

---

## 5. Linear - Workflow Adoption and Team Productivity Dashboard

**Company/Context:** Linear (2022). The product team needed to understand which workflow features drove team-level adoption and whether product changes actually improved team productivity.

**What They Did:**
- Team-level dashboard showing: issues created/completed per week, cycle time (created to done), adoption of workflows (cycles, triage, roadmap views), and "workflow maturity" score.
- Compared teams using advanced features (cycles, auto-assignment, custom views) vs. basic features (simple issue tracking only).
- Tracked "team activation" as a distinct concept from individual activation: a team was activated when 80%+ of members used Linear for 3+ consecutive weeks.

**Metrics Used:** Team cycle time, issues per team per week, workflow feature adoption rate, team activation rate, workflow maturity score.

**What Worked:** Teams using Cycles (sprint planning feature) had 30% shorter cycle times. But causation vs. correlation was unclear until they ran a guided onboarding experiment: teams randomly assigned to Cycles onboarding showed similar improvements, validating the causal link.

**What Failed:** Individual-level metrics were misleading for a team product. One power user could inflate a team's numbers. Switching to "team-level medians" (median member's usage) gave a more honest picture.

**Lessons:** For team products, measure at the team level, not the individual level. Use team medians rather than team totals to avoid power-user distortion.

**Application to Data Squad:** For B2B team products, always build team-level dashboards. Use team medians, not sums. Define team activation separately from individual activation.
