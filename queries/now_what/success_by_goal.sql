  select
    case
      when goal < 1000 then 'Under $1K'
      when goal < 5000 then '$1K-$5K'
      when goal < 10000 then '$5K-$10K'
      when goal < 25000 then '$10K-$25K'
      when goal < 50000 then '$25K-$50K'
      else 'Over $50K'
    end as goal_range,
    count(*) as total_projects,
    sum(case when state = 'successful' then 1 else 0 end) as successful_projects,
    round(100.0 * sum(case when state = 'successful' then 1 else 0 end) / count(*), 1) as success_rate
  from kickstarter.projects
  where main_category like '${inputs.category.value}'
  group by goal_range
  order by case
    when goal_range = 'Under $1K' then 1
    when goal_range = '$1K-$5K' then 2
    when goal_range = '$5K-$10K' then 3
    when goal_range = '$10K-$25K' then 4
    when goal_range = '$25K-$50K' then 5
    else 6
  end
