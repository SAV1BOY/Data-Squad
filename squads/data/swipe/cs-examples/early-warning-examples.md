# Early Warning System Examples

Real-world early warning systems from CS teams that detect churn risk before it becomes visible in standard metrics.

---

## 1. Slack - Champion Departure Detection System

**Company/Context:** Slack (2020). The enterprise CS team found that champion departures (the primary internal advocate leaving the company) were the single largest driver of unexpected churn.

**What They Did:**
- Built a multi-signal champion departure detection system:
  - Signal 1: Primary champion's login frequency dropped 80%+ over 2 weeks (could indicate they've given notice or are transitioning).
  - Signal 2: LinkedIn job change detected (automated monitoring via third-party data enrichment).
  - Signal 3: Admin permissions transferred to a new user (succession planning indicator).
  - Signal 4: Champion's email bounced from CSM outreach (confirmed departure).
- Triggered a "Champion Risk" playbook: CSM identifies the new internal sponsor within 5 business days, schedules introductory call, and resets the relationship.
- Tracked "champion gap days" -- the number of days between old champion departure and new champion engagement.

**Metrics Used:** Champion departure detection rate, champion gap days, churn rate for accounts with champion departure (with intervention vs. without), time to new champion engagement.

**What Worked:** Accounts where the champion gap was less than 14 days had 88% annual retention. Accounts with gaps over 60 days had 52% retention. Rapid response to champion departure was the single highest-ROI CS intervention.

**What Failed:** LinkedIn monitoring had a 3-4 week lag (people update LinkedIn after settling into new roles). The login-frequency drop signal was faster (detected within 2 weeks of departure) and became the primary trigger.

**Lessons:** Champion departure is the highest-impact churn risk factor for enterprise accounts. Build detection systems around behavioral signals (login drop) rather than external data (LinkedIn). Minimize the "champion gap" as the key intervention metric.

**Application to Data Squad:** For B2B clients, build champion departure detection as a standard early warning. Track champion gap days. Train CSMs to treat champion departure as a critical incident requiring same-week response.

---

## 2. Zendesk - Support Sentiment Trend Analysis

**Company/Context:** Zendesk (2019). The CS team built an early warning system based on support ticket sentiment trends rather than ticket volume.

**What They Did:**
- Applied NLP sentiment analysis to every support ticket and aggregated to an account-level "sentiment score" (rolling 30-day average).
- Early warning triggers:
  - Sentiment score dropped below -0.3 (on a -1 to +1 scale) for 2+ consecutive weeks.
  - Ticket escalation rate exceeded 15% (tickets escalated to manager or engineering).
  - Repeat-contact rate exceeded 30% (same issue reopened or recontacted).
  - New signal: "frustration language" detection -- specific phrases like "this has been going on for weeks," "we're considering alternatives," "our team is frustrated."
- Combined sentiment signals into a "Support Health" sub-score feeding the overall health score.

**Metrics Used:** Account-level sentiment score, sentiment trend (velocity), escalation rate, repeat-contact rate, frustration language detection rate, time from first negative signal to churn (lead time).

**What Worked:** Frustration language detection was the earliest signal, firing an average of 75 days before churn. Standard sentiment scoring fired at 45 days. Volume-based alerts fired at only 20 days. The specific language patterns ("considering alternatives") were 4x more predictive than general negative sentiment.

**What Failed:** Sentiment analysis on short tickets (under 20 words) was unreliable, producing false positives. Filtering to tickets with 50+ words and focusing on multi-paragraph tickets improved precision without sacrificing recall.

**Lessons:** Support ticket sentiment trend is a powerful leading indicator. Specific frustration phrases outperform general sentiment scoring. Filter out short tickets to reduce noise.

**Application to Data Squad:** Build support sentiment analysis into CS early warning systems. Create a custom dictionary of churn-predictive phrases for each client's domain. Focus on trends, not point-in-time scores.

---

## 3. Intercom - Product Usage Anomaly Detection

**Company/Context:** Intercom (2021). The CS team built an anomaly detection system that flagged unusual changes in product usage patterns, even when absolute usage levels appeared healthy.

**What They Did:**
- For each account, built a "usage baseline" from the trailing 90-day average of key metrics: daily active users, messages sent, bot conversations completed, articles viewed, custom bot builds.
- Anomaly detection flagged accounts where any key metric deviated by more than 2 standard deviations from baseline for 5+ consecutive days.
- Positive anomalies (usage spikes) triggered expansion opportunity alerts.
- Negative anomalies (usage drops) triggered risk investigation alerts.
- Contextual enrichment: cross-referenced anomalies with known events (product outage, customer reorg, holiday calendar).

**Metrics Used:** Usage deviation from baseline (z-score), anomaly duration, anomaly type (positive/negative), anomaly cause classification, post-anomaly outcome (expansion, renewal, churn).

**What Worked:** The system caught a pattern invisible to threshold-based monitoring: "healthy accounts that go quiet." An account with 200 DAU that suddenly dropped to 150 DAU (still above the "at-risk" threshold of 100) was flagged by anomaly detection. Investigation revealed a competitor POC was underway. Early intervention saved the account.

**What Failed:** Holiday periods generated massive false positive volumes (usage drops during Christmas, Thanksgiving). Adding a holiday calendar filter and comparing to "same period last year" eliminated 80% of seasonal false positives.

**Lessons:** Anomaly detection catches risks that threshold-based systems miss. Account-specific baselines are more meaningful than universal thresholds. Always filter for known events (holidays, outages) to reduce false positives.

**Application to Data Squad:** Implement account-specific anomaly detection alongside threshold-based health scores. Flag accounts that deviate from their own baseline, not just accounts below a universal threshold.

---

## 4. HubSpot - Multi-Channel Disengagement Cascade

**Company/Context:** HubSpot (2021). The CS team discovered that churn rarely happened in one dimension -- it cascaded across multiple engagement channels in a predictable sequence.

**What They Did:**
- Tracked engagement across 5 channels: product login, support portal, community forum, email open rate (from CS communications), and CSM meeting attendance.
- Discovered a "disengagement cascade" pattern: typical sequence was community forum dropout (first, -90 days), then email open rate decline (-60 days), then support portal decline (-45 days), then CSM meeting skips (-30 days), then product login decline (-15 days).
- Built a cascade score: number of channels showing disengagement out of 5. Score of 3+ triggered a "full disengagement" alert.
- Plotted the typical cascade timeline to optimize intervention timing.

**Metrics Used:** Per-channel engagement trend, cascade score (channels disengaged out of 5), cascade sequence timing, intervention success rate by cascade stage, optimal intervention point.

**What Worked:** The cascade model revealed that community forum dropout was the earliest signal (90 days before churn), but CSMs had never monitored it. Adding community engagement to the early warning system extended the intervention window by 45 days compared to the previous system (which only monitored product login and CSM meetings).

**What Failed:** Not all channels were relevant for all segments. SMB customers rarely used community forums or attended CSM meetings, making those signals unavailable. Building segment-specific cascade models (Enterprise: all 5 channels; SMB: 3 channels) improved accuracy.

**Lessons:** Churn is a cascade across multiple engagement dimensions, not a single-metric failure. The earliest signal is often in peripheral channels (community, email) that CS teams don't monitor. Build cascade models to detect multi-channel disengagement.

**Application to Data Squad:** Build multi-channel disengagement cascade models for clients. Identify the earliest-signal channel (often peripheral) and add it to monitoring. Train CSMs that the peripheral channels are the leading indicators.
