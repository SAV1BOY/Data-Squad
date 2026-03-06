# Power BI Reference

## Overview

Power BI is Microsoft's business intelligence platform. It includes Power BI Desktop (authoring tool), Power BI Service (cloud publishing and collaboration), and Power BI Mobile. It is deeply integrated with the Microsoft ecosystem (Azure, Excel, Teams, SharePoint) and is the dominant BI tool in enterprise environments.

## Core Components

| Component | Purpose | Cost |
|-----------|---------|------|
| Power BI Desktop | Author reports and data models | Free (Windows only) |
| Power BI Service | Publish, share, collaborate, schedule refresh | Pro or Premium license |
| Power BI Mobile | View reports on mobile devices | Included with Pro/Premium |
| Power BI Embedded | Embed reports in applications | Capacity-based pricing |
| Power BI Report Server | On-premise report hosting | Premium license |

## Data Connectivity

### Import vs. DirectQuery vs. Live Connection

| Mode | How It Works | Best For |
|------|-------------|----------|
| **Import** | Data copied into Power BI's in-memory engine (VertiPaq) | Fast performance, small-medium datasets |
| **DirectQuery** | Queries run against the source database at report time | Large datasets, real-time data |
| **Live Connection** | Connects to Analysis Services or Power BI datasets | Enterprise semantic models |
| **Composite** | Mix of Import and DirectQuery in one model | Flexibility, performance tuning |

**Recommendation:** Use Import mode whenever possible. VertiPaq compression is excellent and query performance is much better than DirectQuery. Only use DirectQuery when data volume exceeds memory or real-time data is required.

### Common Data Sources

