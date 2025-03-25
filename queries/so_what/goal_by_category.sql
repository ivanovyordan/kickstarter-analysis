select
  main_category,
  percentile_cont(0.50) within group (order by goal) as median_goal
from kickstarter.projects
group by main_category
order by median_goal desc