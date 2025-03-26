---
title: Now What - Strategies for Successful Kickstarter Campaigns
layout: full
queries:
  - success_matrix: now_what/success_matrix.sql
  - optimal_parameters: now_what/optimal_parameters.sql
  - success_by_goal: now_what/success_by_goal.sql
---

# Strategies for Kickstarter Success
```sql categories
  select distinct
      main_category
  from kickstarter.projects
  order by main_category
```

<Dropdown data={categories} name=category value=main_category>
    <DropdownOption value="%" valueLabel="All Categories"/>
</Dropdown>

## Success Rate by Goal Size and Duration

<DataTable 
  data={success_matrix}
  title="Success Rate by Goal Size and Duration"
/>

## Optimal Project Parameters

<DataTable 
  data={optimal_parameters}
  title="Successful vs. Failed Project Parameters"
/>

## Success Rate by Goal Range

<BarChart
  data={success_by_goal}
  title="Success Rate by Goal Range"
  x=goal_range
  y=success_rate
  series=goal_range
  yAxisTitle="Success Rate (%)"
/>