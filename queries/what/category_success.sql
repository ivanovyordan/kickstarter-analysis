select
  main_category,
  count(*) as total_projects,
  round(sum(case when state = 'successful' then 1 else 0 end) * 100.0 / count(*), 1) as success_rate
from kickstarter.projects
where launched::date > '1970-01-01'
group by main_category
order by success_rate desc