# Kaushik Web Analytics 2.0 Framework

## Overview

Web Analytics 2.0 is Avinash Kaushik's four-pillar model for comprehensive digital measurement.
It expands the definition of web analytics beyond clickstream data to include outcomes analysis,
experimentation, and voice of customer research. The framework argues that clickstream data alone
is inherently limited because it tells you what people did but never why they did it, and it cannot
tell you what would have happened under different conditions.

Organizations that rely solely on clickstream analytics -- even with sophisticated implementation --
are making decisions with at best 25% of the available evidence.

## Origin

Defined by **Avinash Kaushik** in his book *Web Analytics 2.0: The Art of Online Accountability
and Science of Customer Centricity* (2009). Kaushik formally defined Web Analytics 2.0 as:
"The analysis of qualitative and quantitative data from your website and the competition to drive
a continuous improvement of the online experience that your customers and potential customers have,
which translates to your desired outcomes." The four-pillar structure was his operationalization
of that definition.

## Core Model

### Pillar 1: Clickstream Analysis

The foundational data layer. Clickstream encompasses all behavioral data collected as users interact
with your digital properties.

**What it includes:**
- Page views, sessions, and user counts
- Navigation paths and flow analysis
- Entrance and exit page patterns
- Device, browser, and geographic segmentation
- Traffic source and campaign attribution
- Event tracking (clicks, scrolls, video plays, downloads)
- Custom dimensions and user properties

**What it reveals:**
- What happened on your site
- Where users came from
- What paths they followed
- Where they dropped off
- How segments differ in behavior

**What it cannot reveal:**
- Why users behaved as they did
- What users were trying to accomplish
- Whether observed patterns are causal or coincidental
- How users felt about their experience
- What users would have done under different conditions

**Maturity indicators:**
- Basic: pageview and session reporting
- Intermediate: event tracking, custom segments, attribution
- Advanced: user-level journey analysis, predictive segments, real-time behavioral triggers

### Pillar 2: Outcomes Analysis

Connecting digital activity to business results. Outcomes analysis bridges the gap between behavioral
data and business impact.

**What it includes:**
- Macro conversions (purchases, sign-ups, subscriptions)
- Micro conversions (email sign-ups, tool usage, content engagement)
- Economic value assignment to all conversion types
- Revenue and profitability analysis by segment
- Customer lifetime value tracking
- Attribution modeling across touchpoints

**What it reveals:**
- Which activities produce business value
- The relative economic contribution of different channels, campaigns, and content
- Where value is being created and destroyed
- The gap between activity and results

**Critical practices:**
- Every micro conversion must have an assigned economic value
- Attribution models must be documented, understood, and regularly challenged
- Outcome measurement must span the full customer lifecycle, not just initial conversion
- Offline outcomes must be connected to online behaviors where possible

**Maturity indicators:**
- Basic: conversion counting
- Intermediate: economic value assignment, multi-touch attribution
- Advanced: incrementality measurement, lifetime value attribution, unified online-offline measurement

### Pillar 3: Experimentation and Testing

The scientific method applied to digital experience. Experimentation is the only reliable way to
establish causation in digital analytics.

**What it includes:**
- A/B testing of pages, flows, and content
- Multivariate testing for complex interaction effects
- Server-side experiments for personalization
- Holdout groups for channel and campaign incrementality
- Pricing and offer experiments
- Feature experiments in product development

**What it reveals:**
- Whether a change actually causes improvement (not just correlates)
- The magnitude of causal effects
- Which segments respond differently to changes
- The opportunity cost of the current experience

**Critical practices:**
- Statistical rigor in sample size calculation and significance testing
- Pre-registration of hypotheses to prevent p-hacking
- Proper randomization and isolation of test groups
- Business impact estimation, not just statistical significance
- A culture that celebrates learning from failed tests as much as winning tests

**Maturity indicators:**
- Basic: occasional A/B tests on landing pages
- Intermediate: systematic testing program with 2+ tests per month
- Advanced: experimentation platform, feature flags, continuous experimentation culture

### Pillar 4: Voice of Customer (VOC)

Qualitative and direct-response data from actual users. VOC answers the "why" that clickstream
data cannot.

**What it includes:**
- On-site surveys (exit surveys, task completion surveys)
- Post-purchase satisfaction surveys
- Usability testing and session recordings
- Customer interviews and focus groups
- Social listening and review analysis
- Support ticket and chat log analysis
- Net Promoter Score and Customer Effort Score programs

**What it reveals:**
- Why users behave as they do
- What users were trying to accomplish (task completion)
- What barriers and frustrations users encounter
- Unmet needs and feature requests
- Emotional response to brand and experience
- Competitive context (what alternatives users considered)

