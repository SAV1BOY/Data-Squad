# Cross-Squad Data Delivery Workflow

## Purpose
Handle data requests from other squads with a structured process that ensures clear scoping, reliable delivery, proper validation, and feedback incorporation. Prevent ad-hoc requests from derailing squad priorities.

## Trigger
- Another squad submits a formal data request
- Cross-functional initiative requires data support
- Stakeholder needs a one-time analysis or recurring data feed
- Escalation from a self-service attempt that exceeded the requester's capability

## Agents Involved
- **data-chief**: Scopes the request, designs the data solution, and delivers
- **avinash-kaushik**: Validates the delivered data
- **wes-kao**: Ensures delivery is understandable and actionable
- **data-chief**: Reviews for strategic alignment and priority conflicts

## Steps

### Phase 1: Request Intake (Day 1)
1. **data-chief** receives the request through the standard intake form: requester, squad, question to answer, decision to make, deadline, and data requirements.
2. **data-chief** classifies the request: Quick Query (< 2 hours), Standard Analysis (2-5 days), Complex Project (> 5 days), or Recurring Data Feed.
3. **data-chief** reviews the request against current squad priorities to determine if it can be accommodated within the current cycle.
4. **data-chief** acknowledges receipt and provides an estimated delivery date within 1 business day.

### Phase 2: Scope Definition (Days 2-3)
5. **data-chief** meets with the requester to clarify the question, understand the decision context, and agree on deliverable format.
6. **data-chief** documents the scope: specific questions, metrics involved, time ranges, segments, filters, and output format.
7. **data-chief** identifies data sources, assesses feasibility, and flags any data quality concerns.
8. **data-chief** and requester agree on the final scope and delivery timeline in writing.

### Phase 3: Delivery (Duration varies by classification)
9. **data-chief** executes the analysis or builds the data pipeline according to the agreed scope.
10. **data-chief** documents methodology: queries, transformations, assumptions, and limitations.
11. **wes-kao** reviews the deliverable for clarity: are the results interpretable by the requesting squad without Data Squad context?
12. **data-chief** packages the deliverable: data, methodology documentation, and interpretation guide.

### Phase 4: Validation (1-2 days)
13. **avinash-kaushik** validates the delivered data: spot checks, cross-references with known benchmarks, and logical consistency.
14. **avinash-kaushik** confirms the output matches the scoped requirements.
15. **data-chief** presents the results to the requester in a walkthrough meeting.
16. **data-chief** addresses any questions and makes minor adjustments if needed.

### Phase 5: Feedback and Close (Within 1 week of delivery)
17. **data-chief** sends a feedback form to the requester: was the delivery useful, timely, and accurate?
18. **wes-kao** collects the feedback and logs it in the delivery registry.
19. **data-chief** identifies if the request reveals a recurring need that should become a self-service dashboard or automated report.
20. **data-chief** closes the request in the tracking system with final status and documentation.

## Inputs
- Formal data request with business context
- Requester availability for scoping meeting
- Data source access and documentation
- Current squad capacity and priorities

## Outputs
- Scoped request document with agreed deliverables and timeline
- Data deliverable with methodology documentation
- Validation report
- Feedback record
- Recommendation for self-service (if applicable)

## Quality Gates

| Gate | Criteria | Owner |
|------|----------|-------|
| G1: Scope Agreed | Written scope document signed off by requester and data-chief | data-chief |
| G2: Priority Cleared | Request fits within current capacity or priority trade-off approved | data-chief |
| G3: Data Validated | Deliverable passes spot checks and logical consistency review | avinash-kaushik |
| G4: Requester Satisfied | Walkthrough completed, requester confirms deliverable answers their question | data-chief |
| G5: Feedback Collected | Post-delivery feedback received and logged within 1 week | wes-kao |

## Registry Updates
- **Delivery Registry**: Log request ID, requester, squad, classification, scope, delivery date, and feedback score.
- **Self-Service Backlog**: Add recurring request patterns as candidates for self-service tooling.
- **Capacity Log**: Track hours spent on cross-squad requests for capacity planning.
- **Knowledge Base**: Document reusable queries or analyses that may serve future requests.

## SLA by Classification
| Type | Acknowledgment | Delivery | Feedback |
|------|---------------|----------|----------|
| Quick Query | Same day | 1-2 days | 3 days |
| Standard Analysis | 1 day | 3-5 days | 1 week |
| Complex Project | 1 day | 1-3 weeks | 1 week |
| Recurring Data Feed | 1 day | 2-4 weeks setup | Monthly |
