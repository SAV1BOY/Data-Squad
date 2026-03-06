# SQL Style Guide

Consistent SQL formatting improves readability, reviewability, and maintainability. These conventions apply to all SQL written by the data team.

---

## Naming Conventions

### Tables and Views

| Type          | Convention           | Example                    |
|---------------|---------------------|----------------------------|
| Staging       | `stg_{source}_{entity}` | `stg_stripe_payments`   |
| Intermediate  | `int_{entity}_{desc}`   | `int_users_with_orders` |
| Mart          | `mart_{entity}`         | `mart_order_summary`    |
| Metric        | `mtr_{metric_name}`     | `mtr_daily_active_users`|

### Columns

- Use `snake_case` for all column names.
- Boolean columns: prefix with `is_`, `has_`, or `was_`. Example: `is_active`, `has_subscription`.
- Date columns: suffix with `_date` or `_at`. Example: `created_date`, `updated_at`.
- ID columns: suffix with `_id`. Example: `user_id`, `order_id`.
- Count columns: prefix with `count_` or suffix with `_count`. Example: `order_count`.
- Amount columns: suffix with `_amount` and include currency context. Example: `revenue_amount_usd`.

### Aliases

- Table aliases: use meaningful abbreviations, not single letters. `users AS u` is acceptable; `some_very_long_table_name AS t1` is not — use `svltn` or a descriptive abbreviation.
- Column aliases: use `AS` explicitly. Never rely on positional aliases.

---

## Formatting Rules

### Keywords

- Write SQL keywords in uppercase: `SELECT`, `FROM`, `WHERE`, `JOIN`, `GROUP BY`, `ORDER BY`.
- Write function names in lowercase: `count()`, `sum()`, `coalesce()`.

### Indentation

- Use 2 spaces for indentation (no tabs).
- Each major clause starts on a new line at the base indentation level.
- Column lists are indented one level under `SELECT`.

### Example

```sql
SELECT
  u.user_id,
  u.signup_date,
  COUNT(DISTINCT o.order_id) AS order_count,
  SUM(o.revenue_amount_usd) AS total_revenue_usd,
  MIN(o.order_date) AS first_order_date,
  MAX(o.order_date) AS last_order_date
FROM mart_users AS u
LEFT JOIN mart_orders AS o
  ON u.user_id = o.user_id
  AND o.order_status = 'completed'
WHERE u.signup_date >= '2026-01-01'
  AND u.is_internal = FALSE
GROUP BY
  u.user_id,
  u.signup_date
HAVING COUNT(DISTINCT o.order_id) >= 1
ORDER BY total_revenue_usd DESC
LIMIT 100;
```

---

## CTEs (Common Table Expressions)

### When to Use CTEs

- Use CTEs to break complex queries into named, readable steps.
- Each CTE should do one thing and have a descriptive name.
- Prefer CTEs over subqueries for readability.
- Prefer CTEs over temporary tables unless performance requires materialization.

### CTE Formatting

```sql
WITH daily_signups AS (
  -- Count new signups per day
  SELECT
    signup_date,
    COUNT(DISTINCT user_id) AS new_users
  FROM mart_users
  WHERE signup_date >= '2026-01-01'
  GROUP BY signup_date
),

daily_activations AS (
  -- Count users who completed activation on their signup day
  SELECT
    activation_date,
    COUNT(DISTINCT user_id) AS activated_users
  FROM mart_activations
  WHERE activation_date >= '2026-01-01'
  GROUP BY activation_date
)

SELECT
  s.signup_date,
  s.new_users,
  COALESCE(a.activated_users, 0) AS activated_users,
  ROUND(100.0 * COALESCE(a.activated_users, 0) / NULLIF(s.new_users, 0), 1) AS activation_rate_pct
FROM daily_signups AS s
LEFT JOIN daily_activations AS a
  ON s.signup_date = a.activation_date
ORDER BY s.signup_date;
```

### CTE Rules

- Separate CTEs with a blank line and a comma after the closing parenthesis.
- Name CTEs as nouns describing what they contain, not verbs: `daily_signups` not `get_signups`.
- Add a comment at the top of each CTE explaining its purpose.

---

## Joins

### Join Formatting

```sql
FROM table_a AS a
INNER JOIN table_b AS b
  ON a.key = b.key
  AND b.status = 'active'
LEFT JOIN table_c AS c
  ON a.key = c.key
```

### Join Rules

- Always specify the join type explicitly (`INNER JOIN`, `LEFT JOIN`, `CROSS JOIN`). Never use implicit joins (`FROM a, b WHERE a.key = b.key`).
- Put the join condition on the next line, indented with `ON`.
- Additional join conditions use `AND` on subsequent indented lines.
- Prefer `LEFT JOIN` over `RIGHT JOIN` for readability (restructure the query if needed).
- When joining to a subquery, extract it as a CTE instead.

---

## Comments

### When to Comment

- At the top of every query: what it produces and who it is for.
- At the top of each CTE: what it contains.
- On any non-obvious filter or business logic.
- On any hardcoded value: why that specific value.

### Comment Format

```sql
-- Single line comment for brief notes

/*
  Multi-line comment for longer explanations.
  Use for query headers and complex logic descriptions.
*/
```

### Comment Anti-Patterns

- Do not comment obvious code: `-- Select user_id` above `SELECT user_id`.
- Do not leave commented-out code in production queries. Delete it; version control has the history.

---

## General Rules

1. **One statement per query file.** If you need multiple statements, use separate files or CTEs.
2. **Trailing commas.** Place commas at the end of lines, not at the beginning. Either convention is acceptable if the team is consistent, but end-of-line is more common.
3. **No SELECT *.** Always list columns explicitly. `SELECT *` breaks when schemas change.
4. **Use COALESCE for nulls.** Make null handling explicit: `COALESCE(revenue, 0)`.
5. **Use NULLIF to prevent division by zero.** `value / NULLIF(denominator, 0)`.
6. **Qualify column names.** When joining multiple tables, always prefix columns with the table alias.
7. **Date handling.** Use ISO 8601 format for date literals: `'2026-01-01'`. Never use ambiguous formats like `'01/02/2026'`.
