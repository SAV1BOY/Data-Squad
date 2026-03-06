# CS Dashboard Examples

Real-world customer success dashboards: health scores, NRR tracking, and risk alerts.

---

## 1. Gainsight - Multi-Dimensional Health Score Dashboard

**Company/Context:** Gainsight (2020). Their own CS team needed a health score that predicted churn better than simple usage metrics.

**What They Did:**
- Composite health score (0-100) built from 6 dimensions, each weighted by predictive power: Product Usage (25%), Feature Breadth (20%), Support Sentiment (15%), Engagement Recency (15%), Executive Sponsor Activity (15%), Contract Growth Trend (10%).
- Dashboard showed: portfolio distribution (healthy/neutral/at-risk), health score trend by segment, and a "biggest movers" panel highlighting accounts that changed 15+ points in either direction.
- Each dimension could be drilled into to see the underlying signals.

**Metrics Used:** Composite health score, dimension-level scores, portfolio distribution, score velocity (rate of change), biggest movers (positive and negative).

**What Worked:** The "biggest movers" panel caught problems 45 days earlier than waiting for accounts to hit the "at-risk" threshold. CSMs began proactively reaching out when scores dropped by 15+ points, even if the account was still "healthy."

**What Failed:** The initial weights were set by intuition. Logistic regression on historical churn data showed that Executive Sponsor Activity was far more predictive than assumed, and Product Usage was less predictive. Re-weighting improved churn prediction accuracy from 62% to 78%.

**Lessons:** Health score weights must be derived from churn data, not intuition. Score velocity (direction and speed of change) is often more actionable than the absolute score.

**Application to Data Squad:** Build health scores with data-derived weights. Always include a "biggest movers" view. Train CSMs to react to velocity, not just thresholds.

---

## 2. Salesforce - NRR Decomposition Dashboard

**Company/Context:** Salesforce (2019). CS leadership needed to decompose NRR into its components to identify exactly where revenue was expanding or contracting.

**What They Did:**
- NRR waterfall: Starting ARR, then flows of Expansion (upsell, cross-sell, price increase), Contraction (downgrades, seat reduction), and Churn (full cancellations).
- Segmented by: customer size tier, industry vertical, CSM, and product line.
- Added a "renewal forecast" panel showing upcoming renewals with predicted outcome (expand, flat, contract, churn) based on health score and usage trends.
- A "save rate" metric tracked what % of at-risk accounts were retained after intervention.

**Metrics Used:** Gross revenue retention, NRR, expansion rate, contraction rate, churn rate, renewal forecast accuracy, save rate.

**What Worked:** The CSM-level segmentation revealed that NRR varied from 85% to 145% across CSMs -- not primarily due to skill, but due to portfolio composition. Rebalancing portfolios by risk profile (ensuring every CSM had a mix) normalized outcomes.

**What Failed:** The renewal forecast was initially based only on contract terms and health scores. Adding "champion change" detection (when the main user/buyer left the company) improved forecast accuracy by 20%.

**Lessons:** NRR decomposition by CSM often reveals portfolio composition problems, not performance problems. Champion departure is a critical churn predictor that most health scores miss.

**Application to Data Squad:** Build NRR waterfalls segmented by CSM, size, and vertical. Add champion-change detection to health scoring. Use portfolio composition analysis before blaming CSM performance.

---

## 3. HubSpot - Proactive Risk Alert System Dashboard

**Company/Context:** HubSpot (2020). The CS team wanted to move from reactive (responding to churn requests) to proactive (catching risk signals early).

**What They Did:**
- Built an alert dashboard with three severity levels: Watch (early signals), Warning (clear risk indicators), Critical (imminent churn risk).
- Watch triggers: login frequency dropped 30%+ from baseline, support ticket sentiment turned negative, key feature usage declined.
- Warning triggers: admin user went inactive, billing contact updated payment method to a lower-tier card, began exporting data.
- Critical triggers: cancellation page visited, support ticket requesting data export, 60+ days of zero usage.
- Each alert included: account context, health score history, last CSM interaction, and recommended playbook.

