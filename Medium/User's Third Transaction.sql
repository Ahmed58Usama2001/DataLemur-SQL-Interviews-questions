with cte as(
select user_id, spend,transaction_date,
row_number() over (partition by user_id order by transaction_date) as ranking
from transactions 
)
select user_id, spend,transaction_date
from cte
where ranking =3