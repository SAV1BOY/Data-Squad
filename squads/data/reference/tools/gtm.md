# Google Tag Manager (GTM) Reference

## Overview

Google Tag Manager is a tag management system that lets you deploy and manage tracking tags (analytics, advertising, remarketing) on your website or mobile app without modifying code. It acts as a middleware layer between your site and your analytics/marketing tools.

## Core Concepts

### Container

A container holds all your tags, triggers, and variables for a given platform. Types:

| Container Type | Usage |
|---------------|-------|
| Web | Standard websites |
| AMP | Accelerated Mobile Pages |
| iOS | Native iOS apps |
| Android | Native Android apps |
| Server | Server-side tagging |

One container per platform per environment. Use separate containers for production and staging. Never share a container between unrelated sites.

### Tags

A tag is a snippet of code that sends data to a third-party service.

| Tag Type | Purpose | Examples |
|----------|---------|---------|
| GA4 Configuration | Initialize GA4 on every page | Set measurement ID, default parameters |
| GA4 Event | Send custom events to GA4 | `add_to_cart`, `submit_form`, `view_product` |
| Google Ads Conversion | Track ad conversions | Purchase, lead form submission |
| Google Ads Remarketing | Build audience lists | Page viewers, cart abandoners |
| Facebook Pixel | Meta ads tracking | PageView, Purchase, Lead |
| Custom HTML | Any custom script | Hotjar, Intercom, custom scripts |
| Custom Image | Pixel-based tracking | Simple conversion pixels |

### Triggers

Triggers define when a tag fires. Every tag needs at least one trigger.

| Trigger Type | Fires When | Use Case |
|-------------|-----------|----------|
| Page View | Page loads (DOM ready, Window loaded) | Analytics pageview tags |
| Click - All Elements | Any element is clicked | Generic click tracking |
| Click - Just Links | A link is clicked | Outbound link tracking |
| Form Submission | A form is submitted | Lead capture, search events |
| Scroll Depth | User scrolls to a threshold | Engagement tracking |
| Element Visibility | An element appears in viewport | Banner impression tracking |
| Custom Event | A `dataLayer.push` fires | Any custom interaction |
| Timer | After a time interval | Time-on-page tracking |
| History Change | URL fragment changes (SPA) | SPA pageview tracking |

### Variables

Variables provide dynamic values to tags and triggers.

**Built-in variables:**
- `Page URL`, `Page Hostname`, `Page Path`
- `Click Element`, `Click Classes`, `Click ID`, `Click URL`, `Click Text`
- `Form Element`, `Form Classes`, `Form ID`
- `Referrer`, `Event` (dataLayer event name)

**User-defined variables:**
- **Data Layer Variable:** Reads values from the `dataLayer`. Most important variable type.
- **JavaScript Variable:** Reads a global JS variable.
- **Custom JavaScript:** Runs a JS function and returns a value.
- **Lookup Table:** Maps input values to output values.
- **RegEx Table:** Pattern matching for value transformation.
- **Constant:** Fixed value (measurement IDs, API keys).
- **Google Analytics Settings:** Shared GA configuration.

## Data Layer

The data layer is the foundation of good GTM implementation. It is a JavaScript array that acts as a message bus between your site and GTM.

### Implementation

```javascript
// Initialize before the GTM container script
window.dataLayer = window.dataLayer || [];

// Push events and data
dataLayer.push({
  'event': 'add_to_cart',
  'product_id': 'SKU-001',
  'product_name': 'Pro Plan',
  'product_price': 99.99,
  'currency': 'BRL'
});
```

### Best Practices

1. **Always use the data layer** instead of scraping the DOM. DOM scraping is fragile and breaks when the UI changes.
2. Push a **page_data** event on every page with standard page properties.
3. Push a **user_data** event after authentication with user properties (plan, role, tenure).
4. Use consistent key names aligned with your event naming standard.
5. Do not push PII to the data layer without considering privacy implications.

### E-commerce Data Layer

Follow Google's recommended e-commerce schema:

```javascript
dataLayer.push({
  'event': 'purchase',
  'ecommerce': {
    'transaction_id': 'TXN-12345',
    'value': 199.98,
    'currency': 'BRL',
    'items': [
      {
        'item_id': 'SKU-001',
        'item_name': 'Pro Plan',
        'price': 99.99,
        'quantity': 2
      }
    ]
  }
});
```

