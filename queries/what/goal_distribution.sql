select
  case
    when goal <= 1000 then '< $1k'
    when goal <= 5000 then '$1k - $5k'
    when goal <= 10000 then '$5k - $10k'
    when goal <= 50000 then '$10k - $50k'
    else '> $50k'
  end as goal_range,
  count(*) as campaign_count,
  round(avg(case when state = 'successful' then 1 else 0 end) * 100, 1) as success_rate
from kickstarter.projects
where launched::date > '1970-01-01'
group by goal_range
order by goal_range