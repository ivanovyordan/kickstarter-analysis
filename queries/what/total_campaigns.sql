select
  count(*) as total_campaigns,
  round(sum(case when state = 'successful' then 1 else 0 end) * 100.0 / count(*), 1) as success_rate
from kickstarter.projects
where launched::date > '1970-01-01'