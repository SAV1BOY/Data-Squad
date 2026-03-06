# Experimentation Platforms: Optimizely, Statsig, LaunchDarkly

## Overview

This document covers three major experimentation and feature management platforms. Each has a different focus: Optimizely is the established A/B testing leader, Statsig combines feature flags with warehouse-native analytics, and LaunchDarkly focuses on feature management with experimentation capabilities.

## Optimizely

### What It Is

Optimizely is a mature experimentation platform for web, mobile, and full-stack experiments. It includes a visual editor for no-code web tests and SDKs for server-side experiments.

### Key Features

| Feature | Description |
|---------|-------------|
| Visual Editor | Modify web pages without code. Good for marketing and CRO teams. |
| Full Stack SDKs | Server-side experimentation for product teams. SDKs for all major languages. |
| Feature Flags | Roll out features gradually with targeting rules. |
| Stats Engine | Sequential testing engine that allows valid early decisions. |
| Audiences | Target experiments to specific user segments. |
| Mutual Exclusion | Prevent users from being in conflicting experiments. |
| Multi-Armed Bandits | Automatically allocate traffic to winning variants. |
| Program Management | Manage experimentation programs with collaboration tools. |

### Stats Engine

Optimizely uses a sequential testing methodology:

- Results are always valid, no matter when you check them (no peeking problem).
- False discovery rate control instead of traditional p-value correction.
- Reports both statistical significance and "practical significance" (is the effect big enough to matter?).
- Default significance level: 90% (configurable).

### Implementation

```javascript
// Web SDK
const optimizelyClient = optimizelySdk.createInstance({
  sdkKey: 'YOUR_SDK_KEY'
});

const user = optimizelyClient.createUserContext('user-123', {
  plan: 'pro',
  country: 'BR'
});

const decision = user.decide('checkout_redesign');

if (decision.variationKey === 'variant_a') {
  // Show new checkout
} else {
  // Show control
}

// Track conversion
user.trackEvent('complete_purchase', { revenue: 149.90 });
```

### When to Use Optimizely

- Established experimentation culture with high volume of tests.
- Need for visual editor (marketing/CRO teams).
- Require sophisticated statistical methods (sequential testing, multi-armed bandits).
- Enterprise-grade compliance and support requirements.

### Limitations

- Expensive. Pricing is based on Monthly Tracked Users.
- Visual editor can create "tag soup" if not governed.
- Full Stack requires more engineering effort than feature flag tools.

## Statsig

### What It Is

Statsig is a modern experimentation and feature management platform that integrates with your data warehouse. Founded by former Facebook experimentation team members, it brings Meta's experimentation methodology to external teams.

### Key Features

| Feature | Description |
|---------|-------------|
| Feature Gates | Feature flags with targeting rules. |
| Experiments | A/B tests with built-in statistical analysis. |
| Autotune | Multi-armed bandit optimization. |
| Dynamic Config | Remote configuration without code deploys. |
| Layers | Mutual exclusion for experiments. |
| Warehouse Native | Run analysis on your own warehouse data. |
| Pulse | Automated experiment results with health checks. |
| CUPED | Variance reduction for more sensitive experiments. |
| Holdouts | Long-term impact measurement. |

### Warehouse Native

Statsig's differentiator: it can analyze experiment results using your own data warehouse data.

- Connect to BigQuery, Snowflake, Redshift, or Databricks.
- Statsig reads exposure and metric data from your warehouse.
- No need to duplicate event tracking in Statsig's infrastructure.
- Metrics are computed from warehouse tables, ensuring consistency with your BI dashboards.

### Pulse (Automated Results)

Pulse automatically computes experiment results:

- Shows impact on all configured metrics (not just the ones you defined for the experiment).
- Health checks: sample ratio mismatch (SRM), pre-experiment bias.
- Topline metrics, dimensional breakdowns, and time series.
- CUPED-adjusted results for higher sensitivity.

### Implementation

```javascript
// Initialize
const statsig = require('statsig-node');
await statsig.initialize('server-key');

// Check feature gate
const showNewFeature = statsig.checkGate(
  { userID: 'user-123', custom: { plan: 'pro' } },
  'new_checkout_flow'
);

// Get experiment variant
const experiment = statsig.getExperiment(
  { userID: 'user-123' },
  'checkout_redesign'
);
const variant = experiment.get('variant', 'control');

// Log event
statsig.logEvent(
  { userID: 'user-123' },
  'complete_purchase',
  149.90,
  { currency: 'BRL' }
);
```

