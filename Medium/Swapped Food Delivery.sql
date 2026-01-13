
select order_id as corrected_order_id,
CASE
when order_id%2=1
  then COALESCE(lead(item) over (order by order_id),item)
  else lag(item) over(order by order_id)
  end as item
from orders 
