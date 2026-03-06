# Few: Dashboard Design Principles Framework

## Overview

Stephen Few's work, particularly "Information Dashboard Design" (2006, revised 2013) and "Show Me the Numbers" (2004, revised 2012), translates the theoretical principles of data visualization into practical dashboard design guidance. While Tufte provides the philosophical foundation, Few provides the implementation manual. His central thesis is that dashboards fail not because of technology limitations but because of design ignorance -- specifically, the failure to apply perceptual science to data presentation.

For data squads, Few's principles are the operational standard for dashboard quality. Every dashboard the team builds or reviews should pass Few's design criteria. Poorly designed dashboards do not just look bad; they cause misinterpretation, waste time, and erode trust in the data team.

## Origin

Stephen Few is a data visualization consultant and educator who founded Perceptual Edge. His work draws heavily on the perceptual psychology research of Colin Ware ("Information Visualization: Perception for Design") and the visualization principles of William Cleveland and Edward Tufte. Few's unique contribution is translating academic perception research into actionable design guidelines for business intelligence practitioners.

Few was motivated by frustration with the dashboard industry, which he saw prioritizing flashy visual effects over effective communication. His writing is direct, opinionated, and focused on practical improvement rather than theoretical elegance.

## Key Concepts

### A Dashboard Defined

Few defines a dashboard as "a visual display of the most important information needed to achieve one or more objectives, consolidated and arranged on a single screen so the information can be monitored at a glance." Key elements of this definition:

- **Single screen** -- No scrolling. If it requires scrolling, it is a report, not a dashboard.
- **At a glance** -- The viewer should grasp the state of affairs within seconds, not minutes.
- **Most important** -- Ruthless prioritization. A dashboard with 50 metrics is not a dashboard; it is a data dump.
- **Objectives** -- Every dashboard serves a defined purpose. "General awareness" is not specific enough.

### Preattentive Visual Attributes

The human visual system processes certain attributes before conscious attention engages. Few identifies the preattentive attributes most useful for dashboards:

- **Color hue** -- Red vs. green vs. blue. Use sparingly and consistently (red = problem, green = healthy, gray = neutral).
- **Color intensity** -- Light vs. dark. Useful for encoding magnitude within a single hue.
- **Size** -- Larger elements draw attention first. Use for emphasis, not decoration.
- **Position** -- Top-left gets viewed first (in left-to-right reading cultures). Place the most important metric there.
- **Orientation** -- Tilted or angled elements stand out. Useful for sparkline trend indicators.

### Alert Mechanisms

Dashboards should alert the viewer to items needing attention without requiring active scanning. Few recommends:

- Bullet graphs instead of gauges (more information-dense, less chartjunk)
- Conditional formatting with meaningful thresholds
- Exception-based highlighting (only color items that are outside normal range)
- Avoid traffic light overload (when everything is red/yellow/green, nothing stands out)

### Bullet Graphs

Few invented the bullet graph as a replacement for gauges and meters. A bullet graph shows a single quantitative measure (a bar), compares it against a target (a reference line), and displays qualitative ranges (background bands for poor/satisfactory/good). It communicates five data points in the space of a single bar. Data squads should prefer bullet graphs over gauges, speedometers, and thermometer charts.

### Information Density and Focus

Few advocates for high information density achieved through thoughtful design:

- Replace each gauge with a bullet graph (5x the information in less space)
- Use sparklines in tables to add trend context
- Remove all non-data elements (logos, decorative borders, 3D effects, unnecessary legends)
- Group related metrics visually using proximity, not borders

### Context Is Everything

A number without context is meaningless. Every metric on a dashboard should include at least one of:
- Comparison to a prior period (trend)
- Comparison to a target or benchmark
- Comparison to a forecast
- Historical range (minimum, maximum, typical)

Without context, viewers cannot distinguish "normal" from "alarming."

### Appropriate Chart Types

Few is prescriptive about chart type selection:

- **Bar charts** for comparing values across categories. Horizontal when labels are long. Sorted by value unless the categories have a natural order.
- **Line charts** for tracking values over time. Only when the x-axis is temporal and there are enough points to show a trend.
- **Tables** when precise values matter more than shapes. Enhanced with conditional formatting and sparklines.
- **Scatter plots** for exploring relationships between two variables.
- **Avoid**: pie charts (humans cannot compare angles accurately), 3D charts of any kind, area charts when overlapping, donut charts, radar charts.

### Dashboard Types

Few distinguishes three dashboard types:

1. **Strategic dashboards** -- For executives. Monthly or quarterly. Focus on high-level KPIs, trends, and goal progress.
2. **Analytical dashboards** -- For analysts. Support exploration with filters, drill-down, and comparisons. More complex, higher information density.
3. **Operational dashboards** -- For frontline managers. Real-time or near-real-time. Focus on current state and exceptions.

Each type has different design requirements. An operational dashboard needs immediacy; a strategic dashboard needs context and trend.

## Application to Data Squad

### Dashboard Design Review Process

Institute a design review for all new dashboards before they go live. Use Few's principles as the review criteria: single screen, clear purpose, appropriate chart types, context for every metric, no chartjunk. Reject dashboards that violate these criteria rather than shipping and hoping for the best.

### Template Library

Build a library of approved dashboard templates for common use cases (product health, marketing performance, executive review). Templates should embed Few's principles by default: correct chart types, bullet graphs, sparklines, and proper layout.

### Metric Limit Enforcement

Enforce a limit of 7-12 metrics per dashboard. When stakeholders request more, help them prioritize or create linked dashboards with drill-through. The discipline of prioritization is itself valuable.

### Bullet Graph Adoption

Replace all gauge and meter widgets with bullet graphs across the organization's dashboards. This is a quick win that dramatically improves information density and accuracy.

### Training for Self-Service Users

When enabling self-service dashboarding, provide training materials based on Few's principles. Without training, self-service users will default to pie charts, 3D effects, and 50-metric dashboards. Prevention is easier than remediation.

### Anti-Pattern Gallery

Maintain an internal gallery of dashboard anti-patterns (anonymized) with explanations of why they fail and how to fix them. This is more educational than abstract guidelines because people learn from concrete examples.

## Pitfalls

### Design Perfectionism

Pursuing a perfect dashboard can delay delivery indefinitely. Ship a good dashboard that follows core principles and iterate. The goal is effective communication, not an art portfolio.

### One-Size-Fits-All

Different audiences need different dashboards. An executive and an analyst should not share the same view. Design for the specific audience and their decision-making context.

### Interactivity as Crutch

"Just add a filter" is not a design strategy. Interactivity should enhance a well-designed static view, not compensate for poor default design. The default view should communicate the essential story without any clicks.

### Ignoring Mobile and Large-Screen Contexts

Few's single-screen principle was defined for desktop monitors. Modern dashboards are viewed on phones, tablets, and wall-mounted displays. Adapt the layout for each context while preserving the principles.

### Data Freshness Disconnect

A beautifully designed dashboard showing stale data is worse than no dashboard. Always display the data freshness timestamp prominently. If the data is more than a threshold age, display a warning.

## Cross-References

- **tufte-data-visualization-principles.md** -- Tufte provides the theoretical foundation that Few operationalizes
- **visualization-layer.md** -- The operational layer where Few's dashboard design principles are applied
- **data-literacy-program-framework.md** -- Dashboard literacy training based on Few's principles
- **kahneman-noise-framework.md** -- Poor dashboard design introduces noise in data interpretation
- **governance-layer.md** -- Dashboard standards and review processes as governance activities
- **decision-layer.md** -- Dashboards exist to support decisions; design should flow from decision needs
