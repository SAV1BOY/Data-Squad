# Information Dashboard Design - Stephen Few (2006)

## Book Info

- **Title:** Information Dashboard Design: The Effective Visual Communication of Data
- **Author:** Stephen Few
- **Publisher:** Analytics Press
- **Year:** 2006 (2nd edition 2013)
- **ISBN:** 978-0596100162
- **Pages:** 223
- **Context:** Stephen Few is an independent consultant, educator, and author who has spent decades studying and teaching data visualization. He is known for his uncompromising stance against chart junk, poor design practices, and the dashboard industry's tendency to prioritize visual appeal over analytical clarity. This book is the definitive guide to dashboard design done right.

## Core Thesis

Most dashboards fail because they are designed to look impressive rather than to communicate information effectively. A well-designed dashboard is a visual display of the most important information needed to achieve one or more objectives, consolidated and arranged on a single screen so the information can be monitored at a glance. Effective dashboards require understanding how human visual perception works and designing with that understanding, not against it. The goal is not beauty but clarity.

## Key Concepts

### 1. Definition of a Dashboard
A visual display of the most important information needed to achieve one or more objectives, consolidated and arranged on a single screen so the information can be monitored at a glance. Key elements of this definition: "most important" (not all information), "single screen" (no scrolling), and "at a glance" (visual processing, not reading).

### 2. Dashboard Types by Purpose
Three types based on the role they serve: (a) **Strategic** -- provide an at-a-glance view of organizational health for executives; updated periodically (daily, weekly). (b) **Analytical** -- support data exploration and root-cause investigation; require interactivity and drill-down. (c) **Operational** -- monitor real-time or near-real-time processes; require alerts and thresholds. Each type has different design requirements.

### 3. Preattentive Visual Attributes
Certain visual properties are processed preattentively -- the brain perceives them instantly without conscious effort. These include: length (bar charts), position (scatter plots), color hue, color intensity, size, and orientation. Effective dashboards leverage preattentive attributes to highlight the most important information. Poor dashboards use these attributes decoratively rather than informationally.

### 4. Data-Ink Ratio
Borrowed from Tufte and championed by Few: maximize the proportion of a chart's ink (or pixels) that represents data. Remove chartjunk: 3D effects, unnecessary grid lines, decorative elements, shadows, gradient fills, and meaningless icons. Every pixel should serve the data or aid comprehension; everything else is noise.

### 5. Appropriate Chart Selection
The most common dashboard design error is using the wrong chart type. Bar charts for comparison, line charts for trends over time, bullet charts for performance against targets, sparklines for compact trend context, and heat maps for pattern detection across two dimensions. Pie charts are almost always inferior to bar charts. Gauges and dials waste space and add no analytical value.

### 6. Bullet Charts
Few's signature contribution to visualization: a compact alternative to gauges and dials. A bullet chart combines: a quantitative measure (bar), a comparative measure (reference line for target), and qualitative ranges (background shading for poor/satisfactory/good). It communicates performance, target, and context in minimal space.

### 7. Context and Comparison
A number without context is meaningless. Every metric on a dashboard needs comparison: to a target, to a prior period, to a peer, or to a range. "Revenue is $1.2M" tells you nothing. "Revenue is $1.2M vs. $1.0M target, up 15% YoY" tells you something. Few insists that dashboards without context are not dashboards; they are data dumps.

### 8. Alert-Based Design
For operational dashboards, design should draw attention to exceptions -- items that require action. Use color (red/yellow/green but sparingly), conditional formatting, and spatial arrangement to ensure that the eye is naturally drawn to problems. The dashboard should answer "what needs my attention right now?" without requiring the viewer to search.

## Application to Data Squad

- **Dashboard design standards:** Adopt Few's principles as the Data Squad standard for all client dashboard deliverables. No chartjunk, no pie charts, no gauges, no 3D effects.
- **Bullet chart adoption:** Use bullet charts as the standard for any KPI-vs-target display. They communicate more information in less space than any alternative.
- **Context requirement:** Every metric on every Data Squad dashboard must include at least one form of context: target, prior period comparison, or benchmark.
- **Dashboard type selection:** At the start of every dashboard engagement, classify the dashboard type (strategic, analytical, operational) and design accordingly.
- **Preattentive attribute audit:** Review existing client dashboards for misuse of color, size, and position. Redesign to ensure preattentive attributes carry information rather than decoration.
- **Single-screen discipline:** Challenge every dashboard to fit on a single screen. If it cannot, it is either trying to serve too many audiences or includes too many metrics.

## Key Quotes

> "A dashboard is not a work of art. It is a work of communication. If it looks impressive but fails to inform, it has failed."

> "The best dashboard is one you can understand in five seconds. If you need to study it, something is wrong with the design."

> "Pie charts are the cockroaches of data visualization. They are everywhere, they are hard to kill, and they serve almost no useful purpose."

> "Every metric needs context. A number without comparison is a number without meaning."

> "Gauges and dials on dashboards exist because someone thought a dashboard should look like a car dashboard. It should not."

## Cross-References

- **few-now-you-see-it.md** - Few's companion book on visual data analysis and exploration, covering the analytical process rather than the display design.
- **tufte-visual-display.md** - Tufte's seminal work provides the theoretical foundation for the data-ink ratio and chartjunk principles Few operationalizes.
- **kaushik-web-analytics-2-0.md** - Few's design principles apply directly to the dashboards Kaushik advocates for presenting the "critical few" metrics.
- **kao-articles-index.md** - Kao's BLUF communication principle is the verbal equivalent of Few's "at a glance" dashboard design.
- **fader-customer-base-audit.md** - The five-lens audit requires well-designed visualizations to communicate complex customer dynamics clearly.
- **cagan-empowered.md** - Product team dashboards need Few's design discipline to enable outcome-based management.
