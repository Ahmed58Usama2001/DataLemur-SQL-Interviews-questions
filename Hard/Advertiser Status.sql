with cte as 
(select a.user_id , 
CASE
  when a.status ='CHURN' then 'RESURRECT'
  ELSE 'EXISTING'
END as new_status
from advertiser a join daily_pay dp
on a.user_id=dp.user_id
  
UNION

select a.user_id, 'CHURN' as new_status
FROM
advertiser a left join daily_pay dp
ON a.user_id=dp.user_id
WHERE dp.paid is NULL

UNION

select dp.user_id, 'NEW' as new_status
FROM
advertiser a right join daily_pay dp
ON a.user_id=dp.user_id
WHERE a.user_id is NULL)

select *
from cte
order by user_id