with duration_days as (
    select
      *,
      extract(day from deadline::timestamp - launched::timestamp) as duration_days
    from kickstarter.projects
),

duration_stats as (
  select
    case
      when duration_days <= 15 then '1-15 days'
      when duration_days <= 30 then '16-30 days'
      when duration_days <= 45 then '31-45 days'
      else '45+ days'
    end as duration_range,
    count(*) as campaign_count,
    sum(case when state = 'successful' then 1 else 0 end) as successful_campaigns
  from duration_days
  group by duration_range
)

select
  duration_range,
  campaign_count,
  round((successful_campaigns * 100.0 / campaign_count), 1) as success_rate
from duration_stats
order by duration_range