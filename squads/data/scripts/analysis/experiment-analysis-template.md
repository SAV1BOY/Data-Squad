# experiment-analysis-template

## Purpose

Provides a standardized analysis pipeline for A/B experiments. Computes sample sizes, conversion rates, confidence intervals, effect sizes, p-values, and guardrail metric checks. Ensures every experiment is evaluated with consistent statistical rigor and documented in a reproducible format.

## When to Run

- **Triggered**: When an experiment reaches its planned end date or target sample size.
- **Scheduled**: Daily check at 10:00 UTC for experiments that have reached maturity.
- **Ad-hoc**: For interim checks (clearly labeled as peeking, with adjusted significance thresholds).

## Inputs

| Input | Source | Description |
|---|---|---|
| `analytics.experiment_assignments` | Data warehouse | User-to-variant assignments with timestamp |
| `analytics.raw_events` | Data warehouse | User events for metric computation |
| `config/experiment-registry.yaml` | Config repo | Experiment definitions: variants, primary metric, guardrails, MDE, target duration |
| Parameters | CLI args | experiment_id, analysis_type (final/interim) |

### Experiment Registry Entry Example

```yaml
- experiment_id: "exp_2026_03_checkout_v2"
  hypothesis: "Simplified checkout increases purchase conversion"
  variants: ["control", "treatment"]
  traffic_split: [0.5, 0.5]
  primary_metric: "purchase_conversion_rate"
  secondary_metrics: ["avg_order_value", "cart_abandonment_rate"]
  guardrail_metrics: ["page_load_time_p95", "error_rate"]
  minimum_detectable_effect: 0.02  # 2 percentage points
  significance_level: 0.05
  power: 0.80
  target_sample_per_variant: 12500
  start_date: "2026-02-15"
  planned_end_date: "2026-03-08"
```

## Process

### Step 1: Validate experiment data

```sql
-- Check assignment integrity
SELECT
    variant,
    COUNT(DISTINCT user_id) AS users,
    MIN(assigned_at) AS first_assignment,
    MAX(assigned_at) AS last_assignment
FROM analytics.experiment_assignments
WHERE experiment_id = :experiment_id
GROUP BY variant;
```

```python
# Verify traffic split is within tolerance (chi-squared test)
expected_ratio = config["traffic_split"]
observed_counts = [variant_data[v]["users"] for v in config["variants"]]
chi2, p_value = scipy.stats.chisquare(observed_counts,
                                       f_exp=[sum(observed_counts) * r for r in expected_ratio])
if p_value < 0.001:
    warnings.append("Traffic split significantly deviates from expected. Possible assignment bug.")
```

### Step 2: Compute primary metric per variant

```sql
-- For conversion rate metric
WITH user_metrics AS (
    SELECT
        a.user_id,
        a.variant,
        MAX(CASE WHEN e.event_name = 'purchase_completed'
                  AND e.event_timestamp > a.assigned_at
                  AND e.event_timestamp < DATEADD('day', 14, a.assigned_at)
             THEN 1 ELSE 0 END) AS converted
    FROM analytics.experiment_assignments a
    LEFT JOIN analytics.raw_events e ON a.user_id = e.user_id
    WHERE a.experiment_id = :experiment_id
    GROUP BY a.user_id, a.variant
)
SELECT
    variant,
    COUNT(*) AS sample_size,
    SUM(converted) AS conversions,
    AVG(converted) AS conversion_rate
FROM user_metrics
GROUP BY variant;
```

### Step 3: Statistical significance testing

For proportions (conversion rates), use a two-proportion z-test.

```python
# Two-proportion z-test
n_c, x_c = control.sample_size, control.conversions  # control
n_t, x_t = treatment.sample_size, treatment.conversions  # treatment

p_c = x_c / n_c  # control conversion rate
p_t = x_t / n_t  # treatment conversion rate
p_pooled = (x_c + x_t) / (n_c + n_t)

# Standard error
se = math.sqrt(p_pooled * (1 - p_pooled) * (1/n_c + 1/n_t))

# Z-statistic
z_stat = (p_t - p_c) / se

# Two-tailed p-value
p_value = 2 * (1 - scipy.stats.norm.cdf(abs(z_stat)))

# 95% confidence interval for the difference
se_diff = math.sqrt(p_c * (1 - p_c) / n_c + p_t * (1 - p_t) / n_t)
ci_lower = (p_t - p_c) - 1.96 * se_diff
ci_upper = (p_t - p_c) + 1.96 * se_diff
```