- SQL Server, PostgreSQL, MySQL
- Azure SQL, Synapse, Databricks
- BigQuery, Snowflake, Redshift
- Excel, CSV, SharePoint lists
- REST APIs (via Web connector or custom connectors)
- Dataflows (Power BI's built-in ETL)

## DAX (Data Analysis Expressions)

DAX is the formula language for calculated columns, measures, and tables in Power BI.

### Key Concepts

- **Measures:** Dynamic calculations that evaluate at query time based on context. Use measures for KPIs and aggregations.
- **Calculated columns:** Static calculations computed during data refresh. Use sparingly; prefer measures.
- **Filter context:** The set of filters active at the time a measure is evaluated. Understanding filter context is essential.
- **Row context:** The current row during iteration. Created by calculated columns and iterator functions.

### Essential DAX Patterns

**Basic aggregation:**
```dax
Total Revenue = SUM(Orders[Revenue])
Order Count = COUNTROWS(Orders)
Avg Order Value = DIVIDE([Total Revenue], [Order Count])
```

**Time intelligence (requires a proper date table):**
```dax
Revenue YTD = TOTALYTD([Total Revenue], Calendar[Date])
Revenue MTD = TOTALMTD([Total Revenue], Calendar[Date])
Revenue LY = CALCULATE([Total Revenue], SAMEPERIODLASTYEAR(Calendar[Date]))
Revenue YoY % = DIVIDE([Total Revenue] - [Revenue LY], [Revenue LY])
```

**Filtering:**
```dax
Active Users = CALCULATE(
    DISTINCTCOUNT(Events[UserID]),
    Events[EventName] = "active_session"
)

New User Revenue = CALCULATE(
    [Total Revenue],
    Users[IsNew] = TRUE()
)
```

**Ranking:**
```dax
Product Rank = RANKX(
    ALL(Products[ProductName]),
    [Total Revenue],
    ,
    DESC
)
```

### DAX Best Practices

1. **Always use measures instead of calculated columns** for aggregations.
2. **Create a proper date table** using `CALENDAR()` or `CALENDARAUTO()`. Mark it as a date table.
3. **Use `DIVIDE()` instead of `/`** to handle division by zero gracefully.
4. **Avoid using `FILTER()` inside `CALCULATE()` when a simple predicate works.** `CALCULATE([X], Table[Col] = "Value")` is more efficient than `CALCULATE([X], FILTER(Table, Table[Col] = "Value"))`.
5. **Use variables** to improve readability and performance:
   ```dax
   Margin % =
   VAR Revenue = [Total Revenue]
   VAR Cost = [Total Cost]
   RETURN DIVIDE(Revenue - Cost, Revenue)
   ```

## Data Modeling

### Star Schema

Power BI works best with a star schema:

- **Fact tables:** Events, transactions, orders (many rows, numeric measures).
- **Dimension tables:** Users, products, dates, geographies (descriptive attributes).
- **Relationships:** One-to-many from dimension to fact.

### Relationships

- Define relationships in the Model view.
- Use single-direction filtering by default. Bi-directional filtering is needed rarely and can cause performance issues.
- Avoid circular dependencies.
- Every fact table should relate to the date dimension.

### Row-Level Security (RLS)

Define DAX rules that filter data based on the logged-in user:

```dax
[Region] = LOOKUPVALUE(UserRegions[Region], UserRegions[Email], USERPRINCIPALNAME())
```

- Test RLS using "View as role" in Desktop.
- RLS is enforced in the Service and Embedded scenarios.

## Visualizations

### Built-in Visuals

| Visual | Use Case |
|--------|----------|
| Card / KPI | Single number with comparison |
| Line chart | Trends over time |
| Bar/column chart | Category comparisons |
| Table / Matrix | Detailed data with drill-down |
| Scatter plot | Two-variable relationship |
| Map | Geographic data |
| Treemap | Hierarchical proportions |
| Waterfall | Cumulative effect of values |
| Decomposition tree | Multi-dimensional drill-down |

### Custom Visuals

- Import from AppSource (Microsoft's marketplace).
- Use certified visuals when possible (reviewed by Microsoft).
- Custom visuals can have security implications; review before deploying.

### Visualization Best Practices

1. Follow the dashboard design standard for layout, colors, and formatting.
2. Use conditional formatting on tables and matrices for quick visual scanning.
3. Use bookmarks for guided navigation within a report.
4. Limit cross-highlighting; it can confuse users. Use drill-through instead.
5. Set default interactions between visuals (filter vs. highlight vs. none).

## Publishing and Governance

### Workspaces

- Organize reports by team or domain.
- Each workspace has its own access control.
- Use a "Development" workspace for drafts and a "Production" workspace for published reports.

### Apps

- Package dashboards and reports from a workspace into an App.
- Apps provide a curated, read-only experience for consumers.
- Update the app when new reports are ready.

### Deployment Pipelines

- Available in Premium. Promote reports through Development, Test, and Production stages.
- Reduces the risk of publishing broken reports.

### Dataflows

- Power BI's built-in ETL (based on Power Query).
- Define data transformations that run on a schedule.
- Shared across multiple reports.
- Useful for small-scale data prep. For complex transformations, use dbt + warehouse.

### Refresh Schedules

- Import mode requires scheduled refresh (up to 8 per day on Pro, 48 on Premium).
- DirectQuery reports always show current data but hit the source database.
- Monitor refresh failures in the Service and set up alerts.

## Performance Optimization

1. **Use Import mode** and optimize the data model in the warehouse.
2. **Remove unused columns** from the model. Every column increases memory.
3. **Avoid high-cardinality columns** in visuals (e.g., do not put a column with millions of unique values in a slicer).
4. **Use aggregation tables** for large datasets. Power BI can automatically route queries to aggregated tables.
5. **Optimize DAX measures.** Use DAX Studio and Performance Analyzer to identify slow measures.
6. **Limit the number of visuals per page** to 8-10. Each visual generates queries.

## Common Pitfalls

1. **Not creating a date table.** Time intelligence functions require a contiguous date table.
2. **Using calculated columns for everything.** Measures are more flexible and performant.
3. **Bi-directional relationships everywhere.** They cause unexpected filtering behavior and performance issues.
4. **Publishing to the default workspace.** Set up proper workspaces before the team starts publishing.
5. **Ignoring refresh failures.** Stale data without a warning is worse than no data.
6. **Building Power BI reports on top of raw data.** Use a warehouse and dbt for transformations. Power BI should be the visualization layer, not the transformation layer.
