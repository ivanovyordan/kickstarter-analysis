with monthly_stats as (
  select
    monthname(launched) as launch_month,
    date_part('month', launched) as month_number,
    count(*) as total_campaigns,
    sum(case when state = 'successful' then 1 else 0 end) as successful_campaigns
  from kickstarter.projects
  group by launch_month, month_number
)
select
  launch_month,
  round((successful_campaigns * 100.0 / total_campaigns), 1) as success_rate,
  total_campaigns
from monthly_stats
order by month_number::int