with cte as (
select c.customer_id,count( distinct (product_category)) as category_count
from customer_contracts c inner join products p 
on c.product_id = p.product_id
group by c.customer_id
)

select customer_id
from cte
where category_count=3

