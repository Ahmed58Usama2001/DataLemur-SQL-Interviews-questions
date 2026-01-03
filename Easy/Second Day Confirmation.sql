with cte as(
select email_id as confirmed_2nd_day
from texts
group by email_id
having extract(day from (max(action_date) - min(action_date))) =1
)
select user_id
from cte inner join emails
on cte.confirmed_2nd_day = emails.email_id