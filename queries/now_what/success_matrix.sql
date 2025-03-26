  with fields as (
    select
      goal,
      state,
      main_category,
      extract(day from deadline::timestamp - launched::timestamp) as duration_days

    from kickstarter.projects
    where main_category like '${inputs.category.value}'
  )

  select 
    case
      when goal < 5000 then 'Under $5K'
      when goal < 10000 then '$5K-$10K'
      when goal < 25000 then '$10K-$25K'
      when goal < 50000 then '$25K-$50K'
      else 'Over $50K'
    end as goal_range,
    case
      when duration_days < 15 then 'Short (< 15 days)'
      when duration_days < 30 then 'Medium (15-30 days)'
      else 'Long (30+ days)'
    end as duration_range,
    count(*) as total_projects,
    sum(case when state = 'successful' then 1 else 0 end) as successful_projects,
    round(100.0 * sum(case when state = 'successful' then 1 else 0 end) / count(*), 1) as success_rate
  from fields
  group by goal_range, duration_range
  order by goal_range, duration_range