with subcategory_stats as (
  select
    main_category,
    category as subcategory,
    count(*) as total_campaigns,
    sum(case when state = 'successful' then 1 else 0 end) as successful_campaigns
  from kickstarter.projects
  group by 1, 2
  having count(*) >= 50  -- filter out categories with too few campaigns
)
select
  main_category,
  subcategory,
  total_campaigns,
  round((successful_campaigns * 100.0 / total_campaigns), 1) as success_rate
from subcategory_stats
order by success_rate desc
limit 20