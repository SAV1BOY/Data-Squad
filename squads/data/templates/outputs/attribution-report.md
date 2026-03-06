# Attribution Analysis Report

> Use this template to document and communicate marketing attribution analysis.
> Attribution connects marketing spend to business outcomes across channels and touchpoints.

---

## 1. Report Overview

**Report Title:** [Descriptive name]
**Analyst:** [Name, Team]
**Date:** [YYYY-MM-DD]
**Period Analyzed:** [e.g., "Q4 2025 (Oct-Dec)"]
**Attribution Model(s) Used:** [e.g., "Last-touch, first-touch, linear, data-driven"]

_Example:_
**Report Title:** Q4 2025 Marketing Attribution Analysis - Channel Performance and Budget Recommendations
**Analyst:** Tom Lee, Marketing Analytics
**Date:** 2026-03-06
**Period Analyzed:** Q4 2025 (Oct 1 - Dec 31, 2025)
**Attribution Model(s) Used:** Last-touch (primary), first-touch, linear (for comparison)

---

## 2. Methodology [REQUIRED]

**Conversion Event:** [What counts as a conversion, e.g., "Paid subscription start"]
**Lookback Window:** [e.g., "30-day click, 7-day view"]
**Identity Resolution:** [e.g., "User ID match, then cookie fallback"]
**Touchpoint Sources:** [List all tracked touchpoints]
**Model Description:** [Brief explanation of attribution logic]

_Example:_
**Conversion Event:** First paid subscription start (trial-to-paid or direct purchase)
**Lookback Window:** 30-day click attribution, 7-day view-through for display
**Identity Resolution:** Deterministic user ID match (logged-in), cookie-based for anonymous
**Touchpoint Sources:** Paid search, paid social, organic search, direct, email, referral, content, events
**Model Description:** Last-touch assigns 100% credit to the final touchpoint before conversion. Linear distributes credit equally across all touchpoints in the path. First-touch assigns 100% to the first known touchpoint.

---

## 3. Channel Performance Summary [REQUIRED]

### By Last-Touch Attribution