**Critical practices:**
- Surveys must be short, targeted, and triggered by specific behaviors
- Open-ended questions are more valuable than rating scales for understanding "why"
- VOC data must be analyzed systematically, not cherry-picked for confirmation
- VOC insights must be connected to clickstream segments for triangulation
- The three key questions: "What is the purpose of your visit?" / "Were you able to complete your
  task?" / "If not, why?"

**Maturity indicators:**
- Basic: annual satisfaction survey
- Intermediate: always-on exit surveys, regular usability testing
- Advanced: integrated VOC platform, automated theme extraction, closed-loop action on feedback

## Application Steps

### Step 1: Assess Current Pillar Coverage
Map your current analytics capabilities to the four pillars. Most organizations have moderate
clickstream capability and weak everything else. Be honest about gaps.

### Step 2: Prioritize the Weakest Pillar
The highest marginal return comes from investing in your weakest pillar. If you have no
experimentation program, starting one will yield more insight per dollar than improving your
already-functional clickstream analytics.

### Step 3: Build Integration Points
The pillars become powerful when connected. Clickstream segments should inform VOC survey targeting.
Experimentation hypotheses should come from VOC findings. Outcomes analysis should measure
experiment impact.

### Step 4: Staff for All Four Pillars
Each pillar requires somewhat different skills. Clickstream needs technical implementation.
Outcomes needs business and financial acumen. Experimentation needs statistics. VOC needs
research methodology. The 10/90 rule applies to each pillar.

### Step 5: Report Across Pillars
Executive reporting should include findings from all four pillars, not just clickstream. A monthly
analytics review might include: "Clickstream shows X happened. VOC tells us it happened because Y.
Our experiment proved that Z is the solution. The outcome impact is $W."

### Step 6: Iterate and Deepen
Each pillar has a maturity curve. Move all four forward in parallel rather than perfecting one
before starting another. A basic capability across all four pillars beats advanced capability in
one.

## Key Distinctions

- **Clickstream is necessary but not sufficient.** It is the foundation, not the building. An
  organization that only does clickstream is doing 25% of analytics.
- **Experimentation is the only source of causal knowledge.** Clickstream and VOC reveal
  correlations and motivations. Only experiments prove that changes cause outcomes.
- **VOC is not just surveys.** It encompasses any method of hearing the customer's perspective,
  including behavioral signals like rage clicks and repeated searches.
- **Outcomes analysis is not just conversion tracking.** It includes economic value assignment,
  lifetime value, and the connection between digital activity and business profitability.
- **The pillars are multiplicative, not additive.** Each pillar amplifies the value of the others.
  VOC without clickstream lacks scale. Clickstream without VOC lacks depth. Either without
  experimentation lacks proof.

## Pitfalls

1. **Over-indexing on clickstream.** It is the easiest pillar to build and the most comfortable
   for analysts. This leads to organizations drowning in behavioral data while lacking insight.
2. **Treating experimentation as a conversion optimization tactic.** Experimentation is a learning
   methodology that applies to every business question, not just button colors.
3. **Running VOC as a separate silo.** If VOC insights are not connected to clickstream data and
   experimentation programs, they become anecdotal evidence that is easy to dismiss.
4. **Measuring outcomes without attribution sophistication.** Counting conversions without
   understanding which activities drove them leads to misallocation.
5. **Staffing all four pillars with one team.** Each pillar requires different skills. Expecting
   one analyst to be expert in all four is unrealistic for most organizations.
6. **Neglecting data quality in the rush to add pillars.** A new pillar with bad data is worse
   than no pillar at all. Each addition needs proper implementation.
7. **Forgetting competitive intelligence.** Kaushik includes competitive analysis in his
   definition. Understanding your data in isolation, without competitive context, limits insight.

## Cross-References

- **Kaushik DMMM** -- The DMMM defines what to measure; Web Analytics 2.0 defines how to measure
  it across all four pillars.
- **Kaushik 10/90 Rule** -- Each pillar requires human expertise. VOC requires research skills.
  Experimentation requires statistical literacy. Tools alone cannot operate any pillar.
- **Kaushik Economic Value Framework** -- Economic value is the core of Pillar 2 (Outcomes).
  Without it, outcomes analysis reduces to conversion counting.
- **Kaushik Trinity Strategy** -- The Trinity (Behavior, Outcomes, Experience) maps onto the
  four pillars: Clickstream feeds Behavior, Outcomes feeds Outcomes, VOC feeds Experience,
  and Experimentation validates all three.
- **Ellis High-Tempo Testing** -- Ellis's testing framework is a specific implementation of
  Pillar 3 optimized for growth-stage companies.
- **Mehta Customer Health Score** -- Health scoring combines clickstream (product usage),
  outcomes (renewal), and VOC (satisfaction) -- three of the four pillars applied to CS.
