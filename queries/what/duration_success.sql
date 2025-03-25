with project_durations as (
  select
    *,
    extract(day from deadline::timestamp - launched::timestamp) as duration_days
  from kickstarter.projects
  where launched::date > '1970-01-01'
)
select
  case
    when duration_days <= 15 then '1-15 days'
    when duration_days <= 30 then '16-30 days'
    when duration_days <= 45 then '31-45 days'
    else '45+ days'
  end as duration_range,
  count(*) as campaign_count,
  round(avg(case when state = 'successful' then 1 else 0 end) * 100, 1) as success_rate
from project_durations
group by duration_range
order by duration_range