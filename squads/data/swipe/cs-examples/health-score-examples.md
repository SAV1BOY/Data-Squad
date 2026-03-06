# Health Score Examples

Real-world health score designs from CS teams, showing construction, calibration, and operational use.

---

## 1. Gainsight - Multi-Signal Health Score with Regression-Based Weights

**Company/Context:** Gainsight (2020). Their CS team rebuilt their health score from scratch using logistic regression on historical churn data rather than expert-assigned weights.

**What They Did:**
- Collected 18 candidate signals across 4 categories: Product Usage (DAU/MAU ratio, feature breadth, data volume), Engagement (CSM meeting frequency, QBR attendance, support ticket sentiment), Outcomes (ROI realized, goals achieved in success plan), Relationship (executive sponsor engagement, champion NPS response, multi-threaded contacts).
- Ran logistic regression predicting 90-day churn on 2 years of historical data.
- Top 6 predictors (by coefficient magnitude): executive sponsor login recency, DAU/MAU decline rate, support ticket sentiment trend, feature breadth vs. contracted features, QBR attendance streak, and champion NPS score.
- Weighted these into a 0-100 composite score, with thresholds: 80-100 (healthy), 50-79 (neutral), 0-49 (at-risk).

**Metrics Used:** Composite health score, dimension scores, AUC-ROC of churn prediction model (0.82), false positive rate, early warning lead time (average days before churn that score dropped below 50).

**What Worked:** The regression-derived score outperformed the previous expert-assigned score dramatically: AUC-ROC improved from 0.64 to 0.82. Executive sponsor engagement was 3x more predictive than raw product usage -- a counterintuitive finding that changed CSM behavior.

**What Failed:** The regression model was trained on historical data where CSMs had already intervened on at-risk accounts, biasing the model. Adding an "intervention flag" to the training data and modeling unintervened accounts separately improved calibration.

**Lessons:** Data-derived health scores outperform expert-assigned scores. Relationship signals (executive engagement, champion health) are often more predictive than usage signals. Account for CSM intervention bias in model training.

**Application to Data Squad:** Build health scores with data-derived weights. Always include relationship/engagement signals alongside product usage. Warn clients that expert-assigned weights are typically wrong.

---

## 2. Mixpanel - Product-Usage-Only Health Score

**Company/Context:** Mixpanel (2019). With a lean CS team, they needed a health score that could be fully automated from product data (no CSM input required).

**What They Did:**
- Built the score entirely from product telemetry: weekly active users as % of licensed seats, number of distinct query types used (funnels, retention, flows, cohorts), data freshness (how recently the customer sent tracking data), report sharing frequency (users sharing analyses internally).
- Each signal normalized to 0-25 points, summing to a 0-100 score.
- Added a "trajectory" indicator: improving, stable, or declining based on 4-week trend.
- Triggered automated plays: score below 40 triggered CSM outreach email; score below 25 triggered executive sponsor alert.

**Metrics Used:** Health score, seat utilization rate, feature breadth score, data freshness, report sharing rate, trajectory indicator, automated play trigger volume.

**What Worked:** Report sharing frequency was the sleeper signal. Accounts where users shared analyses internally had 85% annual retention vs. 60% for accounts where analyses stayed in personal dashboards. Sharing indicated organizational value, not just individual user value.

**What Failed:** The equal weighting (0-25 per signal) was a compromise for simplicity but didn't reflect actual predictive power. Seat utilization was weighted the same as data freshness, but seat utilization was 3x more predictive. Adjusting weights improved accuracy significantly.

**Lessons:** Fully automated health scores are viable for lean CS teams. Internal sharing/collaboration signals are among the strongest predictors. Even simple scores benefit from unequal weighting based on predictive power.

**Application to Data Squad:** For clients with lean CS teams, build automated health scores from product telemetry. Look for "internal sharing" or "collaboration" signals as strong retention predictors.

---

## 3. Salesforce - Tiered Health Score by Customer Segment

**Company/Context:** Salesforce (2020). A single health score model performed poorly because Enterprise, Mid-Market, and SMB customers had fundamentally different success patterns.

**What They Did:**
- Built three separate health score models, one per segment:
- Enterprise (1000+ seats): weighted toward executive engagement (30%), multi-department adoption (25%), integration depth (20%), support escalation trend (15%), renewal history (10%).
- Mid-Market (100-999 seats): weighted toward admin engagement (25%), seat utilization (25%), feature adoption (20%), support ticket volume (15%), growth trajectory (15%).
- SMB (under 100 seats): weighted toward primary user login frequency (30%), core feature usage (25%), billing health (20%), support self-service usage (15%), growth signals (10%).
- Each model had segment-specific thresholds: Enterprise flagged at-risk at 60 (more intervention time needed), SMB at 40 (faster churn cycle).

**Metrics Used:** Segment-specific health scores, segment-specific churn prediction accuracy, renewal rate by health tier by segment, CSM portfolio health distribution.

**What Worked:** Segment-specific models improved churn prediction by 25% vs. the one-size-fits-all model. The key insight: Enterprise churn is driven by relationship failures (executive sponsor leaves, no multi-department adoption). SMB churn is driven by engagement failures (stopped logging in, not using core features). Different signals for different segments.

**What Failed:** The segment boundaries (100, 1000 seats) were arbitrary. Some 95-seat customers behaved like Mid-Market, and some 105-seat customers behaved like SMB. Adding a "behavioral segment" override (based on usage patterns, not just seat count) improved edge-case accuracy.

**Lessons:** One health score model does not fit all customer segments. Enterprise health is relationship-driven; SMB health is engagement-driven. Use behavioral indicators to handle segment boundary edge cases.

**Application to Data Squad:** Build segment-specific health scores for clients with diverse customer bases. Educate CS leaders that the signals that matter change by segment.

---

## 4. Zendesk - Leading Indicator Health Score

**Company/Context:** Zendesk (2021). The CS team found that their health score was a lagging indicator -- it dropped after customers had already decided to churn, too late for intervention.

**What They Did:**
- Rebuilt the score around leading indicators rather than current-state metrics.
- Leading indicators: rate of change in usage (not absolute usage), new user onboarding velocity (are new team members being added and trained?), admin engagement trend (is the admin investing time in configuration?), feature exploration (is the account trying new features or stuck on the basics?), integration additions (is the account connecting more tools?).
- Calculated "health velocity" -- the speed and direction of score change -- and made this the primary alert trigger rather than the absolute score level.
- Alert threshold: health velocity below -3 points/week for 2+ consecutive weeks, regardless of absolute score level.

**Metrics Used:** Health velocity (score change per week), leading indicator scores, intervention response rate, early warning lead time.

**What Worked:** Health velocity alerts fired 60 days earlier than absolute-threshold alerts on average. A "healthy" account (score of 75) declining at -4 points/week was flagged 8 weeks before it would have crossed the at-risk threshold at 50. This gave CSMs actionable intervention time.

**What Failed:** Health velocity was noisy for small accounts where a single user's vacation could cause a temporary dip. Adding a "minimum account size" filter (5+ users) and a "sustained decline" requirement (2+ consecutive weeks) reduced false positives by 70%.

**Lessons:** Health score velocity (rate of change) is more actionable than absolute level. A healthy account that is declining fast is a higher priority than a neutral account that is stable. Filter for sustained trends to reduce noise.

**Application to Data Squad:** Build health velocity as a first-class metric alongside absolute health score. Alert on sustained velocity declines. Educate CSMs to prioritize fast-declining healthy accounts over stable at-risk accounts.
