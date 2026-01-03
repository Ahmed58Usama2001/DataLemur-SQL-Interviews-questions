with cte AS(SELECT user_id,count(*) as completed_orders
from trades
where status = 'Completed'
group by user_id
)

select city,sum(completed_orders)
from cte inner join users u on cte.user_id=u.user_id
group by city
order by sum(completed_orders) desc
limit 3