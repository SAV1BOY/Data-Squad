# Task: Migrate Tracking
> Agent(s): avinash-kaushik, data-chief
> Frameworks: instrumentation-layer
> Checklists: tracking-plan-quality, instrumentation/tag-manager-qa
> Templates: outputs/tracking-spec
> Registry: event-registry

## Objective
Migrate analytics tracking from one platform or implementation to another while preserving
data continuity, minimizing data loss, and ensuring historical comparability.

## Prerequisites
- Source platform and destination platform are both accessible.
- Event taxonomy for the destination is defined.
- Stakeholder alignment on migration timeline and acceptable data gaps.
- Sufficient engineering capacity allocated for dual-tracking period.

## Steps
1. **Inventory source tracking** -- Export the complete event catalog from the source
   platform: event names, properties, volumes, and any custom configurations.
2. **Map source to destination** -- Create a mapping table: source event name -> destination
   event name, source property -> destination property. Flag events that will be renamed,
   merged, split, or deprecated.
3. **Identify schema changes** -- Document all differences in event structure, property
   types, naming conventions, and global properties between source and destination.
4. **Plan dual-tracking period** -- Define the overlap period where both source and
   destination receive events simultaneously. Minimum recommended: 2 weeks. Set start
   and end dates.
5. **Implement destination tracking** -- Add the destination analytics SDK and implement
   all mapped events following the destination taxonomy. Do NOT remove source tracking yet.
6. **Validate parity** -- During the dual-tracking period, compare event volumes between
   source and destination daily. Acceptable variance: < 5%.
   Create a parity dashboard showing side-by-side volumes.
7. **Validate property accuracy** -- Spot-check property values for 10% of events. Verify
   types, enums, and edge cases match expectations.
8. **Migrate dashboards** -- Recreate or reconfigure dashboards and reports to use the
   destination data source. Keep source dashboards available as reference.
9. **Migrate alerts** -- Recreate alerting rules on the destination platform. Verify
   alert thresholds are calibrated for the new data.
10. **Update metric definitions** -- Update the metric registry with new data source
    references. Document the cutover date for historical queries.
11. **Cutover** -- After parity is confirmed, remove source tracking code. Document the
    exact cutover timestamp.
12. **Post-migration validation** -- Monitor destination data for 2 weeks post-cutover.
    Check for volume drops, property issues, or missing events.
13. **Archive source data** -- Ensure historical data from the source platform is exported
    and archived for future reference.

## Deliverable
- Source-to-destination mapping document.
- Parity validation report with daily volume comparisons.
- Updated dashboards and alerts on destination platform.
- Updated metric registry entries.
- Post-migration validation report.
- Archived source data confirmation.

## Quality Gate
- [ ] 100% of active source events are mapped to destination.
- [ ] Dual-tracking period is minimum 2 weeks.
- [ ] Event volume parity is within 5% during overlap.
- [ ] Property spot-checks pass with < 1% error rate.
- [ ] All dashboards are recreated on destination.
- [ ] All alerts are migrated and calibrated.
- [ ] Metric registry is updated with new data sources.
- [ ] Historical source data is archived.

## Registry Update
- Update `event-registry` with new platform references and migration date.
- Update `metric-registry` data source fields for all affected metrics.
- Add migration record to `task-log` with cutover date and parity report link.