### When to Use Statsig

- Want warehouse-native experimentation (metrics from your warehouse, not a separate system).
- Team that values rigorous statistics (CUPED, SRM detection, sequential testing).
- Need both feature flags and experimentation in one platform.
- Prefer a modern, developer-friendly platform over enterprise-legacy tools.

### Limitations

- Younger platform; smaller ecosystem than Optimizely.
- No visual editor for no-code web tests.
- Warehouse Native requires well-structured warehouse data.

## LaunchDarkly

### What It Is

LaunchDarkly is primarily a feature management platform with experimentation capabilities. It excels at feature flags, progressive rollouts, and targeting, with experimentation as an added feature rather than the core focus.

### Key Features

| Feature | Description |
|---------|-------------|
| Feature Flags | Best-in-class feature flag management. |
| Targeting | Complex rules based on user attributes, segments, and percentages. |
| Progressive Rollouts | Gradually increase feature exposure. |
| Kill Switch | Instantly disable a feature in production. |
| Experimentation | A/B testing integrated with feature flags. |
| Approval Workflows | Require approvals before flag changes in production. |
| Audit Log | Complete history of every flag change. |
| Relay Proxy | On-premise proxy for performance and security. |

### Feature Flag Best Practices with LaunchDarkly

1. **Naming convention:** `team-feature-description` (e.g., `checkout-new-payment-flow`).
2. **Temporary vs. permanent flags:** Mark flags as temporary (experiment, rollout) or permanent (kill switch, entitlement). Clean up temporary flags after use.
3. **Default values:** Always define sensible defaults for when LaunchDarkly is unavailable.
4. **Flag lifecycle:** Create, test, roll out, measure, archive. Do not accumulate dead flags.

### Experimentation in LaunchDarkly

```javascript
// Feature flag evaluation (which is also the experiment assignment)
const ldClient = LaunchDarkly.init('sdk-key');

ldClient.on('ready', () => {
  const user = { key: 'user-123', custom: { plan: 'pro' } };
  const variant = ldClient.variation('checkout-experiment', user, 'control');

  if (variant === 'new_checkout') {
    // Show new checkout
  }

  // Track metric
  ldClient.track('purchase_completed', user, { revenue: 149.90 });
});
```

### When to Use LaunchDarkly

- Feature management is the primary need, with experimentation secondary.
- Engineering team wants full control over feature rollouts.
- Need sophisticated targeting and progressive rollout capabilities.
- Require approval workflows and audit trails for compliance.

### Limitations

- Experimentation is less mature than Optimizely or Statsig.
- Statistical methods are basic compared to Statsig's CUPED and sequential testing.
- Expensive for feature flags if you only need simple on/off toggles.

## Comparison

| Aspect | Optimizely | Statsig | LaunchDarkly |
|--------|-----------|---------|-------------|
| Primary strength | Experimentation | Experimentation + warehouse native | Feature management |
| Visual editor | Yes | No | No |
| Sequential testing | Yes (Stats Engine) | Yes | Basic |
| CUPED | No | Yes | No |
| Warehouse native | No (export only) | Yes | No |
| Feature flags | Yes | Yes | Best-in-class |
| SRM detection | Manual | Automatic | No |
| Mutual exclusion | Yes | Yes (Layers) | No |
| Pricing | Expensive | Mid-range | Expensive |
| Target audience | CRO + Product | Product + Data | Engineering |

## Choosing a Platform

- **If experimentation is your primary need and you have a CRO team:** Optimizely.
- **If you want warehouse-native analysis and rigorous statistics:** Statsig.
- **If feature management is primary and experimentation is secondary:** LaunchDarkly.
- **If budget is constrained:** Statsig offers the most experimentation value per dollar. LaunchDarkly and Optimizely are premium-priced.

## General Best Practices

1. **Always check for Sample Ratio Mismatch (SRM).** If the ratio of users in control vs. treatment differs from expected by more than 1%, something is wrong with the randomization.
2. **Use CUPED when available.** It can reduce the required sample size by 50% or more.
3. **Clean up old flags and experiments.** Dead flags are technical debt.
4. **Integrate with your analytics stack.** Send exposure events to your warehouse and product analytics tool.
5. **Define metrics before launching experiments.** Post-hoc metric selection is p-hacking.
6. **Document every experiment** in a central registry, regardless of which platform runs it.