**Metrics Used:** Alert volume by severity, alert-to-action time (how quickly CSMs responded), intervention success rate by alert type, false positive rate.

**What Worked:** The data export signal was the single most predictive churn indicator (78% of accounts that exported full data churned within 90 days). CSMs began treating data export as a "red phone" event with same-day outreach.

**What Failed:** The initial system generated 200+ alerts per week per CSM, causing alert fatigue. Implementing a priority score based on account value times churn probability reduced actionable alerts to 15-20 per week, and CSMs actually engaged with them.

**Lessons:** Risk alert systems fail from over-alerting, not under-alerting. Prioritize by account value times probability. Behavioral signals (data export, admin changes) outperform usage-decline signals.

**Application to Data Squad:** Build tiered alert systems with strict volume caps per CSM per week. Identify the "red phone" behavioral signal for each client's product. Prioritize by value times probability.

---

## 4. Zendesk - Customer Effort and Satisfaction Tracking

**Company/Context:** Zendesk (2019). CS leadership hypothesized that customer effort (how hard it was to get value from the product) predicted churn better than satisfaction scores.

**What They Did:**
- Tracked Customer Effort Score (CES) alongside CSAT and NPS for every support interaction and product milestone.
- Dashboard showed: CES trend by customer segment, CES by product area (setup, daily use, admin, billing), correlation between CES and renewal rate, and a "friction map" showing where effort was highest.
- Combined CES with product usage data to create an "ease of value" metric: value received (measured by outcomes) divided by effort invested (measured by support contacts, time to complete key workflows).

**Metrics Used:** CES, CSAT, NPS, ease-of-value ratio, friction map scores by product area, CES-to-renewal correlation.

**What Worked:** CES predicted churn 2.3x better than CSAT. The friction map revealed that billing/invoicing had the highest effort scores despite being a "solved problem" -- customers struggled with complex multi-product invoicing. Simplifying invoicing reduced billing-related churn by 15%.

**What Failed:** CES surveys had low response rates (12%). Supplementing with implicit effort signals (support ticket volume, repeated page visits, undo/redo frequency in product) increased coverage to 85% of accounts.

**Lessons:** Customer effort is more predictive than satisfaction. Implicit effort signals (behavioral data) can supplement explicit surveys. Friction maps by product area reveal non-obvious improvement opportunities.

**Application to Data Squad:** Add effort-based metrics to CS dashboards alongside satisfaction. Build implicit effort scoring from behavioral signals. Create friction maps to prioritize CS improvements.

---

## 5. Intercom - Account Health Timeline Dashboard

**Company/Context:** Intercom (2021). CSMs needed to quickly understand an account's full history when preparing for renewals or escalations.

**What They Did:**
- Timeline view for each account showing: key events (onboarding completed, QBR held, support escalation, champion changed, feature adopted, plan changed), health score overlay, and NPS/CSAT responses.
- Dashboard aggregated timelines into patterns: "accounts that follow the healthy pattern" vs. "accounts that follow the churn pattern."
- Pattern matching flagged accounts whose recent timeline resembled historical churn patterns.

**Metrics Used:** Event timeline completeness, pattern match score (similarity to churn archetype), days since last positive event, event velocity (frequency of key milestones).

**What Worked:** Pattern matching identified a "silent churn" archetype: accounts where nothing bad happened, but nothing good happened either -- no QBRs held, no new features adopted, no support contact. These accounts churned at 40% vs. 8% for engaged accounts.

**What Failed:** The timeline initially showed every event, making it unreadable for long-tenured accounts. Filtering to "significant events only" (defined as events that historically correlated with outcome changes) made it usable.

**Lessons:** Absence of positive events is as dangerous as presence of negative events. Pattern matching against churn archetypes catches risks that threshold-based alerts miss.

**Application to Data Squad:** Build account timeline dashboards that flag "silence" as a risk signal. Use pattern matching against historical churn archetypes for early warning.
