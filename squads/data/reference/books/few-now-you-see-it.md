# Now You See It - Stephen Few (2009)

## Book Info

- **Title:** Now You See It: Simple Visualization Techniques for Quantitative Analysis
- **Author:** Stephen Few
- **Publisher:** Analytics Press
- **Year:** 2009
- **ISBN:** 978-0970601988
- **Pages:** 327
- **Context:** Where Information Dashboard Design focused on the display of information for monitoring, Now You See It focuses on the process of visual analysis -- using visualizations to explore data, discover patterns, find anomalies, and build understanding. Few draws on perceptual psychology and practical analytics experience to create a systematic approach to visual data exploration.

## Core Thesis

Visual analysis is the most powerful and most underutilized analytical technique available to data practitioners. The human visual system is extraordinarily good at detecting patterns, trends, outliers, and relationships -- but only when data is presented in ways that leverage how vision actually works. Most analysts underuse visualization because they treat charts as presentation tools (something you make after the analysis) rather than as analytical tools (something you use during the analysis). Visualization should be the primary medium for data exploration, not just the final deliverable.

## Key Concepts

### 1. Visual Analysis as Process
Visual analysis is not a single chart; it is a systematic process: (a) explore the data broadly to get oriented, (b) examine specific patterns and relationships, (c) investigate anomalies and outliers, (d) communicate findings. Most analysts jump to step 4 and miss the discovery that happens in steps 1-3. The process is iterative and often non-linear.

### 2. Time-Series Analysis Techniques
Time is the most common analytical dimension. Few provides techniques for: trend identification (smoothing, moving averages), seasonality detection, anomaly detection against expected patterns, comparing multiple time series, and choosing appropriate time granularity. The key mistake: using a granularity that is too fine (daily when weekly patterns are what matter) or too coarse (annual when quarterly shifts are hidden).

### 3. Distribution Analysis
Understanding the shape of data distributions is fundamental. Histograms, box plots, and strip plots reveal: central tendency, spread, skewness, multimodality, and outliers. Mean and standard deviation are meaningless if the distribution is not approximately normal. Few insists that looking at distributions should precede any summary statistics.

### 4. Correlation and Relationship Analysis
Scatter plots are the primary tool for exploring relationships between variables. Few covers: interpreting scatter plot patterns, using reference lines and regression fits, small multiples for comparing relationships across groups, and the critical distinction between correlation and causation. He warns against the common error of inferring causation from visual correlation.

### 5. Part-to-Whole and Ranking Analysis
Comparing parts of a whole (market share, budget allocation, revenue mix) and ranking items are common analytical tasks. Few advocates stacked bar charts and treemaps over pie charts, and sorted bar charts over unsorted tables. The key principle: the visual encoding must match the analytical question. If the question is "which is biggest?", the chart must make relative size immediately apparent.

### 6. Multivariate Analysis
Exploring relationships among three or more variables simultaneously. Techniques include: scatter plot matrices, small multiples, color-coded scatter plots, parallel coordinates, and trellis displays. The challenge is managing visual complexity without losing the ability to detect patterns. Few provides guidelines for when to use each technique based on the number of variables and the type of relationship being explored.

### 7. Anomaly and Outlier Detection
Outliers are often the most valuable discoveries in data analysis. Visual techniques for finding them: control charts (values outside expected bounds), scatter plots (points far from the cluster), time series with reference bands, and conditional formatting in tables. Few emphasizes that outliers should be investigated, not automatically removed -- they may represent errors, special causes, or important signals.

### 8. The Role of Interaction
Static charts are limited. Interactive visualizations allow: filtering, zooming, drilling, brushing (selecting points in one view and highlighting them in another), and dynamic aggregation. These capabilities transform visualization from a presentation medium into an analytical instrument. Few advocates for interactive tools in the analytical phase even when the final deliverable is a static dashboard.

## Application to Data Squad

- **Visual exploration as methodology:** Train Data Squad analysts to use visualization as their primary exploration tool, not just their presentation medium. Build exploratory charts before summary statistics.
- **Distribution-first analysis:** Before computing averages or running regressions, visualize distributions. This catches data quality issues, multimodality, and outliers that invalidate standard statistical approaches.
- **Time-series best practices:** Establish standards for time-series analysis: appropriate granularity, smoothing methods, seasonality handling, and anomaly detection approaches.
- **Scatter plot discipline:** Use scatter plots as the standard tool for relationship exploration in client data. Pair with correlation statistics but never skip the visual inspection.
- **Small multiples adoption:** Use small multiples (trellis displays) as the standard approach for comparing patterns across segments, cohorts, or categories. They are more analytically honest than overlaid line charts.
- **Anomaly investigation workflow:** Build a standard workflow for outlier investigation: detect visually, verify data quality, investigate root cause, and document findings.

## Key Quotes

> "The greatest value of visualization is not in presenting what you already know. It is in discovering what you did not know you needed to look for."

> "If you are not visualizing your data before analyzing it statistically, you are driving with your eyes closed."

> "The human visual system is the most powerful pattern-detection instrument ever created. Most analysts use it at a fraction of its capacity."

> "An outlier is not a problem to be removed. It is a question to be answered."

> "The right chart for analysis is rarely the right chart for presentation. Analysis requires exploration; presentation requires clarity. Do not confuse the two."

## Cross-References

- **few-information-dashboard-design.md** - The companion book on dashboard design; Now You See It covers the analytical process that feeds dashboard design.
- **tufte-visual-display.md** - Tufte provides the theoretical and aesthetic foundations that Few operationalizes into practical techniques.
- **kaushik-web-analytics-2-0.md** - Visual analysis techniques apply directly to exploring the clickstream, outcomes, and experimentation data Kaushik describes.
- **kahneman-thinking-fast-slow.md** - Understanding how human perception works (System 1 visual processing) explains why visual analysis is so powerful.
- **provost-data-science-business.md** - Visual exploration is a critical step in the CRISP-DM data understanding and preparation phases.
- **fader-customer-base-audit.md** - The five-lens audit produces the kind of multi-dimensional data that benefits most from Few's visual analysis techniques.
