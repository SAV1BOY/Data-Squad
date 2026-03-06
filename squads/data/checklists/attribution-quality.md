# Attribution Quality Checklist

## Purpose

This checklist ensures that marketing and product attribution analyses are
transparent about their methodology, honest about their limitations, and
produce decisions that are better than guessing. Attribution is one of the
most abused areas of analytics — every channel wants credit, every model has
blind spots, and overconfidence in attribution leads to massive misallocation
of spend. Use this before making any budget decision based on attribution data.

## When to Use

- Before reallocating marketing budget based on attribution data
- When selecting or changing an attribution model
- During quarterly marketing performance reviews
- When onboarding a new attribution vendor or tool
- Before presenting channel ROI to leadership

---

## Checklist Items

### 1. Attribution Model Is Documented and Understood by Stakeholders
- **Pass:** The model type (last-touch, first-touch, linear, time-decay, data-driven, MMM) is explicitly documented, and stakeholders understand what it does and does not measure.
- **Fail:** Attribution numbers are presented without explaining the model, or stakeholders believe the numbers represent "truth" rather than a model's estimate.

### 2. Attribution Window Is Defined and Justified
- **Pass:** The lookback window (e.g., 7-day click, 1-day view, 30-day click) is explicitly stated, justified for the product's purchase cycle, and consistent across channels.
- **Fail:** Default platform windows are used without examination, or different windows are used for different channels without adjustment.

### 3. Cross-Device and Cross-Channel Gaps Are Acknowledged
- **Pass:** Known blind spots (cross-device journeys, walled gardens, dark social, offline touchpoints) are documented with estimated impact.
- **Fail:** Attribution is presented as complete when significant touchpoints are unmeasured.

### 4. Self-Reported Attribution Is Collected as a Complement
- **Pass:** "How did you hear about us?" or post-purchase surveys are used to triangulate model-based attribution and catch channels models miss.
- **Fail:** Only model-based attribution is used, or self-reported data is collected but never compared to model outputs.

### 5. Incrementality Testing Is Conducted for Major Channels
- **Pass:** At least the top spending channels have been tested for incrementality (holdout tests, geo-experiments, PSA tests) to validate attributed conversions.
- **Fail:** All attributed conversions are assumed to be incremental, with no holdout or lift testing.

### 6. Attribution Does Not Double-Count Conversions
- **Pass:** Total attributed conversions across all channels sum to actual total conversions (or the over-count factor is known and documented).
- **Fail:** Each channel claims credit for the same conversion, and the sum of channel-attributed conversions far exceeds actual conversions.

### 7. Sanity Checks Are Performed Against Business Reality
- **Pass:** Attribution outputs are cross-checked against known business events (e.g., if a channel was paused, attributed conversions should drop; if a campaign launched, the source should appear).
- **Fail:** Attribution numbers are taken at face value without reality checks.

### 8. Model Limitations Are Included in Every Report
- **Pass:** Every attribution report includes a "Limitations" section noting what the model cannot capture and where confidence is low.
- **Fail:** Attribution data is presented with the same confidence level as directly measured metrics like revenue.

### 9. View-Through Attribution Is Handled Conservatively
- **Pass:** View-through conversions are reported separately from click-through, with a clear discount factor or are excluded from primary reporting.
- **Fail:** View-through conversions are weighted equally with click-through, inflating display and video channel performance.

### 10. Attribution Informs But Does Not Dictate Budget Decisions
- **Pass:** Attribution is one input into budget decisions alongside incrementality tests, MMM, qualitative insights, and strategic priorities.
- **Fail:** Budget is mechanically allocated based solely on attributed ROAS, without considering model limitations or strategic factors.

---

## Cross-References

- **LTV/CLV Model Quality Checklist** (`ltv-clv-model-quality.md`) — Channel-level CLV depends on attribution accuracy.
- **Experiment Design Quality Checklist** (`experiment-design-quality.md`) — Incrementality tests are experiments; use proper design.
- **Framing Effects in Reports** (`reference/psychology/framing-effects-in-reports.md`) — How attribution data presentation influences budget decisions.
- **Authority Bias in Dashboards** (`reference/psychology/authority-bias-in-dashboards.md`) — When leadership preferences override attribution evidence.
- **Agency Data Playbook** (`reference/industries/agency-data-playbook.md`) — Agency-specific attribution challenges and practices.

---

*Version: 1.0 | Last updated: 2026-03-06*
