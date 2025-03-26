---
title: So What - Campaign Success Patterns
layout: full
sidebar_position: 2
queries:
  - goal_range_success: so_what/goal_range_success.sql
  - success_by_month: so_what/success_by_month.sql
  - duration_vs_success: so_what/duration_vs_success.sql
  - subcategory_success: so_what/subcategory_success.sql
  - goal_by_category: so_what/goal_by_category.sql
---

# 🔍 What Makes Campaigns Succeed?

Let's dive into the key patterns and insights that influence Kickstarter campaign success.

## 💰 Goal Amount Impact

<BarChart
  data={goal_range_success}
  title="Success Rate by Goal Range"
  x=goal_range
  y=success_rate
  yAxisTitle="Success Rate (%)"
/>

<BarChart
  data={goal_by_category}
  title="Funding Goals Distribution by Category"
  x=main_category
  y=median_goal
  yAxisTitle="Goal Amount ($)"
/>


## 📅 Seasonal Trends

<BarChart
  data={success_by_month}
  title="Success Rate by Launch Month"
  x=launch_month
  y=success_rate
  yAxisTitle="Success Rate (%)"
/>

## ⏱️ Campaign Duration Analysis

<BarChart
  data={duration_vs_success}
  title="Success Rate by Campaign Duration"
  x=duration_range
  y=success_rate
  yAxisTitle="Success Rate (%)"
/>

## 🏆 Top Performing Categories

<DataTable
  data={subcategory_success}
  title="Most Successful Project Types"
  rows=20
/>