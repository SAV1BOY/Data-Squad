# UTM Parameter Taxonomy

Standards for UTM parameter usage to ensure consistent, accurate attribution and marketing analysis.

---

## Parameter Definitions

### utm_source (Required)

Identifies the platform or site sending traffic.

| Rule                    | Details                                         |
|-------------------------|-------------------------------------------------|
| Format                  | Lowercase, no spaces, use hyphens for multi-word |
| Represents              | The specific platform, publisher, or partner     |
| Granularity             | One value per traffic source                     |

**Allowed values:**

| Value              | Use When                                  |
|--------------------|-------------------------------------------|
| `google`           | Google Ads, Google organic, Google Shopping|
| `facebook`         | Facebook/Meta Ads                         |
| `instagram`        | Instagram Ads or organic                  |
| `linkedin`         | LinkedIn Ads or organic posts             |
| `twitter`          | Twitter/X Ads or organic                  |
| `youtube`          | YouTube Ads or organic                    |
| `tiktok`           | TikTok Ads or organic                     |
| `bing`             | Bing/Microsoft Ads                        |
| `email`            | Email campaigns (internal)                |
| `newsletter`       | Newsletter sends                          |
| `partner-{name}`   | Partner referrals (e.g., `partner-acme`)  |
| `affiliate-{name}` | Affiliate referrals                       |
| `reddit`           | Reddit Ads or organic                     |
| `direct-mail`      | Physical direct mail campaigns            |
| `podcast-{name}`   | Podcast sponsorships                      |
| `internal`         | In-app or on-site cross-promotion         |

### utm_medium (Required)

Identifies the marketing channel or mechanism.

| Value        | Definition                                          |
|-------------|------------------------------------------------------|
| `cpc`       | Cost per click (paid search)                         |
| `cpm`       | Cost per mille/impression (display)                  |
| `paid-social`| Paid social media campaigns                         |
| `organic-social` | Unpaid social media posts                       |
| `email`     | Email marketing                                      |
| `referral`  | Referral from another website                        |
| `affiliate` | Affiliate marketing links                            |
| `display`   | Display/banner advertising                           |
| `video`     | Video advertising (pre-roll, mid-roll)               |
| `retargeting`| Retargeting/remarketing campaigns                   |
| `sms`       | SMS/text message marketing                           |
| `push`      | Push notification campaigns                          |
| `content`   | Content marketing (blog, guest posts)                |
| `pr`        | Press/media coverage                                 |
| `direct-mail`| Physical mail campaigns                             |
| `event`     | In-person or virtual event                           |

### utm_campaign (Required)

Identifies the specific campaign.

**Format:** `{year}{month}-{initiative}-{descriptor}`

**Examples:**
- `202602-spring-sale-homepage`
- `202601-product-launch-beta`
- `202603-webinar-analytics-101`
- `202602-retarget-cart-abandoners`

**Rules:**
- Always include the year and month prefix for temporal ordering.
- Use hyphens to separate words, never spaces or underscores.
- Be descriptive but concise. Someone should understand the campaign from the name alone.
- Never use internal code names that are meaningless outside your team.

### utm_content (Optional)

Differentiates creative variants or placements within the same campaign.

**Format:** `{creative-type}-{variant}`

**Examples:**
- `banner-v1` / `banner-v2`
- `hero-image-blue` / `hero-image-red`
- `cta-above-fold` / `cta-below-fold`
- `testimonial-video` / `product-demo`

**Rules:**
- Use for A/B testing creative assets.
- Use for distinguishing placements (sidebar vs. header).
- Keep values descriptive of what differs between variants.

### utm_term (Optional)

Identifies the keyword or targeting criteria for paid search.

**Examples:**
- `analytics+dashboard` (keyword in paid search)
- `audience-lookalike-1pct` (audience targeting in social)
- `interest-data-science` (interest targeting)

**Rules:**
- For paid search: use the actual keyword or keyword group.
- For paid social: use the targeting criteria.
- URL-encode special characters (spaces become `+`).

---

## Complete URL Examples

```
# Google Ads paid search
https://example.com/pricing?utm_source=google&utm_medium=cpc&utm_campaign=202602-pricing-page&utm_term=analytics+pricing&utm_content=ad-v2

# Facebook retargeting
https://example.com/demo?utm_source=facebook&utm_medium=retargeting&utm_campaign=202602-retarget-trial-expired&utm_content=video-testimonial

# Newsletter
https://example.com/blog/new-feature?utm_source=newsletter&utm_medium=email&utm_campaign=202602-weekly-digest&utm_content=feature-announcement

# Partner referral
https://example.com/signup?utm_source=partner-acme&utm_medium=referral&utm_campaign=202602-acme-integration
```

---

## Governance

### Validation Rules

| Rule                          | Enforcement                                    |
|-------------------------------|------------------------------------------------|
| Source must be from allowed list | Automated check at link creation; reject unknowns |
| Medium must be from allowed list | Automated check at link creation              |
| Campaign must include date prefix | Regex validation: `^\d{6}-`                  |
| No uppercase characters       | Auto-lowercase on ingestion                    |
| No spaces in any parameter    | Reject or auto-replace with hyphens            |
| No PII in UTM parameters      | Never include email addresses, names, or user IDs |

### New Value Requests

To add a new allowed value for source or medium:
1. Submit a request to the marketing analytics team.
2. Include: the new value, its definition, and the use case.
3. Marketing analytics approves and adds it to the allowed list.
4. Update this taxonomy document.

### Audit Cadence

| Check                                   | Frequency | Owner               |
|-----------------------------------------|-----------|---------------------|
| Review UTM values in use vs. allowed list | Monthly  | Marketing analytics |
| Clean up non-standard values            | Monthly   | Marketing analytics |
| Full taxonomy review                    | Quarterly | Marketing + Data    |

---

## Common Mistakes

| Mistake                              | Problem                              | Fix                                |
|--------------------------------------|--------------------------------------|------------------------------------|
| `utm_source=Facebook`                | Uppercase; will create a separate bucket | Always lowercase              |
| `utm_medium=social`                  | Ambiguous: paid or organic?          | Use `paid-social` or `organic-social` |
| `utm_campaign=q1campaign`            | No date, not descriptive             | `202601-brand-awareness-video`     |
| `utm_source=email&utm_medium=email`  | Source and medium are the same       | `utm_source=newsletter&utm_medium=email` |
| No UTMs on paid links                | Paid traffic shows as direct/organic | Enforce UTMs on all paid links     |
