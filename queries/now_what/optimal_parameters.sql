with fields as (

  select
    state,
    goal,
    main_category,
    extract(day from deadline::timestamp - launched::timestamp) as duration_days,
  from kickstarter.projects
  where main_category like '${inputs.category.value}'

)

select
    main_category,
    round(avg(case when state = 'successful' then goal else null end), 0) as avg_successful_goal,
    round(avg(case when state = 'successful' then duration_days else null end), 1) as avg_successful_duration,
    round(avg(case when state = 'failed' then goal else null end), 0) as avg_failed_goal,
    round(avg(case when state = 'failed' then duration_days else null end), 1) as avg_failed_duration,
    round(100.0 * sum(case when state = 'successful' then 1 else 0 end) / count(*), 1) as success_rate
  from fields
  group by main_category