| Channel          | Spend       | Conversions | CPA        | Revenue Attributed | ROAS   | % of Total Conv |
|------------------|-------------|-------------|------------|-------------------|--------|-----------------|
| [Channel 1]      | [$]         | [#]         | [$]        | [$]                | [x.x]  | [%]             |
| [Channel 2]      | [$]         | [#]         | [$]        | [$]                | [x.x]  | [%]             |
| **Total**        | **[$]**     | **[#]**     | **[$]**    | **[$]**            | **[x]**| **100%**        |

_Example:_

| Channel          | Spend     | Conv. | CPA    | Revenue     | ROAS | % Conv |
|------------------|-----------|-------|--------|-------------|------|--------|
| Paid search      | $82,000   | 620   | $132   | $285,000    | 3.5x | 28%    |
| Organic search   | $0*       | 540   | $0*    | $248,000    | --   | 24%    |
| Paid social      | $65,000   | 310   | $210   | $118,000    | 1.8x | 14%    |
| Email            | $8,000    | 280   | $29    | $156,000    | 19.5x| 13%    |
| Referral         | $12,000   | 220   | $55    | $142,000    | 11.8x| 10%    |
| Direct           | $0*       | 180   | $0*    | $82,000     | --   | 8%     |
| Content/SEO      | $15,000   | 70    | $214   | $31,000     | 2.1x | 3%     |
| **Total**        | **$182k** |**2,220**|**$82**| **$1,062k** |**5.8x**|**100%**|

*Organic, direct, and referral have content/team costs not captured in channel spend.

---

## 4. Model Comparison

How does attribution differ across models? Large differences indicate long or complex buyer journeys.

| Channel          | Last-Touch % | First-Touch % | Linear % | Data-Driven % | Variance |
|------------------|-------------|---------------|----------|---------------|----------|
| [Channel 1]      | [%]         | [%]           | [%]      | [%]           | [Low/Med/High]|
| [Channel 2]      | [%]         | [%]           | [%]      | [%]           | [Low/Med/High]|

_Example:_

| Channel          | Last-Touch | First-Touch | Linear  | Variance |
|------------------|-----------|-------------|---------|----------|
| Paid search      | 28%       | 32%         | 30%     | Low      |
| Organic search   | 24%       | 28%         | 26%     | Low      |
| Paid social      | 14%       | 22%         | 18%     | High     |
| Email            | 13%       | 5%          | 9%      | High     |
| Referral         | 10%       | 6%          | 8%      | Medium   |
| Content/SEO      | 3%        | 7%          | 5%      | Medium   |

**Key Insight:** [What does the model comparison tell you?]

_Example:_
**Key Insight:** Paid social gets significantly more first-touch credit (22%) than last-touch (14%), suggesting it plays an awareness/introduction role rather than a closing role. Email shows the opposite pattern - strong closer (13% last-touch) but rarely introduces (5% first-touch). This confirms email nurture is critical for converting awareness into action.

---

## 5. Path Analysis

**Average Touchpoints Per Conversion:** [e.g., "3.4 touchpoints"]
**Average Days to Convert:** [e.g., "18 days from first touch"]

### Most Common Conversion Paths

| Rank | Path                                              | Conversions | % of Total |
|------|----------------------------------------------------|-------------|-----------|
| 1    | [e.g., "Paid Search -> Direct -> Paid Search"]   | [#]         | [%]       |
| 2    | [e.g., "Organic -> Email -> Direct"]              | [#]         | [%]       |
| 3    | [e.g., "Paid Social -> Organic -> Email -> Direct"]| [#]        | [%]       |

_Example:_

| Rank | Path                                        | Conv. | %    |
|------|---------------------------------------------|-------|------|
| 1    | Paid Search -> Direct                       | 280   | 12.6%|
| 2    | Organic -> Direct                           | 210   | 9.5% |
| 3    | Paid Social -> Email -> Direct              | 165   | 7.4% |
| 4    | Organic -> Email -> Direct                  | 140   | 6.3% |
| 5    | Referral -> Direct                          | 120   | 5.4% |

---

## 6. Key Findings [REQUIRED]

**Finding 1:** [Title]
[Description with supporting data]

**Finding 2:** [Title]
[Description with supporting data]

**Finding 3:** [Title]
[Description with supporting data]

_Example:_

**Finding 1: Email is the most efficient paid channel by ROAS (19.5x)**
Despite low spend ($8K), email drives 13% of conversions with the highest ROAS. Incremental email investment likely has significant upside before diminishing returns.

**Finding 2: Paid social is an awareness channel, not a converter**
Paid social CPA ($210) is 59% higher than paid search ($132). However, paid social appears in 22% of conversion paths as a first touch, suggesting it plays an introduction role that last-touch attribution undervalues.

**Finding 3: Referral delivers the highest-quality conversions**
Referral conversions have 38% higher average MRR and 52% higher 6-month retention than the channel average, making the true CLV-adjusted ROAS significantly higher than the 11.8x surface figure.

---

## 7. Budget Recommendations

| Channel       | Current Spend | Recommended Spend | Change   | Rationale                           |
|---------------|--------------|-------------------|----------|--------------------------------------|
| [Channel]     | [$]          | [$]               | [+/- %]  | [Rationale]                          |

_Example:_

| Channel       | Current  | Recommended | Change  | Rationale                                |
|---------------|----------|-------------|---------|------------------------------------------|
| Email         | $8,000   | $15,000     | +88%    | Highest ROAS; room to scale              |
| Referral      | $12,000  | $20,000     | +67%    | Best LTV; invest in referral incentives  |
| Paid search   | $82,000  | $85,000     | +4%     | Strong performer; modest increase        |
| Paid social   | $65,000  | $50,000     | -23%    | Lower CPA targets or reduce volume       |
| Content/SEO   | $15,000  | $15,000     | 0%      | Long-term play; maintain investment      |

---

## 8. Limitations and Caveats

- [e.g., "Cross-device tracking gaps may undercount multi-device paths (~15% of users)"]
- [e.g., "View-through attribution on display may overcount impact"]
- [e.g., "Offline touchpoints (events, word-of-mouth) are not captured"]
- [e.g., "Attribution window of 30 days misses longer B2B sales cycles"]

---

## 9. Next Steps

- [ ] [e.g., "Present recommendations to marketing leadership (Mar 12)"]
- [ ] [e.g., "Implement budget shifts for Q2 planning"]
- [ ] [e.g., "Set up incrementality test for paid social"]
- [ ] [e.g., "Evaluate data-driven attribution model for Q2 analysis"]

---

## Appendix

**Data Sources:** [Tools and tables used]
**Query / Notebook:** [Link]
**Dashboard:** [Link to attribution dashboard]
