with cte as(
select category, product , 
sum(spend) as total_spend,
rank() over (PARTITION BY category 
      ORDER BY SUM(spend) DESC) AS ranking 
from product_spend 
WHERE transaction_date >= DATE '2022-01-01'
  AND transaction_date <  DATE '2023-01-01' 
  group by category, product
)

select category, product,total_spend
from cte
where ranking <=2
order by category , ranking