## Consent Mode Integration

### Setup

1. Configure your CMP (Consent Management Platform) to push consent state to the data layer.
2. Use GTM's built-in consent features or Consent Mode tags.
3. Set default consent state (denied for EU/BR users).
4. Update consent state when the user interacts with the banner.

### Blocking Tags Based on Consent

- Use GTM's built-in consent settings on each tag.
- OR use trigger exceptions: create a trigger that fires when consent is denied, and add it as an exception to marketing tags.
- Consent categories: `analytics_storage`, `ad_storage`, `ad_user_data`, `ad_personalization`.

## Debugging

### Preview Mode

GTM's Preview mode (Tag Assistant) is the primary debugging tool:

1. Click "Preview" in the GTM workspace.
2. Enter your site URL.
3. A debug panel opens showing:
   - Which tags fired (and which did not).
   - Which triggers activated.
   - What data was in the data layer at each event.
   - What values variables resolved to.
4. Click on each event in the timeline to see the state at that moment.

### Common Debugging Steps

1. **Tag did not fire:** Check the trigger. Look at the trigger conditions and verify the data layer values match.
2. **Tag fired but data is wrong:** Check the variables. Preview mode shows what each variable resolved to.
3. **Tag fires twice:** Check for duplicate triggers or duplicate `dataLayer.push` calls.
4. **SPA navigation not tracked:** Ensure History Change trigger is configured and your router pushes to the data layer.

### Browser Console

```javascript
// View current data layer state
console.log(window.dataLayer);

// Monitor pushes in real-time
(function() {
  var original = window.dataLayer.push;
  window.dataLayer.push = function() {
    console.log('dataLayer push:', arguments);
    return original.apply(this, arguments);
  };
})();
```

## Server-Side GTM

### Why Server-Side

- **Privacy:** First-party data collection. Cookies are set by your domain, not third-party domains.
- **Performance:** Heavy scripts run on the server, not the user's browser.
- **Control:** You decide what data reaches third parties.
- **Ad blockers:** Server-side tags are not blocked by browser ad blockers.

### Architecture

1. Web container sends events to a server container (hosted on your domain).
2. Server container processes events and forwards to destinations (GA4, Facebook CAPI, etc.).
3. Server container runs on Google Cloud Run, Cloud Functions, or any compatible hosting.

### Cost

- Server-side GTM is not free. You pay for the hosting infrastructure.
- Estimate: $50-200/month for moderate traffic using Google Cloud.
- Worth it for: high-traffic sites, strict privacy requirements, or heavy reliance on conversion data.

## Workspace and Version Management

### Workspaces

- Use separate workspaces for different team members or projects.
- Each workspace is an independent draft.
- Merge conflicts can occur if two workspaces modify the same tag.

### Versioning

- Every publish creates a new version.
- Always add a description when publishing: what changed and why.
- You can roll back to any previous version instantly.
- Use the version history as an audit log.

### Environments

- **Live:** Production container served to all users.
- **Latest:** Most recent published version (usually same as Live).
- **Custom environments:** Create staging or QA environments with their own container snippets.

## Organizational Best Practices

1. **Naming convention for tags:** `[Tool] - [Action] - [Detail]`. Example: `GA4 - Event - add_to_cart`, `Meta - Pixel - Purchase`.
2. **Naming convention for triggers:** `[Type] - [Condition]`. Example: `Custom Event - purchase`, `Click - CTA Button`.
3. **Folder organization:** Group tags, triggers, and variables by tool or by feature.
4. **Limit Custom HTML tags.** They are a security risk and a performance liability. Prefer built-in tag templates.
5. **Audit third-party tags quarterly.** Remove tags for tools you no longer use.
6. **Restrict container access.** Only approved team members should have publish rights.

## Common Pitfalls

1. **Not using the data layer.** Scraping the DOM is brittle and error-prone.
2. **Firing all tags on all pages.** Use specific triggers to avoid unnecessary data collection and performance impact.
3. **Not testing after publish.** Always verify in production after publishing a new version.
4. **Tag soup.** Adding tags without removing old ones. Audit regularly.
5. **Ignoring page load impact.** Each tag adds weight. Measure the performance impact of your container.
