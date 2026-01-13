with cte as(
SELECT product_id, user_id,transaction_date,
rank()over(partition by user_id order by transaction_date desc) as ranking
from user_transactions )

select user_id,transaction_date,count(product_id) as purchase_count
from cte 
where ranking =1
group by user_id,transaction_date
order by transaction_date
