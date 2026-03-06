# Analytics Audit Quality Checklist
> Gate type: Pre-delivery
> Owner: Kaushik
> Applies to: Analytics audit deliverables (site/app/product analytics reviews)

## Purpose
An analytics audit is only valuable if it surfaces real gaps, validates existing instrumentation, and produces a prioritised action list that the team can execute against. This gate ensures the audit is thorough, evidence-based, and ends with clear next steps rather than a vague list of observations.

## Checklist Items

1. - [ ] **Scope definition** -- Confirm the audit scope (platforms, properties, date range) is explicitly stated.
   - Pass criteria: A single paragraph or table lists every property, environment, and date window under review.
   - Fail signal: Scope is implied or only partially described; reader must guess what was included.
   - Action if fail: Add a scope section before any findings are presented.

2. - [ ] **Tag inventory completeness** -- Verify every tag manager container has been exported and catalogued.
   - Pass criteria: Container export JSON or screenshot attached; tag count matches live container.
   - Fail signal: Tag counts are approximated or containers are missing.
   - Action if fail: Re-export containers and reconcile counts with live environment.

3. - [ ] **Firing-rule validation** -- Each tag's trigger rules have been tested in at least one real session.
   - Pass criteria: Debug/preview evidence (screenshots or log) for every trigger.
   - Fail signal: Tags listed without confirmation they actually fire.
   - Action if fail: Run debug sessions and attach evidence per tag.

4. - [ ] **Event coverage map** -- A matrix maps every key user action to an analytics event.
   - Pass criteria: Matrix rows = user actions from sitemap/user-flow; columns = event name + status (tracked / missing / broken).
   - Fail signal: Coverage described in prose without systematic mapping.
   - Action if fail: Build the matrix from the product's user-flow documentation.

5. - [ ] **Funnel integrity** -- Each critical funnel has been reconstructed from raw event data and compared to any pre-built reports.
   - Pass criteria: Funnel step counts from raw query match dashboard report within 5%.
   - Fail signal: Discrepancies exceed 5% or funnels were not independently verified.
   - Action if fail: Investigate discrepancies, document root cause (filters, sampling, deduplication).

6. - [ ] **Data freshness and latency** -- Document the lag between event occurrence and availability in the reporting tool.
   - Pass criteria: Latency measured for each data source; acceptable threshold stated and compared.
   - Fail signal: Latency not measured or assumed to be real-time without evidence.
   - Action if fail: Timestamp a test event and measure when it appears in the reporting tool.

7. - [ ] **PII and consent compliance** -- Confirm no personally identifiable information leaks into analytics payloads without consent.
   - Pass criteria: Network-level inspection shows no PII in event payloads; consent-mode behaviour verified.
   - Fail signal: Email, phone, or other PII visible in payloads; consent mode not tested.
   - Action if fail: Flag as critical, file remediation ticket, and note in audit findings.

8. - [ ] **Gap prioritisation** -- Every identified gap is ranked by business impact and implementation effort.
   - Pass criteria: A priority matrix (impact vs. effort) with each gap plotted and labeled.
   - Fail signal: Gaps listed without prioritisation or with subjective labels only (e.g., "important").
   - Action if fail: Score each gap on a 1-5 scale for impact and effort; re-sort the list.

9. - [ ] **Duplicate and redundant tracking** -- Identify events or tags that fire multiple times for the same action.
   - Pass criteria: Duplicates catalogued with root cause (double-tagging, SPA re-render, etc.) and recommended fix.
   - Fail signal: No mention of duplication analysis.
   - Action if fail: Run a frequency analysis on event logs and flag events with suspiciously high counts.

10. - [ ] **UTM and campaign parameter audit** -- Validate that campaign parameters are consistently structured and captured.
    - Pass criteria: Sample of 20+ landing-page URLs checked; UTM taxonomy documented; breakage rate reported.
    - Fail signal: UTM audit not performed or sample size too small.
    - Action if fail: Pull top 50 campaign landing pages and validate parameter presence and naming.

11. - [ ] **Cross-domain and cross-device tracking** -- Confirm linker configuration and user-ID stitching where applicable.
    - Pass criteria: Test journey across domains/devices shows single user session in reports.
    - Fail signal: Cross-domain journeys split into separate sessions; no test performed.
    - Action if fail: Configure and test cross-domain linker; document user-ID join logic.

12. - [ ] **Actionable recommendations** -- Each finding has a concrete recommendation, owner, and estimated timeline.
    - Pass criteria: Recommendations table with columns: finding, recommendation, owner, effort, target date.
    - Fail signal: Findings end with observations but no next steps.
    - Action if fail: Convert every finding into an actionable recommendation row.

## Cross-References
- [Tracking Plan Quality Checklist](tracking-plan-quality.md)
- [Event Taxonomy Quality Checklist](event-taxonomy-quality.md)
- [Attribution Quality Checklist](attribution-quality.md)
- [Dashboard Quality Checklist](dashboard-quality.md)
