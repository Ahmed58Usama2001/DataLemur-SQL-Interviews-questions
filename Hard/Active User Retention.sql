with cte as(
SELECT
DISTINCT user_id
FROM user_actions
where DATE_PART('month', event_date) =7 and DATE_PART('year', event_date) =2022
)

SELECT 7 as month , count(distinct cte.user_id) as monthly_active_users
from cte inner join user_actions ua
on cte.user_id = ua.user_id
where DATE_PART('month', ua.event_date) =6 and DATE_PART('year', ua.event_date) =2022