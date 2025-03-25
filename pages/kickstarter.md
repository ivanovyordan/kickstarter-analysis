---
title: Kickstarter Campaign Analysis
layout: full
queries:
  - total_campaigns: what/total_campaigns.sql
  - category_success: what/category_success.sql
  - duration_success: what/duration_success.sql
  - goal_distribution: what/goal_distribution.sql
  - campaigns_by_time: what/campaigns_by_time.sql
---

# 🎯 What Makes a Successful Kickstarter Campaign?

Using data analysis to understand campaign performance and success factors.

## 📘 What? — Campaign Overview

<BigValue 
  data={total_campaigns} 
  value=total_campaigns 
  title="Total Campaigns"
/>

<BigValue 
  data={total_campaigns} 
  value=success_rate 
  title="Success Rate"
  format="percent"
/>

<BarChart
  data={category_success}
  title="Success Rate by Category"
  x=main_category
  y=success_rate
  yAxisTitle="Success Rate (%)"
/>

<BarChart
  data={duration_success}
  title="Success Rate by Duration"
  x=duration_range
  y=success_rate
  yAxisTitle="Success Rate (%)"
/>

<BarChart
  data={goal_distribution}
  title="Campaign Goals Distribution"
  x=goal_range
  y=campaign_count
  series=success_rate
  yAxisTitle="Number of Campaigns"
/>

<LineChart
  data={campaigns_by_time}
  title="Campaigns Over Time"
  x=launch_month
  y=total_campaigns
  yAxisTitle="Number of Campaigns"
/>

<LineChart
  data={campaigns_by_time}
  title="Success Rate Trend"
  x=launch_month
  y=success_rate
  yAxisTitle="Success Rate (%)"
/>