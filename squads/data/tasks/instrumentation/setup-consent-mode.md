# Task: Setup Consent Mode
> Agent(s): Data Engineer, Frontend Engineer, Legal/Privacy Lead
> Frameworks: GDPR Compliance Framework, Consent Management Standard
> Checklists: privacy-compliance-checklist, consent-implementation-checklist
> Template: consent-configuration-template
> Registry: event-registry, compliance-registry

## Objective
Implement a consent management system that controls analytics tracking based on user consent
preferences, ensuring compliance with privacy regulations (GDPR, CCPA, ePrivacy) while
preserving maximum data utility.

## Prerequisites
- Legal review of applicable privacy regulations is complete.
- Consent Management Platform (CMP) is selected or built.
- Analytics SDK supports consent-based initialization.
- Cookie/tracking inventory exists or will be built in this task.

## Steps
1. **Audit current tracking** -- Inventory all tracking technologies in use: analytics SDKs,
   advertising pixels, session recording tools, error tracking. Classify each by data type
   collected and legal basis required.
2. **Define consent categories** -- Establish consent buckets:
   - Strictly necessary (no consent required).
   - Analytics/performance (requires consent in EU).
   - Marketing/advertising (requires consent).
   - Personalization (requires consent).
3. **Map tracking to categories** -- Assign each tracking technology and event to a consent
   category. Document the mapping.
4. **Configure CMP** -- Set up the Consent Management Platform with:
   - Banner text approved by legal.
   - Granular consent options per category.
   - Geo-based rules (e.g., opt-in for EU, opt-out for US).
   - Consent storage and retrieval mechanism.
5. **Implement consent gates** -- Modify the analytics initialization and event firing code:
   - Check consent status before initializing SDKs.
   - Gate each tracking call behind the appropriate consent category.
   - Handle consent changes mid-session (grant, revoke).
6. **Implement consent mode for Google** -- If using Google Analytics/Ads, configure Google
   Consent Mode v2 with default and updated consent states.
7. **Handle server-side tracking** -- If server-side tracking exists, propagate consent
   status to the server and enforce gates there as well.
8. **Build consent status tracking** -- Track consent rates themselves as a metric:
   consent grant rate, decline rate, and partial consent patterns.
9. **Test thoroughly** -- Validate that:
   - No tracking fires before consent is granted.
   - Tracking starts after consent is granted.
   - Revoking consent stops tracking immediately.
   - Page reload preserves consent state.
   - Different geo rules work correctly.
10. **Document for the team** -- Write developer guidelines on how to add new tracking
    that respects the consent system.
11. **Legal review** -- Have legal/privacy team review the implementation and sign off.
12. **Monitor post-launch** -- Set up alerts for consent rate drops and tracking anomalies.

## Deliverable
- Configured CMP with approved banner and geo-rules.
- Consent-gated tracking implementation across all platforms.
- Consent category mapping document.
- Developer guidelines for consent-aware tracking.
- Legal sign-off document.
- Consent rate dashboard.

## Quality Gate
- [ ] No tracking fires without appropriate consent.
- [ ] Consent revocation stops tracking within the same session.
- [ ] Geo-based rules are correctly applied (opt-in vs. opt-out).
- [ ] Consent state persists across page reloads and sessions.
- [ ] Google Consent Mode v2 is correctly configured (if applicable).
- [ ] Legal/privacy team has signed off on the implementation.
- [ ] Consent rates are tracked and dashboarded.
- [ ] Developer guidelines are documented and distributed.

## Registry Update
- Add consent categories to `compliance-registry`.
- Update `event-registry` with `consent_category` field for each event.
- Log task completion in `task-log` with legal sign-off reference.