For continuous metrics (e.g., revenue), use Welch's t-test:

```python
t_stat, p_value = scipy.stats.ttest_ind(treatment_values, control_values, equal_var=False)
effect_size_cohens_d = (mean_t - mean_c) / math.sqrt((std_t**2 + std_c**2) / 2)
```

### Step 4: Effect size and practical significance

```python
absolute_effect = p_t - p_c
relative_effect = (p_t - p_c) / p_c  # relative lift

is_statistically_significant = p_value < config["significance_level"]
is_practically_significant = abs(absolute_effect) >= config["minimum_detectable_effect"]

result_classification = "not_significant"
if is_statistically_significant and is_practically_significant:
    result_classification = "significant_and_meaningful"
elif is_statistically_significant:
    result_classification = "significant_but_small"
elif is_practically_significant:
    result_classification = "underpowered"
```

### Step 5: Power analysis and sample size check

```python
# Verify actual power achieved
from statsmodels.stats.power import NormalIndPower
power_analysis = NormalIndPower()
actual_power = power_analysis.solve_power(
    effect_size=absolute_effect / math.sqrt(p_pooled * (1 - p_pooled)),
    nobs1=n_c,
    ratio=n_t / n_c,
    alpha=config["significance_level"]
)

required_sample = power_analysis.solve_power(
    effect_size=config["minimum_detectable_effect"] / math.sqrt(p_pooled * (1 - p_pooled)),
    power=config["power"],
    ratio=1.0,
    alpha=config["significance_level"]
)

if n_c < required_sample:
    warnings.append(f"Underpowered: needed {required_sample} per variant, got {n_c}/{n_t}")
```

### Step 6: Guardrail metric checks

```sql
-- Example: check page load time p95 per variant
SELECT
    a.variant,
    PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY e.event_properties:load_time_ms::FLOAT) AS p95_load_time
FROM analytics.experiment_assignments a
JOIN analytics.raw_events e ON a.user_id = e.user_id AND e.event_name = 'page_loaded'
WHERE a.experiment_id = :experiment_id
  AND e.event_timestamp > a.assigned_at
GROUP BY a.variant;
```

```python
for guardrail in config["guardrail_metrics"]:
    control_val = guardrail_results["control"][guardrail]
    treatment_val = guardrail_results["treatment"][guardrail]
    pct_change = (treatment_val - control_val) / control_val

    if abs(pct_change) > 0.05:  # 5% degradation threshold
        guardrail_flags.append({
            "metric": guardrail,
            "control": control_val,
            "treatment": treatment_val,
            "pct_change": pct_change,
            "status": "FAILED"
        })
```

### Step 7: Compile results and persist

```python
experiment_result = {
    "experiment_id": config["experiment_id"],
    "analysis_date": today,
    "analysis_type": "final",  # or "interim"
    "primary_metric": config["primary_metric"],
    "control_rate": p_c,
    "treatment_rate": p_t,
    "absolute_effect": absolute_effect,
    "relative_lift": relative_effect,
    "p_value": p_value,
    "ci_lower": ci_lower,
    "ci_upper": ci_upper,
    "classification": result_classification,
    "actual_power": actual_power,
    "guardrail_results": guardrail_flags,
    "recommendation": generate_recommendation(result_classification, guardrail_flags),
    "warnings": warnings
}

insert_result("analytics.experiment_results", experiment_result)
```

## Outputs

| Output | Destination | Description |
|---|---|---|
| `analytics.experiment_results` | Data warehouse | Full analysis results per experiment |
| `analytics.experiment_guardrails` | Data warehouse | Guardrail metric check details |
| Experiment report | Generated markdown / Notion page | Human-readable summary with charts |
| Alert | `alert-dispatcher` | If guardrails fail on a running experiment |

## Error Handling

| Error | Action |
|---|---|
| Experiment ID not found in registry | Abort with clear error listing valid experiment IDs |
| Zero users in a variant | Abort, flag as critical assignment failure, alert eng team |
| Sample size below 100 per variant | Warn that results are unreliable, label analysis as "preliminary" |
| Multiple assignments for same user | Deduplicate to first assignment, log count of re-assignments |
| Interim analysis (peeking) | Apply Bonferroni or alpha-spending correction, label clearly as interim |
| Guardrail metric data missing | Log warning, skip that guardrail, note in report |

## Schedule / Trigger

- **Cron**: `0 10 * * *` (daily check for mature experiments)
- **Manual**: `python run_script.py experiment-analysis --experiment exp_2026_03_checkout_v2 --type final`
