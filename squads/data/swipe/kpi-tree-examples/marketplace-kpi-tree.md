# Marketplace KPI Tree: GMV -> Supply x Demand x Take Rate

Real-world examples of marketplace companies decomposing GMV into actionable components.

---

## 1. Airbnb - GMV Decomposition Tree

**Company/Context:** Airbnb (2018-2019). The growth and finance teams needed a unified tree connecting supply (hosts), demand (guests), and monetization.

**What They Did:**
- Level 0: GMV (Gross Booking Value)
- Level 1: Nights booked x Average daily rate (ADR)
- Level 2 (Nights booked): Search queries x Search-to-booking conversion rate. Conversion rate decomposed into: search-to-view rate x view-to-inquiry rate x inquiry-to-booking rate.
- Level 2 (Supply-side): Active listings x Average availability (nights per listing per month) x Occupancy rate. Active listings decomposed into: new host activations + returning hosts - churned hosts.
- Level 2 (ADR): Influenced by market, property type, season, host pricing strategy, and Smart Pricing adoption rate.
- Take rate applied to GMV to derive revenue: GMV x blended take rate (guest service fee + host service fee).

**Metrics Used:** GMV, nights booked, ADR, search-to-book conversion, active listings, availability, occupancy rate, take rate, Smart Pricing adoption.

**What Worked:** The supply-side branch revealed that the constraint was not the number of listings but availability per listing. Many hosts blocked half their calendar. The "host earnings estimator" tool increased average availability by 15% by showing hosts how much more they could earn.

**What Failed:** Treating ADR as a single number masked huge market-level variation. ADR was growing in established markets (pricing power) and declining in new markets (competitive pressure). Market-level segmentation was added.

**Lessons:** In accommodation marketplaces, availability per listing is often more constraining than listing count. ADR must be segmented by market maturity.

**Application to Data Squad:** For marketplace clients, decompose supply into both count and utilization (availability, active hours, inventory depth). Segment pricing by market maturity.

---

## 2. DoorDash - Three-Sided Marketplace Tree

**Company/Context:** DoorDash (2020). With consumers, merchants, and Dashers (drivers), they needed a KPI tree capturing three-sided dynamics.

**What They Did:**
- Level 0: Net Revenue (GMV x Take Rate - Dasher Pay - Promotions)
- Level 1 (Demand): Active consumers x Orders per consumer per month x Average order value
- Level 1 (Supply - Merchants): Active merchants x Menu items available x Average item price x In-stock rate
- Level 1 (Supply - Dashers): Active Dashers x Deliveries per Dasher per hour x Active hours per Dasher
- Level 2 (Quality Metrics): Delivery time, order accuracy, Dasher-to-order ratio (coverage), consumer NPS by delivery experience
- Marketplace balance: Dasher-to-order ratio (target: 1.2-1.5 Dashers available per order). Below 1.0 = long wait times. Above 2.0 = Dashers idle, unsustainable cost.

**Metrics Used:** GMV, net revenue, take rate, Dasher-to-order ratio, delivery time, orders per consumer, order frequency, Dasher utilization rate.

**What Worked:** The Dasher-to-order ratio became the single most important operational metric. Zones where the ratio fell below 1.0 saw delivery times spike and consumer reorder rates drop by 35%. Real-time monitoring and Dasher incentives in under-supplied zones maintained the target ratio.

**What Failed:** The tree initially optimized for GMV, which incentivized high-AOV orders regardless of profitability. Adding unit economics per order (contribution margin per delivery) as a parallel track revealed that some high-GMV orders were margin-negative due to delivery distance.

**Lessons:** Three-sided marketplaces need a balance metric (supply-to-demand ratio) as a first-class KPI. Optimize for unit economics, not just GMV.

**Application to Data Squad:** For marketplace clients, always build a supply-to-demand balance metric. Add unit economics per transaction as a parallel tree to GMV.

---

## 3. Etsy - Handmade Marketplace Tree

**Company/Context:** Etsy (2019-2020). As a marketplace for unique/handmade goods, Etsy's KPI tree needed to capture the long-tail nature of supply and the importance of search/discovery.

**What They Did:**
- Level 0: GMS (Gross Merchandise Sales)
- Level 1: Active buyers x Orders per buyer x Average order value
- Level 2 (Active buyers): New buyers (acquisition) + Habitual buyers (ordered 2+ times in 12 months) + Reactivated buyers (lapsed buyers who returned)
- Level 2 (Discovery): Search queries x Search-to-purchase rate. Search effectiveness decomposed into: relevant results rate (did the search return what the buyer wanted?) and listing quality score.
- Level 2 (Supply): Active sellers x Listings per seller x Listing quality score x Shipping speed offered.
- Habitual buyer focus: Habitual buyers were 4% of buyer base but drove 40% of GMS. The tree explicitly tracked habitual buyer growth.

**Metrics Used:** GMS, active buyers by frequency segment, habitual buyer concentration, search-to-purchase rate, relevant results rate, listings per seller, listing quality.

**What Worked:** Focusing the tree on habitual buyers (2+ orders/year) revealed that search quality was the bottleneck. Habitual buyers searched 5x more frequently and converted at 3x the rate, but poor search results for niche queries caused abandonment. Improving search relevance for long-tail queries grew habitual buyer count by 18%.

**What Failed:** "Active sellers" was initially defined as "listed something in the last 12 months," which included sellers with stale listings and no sales. Redefining as "had at least 1 sale in the last 90 days" cut the active seller count by 40% but made it a more useful metric.

**Lessons:** In long-tail marketplaces, search quality is the bridge between supply and demand. Habitual buyer growth matters more than total buyer count.

**Application to Data Squad:** For marketplace clients with long-tail supply, add search/discovery effectiveness as a key branch. Identify and explicitly track the high-frequency buyer segment.

---

## 4. Uber - Rides Marketplace with Network Density

**Company/Context:** Uber (2018). The marketplace team needed to capture the network density effects that drove marketplace health in each city.

**What They Did:**
- Level 0: Gross Bookings
- Level 1: Trips x Average fare
- Level 2 (Trips): Ride requests x Fulfillment rate (% of requests matched to a driver). Requests decomposed by time-of-day and geography.
- Level 2 (Supply): Online drivers x Trips per driver per hour. Online drivers influenced by: driver earnings, driver incentive spend, and driver churn rate.
- Level 2 (Average fare): Base fare + Surge pricing component + Tolls/fees. Surge decomposed into: surge frequency x average surge multiplier.
- Network density metric: Drivers per square mile during peak hours. This was the single best predictor of fulfillment rate, ETA, and rider retention.

**Metrics Used:** Gross bookings, trips, fulfillment rate, ETA, drivers per square mile, surge frequency, driver earnings per hour, rider retention by ETA band.

**What Worked:** The network density metric revealed that cities with fewer than X drivers per square mile during peak had a cascading failure: low density caused long ETAs, which caused low rider demand, which caused driver idle time, which caused driver churn, which further reduced density. This insight led to "density-first" launch strategies for new markets.

**What Failed:** The initial tree optimized for trip volume, which led to subsidizing rides to drive demand. Adding unit economics per trip (contribution margin after driver pay and incentives) revealed that some markets were destroying value at scale.

**Lessons:** Network density (supply per unit of geography) is the fundamental health metric for location-based marketplaces. Below a critical density, the marketplace enters a death spiral.

**Application to Data Squad:** For location-based marketplace clients, build density metrics (supply per geography per time period). Identify the critical density threshold below which the marketplace degrades.
